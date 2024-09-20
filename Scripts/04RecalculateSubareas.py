from qgis.core import (
    QgsProcessing,
    QgsProcessingAlgorithm,
    QgsProcessingParameterFeatureSource,
    QgsProcessingParameterBoolean,
    QgsVectorLayer,
    QgsExpression,
    QgsExpressionContext,
    QgsExpressionContextUtils,
    QgsProject,
    QgsProcessingException,
    QgsProcessingMultiStepFeedback,  # Import Multi-Step Feedback
)
from qgis.PyQt.QtCore import QCoreApplication

class RecalculateFieldsAlgorithm(QgsProcessingAlgorithm):
    """
    This algorithm recalculates the fields in a vector layer based on the default expressions assigned to them.
    """

    INPUT = "INPUT"
    RECALCULATE_GEOMETRY_FIELDS = "RECALCULATE_GEOMETRY_FIELDS"

    def tr(self, string):
        """
        Returns a translatable string with the self.tr() function.
        """
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return RecalculateFieldsAlgorithm()

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm. This string should be fixed for the algorithm, and must not be localized. The name should be unique within each provider. Names should contain lowercase alphanumeric characters only and no spaces or other formatting characters.
        """
        return '04RecalculateSubareas'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any user-visible display of the algorithm name.
        """
        return self.tr('04 Recalculate Subareas')

    def group(self):
        """
        Returns the name of the group this algorithm belongs to. This string should be localized.
        """
        return self.tr('Sanitation Planning')

    def groupId(self):
        """
        Returns the unique ID of the group this algorithm belongs to. This string should be fixed for the algorithm, and must not be localized. The group id should be unique within each provider. Group id should contain lowercase alphanumeric characters only and no spaces or other formatting characters.
        """
        return 'Sanitation Planning'

    def shortHelpString(self):
        """
        Returns a localized short helper string for the algorithm. This string should provide a basic description about what the algorithm does and the parameters and outputs associated with it.
        """
        return self.tr("This script recalculates the subareas fields with default values based on their expressions.")

    def flags(self):
        # Use the FlagNoThreading flag to ensure the algorithm runs in the main thread
        return QgsProcessingAlgorithm.FlagNoThreading

    def initAlgorithm(self, config=None):
        self.addParameter(
            QgsProcessingParameterFeatureSource(
                self.INPUT,
                QCoreApplication.translate("RecalculateSubareas", "Input layer"),
                [QgsProcessing.TypeVectorAnyGeometry],
            )
        )

        # Add a boolean parameter for recalculating geometry-related fields
        self.addParameter(
            QgsProcessingParameterBoolean(
                self.RECALCULATE_GEOMETRY_FIELDS,
                self.tr("Recalculate for changes in geometries?"),
                defaultValue=False,
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        # Determine the number of steps in your process
        num_steps = 3  # Steps: Initialize, Process Fields, Finalize

        # Create a Multi-Step Feedback
        feedback = QgsProcessingMultiStepFeedback(num_steps, feedback)

        # Step 0: Initialization
        feedback.pushInfo("Starting the process...")
        feedback.setCurrentStep(0)

        # Get the input source
        feedback.pushInfo("Retrieving the input source...")
        source = self.parameterAsSource(parameters, self.INPUT, context)
        if source is None:
            raise QgsProcessingException(self.invalidSourceError(parameters, self.INPUT))

        # Get the boolean parameter value
        recalculate_geometry_fields = self.parameterAsBool(parameters, self.RECALCULATE_GEOMETRY_FIELDS, context)

        # Getting the actual vector layer from the source
        layer_id = source.sourceName()
        
        # Attempt to find the corresponding QgsVectorLayer in the project
        layer = QgsProject.instance().mapLayersByName(layer_id)
        if not layer:
            raise QgsProcessingException("Layer not found in the current project.")

        layer = layer[0]

        if not isinstance(layer, QgsVectorLayer) or not layer.isValid():
            raise QgsProcessingException("Invalid vector layer.")

        # Ensure the layer is editable
        if not layer.isEditable():
            feedback.pushInfo("Activating edit mode for the layer...")
            layer.startEditing()

        # Step 1: Process Fields
        feedback.setCurrentStep(1)
        feedback.pushInfo("Processing fields...")

        # Check for actual changes in the edit buffer
        edit_buffer = layer.editBuffer()
        has_changes = (
            bool(edit_buffer.changedGeometries()) or
            bool(edit_buffer.changedAttributeValues()) or
            bool(edit_buffer.addedFeatures())
        )
        feedback.pushInfo(f"Edit buffer changes exist: {has_changes}")

        # Determine the features to process
        if has_changes:
            feedback.pushInfo("Using features from edit buffer...")
            modified_feature_ids = set(edit_buffer.changedGeometries().keys())
            modified_feature_ids.update(edit_buffer.changedAttributeValues().keys())
            modified_feature_ids.update(edit_buffer.addedFeatures().keys())
            features_to_process = [layer.getFeature(fid) for fid in modified_feature_ids]
            feedback.pushInfo(f"Features to update: {len(features_to_process)} with IDs: {list(modified_feature_ids)}")
        else:
            feedback.pushInfo("Processing all (or selected) features...")
            features_to_process = list(source.getFeatures())

            feature_ids = [feature.id() for feature in features_to_process]
            feedback.pushInfo(f"Number of features to process: {len(feature_ids)} with IDs: {feature_ids}")

        # Get the expression context
        feedback.pushInfo("Setting up expression context...")
        exp_context = QgsExpressionContext()
        exp_context.appendScopes(QgsExpressionContextUtils.globalProjectLayerScopes(layer))

        # Fields to always be excluded
        always_excluded_fields = {"area_ha", "uuid"}

        # Fields to be excluded if recalculate_geometry_fields is False
        conditional_excluded_fields = {"PopDataset_sum", "street_length_sum", "count_buildings", "area_buildings"}

        # Combine exclusion fields
        if not recalculate_geometry_fields:
            excluded_fields = always_excluded_fields.union(conditional_excluded_fields)
        else:
            excluded_fields = always_excluded_fields

        # Iterate over fields
        feedback.pushInfo("Iterating over fields to check for default values...")
        fields = source.fields()
        total_fields = fields.count()

        total_work = total_fields * len(features_to_process)  # Total number of operations
        current_progress = 0  # Initialize progress counter

        for field_index in range(total_fields):
            field = fields[field_index]

            # Skip excluded fields
            if field.name() in excluded_fields:
                continue

            # Check if the field has a default value
            default_value = field.defaultValueDefinition()
            if not default_value.isValid():
                # Skip fields without default values
                continue

            feedback.pushInfo(f"Field '{field.name()}' has a default value expression.")

            # Get the default expression
            expression = default_value.expression()

            # Check if the expression is valid
            expr = QgsExpression(expression)
            if expr.hasParserError():
                feedback.reportError(f"Expression error in field '{field.name()}': {expr.parserErrorString()}")
                continue

            # Prepare to update features directly
            for feature in features_to_process:
                exp_context.setFeature(feature)

                # Evaluate the expression
                value = expr.evaluate(exp_context)
                if expr.hasEvalError():
                    feedback.reportError(f"Evaluation error in field '{field.name()}': {expr.evalErrorString()}")
                    continue

                # Update the feature's attribute in-memory
                feature.setAttribute(field_index, value)

                # Apply changes to the layer
                if not layer.updateFeature(feature):
                    feedback.reportError(f"Failed to update feature ID {feature.id()} for field '{field.name()}'")

                # Update progress
                current_progress += 1
                progress = int(current_progress / total_work * 100)

                # Set progress without feedback logging
                feedback.setProgress(progress)

        # Finalize and ensure progress bar hits 100%
        feedback.setCurrentStep(2)
        feedback.setProgress(100)  # Ensure it reaches 100%
        feedback.pushInfo("Processing 100% completed")

        # Step 2: Finalization
        feedback.pushInfo("Committing changes to the layer...")
        if layer.isEditable():
            layer.commitChanges()

        feedback.pushInfo("Process completed successfully.")
        return {}
