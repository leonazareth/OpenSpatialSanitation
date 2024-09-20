"""
***************************************************************************
*                                                                         *
*   This program is free software; you can redistribute it and/or modify  *
*   it under the terms of the GNU General Public License as published by  *
*   the Free Software Foundation; either version 2 of the License, or     *
*   (at your option) any later version.                                   *
*                                                                         *
***************************************************************************
"""

from qgis.PyQt.QtCore import QCoreApplication
from qgis.core import (
    QgsProcessing,
    QgsProcessingAlgorithm,
    QgsProcessingMultiStepFeedback,
    QgsProcessingParameterFeatureSource,
    QgsProcessingParameterRasterLayer,
    QgsProcessingParameterVectorLayer,
    QgsProcessingParameterField,
    QgsProcessingParameterNumber,
    QgsProcessingParameterBoolean,
    QgsProcessingParameterRasterDestination,
    QgsProcessingParameterFeatureSink,
    QgsVectorLayer,
    QgsField,
    QgsDefaultValue,
    QgsProcessingOutputLayerDefinition,
    QgsProcessingUtils,
    QgsExpressionContextUtils,
    QgsProject
)
import os
import processing
from qgis.PyQt.QtCore import QVariant

class AggregatePopSubareas(QgsProcessingAlgorithm):
    """
    This algorithm consolidates data from the sub-areas based on information from the external layer, generating indicators and suggesting sanitation systems based on the parameters provided.
    """

    # Input layers
    INPUT_SUBAREAS_LAYER = 'subareas_layer2'
    INPUT_POPULATION_RASTER = 'population_raster_layer'
    INPUT_POPULATION_VECTOR = 'population_vector_layer'
    INPUT_POPULATION_FIELD = 'select_the_population_field'
    INPUT_BUILDINGS_LAYER = 'buildings_layer'
    INPUT_STREET_LAYER = 'street_layer'
      
    # Input Parameters
    INPUT_WATER_CONSUMPTION_ATTRIBUTE = 'select_the_average_water_consumption_attribute'
    INPUT_EXISTING_SANITATION_ATTRIBUTE = 'select_the_existing_sanitation_attribute'
    INPUT_WATER_AVAILABLE_ATTRIBUTE = 'select_the_water_available_attribute'
    INPUT_LOW_DENSITY_LIMIT = 'upper_limit_for_low_population_density_classification_inhabitantshectare'
    INPUT_MEDIUM_DENSITY_LIMIT = 'upper_limit_for_medium_population_density_classification_inhabitantshectare'
    INPUT_MIN_WATER_CONSUMPTION = 'minimum_water_consumption_required_for_sewerage_systems_litersinhabitantday'
    INPUT_ANNUAL_GROWTH_RATE = 'anual_growth_rate_'
    INPUT_YEAR_POP_DATASET = 'year_of_population_data_set'
    INPUT_START_PLAN_YEAR = 'year_of_start_of_plan'
    INPUT_PEOPLE_PER_HOUSEHOLD_START = 'people_per_household_start_of_plan'
    INPUT_END_PLAN_YEAR = 'year_of_end_of_plan'
    INPUT_PEOPLE_PER_HOUSEHOLD_END = 'people_per_household_end_of_plan'
    INPUT_AVERAGE_STREET_WIDTH = 'average_street_width'
    
    # Output layers
    OUTPUT_REPROJECTED_POP_RASTER = 'ReprojectedPopulationRaster'
    OUTPUT_POP_POINTS = 'PopulationPoints'
    OUTPUT_STREETS_SUBAREAS = 'Street_of_subareas'
    OUTPUT_BUILDINGS_SUBAREAS = 'Buildings_of_subareas'
    OUTPUT_REPROJECTED_POP_VECTOR = 'ReprojectedPopulationVector'
    OUTPUT_SUGGESTED_SANITATION = 'Subareas_suggested_sanitation'
    
    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm. This string should be fixed for the algorithm, and must not be localized. The name should be unique within each provider. Names should contain lowercase alphanumeric characters only and no spaces or other formatting characters.
        """
        return '03SanitationSystemEvaluation'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any user-visible display of the algorithm name.
        """
        return '03 Sanitation System Evaluation'

    def group(self):
        """
        Returns the name of the group this algorithm belongs to. This string should be localized.
        """
        return 'Sanitation Planning'

    def groupId(self):
        """
        Returns the unique ID of the group this algorithm belongs to. This string should be fixed for the algorithm, and must not be localized. The group id should be unique within each provider. Group id should contain lowercase alphanumeric characters only and no spaces or other formatting characters.
        """
        return 'Sanitation Planning'
        
        
    alg_description = '''
                        This algorithm consolidates primary data and optional data to: 
                        i) create indicators, 
                        ii) suggest the type of sanitation system based on technical criteria according to the area's characteristics, and 
                        iii) generate additional recommendations to support the sanitation planner.
                        <b>Primary Data:</b>
                        - Population dataset
                        - Delimitation of subareas with water availability
                        - Average water consumption per subarea
                        - Delimitation of subareas with existing sanitation system per type
                        
                        <b>Optional Data:</b>
                        - Building footprints
                        - Streets
                    '''
        
        
    def shortHelpString(self):
        """
        Returns a localized short helper string for the algorithm. This string should provide a basic description about what the algorithm does and the parameters and outputs associated with it.
        """
        return self.alg_description


    def createInstance(self):
        return AggregatePopSubareas()
    
    
    def apply_style(self, layer, qml_path, feedback):
        if layer is None:
            feedback.pushInfo(f"No layer provided for style file '{qml_path}'")
            return
        if os.path.exists(qml_path):
            layer.loadNamedStyle(qml_path)
            layer.triggerRepaint()
            feedback.pushInfo(f"Style from '{qml_path}' applied to layer: {layer.name()}")
        else:
            feedback.pushInfo(f"Style file '{qml_path}' not found for layer: {layer.name()}")

    def initAlgorithm(self, config=None):
        """
        Here we define the inputs and output of the algorithm, along with some other properties.
        """
    
    #INPUTS
        # Automatically update indicators checkbox (UNSTABLE BECAUSE OF CIRCULAR REFERENCE ON THE CALCULATION)
        #self.addParameter(
            #QgsProcessingParameterBoolean(
                #'AUTO_UPDATE_INDICATORS',
                #'Automatically update indicators with feature changes? (Requires high processing power)',
                #defaultValue=False
            #)
        #)
        
        # Subareas layer selection
        self.addParameter(
            QgsProcessingParameterFeatureSource(
                self.INPUT_SUBAREAS_LAYER,
                'Subareas Layer',
                types=[QgsProcessing.TypeVectorPolygon],
                defaultValue=None
            )
        )

        # Subareas layer fields selection
        self.addParameter(
            QgsProcessingParameterField(
                self.INPUT_WATER_CONSUMPTION_ATTRIBUTE,
                'Select the average water consumption attribute',
                type=QgsProcessingParameterField.Numeric,
                parentLayerParameterName=self.INPUT_SUBAREAS_LAYER,
                allowMultiple=False,
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterField(
                self.INPUT_EXISTING_SANITATION_ATTRIBUTE,
                'Select the existing sanitation attribute',
                type=QgsProcessingParameterField.Boolean,
                parentLayerParameterName=self.INPUT_SUBAREAS_LAYER,
                allowMultiple=False,
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterField(
                self.INPUT_WATER_AVAILABLE_ATTRIBUTE,
                'Select the water available attribute',
                type=QgsProcessingParameterField.Boolean,
                parentLayerParameterName=self.INPUT_SUBAREAS_LAYER,
                allowMultiple=False,
                defaultValue=None
            )
        )

        # Population Dataset parameters
        self.addParameter(
            QgsProcessingParameterRasterLayer(
                self.INPUT_POPULATION_RASTER,
                'Population Raster Layer',
                optional=True,
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.INPUT_POPULATION_VECTOR,
                'Population Vector Layer',
                optional=True,
                types=[QgsProcessing.TypeVectorAnyGeometry],
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterField(
                self.INPUT_POPULATION_FIELD,
                'Select the population field',
                optional=True,
                type=QgsProcessingParameterField.Numeric,
                parentLayerParameterName=self.INPUT_POPULATION_VECTOR,
                allowMultiple=False,
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_YEAR_POP_DATASET,
                'Year of population data set',
                type=QgsProcessingParameterNumber.Integer,
                defaultValue=2020
            )
        )

        # Population density parameters
        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_LOW_DENSITY_LIMIT,
                'Upper limit for low population density classification (inhabitants/hectare)',
                type=QgsProcessingParameterNumber.Integer,
                defaultValue=50
            )
        )

        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_MEDIUM_DENSITY_LIMIT,
                'Upper limit for medium population density classification (inhabitants/hectare)',
                type=QgsProcessingParameterNumber.Integer,
                defaultValue=100
            )
        )

        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_ANNUAL_GROWTH_RATE,
                'Annual growth rate (%)',
                type=QgsProcessingParameterNumber.Double,
                defaultValue=1.5
            )
        )

        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_START_PLAN_YEAR,
                'Year of start of plan',
                type=QgsProcessingParameterNumber.Integer,
                defaultValue=2024
            )
        )

        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_PEOPLE_PER_HOUSEHOLD_START,
                'People per household start of plan',
                type=QgsProcessingParameterNumber.Double,
                defaultValue=4
            )
        )

        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_END_PLAN_YEAR,
                'Year of end of plan',
                type=QgsProcessingParameterNumber.Integer,
                defaultValue=2054
            )
        )

        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_PEOPLE_PER_HOUSEHOLD_END,
                'People per household end of plan',
                type=QgsProcessingParameterNumber.Double,
                defaultValue=4
            )
        )

        # Other parameters
        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_MIN_WATER_CONSUMPTION,
                'Minimum water consumption required for sewerage systems (liters/inhabitant/day)',
                type=QgsProcessingParameterNumber.Integer,
                defaultValue=50
            )
        )

        # Additional data (Streets and Buildings footprints)
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.INPUT_BUILDINGS_LAYER,
                'Buildings Layer',
                optional=True,
                types=[QgsProcessing.TypeVectorPolygon],
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.INPUT_STREET_LAYER,
                'Street Layer',
                optional=True,
                types=[QgsProcessing.TypeVectorLine],
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterNumber(
                self.INPUT_AVERAGE_STREET_WIDTH,
                'Average street width',
                optional=True,
                type=QgsProcessingParameterNumber.Double,
                defaultValue=4
            )
        )

        # OUTPUTS
        self.addParameter(
            QgsProcessingParameterRasterDestination(
                self.OUTPUT_REPROJECTED_POP_RASTER,
                'Reprojected Population (raster)',
                createByDefault=True,
                defaultValue=''
            )
        )

        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT_REPROJECTED_POP_VECTOR,
                'Reprojected Population (vector)',
                type=QgsProcessing.TypeVectorAnyGeometry,
                createByDefault=True,
                supportsAppend=True,
                defaultValue='TEMPORARY_OUTPUT'
            )
        )

        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT_POP_POINTS,
                'Population points',
                type=QgsProcessing.TypeVectorPoint,
                createByDefault=True,
                supportsAppend=True,
                defaultValue='TEMPORARY_OUTPUT'
            )
        )

        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT_STREETS_SUBAREAS,
                'Street Layer',
                type=QgsProcessing.TypeVectorAnyGeometry,
                createByDefault=True,
                supportsAppend=True,
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT_BUILDINGS_SUBAREAS,
                'Buildings Layer',
                type=QgsProcessing.TypeVectorAnyGeometry,
                createByDefault=True,
                supportsAppend=True,
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT_SUGGESTED_SANITATION,
                'Subareas_suggested_sanitation',
                type=QgsProcessing.TypeVectorAnyGeometry,
                createByDefault=True,
                supportsAppend=True,
                defaultValue='TEMPORARY_OUTPUT'
            )
        )

    def processAlgorithm(self, parameters, context, model_feedback):
        total_steps = 63
        feedback = QgsProcessingMultiStepFeedback(total_steps, model_feedback)
        results = {}
        outputs = {}
        step_counter = 0

        def set_current_step(step_desc):
            nonlocal step_counter
            step_counter += 1
            feedback.pushInfo(f'Step {step_counter}/{total_steps}: {step_desc}')
            feedback.setCurrentStep(step_counter)
            if feedback.isCanceled():
                raise QgsProcessingException('Process canceled by user')

        # Set OUTPUT names
        parameters[self.OUTPUT_REPROJECTED_POP_RASTER] = QgsProcessingOutputLayerDefinition(parameters[self.OUTPUT_REPROJECTED_POP_RASTER])
        parameters[self.OUTPUT_REPROJECTED_POP_RASTER].destinationName = 'Reprojected Population Raster'
        
        parameters[self.OUTPUT_POP_POINTS] = QgsProcessingOutputLayerDefinition(parameters[self.OUTPUT_POP_POINTS])
        parameters[self.OUTPUT_POP_POINTS].destinationName = 'Population Points'
        
        parameters[self.OUTPUT_SUGGESTED_SANITATION] = QgsProcessingOutputLayerDefinition(parameters[self.OUTPUT_SUGGESTED_SANITATION])
        parameters[self.OUTPUT_SUGGESTED_SANITATION].destinationName = 'Subarea Sanitation Suggestion'
        
        parameters[self.OUTPUT_STREETS_SUBAREAS] = QgsProcessingOutputLayerDefinition(parameters[self.OUTPUT_STREETS_SUBAREAS])
        parameters[self.OUTPUT_STREETS_SUBAREAS].destinationName = 'Street of subareas'
        
        parameters[self.OUTPUT_BUILDINGS_SUBAREAS] = QgsProcessingOutputLayerDefinition(parameters[self.OUTPUT_BUILDINGS_SUBAREAS])
        parameters[self.OUTPUT_BUILDINGS_SUBAREAS].destinationName = 'Buildings of subareas'
        
        parameters[self.OUTPUT_REPROJECTED_POP_VECTOR] = QgsProcessingOutputLayerDefinition(parameters[self.OUTPUT_REPROJECTED_POP_VECTOR])
        parameters[self.OUTPUT_REPROJECTED_POP_VECTOR].destinationName = 'Reprojected Population Vector'

        # Style directory and files
        styleDirectory = os.path.join(QgsProject.instance().readPath("./"), "Styles")
        print('Style path: ', styleDirectory)
        popPointStyle = os.path.join(styleDirectory, "PopulationPointStyle.qml")
        subareaStyle = os.path.join(styleDirectory, "SubareasResultStyle.qml")
        streetStyle = os.path.join(styleDirectory, "StreetStyle.qml")
        buildingStyle = os.path.join(styleDirectory, "BuildingsStyle.qml")

        # 01 Exception - CRS projection UTM
        set_current_step("Exception - CRS projection UTM")
        alg_params = {
            'CONDITION': " @project_crs_acronym is not 'utm'",
            'MESSAGE': "'The project CRS: ' ||  @project_crs_description  || ' is not an UTM projection. To ensure the accuracy of the area calculation, please change it before continuing.'"
        }
        outputs['ExceptionCrsProjectionUtm'] = processing.run('native:raiseexception', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        # 02 Conditional - Type of Population Layer (evaluate if the informed layer with the population data is vector, raster or if it was not selected)
        set_current_step("Conditional - Type of Population Layer")
        population_vector_informed = parameters[self.INPUT_POPULATION_VECTOR] is not None
        population_raster_informed = parameters[self.INPUT_POPULATION_RASTER] is not None

        if not population_vector_informed and not population_raster_informed:
            # 03 Exception - Select population layer
            set_current_step("Exception - Select population layer")
            alg_params = {
                'CONDITION': None,
                'MESSAGE': "'Please select one population layer type (raster or vector layer)'"
            }
            outputs['ExceptionSelectPopulationLayer'] = processing.run('native:raiseexception', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            return {}

        if population_vector_informed and population_raster_informed:
            # 04 Exception - Select population layer
            set_current_step("Exception - Select population layer")
            alg_params = {
                'CONDITION': None,
                'MESSAGE': "'Please select only one population layer type (raster or vector layer)'"
            }
            outputs['ExceptionSelectPopulationLayer'] = processing.run('native:raiseexception', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            return {}

        # 05 Conditional - Optional Layers Selected (Evaluate individually if the optional layers [Street Layer and Buildings Layer] were selected)
        set_current_step("Conditional - Optional Layers Selected")
        street_layer_informed = parameters[self.INPUT_STREET_LAYER] is not None
        buildings_layer_informed = parameters[self.INPUT_BUILDINGS_LAYER] is not None

        if street_layer_informed:
            # 06 Reproject Streets
            set_current_step("Reproject Streets")
            alg_params = {
                'CONVERT_CURVED_GEOMETRIES': False,
                'INPUT': parameters[self.INPUT_STREET_LAYER],
                'OPERATION': '',
                'TARGET_CRS': 'ProjectCrs',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ReprojectStreets'] = processing.run('native:reprojectlayer', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 07 Fix streets
            set_current_step("Fix streets")
            alg_params = {
                'INPUT': outputs['ReprojectStreets']['OUTPUT'],
                'METHOD': 1,  # Structure
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['FixStreets'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 08 SPATIALINDEX Streets Reprojected
            set_current_step("SPATIALINDEX Streets Reprojected")
            alg_params = {
                'INPUT': outputs['FixStreets']['OUTPUT']
            }
            outputs['SpatialindexStreetsReprojected'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 09 Clip Streets by subarea
            set_current_step("Clip Streets by subarea")
            alg_params = {
                'INPUT': outputs['SpatialindexStreetsReprojected']['OUTPUT'],
                'OVERLAY': parameters[self.INPUT_SUBAREAS_LAYER],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ClipStreetsBySubarea'] = processing.run('native:clip', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 10 SPATIALINDEX Streets Clipped
            set_current_step("SPATIALINDEX Streets Clipped")
            alg_params = {
                'INPUT': outputs['ClipStreetsBySubarea']['OUTPUT']
            }
            outputs['SpatialindexStreetsClipped'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 11 Cut segments of the street outside subarea
            set_current_step("Cut segments of the street outside subarea")
            alg_params = {
                'INPUT': outputs['SpatialindexStreetsClipped']['OUTPUT'],
                'LINES': parameters[self.INPUT_SUBAREAS_LAYER],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CutSegmentsOfTheStreetOutsideSubarea'] = processing.run('native:splitwithlines', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 12 SPATIALINDEX Streets Splited
            set_current_step("SPATIALINDEX Streets Splited")
            alg_params = {
                'INPUT': outputs['CutSegmentsOfTheStreetOutsideSubarea']['OUTPUT']
            }
            outputs['SpatialindexStreetsSplited'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 13 Explode streets
            set_current_step("Explode streets")
            alg_params = {
                'INPUT': outputs['SpatialindexStreetsSplited']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ExplodeStreets'] = processing.run('native:explodelines', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 14 Segmentation of street in 15 meters
            set_current_step("Segmentation of street in 15 meters")
            alg_params = {
                'INPUT': outputs['ExplodeStreets']['OUTPUT'],
                'LENGTH': 15,
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['SegmentationOfStreetIn15Meters'] = processing.run('native:splitlinesbylength', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 15 Fix streets 2
            set_current_step("Fix streets 2")
            alg_params = {
                'INPUT': outputs['SegmentationOfStreetIn15Meters']['OUTPUT'],
                'METHOD': 0,  # Linework
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['FixStreets2'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 16 Filter streets without extension
            set_current_step("Filter streets without extension")
            alg_params = {
                'INPUT': outputs['FixStreets2']['OUTPUT'],
                'EXPRESSION': "length($geometry) > 0",
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['FilterStreetsWithoutExtension'] = processing.run('native:extractbyexpression', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 17 Calculate street length
            set_current_step("Calculate street length")
            alg_params = {
                'FIELD_LENGTH': 10,
                'FIELD_NAME': 'length',
                'FIELD_PRECISION': 2,
                'FIELD_TYPE': 0,  # Decimal (double)
                'FORMULA': '$length',
                'INPUT': outputs['FilterStreetsWithoutExtension']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CalculateStreetLength'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 18 Update street Fid
            set_current_step("Update street Fid")
            alg_params = {
                'FIELD_LENGTH': 10,
                'FIELD_NAME': 'fid',
                'FIELD_PRECISION': 2,
                'FIELD_TYPE': 1,  # Integer (32 bit)
                'FORMULA': '@id',
                'INPUT': outputs['CalculateStreetLength']['OUTPUT'],
                'OUTPUT': parameters[self.OUTPUT_STREETS_SUBAREAS]
            }
            outputs['UpdateStreetFid'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_STREETS_SUBAREAS] = outputs['UpdateStreetFid']['OUTPUT']

            # Apply style to Street Layer
            self.apply_style(QgsProcessingUtils.mapLayerFromString(results[self.OUTPUT_STREETS_SUBAREAS], context), streetStyle, feedback)

            # 19 SPATIALINDEX Streets subareas
            set_current_step("SPATIALINDEX Streets subareas")
            alg_params = {
                'INPUT': outputs['UpdateStreetFid']['OUTPUT']
            }
            outputs['SpatialindexStreetsSubareas'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        else:
            set_current_step("Create empty street layer")
            # Create a temporary street layer with a length field but no features
            street_layer = QgsVectorLayer('LineString?crs=ProjectCrs', 'temp_street_layer', 'memory')
            street_provider = street_layer.dataProvider()
            street_provider.addAttributes([QgsField('length', QVariant.Double, len=10, prec=2)])
            street_layer.updateFields()

            # Add street layer to context
            context.temporaryLayerStore().addMapLayer(street_layer)
            outputs['EmptyStreetsLayer'] = street_layer
            outputs['SpatialindexStreetsSubareas'] = processing.run('native:createspatialindex', {'INPUT': street_layer}, context=context, feedback=feedback, is_child_algorithm=True)

        if buildings_layer_informed:
            # 20 Reproject Buildings
            set_current_step("Reproject Buildings")
            alg_params = {
                'CONVERT_CURVED_GEOMETRIES': False,
                'INPUT': parameters[self.INPUT_BUILDINGS_LAYER],
                'OPERATION': '',
                'TARGET_CRS': 'ProjectCrs',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ReprojectBuildings'] = processing.run('native:reprojectlayer', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 21 Spatialindex reprojected buildings
            set_current_step("Spatialindex reprojected buildings")
            alg_params = {
                'INPUT': outputs['ReprojectBuildings']['OUTPUT']
            }
            outputs['SpatialindexReprojectedBuildings'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 22 Clip buildings by subarea
            set_current_step("Clip buildings by subarea")
            alg_params = {
                'INPUT': outputs['SpatialindexReprojectedBuildings']['OUTPUT'],
                'INTERSECT': parameters[self.INPUT_SUBAREAS_LAYER],
                'PREDICATE': [0],  # intersect
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ClipBuildingsBySubarea'] = processing.run('native:extractbylocation', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 23 Multipart to singleparts buildings
            set_current_step("Multipart to singleparts buildings")
            alg_params = {
                'INPUT': outputs['ClipBuildingsBySubarea']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['MultipartToSinglepartsBuildings'] = processing.run('native:multiparttosingleparts', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 24 Fix buildings
            set_current_step("Fix buildings")
            alg_params = {
                'INPUT': outputs['MultipartToSinglepartsBuildings']['OUTPUT'],
                'METHOD': 1,  # Structure
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['FixBuildings'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 25 Calculate buildings area
            set_current_step("Calculate buildings area")
            alg_params = {
                'FIELD_LENGTH': 10,
                'FIELD_NAME': 'area_ha',
                'FIELD_PRECISION': 4,
                'FIELD_TYPE': 0,  # Decimal (double)
                'FORMULA': '$area/10000',
                'INPUT': outputs['FixBuildings']['OUTPUT'],
                'OUTPUT': parameters[self.OUTPUT_BUILDINGS_SUBAREAS]
            }
            outputs['CalculateBuildingsArea'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_BUILDINGS_SUBAREAS] = outputs['CalculateBuildingsArea']['OUTPUT']

            # Apply style to Buildings Layer
            self.apply_style(QgsProcessingUtils.mapLayerFromString(results[self.OUTPUT_BUILDINGS_SUBAREAS], context), buildingStyle, feedback)

            # 26 SPATIALINDEX Buildings final
            set_current_step("SPATIALINDEX Buildings final")
            alg_params = {
                'INPUT': outputs['CalculateBuildingsArea']['OUTPUT']
            }
            outputs['SpatialindexBuildingsFinal'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        else:
            set_current_step("Create empty building layer")
            # Create a temporary building layer with 'fid' and 'area_ha' fields but no features
            building_layer = QgsVectorLayer('Polygon?crs=ProjectCrs', 'temp_building_layer', 'memory')
            building_provider = building_layer.dataProvider()
            building_provider.addAttributes([
                QgsField('fid', QVariant.Int, len=10),
                QgsField('area_ha', QVariant.Double, len=10, prec=4)
            ])
            building_layer.updateFields()

            # Add building layer to context
            context.temporaryLayerStore().addMapLayer(building_layer)
            outputs['EmptyBuildingsLayer'] = building_layer
            outputs['SpatialindexBuildingsFinal'] = processing.run('native:createspatialindex', {'INPUT': building_layer}, context=context, feedback=feedback, is_child_algorithm=True)

        if population_vector_informed:
            # 27 Population Vector Layer - Standard field name
            set_current_step("Population Vector Layer - Standard field name")
            alg_params = {
                'FIELD': parameters[self.INPUT_POPULATION_FIELD],
                'INPUT': parameters[self.INPUT_POPULATION_VECTOR],
                'NEW_NAME': 'PopDataset',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['PopulationVectorLayerStandardFieldName'] = processing.run('native:renametablefield', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 28 SPATIALINDEX Population Vector
            set_current_step("SPATIALINDEX Population Vector")
            alg_params = {
                'INPUT': outputs['PopulationVectorLayerStandardFieldName']['OUTPUT']
            }
            outputs['SpatialindexPopulationVector'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 29 Extract by location
            set_current_step("Extract by location")
            alg_params = {
                'INPUT': outputs['SpatialindexPopulationVector']['OUTPUT'],
                'INTERSECT': parameters[self.INPUT_SUBAREAS_LAYER],
                'PREDICATE': [0],  # intersect
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ExtractByLocation'] = processing.run('native:extractbylocation', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 30 Reproject population (vector)
            set_current_step("Reproject population (vector)")
            alg_params = {
                'CONVERT_CURVED_GEOMETRIES': False,
                'INPUT': outputs['ExtractByLocation']['OUTPUT'],
                'OPERATION': None,
                'TARGET_CRS': 'ProjectCrs',
                'OUTPUT': parameters[self.OUTPUT_REPROJECTED_POP_VECTOR]
            }
            outputs['ReprojectPopulationVector'] = processing.run('native:reprojectlayer', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_REPROJECTED_POP_VECTOR] = outputs['ReprojectPopulationVector']['OUTPUT']

            # 31 Generate OUTPUT: “OUTPUT_REPROJECTED_POP_VECTOR”
            # Already handled above

            # 32 Centroid Population Vector
            set_current_step("Centroid Population Vector")
            alg_params = {
                'ALL_PARTS': False,
                'INPUT': outputs['ReprojectPopulationVector']['OUTPUT'],
                'OUTPUT': parameters[self.OUTPUT_POP_POINTS]
            }
            outputs['CentroidPopulationVector'] = processing.run('native:centroids', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_POP_POINTS] = outputs['CentroidPopulationVector']['OUTPUT']

            # Apply style to Population Points Layer
            self.apply_style(QgsProcessingUtils.mapLayerFromString(results[self.OUTPUT_POP_POINTS], context), popPointStyle, feedback)

            # 33 Spatial Index PopV
            set_current_step("Spatial Index PopV")
            alg_params = {
                'INPUT': outputs['CentroidPopulationVector']['OUTPUT']
            }
            outputs['SpatialIndexPopv'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 34 Generate OUTPUT: “OUTPUT_POP_POINTS”
            # Already handled above

            # 35 Population per subarea (vector)
            set_current_step("Population per subarea (vector)")
            alg_params = {
                'DISCARD_NONMATCHING': False,
                'INPUT': parameters[self.INPUT_SUBAREAS_LAYER],
                'JOIN': outputs['SpatialIndexPopv']['OUTPUT'],
                'JOIN_FIELDS': ['PopDataset'],
                'PREDICATE': [0],  # intersect
                'SUMMARIES': [5],  # sum
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['PopulationPerSubareaVector'] = processing.run('native:joinbylocationsummary', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 36 Spatialindex joined pop per subarea (vector)
            set_current_step("Spatialindex joined pop per subarea (vector)")
            alg_params = {
                'INPUT': outputs['PopulationPerSubareaVector']['OUTPUT']
            }
            outputs['SpatialindexJoinedPopPerSubareaVector'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 37 Sum of length of street per subareas (vector)
            set_current_step("Sum of length of street per subareas (vector)")
            alg_params = {
                'DISCARD_NONMATCHING': False,
                'INPUT': outputs['SpatialindexJoinedPopPerSubareaVector']['OUTPUT'],
                'JOIN': outputs['SpatialindexStreetsSubareas']['OUTPUT'],
                'JOIN_FIELDS': ['length'],
                'PREDICATE': [0],  # intersect
                'SUMMARIES': [5],  # sum
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['SumOfLengthOfStreetPerSubareasVector'] = processing.run('native:joinbylocationsummary', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 38 Standarize sum street length attribute name
            set_current_step("Standarize sum street length attribute name")
            alg_params = {
                'FIELD': 'length_sum',
                'INPUT': outputs['SumOfLengthOfStreetPerSubareasVector']['OUTPUT'],
                'NEW_NAME': 'street_length_sum',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['RenameStreetLengthSumVector'] = processing.run('native:renametablefield', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 39 Spatialindex length summed subareas (vector)
            set_current_step("Spatialindex length summed subareas (vector)")
            alg_params = {
                'INPUT': outputs['RenameStreetLengthSumVector']['OUTPUT']
            }
            outputs['SpatialindexLengthSummedSubareasVector'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 40 Calculate sum of buildings (vector)
            set_current_step("Calculate sum of buildings (vector)")
            alg_params = {
                'DISCARD_NONMATCHING': False,
                'INPUT': outputs['SpatialindexLengthSummedSubareasVector']['OUTPUT'],
                'JOIN': outputs['SpatialindexBuildingsFinal']['OUTPUT'],
                'JOIN_FIELDS': ['fid'],
                'PREDICATE': [0],  # intersect
                'SUMMARIES': [0],  # count
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CalculateSumOfBuildingsVector'] = processing.run('native:joinbylocationsummary', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 41 Standarize count buildings attribute name
            set_current_step("Standarize count buildings attribute name")
            alg_params = {
                'FIELD': 'fid_count',
                'INPUT': outputs['CalculateSumOfBuildingsVector']['OUTPUT'],
                'NEW_NAME': 'count_buildings',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['RenameCountBuildingsVector'] = processing.run('native:renametablefield', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 42 Spatialindex counted buildings subareas (vector)
            set_current_step("Spatialindex counted buildings subareas (vector)")
            alg_params = {
                'INPUT': outputs['RenameCountBuildingsVector']['OUTPUT']
            }
            outputs['SpatialindexCountedBuildingsSubareasVector'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 43 Calculate sum of building areas per subarea (vector)
            set_current_step("Calculate sum of building areas per subarea (vector)")
            alg_params = {
                'DISCARD_NONMATCHING': False,
                'INPUT': outputs['SpatialindexCountedBuildingsSubareasVector']['OUTPUT'],
                'JOIN': outputs['SpatialindexBuildingsFinal']['OUTPUT'],
                'JOIN_FIELDS': ['area_ha'],
                'PREDICATE': [0],  # intersect
                'SUMMARIES': [5],  # sum
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CalculateSumOfBuildingAreasPerSubareaVector'] = processing.run('native:joinbylocationsummary', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 44 Standarize count buildings total area attribute name
            set_current_step("Standarize count buildings total area attribute name")
            alg_params = {
                'FIELD': 'area_ha_sum',
                'INPUT': outputs['CalculateSumOfBuildingAreasPerSubareaVector']['OUTPUT'],
                'NEW_NAME': 'area_buildings',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['RenameAreaBuildingsVector'] = processing.run('native:renametablefield', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 45 uuid update attribute (vector)
            set_current_step("uuid update attribute (vector)")
            alg_params = {
                'FIELD_LENGTH': 50,
                'FIELD_NAME': 'uuid',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 2,  # Text (string)
                'FORMULA': "uuid('Id128')",
                'INPUT': outputs['RenameAreaBuildingsVector']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['UuidUpdateAttributeVector'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_SUGGESTED_SANITATION] = outputs['UuidUpdateAttributeVector']['OUTPUT']

        if population_raster_informed:
            # 46 Clip raster by mask layer
            set_current_step("Clip raster by mask layer")
            alg_params = {
                'ALPHA_BAND': False,
                'CROP_TO_CUTLINE': True,
                'DATA_TYPE': 0,  # Use Input Layer Data Type
                'EXTRA': '',
                'INPUT': parameters[self.INPUT_POPULATION_RASTER],
                'KEEP_RESOLUTION': False,
                'MASK': parameters[self.INPUT_SUBAREAS_LAYER],
                'MULTITHREADING': False,
                'NODATA': 0,
                'OPTIONS': '',
                'SET_RESOLUTION': False,
                'SOURCE_CRS': None,
                'TARGET_CRS': 'ProjectCrs',
                'TARGET_EXTENT': None,
                'X_RESOLUTION': None,
                'Y_RESOLUTION': None,
                'OUTPUT': parameters[self.OUTPUT_REPROJECTED_POP_RASTER]
            }
            outputs['ClipRasterByMaskLayer'] = processing.run('gdal:cliprasterbymasklayer', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_REPROJECTED_POP_RASTER] = outputs['ClipRasterByMaskLayer']['OUTPUT']

            # 47 Reprojected Population (raster)
            # Already handled above

            # 48 Centroid Population Raster
            set_current_step("Centroid Population Raster")
            alg_params = {
                'FIELD_NAME': 'PopDataset',
                'INPUT_RASTER': outputs['ClipRasterByMaskLayer']['OUTPUT'],
                'RASTER_BAND': 1,
                'OUTPUT': parameters[self.OUTPUT_POP_POINTS]
            }
            outputs['CentroidPopulationRaster'] = processing.run('native:pixelstopoints', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_POP_POINTS] = outputs['CentroidPopulationRaster']['OUTPUT']

            # Apply style to Population Points Layer
            self.apply_style(QgsProcessingUtils.mapLayerFromString(results[self.OUTPUT_POP_POINTS], context), popPointStyle, feedback)

            # 49 Spatial Index PopR
            set_current_step("Spatial Index PopR")
            alg_params = {
                'INPUT': outputs['CentroidPopulationRaster']['OUTPUT']
            }
            outputs['SpatialIndexPopr'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 50 Generate OUTPUT: “OUTPUT_POP_POINTS”
            # Already handled above

            # 51 Population per subarea (raster)
            set_current_step("Population per subarea (raster)")
            alg_params = {
                'DISCARD_NONMATCHING': False,
                'INPUT': parameters[self.INPUT_SUBAREAS_LAYER],
                'JOIN': outputs['SpatialIndexPopr']['OUTPUT'],
                'JOIN_FIELDS': [''],
                'PREDICATE': [0],  # intersect
                'SUMMARIES': [5],  # sum
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['PopulationPerSubareaRaster'] = processing.run('native:joinbylocationsummary', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 52 Spatialindex joined pop per subarea
            set_current_step("Spatialindex joined pop per subarea")
            alg_params = {
                'INPUT': outputs['PopulationPerSubareaRaster']['OUTPUT']
            }
            outputs['SpatialindexJoinedPopPerSubarea'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 53 Sum of length of street per subareas
            set_current_step("Sum of length of street per subareas")
            alg_params = {
                'DISCARD_NONMATCHING': False,
                'INPUT': outputs['SpatialindexJoinedPopPerSubarea']['OUTPUT'],
                'JOIN': outputs['SpatialindexStreetsSubareas']['OUTPUT'],
                'JOIN_FIELDS': ['length'],
                'PREDICATE': [0],  # intersect
                'SUMMARIES': [5],  # sum
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['SumOfLengthOfStreetPerSubareas'] = processing.run('native:joinbylocationsummary', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 54 Standarize name of sum street length attribute
            set_current_step("Standarize sum street length attribute name")
            alg_params = {
                'FIELD': 'length_sum',
                'INPUT': outputs['SumOfLengthOfStreetPerSubareas']['OUTPUT'],
                'NEW_NAME': 'street_length_sum',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['RenameStreetLengthSum'] = processing.run('native:renametablefield', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 55 Spatialindex length summed subareas
            set_current_step("Spatialindex length summed subareas")
            alg_params = {
                'INPUT': outputs['RenameStreetLengthSum']['OUTPUT']
            }
            outputs['SpatialindexLengthSummedSubareas'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 56 Calculate sum of buildings
            set_current_step("Calculate sum of buildings")
            alg_params = {
                'DISCARD_NONMATCHING': False,
                'INPUT': outputs['SpatialindexLengthSummedSubareas']['OUTPUT'],
                'JOIN': outputs['SpatialindexBuildingsFinal']['OUTPUT'],
                'JOIN_FIELDS': ['fid'],
                'PREDICATE': [0],  # intersect
                'SUMMARIES': [0],  # count
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CalculateSumOfBuildings'] = processing.run('native:joinbylocationsummary', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 57 Standarize name of buildings count attribute
            set_current_step("Standarize the buildings count attribute name")
            alg_params = {
                'FIELD': 'fid_count',
                'INPUT': outputs['CalculateSumOfBuildings']['OUTPUT'],
                'NEW_NAME': 'count_buildings',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['RenameCountBuildings'] = processing.run('native:renametablefield', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 58 Spatialindex counted buildings subareas
            set_current_step("Spatialindex counted buildings subareas")
            alg_params = {
                'INPUT': outputs['RenameCountBuildings']['OUTPUT']
            }
            outputs['SpatialindexCountedBuildingsSubareas'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # # 59 Calculate sum of building areas per subarea
            # set_current_step("Calculate sum of building areas per subarea")
            # alg_params = {
            #     'DISCARD_NONMATCHING': False,
            #     'INPUT': outputs['SpatialindexCountedBuildingsSubareas']['OUTPUT'],
            #     'JOIN': outputs['SpatialindexBuildingsFinal']['OUTPUT'],
            #     'JOIN_FIELDS': ['area_ha'],
            #     'PREDICATE': [0],  # intersect
            #     'SUMMARIES': [5],  # sum
            #     'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            # }
            # outputs['CalculateSumOfBuildingAreasPerSubarea'] = processing.run('native:joinbylocationsummary', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # # 60 Standarize name of total area of buildings attribute
            # set_current_step("Standarize the total area of buildings attribute name")
            # alg_params = {
            #     'FIELD': 'area_ha_sum',
            #     'INPUT': outputs['CalculateSumOfBuildingAreasPerSubarea']['OUTPUT'],
            #     'NEW_NAME': 'area_buildings',
            #     'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            # }
            # outputs['RenameAreaBuildings'] = processing.run('native:renametablefield', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            # 61 uuid update attribute (raster)
            set_current_step("uuid update attribute (raster)")
            alg_params = {
                'FIELD_LENGTH': 50,
                'FIELD_NAME': 'uuid',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 2,  # Text (string)
                'FORMULA': "uuid('Id128')",
                'INPUT': outputs['SpatialindexCountedBuildingsSubareas']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['UuidUpdateAttributeRaster'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_SUGGESTED_SANITATION] = outputs['UuidUpdateAttributeRaster']['OUTPUT']

        # 62 Calculate indicators and suggested sanitation
        # Use the existing output layer "AggregatePopulationBySubarea" for further processing
        
        # Name of the attributes to be created and variables to be used in formulas:
        min_water_consumption_att = 'PARAM_WaterConsumReq'
        low_density_limit_att = 'PARAM_LowDensityPop'
        medium_density_limit_att = 'PARAM_MediumDensityPop'
        annual_growth_att = 'PARAM_AnnualGrowthRate'
        year_dataset_att = 'PARAM_PopDatasetYear'
        year_start_att = 'PARAM_StartPlanYear'
        peopleHH_start_att = 'PARAM_PeopleHHStart'
        year_end_att =  'PARAM_EndPlanYear'
        peopleHH_end_att = 'PARAM_PeopleHHEnd'
        street_width_att = 'PARAM_streetWidth'
        area_ha_att = 'area_ha'  
        water_available_att = 'WaterAvailable'
        existing_sanitation_att = 'ExistingSanitation'
        sanitation_type_att = 'SanitationType'
        average_water_consumption_att = 'AverageWaterConsumption'
        informal_settlement_att = 'InformalSettlement'
        low_income_area_att = 'LowIncomeArea'
        water_consumption_req_att = 'water_consump_requirem'      
        pop_dataset_att = 'PopDataset_sum'
        pop_start_att = 'pop_startPlan'
        pop_end_att = 'pop_endPlan'
        pop_density_start_att = 'pop_density_startPlan'
        pop_density_end_att = 'pop_density_endPlan'
        pop_density_class_start_att = 'classif_pop_density_startPlan'
        pop_density_class_end_att = 'classif_pop_density_endPlan'
        househould_start_att = 'households_startPlan'
        household_end_att = 'households_endPlan'
        suggested_sanit_start_att = 'SuggestedSanitSystemStart'
        suggested_sanit_end_att = 'SuggestedSanitSystemEnd'
        people_building_att = 'people_per_building'
        area_avail_att = 'area_availability'
        street_length_att = 'street_length_sum'
        building_count_att = 'count_buildings'
        buildings_area_att = 'area_buildings'
        building_per_ha_att = 'building_per_ha'
        additional_rec_att = 'AdditionalRecommendations'

        # 62.1 CREATE THE PARAMETER FIELDS
        set_current_step("Create attribute of low-density pop limit")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': low_density_limit_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 1,  # Integer (32 bit)
            'FORMULA': f' {parameters[self.INPUT_LOW_DENSITY_LIMIT]} ',
            'INPUT': results[self.OUTPUT_SUGGESTED_SANITATION],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeOfLowdensityPopLimit'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Create attribute of medium-density pop limit")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': medium_density_limit_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 1,  # Integer (32 bit)
            'FORMULA': f' {parameters[self.INPUT_MEDIUM_DENSITY_LIMIT]} ',
            'INPUT': outputs['CreateAttributeOfLowdensityPopLimit']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeOfMediumdensityPopLimit'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Create attribute with water consumption requirement")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': min_water_consumption_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 1,  # Integer (32 bit)
            'FORMULA': f' {parameters[self.INPUT_MIN_WATER_CONSUMPTION]} ',
            'INPUT': outputs['CreateAttributeOfMediumdensityPopLimit']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeWithWaterConsumptionRequirement'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Create attribute of dataset year")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': year_dataset_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 1,  # Integer (32 bit)
            'FORMULA': f' {parameters[self.INPUT_YEAR_POP_DATASET]} ',
            'INPUT': outputs['CreateAttributeWithWaterConsumptionRequirement']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeOfDatasetYear'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Create attribute of start plan year")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': year_start_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 1,  # Integer (32 bit)
            'FORMULA': f' {parameters[self.INPUT_START_PLAN_YEAR]} ',
            'INPUT': outputs['CreateAttributeOfDatasetYear']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeOfStartPlanYear'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Create attribute people household start of plan")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': peopleHH_start_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': f' {parameters[self.INPUT_PEOPLE_PER_HOUSEHOLD_START]} ',
            'INPUT': outputs['CreateAttributeOfStartPlanYear']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributePeopleHouseholdStartOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Create attribute of end of plan year")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': year_end_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 1,  # Integer (32 bit)
            'FORMULA': f' {parameters[self.INPUT_END_PLAN_YEAR]} ',
            'INPUT': outputs['CreateAttributePeopleHouseholdStartOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeOfEndOfPlanYear'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Create attribute people household end of plan")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': peopleHH_end_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': f' {parameters[self.INPUT_PEOPLE_PER_HOUSEHOLD_END]} ',
            'INPUT': outputs['CreateAttributeOfEndOfPlanYear']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributePeopleHouseholdEndOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Create attribute with annual growth rate")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': annual_growth_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': f' {parameters[self.INPUT_ANNUAL_GROWTH_RATE]} ',
            'INPUT': outputs['CreateAttributePeopleHouseholdEndOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeWithAnnualGrowthRate'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Create attribute street width")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': street_width_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': f' CASE WHEN {parameters[self.INPUT_AVERAGE_STREET_WIDTH]} is not NULL THEN {parameters[self.INPUT_AVERAGE_STREET_WIDTH]} ELSE 0 END',
            'INPUT': outputs['CreateAttributeWithAnnualGrowthRate']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeStreetWidth'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        # 62.2 CALCULATE THE INDICATORS AND RESULTS  

        # Expressions (formulas) to calculate indicators and suggestions:
        FORMULA_AREA_HA = 'round($area/10000,2)'
        FORMULA_WATER_CONSUMPTION_REQUIREMENT = f'CASE WHEN "{average_water_consumption_att}" IS NULL THEN FALSE WHEN "{average_water_consumption_att}" >= "{min_water_consumption_att}" THEN TRUE ELSE FALSE END'
        FORMULA_POP_START_PLAN = f'round("{pop_dataset_att}" * (1 + ("{annual_growth_att}"/100))^("{year_start_att}" - "{year_dataset_att}"),0)'
        FORMULA_POP_DENSITY_START_PLAN = f'round("{pop_start_att}"/"{area_ha_att}",2)'
        FORMULA_POP_DENSITY_CLASSIFICATION_START_PLAN = f'CASE WHEN "{pop_start_att}" = 0 OR "{pop_start_att}" is NULL THEN \'Without population\' WHEN "{pop_density_start_att}" <= "{low_density_limit_att}" THEN \'Low density\' WHEN "{pop_density_start_att}" > "{low_density_limit_att}" AND "{pop_density_start_att}" <= "{medium_density_limit_att}" THEN \'Medium density\' ELSE \'High density\' END'
        FORMULA_HOUSEHOLDS_START_PLAN = f'"{pop_start_att}"/ "{peopleHH_start_att}"'
        FORMULA_SUGGESTED_SANITATION_SYSTEM_START = (
        f"CASE WHEN \"{pop_density_start_att}\" >= \"{medium_density_limit_att}\" AND "
        f"(\"{existing_sanitation_att}\" IS NOT TRUE OR \"{sanitation_type_att}\" IS NOT 'Offsite') AND "
        f"\"{water_consumption_req_att}\" IS TRUE "
        f"THEN 'Offsite' "

        f"WHEN \"{pop_density_start_att}\" >= \"{low_density_limit_att}\" AND "
        f"\"{existing_sanitation_att}\" IS NOT TRUE AND "
        f"\"{water_consumption_req_att}\" IS TRUE "
        f"THEN 'Onsite or Offsite' "

        f"WHEN \"{existing_sanitation_att}\" IS TRUE "
        f"THEN 'The sanitation system already exists' "

        f"ELSE 'Onsite' "

        f"END"
        )
        FORMULA_POP_END_PLAN = f'round("{pop_dataset_att}" * (1 + ("{annual_growth_att}"/100))^("{year_end_att}" - "{year_dataset_att}"),0)'
        FORMULA_POP_DENSITY_END_PLAN = f'round("{pop_end_att}"/"{area_ha_att}",2)'
        FORMULA_POP_DENSITY_CLASSIFICATION_END_PLAN = f'CASE WHEN "{pop_end_att}" = 0 OR "{pop_end_att}" is NULL THEN \'Without population\' WHEN "{pop_density_end_att}" <= "{low_density_limit_att}" THEN \'Low density\' WHEN "{pop_density_end_att}" > "{low_density_limit_att}" AND "{pop_density_end_att}" <= "{medium_density_limit_att}" THEN \'Medium density\' ELSE \'High density\' END'
        FORMULA_HOUSEHOLDS_END_PLAN = f'"{pop_end_att}"/ "{peopleHH_end_att}"'
        FORMULA_SUGGESTED_SANITATION_SYSTEM_END = (
        f"CASE WHEN \"{pop_density_end_att}\" >= \"{medium_density_limit_att}\" AND "
        f"(\"{existing_sanitation_att}\" IS NOT TRUE OR \"{sanitation_type_att}\" IS NOT 'Offsite') AND "
        f"\"{water_consumption_req_att}\" IS TRUE "
        f"THEN 'Offsite' "

        f"WHEN \"{pop_density_end_att}\" >= \"{low_density_limit_att}\" AND "
        f"\"{existing_sanitation_att}\" IS NOT TRUE AND "
        f"\"{water_consumption_req_att}\" IS TRUE "
        f"THEN 'Onsite or Offsite' "

        f"WHEN \"{existing_sanitation_att}\" IS TRUE "
        f"THEN 'The sanitation system already exists' "

        f"ELSE 'Onsite' "
        
        f"END"
        )
        FORMULA_PEOPLE_PER_BUILDING = f'"{pop_start_att}" / "{building_count_att}"'
        FORMULA_AREA_AVAILABILITY = f'({area_ha_att} - ((coalesce("{street_width_att}", 0) * coalesce("{street_length_att}", 0))/10000) - coalesce("{buildings_area_att}", 0))/({area_ha_att}) * 100'
        FORMULA_BUILDING_PER_HA = f'coalesce(round("{building_count_att}"/"{area_ha_att}",2),0)'
        FORMULA_ADDITIONAL_RECOMMENDATIONS = (
        f"replace("
        f"(CASE WHEN (\"{pop_density_class_start_att}\" = 'High density' OR \"{pop_density_class_end_att}\" = 'High density') AND " 
        f"\"{water_consumption_req_att}\" IS NOT TRUE AND "
        f"\"{sanitation_type_att}\" IS NOT 'Offsite' "
        f"THEN 'Be aware of the increase in water consumption; if it reaches the minimum requirements, explore an OFFSITE solution' "
        f"ELSE '' "
        f"END"
        f" || '\n' || "
        f"CASE WHEN \"{informal_settlement_att}\" IS TRUE AND "
        f"\"{existing_sanitation_att}\" IS NOT TRUE "
        f"THEN 'Explore adaptive/resilient alternatives for informal settlements to sanitation systems to increase the likelihood of success' "
        f"ELSE '' "
        f"END"
        f" || '\n' || "
        f"CASE WHEN \"{low_income_area_att}\" IS TRUE AND "
        f"\"{existing_sanitation_att}\" IS NOT TRUE "
        f"THEN 'Explore economic solutions to ensure affordability for the low-income population' "
        f"ELSE '' "
        f"END), '\n\n', '\n')"
        )   

        set_current_step("Update area attribute")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': area_ha_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': FORMULA_AREA_HA,
            'INPUT': outputs['CreateAttributeStreetWidth']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['UpdateAreaAttribute'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate water consumption requirement")
        alg_params = {
            'FIELD_LENGTH': 0,
            'FIELD_NAME': water_consumption_req_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 6,  # Boolean
            'FORMULA': FORMULA_WATER_CONSUMPTION_REQUIREMENT,
            'INPUT': outputs['UpdateAreaAttribute']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculateWaterConsumptionRequirement'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate population - start of plan")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': pop_start_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': FORMULA_POP_START_PLAN,
            'INPUT': outputs['CalculateWaterConsumptionRequirement']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculatePopulationStartOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate pop density - start of plan")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': pop_density_start_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': FORMULA_POP_DENSITY_START_PLAN,
            'INPUT': outputs['CalculatePopulationStartOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculatePopDensityStartOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate pop density classification - start of plan")
        alg_params = {
            'FIELD_LENGTH': 30,
            'FIELD_NAME': pop_density_class_start_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 2,  # Text (string)
            'FORMULA': FORMULA_POP_DENSITY_CLASSIFICATION_START_PLAN,
            'INPUT': outputs['CalculatePopDensityStartOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculatePopDensityClassificationStartOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate number of households - start of plan")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': househould_start_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 1,  # Integer (32 bit)
            'FORMULA': FORMULA_HOUSEHOLDS_START_PLAN,
            'INPUT': outputs['CalculatePopDensityClassificationStartOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculateNumberOfHouseholdsStartOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate suggested sanitation system - start of plan")
        alg_params = {
            'FIELD_LENGTH': 50,
            'FIELD_NAME': suggested_sanit_start_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 2,  # Text (string)
            'FORMULA': FORMULA_SUGGESTED_SANITATION_SYSTEM_START,
            'INPUT': outputs['CalculateNumberOfHouseholdsStartOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculateSuggestedSanitationSystemStart'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate population - end of plan")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': pop_end_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': FORMULA_POP_END_PLAN,
            'INPUT': outputs['CalculateSuggestedSanitationSystemStart']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculatePopulationEndOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate pop density - end of plan")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': pop_density_end_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': FORMULA_POP_DENSITY_END_PLAN,
            'INPUT': outputs['CalculatePopulationEndOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculatePopDensityEndOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate pop density classification - end of plan")
        alg_params = {
            'FIELD_LENGTH': 30,
            'FIELD_NAME': pop_density_class_end_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 2,  # Text (string)
            'FORMULA': FORMULA_POP_DENSITY_CLASSIFICATION_END_PLAN,
            'INPUT': outputs['CalculatePopDensityEndOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculatePopDensityClassificationEndOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate number of households - end of plan")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': household_end_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 1,  # Integer (32 bit)
            'FORMULA': FORMULA_HOUSEHOLDS_END_PLAN,
            'INPUT': outputs['CalculatePopDensityClassificationEndOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculateNumberOfHouseholdsEndOfPlan'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate suggested sanitation system - end of plan")
        alg_params = {
            'FIELD_LENGTH': 50,
            'FIELD_NAME': suggested_sanit_end_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 2,  # Text (string)
            'FORMULA': FORMULA_SUGGESTED_SANITATION_SYSTEM_END,
            'INPUT': outputs['CalculateNumberOfHouseholdsEndOfPlan']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculateSuggestedSanitationSystemEnd'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        
        set_current_step("Calculate building density (per ha) per subarea")
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': building_per_ha_att,
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': FORMULA_BUILDING_PER_HA,
            'INPUT': outputs['CalculateSuggestedSanitationSystemEnd']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculateBuildingDensity'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        set_current_step("Calculate additional recommendations")
        alg_params = {
            'FIELD_LENGTH': 500,
            'FIELD_NAME': additional_rec_att,
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 2,  # Text (string)
            'FORMULA': FORMULA_ADDITIONAL_RECOMMENDATIONS,
            'INPUT': outputs['CalculateBuildingDensity']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculateAdditionalRecommendations'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        # DISREGARDING THE INDICATORS people_per_building and area_availability
        # set_current_step("Create number of people per building")
        # alg_params = {
        #     'FIELD_LENGTH': 10,
        #     'FIELD_NAME': people_building_att,
        #     'FIELD_PRECISION': 2,
        #     'FIELD_TYPE': 0,  # Decimal (double)
        #     'FORMULA': FORMULA_PEOPLE_PER_BUILDING,
        #     'INPUT': outputs['CalculateSuggestedSanitationSystemEnd']['OUTPUT'],
        #     'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        # }
        # outputs['CreateNumberOfPeoplePerBuilding'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        # set_current_step("Calculate indicator area availability")
        # alg_params = {
        #     'FIELD_LENGTH': 10,
        #     'FIELD_NAME': area_avail_att,
        #     'FIELD_PRECISION': 2,
        #     'FIELD_TYPE': 0,  # Decimal (double)
        #     'FORMULA': FORMULA_AREA_AVAILABILITY,
        #     'INPUT': outputs['CreateNumberOfPeoplePerBuilding']['OUTPUT'],
        #     'OUTPUT': parameters[self.OUTPUT_SUGGESTED_SANITATION]
        # }
        # outputs['CalculateIndicatorAreaAvailability'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        #results[self.OUTPUT_SUGGESTED_SANITATION] = outputs['CalculateIndicatorAreaAvailability']['OUTPUT']

        # Add the removal of 'fid' field right before generating the final output
        set_current_step("Remove 'fid' field from the subareas layer")
        alg_params = {
            'COLUMN': ['fid'],
            'INPUT': outputs['CalculateAdditionalRecommendations']['OUTPUT'],
            'OUTPUT': parameters[self.OUTPUT_SUGGESTED_SANITATION]
        }
        outputs['RemoveFidField'] = processing.run('native:deletecolumn', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        results[self.OUTPUT_SUGGESTED_SANITATION] = outputs['RemoveFidField']['OUTPUT']

        # Apply style to Aggregate Population by Subarea Layer
        self.apply_style(QgsProcessingUtils.mapLayerFromString(results[self.OUTPUT_SUGGESTED_SANITATION], context), subareaStyle, feedback)
  
        set_current_step("Create spatial index")
        alg_params = {
            'INPUT': outputs['RemoveFidField']['OUTPUT']
        }
        outputs['CreateSpatialIndex'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
 
     
        # Check if the checkbox for automatic update is enabled (DISABLED DUE TO THE UNSTABLE BEHAVIOR BECAUSE OF CIRCULAR REFERENCE IN THE CALCULATION)
        #auto_update_indicators = self.parameterAsBoolean(parameters, 'AUTO_UPDATE_INDICATORS', context)
        
        auto_update_indicators = True
        
        if auto_update_indicators:
            #def set_default_value(layer, field_name, expression, apply_on_update=True):
            def set_default_value(layer, field_name, expression, apply_on_update=False):
                field_index = layer.fields().indexFromName(field_name)
                if field_index != -1:
                    default_value = QgsDefaultValue()
                    default_value.setExpression(expression)
                    default_value.setApplyOnUpdate(apply_on_update)
                    layer.setDefaultValueDefinition(field_index, default_value)
                    feedback.pushInfo(f"Default value expression for '{field_name}' set to \"{expression}\" in layer: {layer.name()}")
                else:
                    feedback.pushInfo(f"Layer {layer.name()} does not have a '{field_name}' field.")
 
            # 63 Recalculate automatically with changes on the feature or parameters
            set_current_step("Recalculate automatically with changes on the feature or parameters")

            # Retrieve the output layer
            output_layer = QgsProcessingUtils.mapLayerFromString(results[self.OUTPUT_SUGGESTED_SANITATION], context)
           
            if output_layer:

                # Automatically update the values based on the expressions for the calculated fields - **HIGH DEMAND FOR MEMORY AND PROCESSOR**
                set_default_value(output_layer, 'uuid', "uuid('Id128')", True)
                set_default_value(output_layer, 'area_ha', FORMULA_AREA_HA, True)
                set_default_value(output_layer, 'water_consump_requirem', FORMULA_WATER_CONSUMPTION_REQUIREMENT)
                set_default_value(output_layer, 'pop_startPlan', FORMULA_POP_START_PLAN)
                set_default_value(output_layer, 'pop_density_startPlan', FORMULA_POP_DENSITY_START_PLAN)
                set_default_value(output_layer, 'classif_pop_density_startPlan', FORMULA_POP_DENSITY_CLASSIFICATION_START_PLAN)
                set_default_value(output_layer, 'households_startPlan', FORMULA_HOUSEHOLDS_START_PLAN)
                set_default_value(output_layer, 'SuggestedSanitSystemStart', FORMULA_SUGGESTED_SANITATION_SYSTEM_START)
                set_default_value(output_layer, 'pop_endPlan', FORMULA_POP_END_PLAN)
                set_default_value(output_layer, 'pop_density_endPlan', FORMULA_POP_DENSITY_END_PLAN)
                set_default_value(output_layer, 'classif_pop_density_endPlan', FORMULA_POP_DENSITY_CLASSIFICATION_END_PLAN)
                set_default_value(output_layer, 'households_endPlan', FORMULA_HOUSEHOLDS_END_PLAN)
                set_default_value(output_layer, 'SuggestedSanitSystemEnd', FORMULA_SUGGESTED_SANITATION_SYSTEM_END)
                set_default_value(output_layer, 'people_per_building', FORMULA_PEOPLE_PER_BUILDING)
                set_default_value(output_layer, 'area_availability', FORMULA_AREA_AVAILABILITY)
                set_default_value(output_layer, 'building_per_ha', FORMULA_BUILDING_PER_HA)
                set_default_value(output_layer, 'AdditionalRecommendations', FORMULA_ADDITIONAL_RECOMMENDATIONS)
               

                # Formulas for default value expressions that requires the name of the layer (aggregate functions) **HIGH DEMAND FOR MEMORY AND PROCESSOR**
                formula_pop_dataset_sum = "round(aggregate(layer:='{layer_name}', aggregate:='sum', expression:=\"PopDataset\", filter:=intersects(@geometry, geometry(@parent))),2)"
                formula_street_length_sum = "round(aggregate(layer:='{layer_name}', aggregate:='sum', expression:=\"length\", filter:=within(@geometry, geometry(@parent))), 2)"
                formula_count_buildings = "aggregate(layer:='{layer_name}', aggregate:='count', expression:=\"fid\", filter:=intersects(@geometry, geometry(@parent)))"
                formula_area_buildings = "round(aggregate(layer:='{layer_name}', aggregate:='sum', expression:=\"area_ha\", filter:=intersects(@geometry, geometry(@parent))), 2)"

                # Get the POPULATION dataset layer name and automatically update the values based on the expressions
                population_points_layer_def = parameters[self.OUTPUT_POP_POINTS]
                variant_def = population_points_layer_def.toVariant()
                feedback.pushInfo(f"Variant definition: {variant_def}")

                # Extract the sink path from the nested 'val' key
                sink_info = variant_def.get('sink', {})
                sink_path = sink_info.get('val', '')

                if sink_path == 'TEMPORARY_OUTPUT':
                    population_points_layer_name = population_points_layer_def.destinationName
                elif 'table=' in sink_path:
                    population_points_layer_name = sink_path.split('table="')[-1].split('"')[0]
                else:
                    population_points_layer_name = os.path.splitext(os.path.basename(sink_path))[0]

                feedback.pushInfo(f"Extracted layer name: {population_points_layer_name}")

                set_default_value(output_layer, 'PopDataset_sum', formula_pop_dataset_sum.format(layer_name=population_points_layer_name))
                feedback.pushInfo(f"Default value expression for 'PopDataset_sum' set to {formula_pop_dataset_sum.format(layer_name=population_points_layer_name)} in layer: {output_layer.name()}")

                # Get the STREETS dataset layer name and automatically update the values based on the expressions, if was selected a street layer as input
                if parameters[self.INPUT_STREET_LAYER] is not None:
                    print('Street Layer ')
                    if street_layer_informed:
                        street_layer_def = parameters[self.OUTPUT_STREETS_SUBAREAS]
                        variant_def = street_layer_def.toVariant()
                        feedback.pushInfo(f"Variant definition: {variant_def}")

                        # Extract the sink path from the nested 'val' key
                        sink_info = variant_def.get('sink', {})
                        sink_path = sink_info.get('val', '')

                        if sink_path == 'TEMPORARY_OUTPUT':
                            street_layer_name = street_layer_def.destinationName
                        elif 'table=' in sink_path:
                            street_layer_name = sink_path.split('table="')[-1].split('"')[0]
                        else:
                            street_layer_name = os.path.splitext(os.path.basename(sink_path))[0]

                        feedback.pushInfo(f"Extracted layer name: {street_layer_name}")

                        set_default_value(output_layer, 'street_length_sum', formula_street_length_sum.format(layer_name=street_layer_name))
                        feedback.pushInfo(f"Default value expression for 'street_length_sum' set to {formula_street_length_sum.format(layer_name=street_layer_name)} in layer: {output_layer.name()}")

                # Get the BUILDINGS dataset layer name and automatically update the values based on the expressions, if was selected a building layer as input
                if parameters[self.INPUT_BUILDINGS_LAYER] is not None:
                    print('Building Layer informed')
                    if buildings_layer_informed:
                        buildings_layer_def = parameters[self.OUTPUT_BUILDINGS_SUBAREAS]
                        variant_def = buildings_layer_def.toVariant()
                        feedback.pushInfo(f"Variant definition: {variant_def}")

                        # Extract the sink path from the nested 'val' key
                        sink_info = variant_def.get('sink', {})
                        sink_path = sink_info.get('val', '')

                        if sink_path == 'TEMPORARY_OUTPUT':
                            buildings_layer_name = buildings_layer_def.destinationName
                        elif 'table=' in sink_path:
                            buildings_layer_name = sink_path.split('table="')[-1].split('"')[0]
                        else:
                            buildings_layer_name = os.path.splitext(os.path.basename(sink_path))[0]

                        feedback.pushInfo(f"Extracted layer name: {buildings_layer_name}")

                        set_default_value(output_layer, 'count_buildings', formula_count_buildings.format(layer_name=buildings_layer_name))
                        feedback.pushInfo(f"Default value expression for 'count_buildings' set to {formula_count_buildings.format(layer_name=buildings_layer_name)} in layer: {output_layer.name()}")

                        set_default_value(output_layer, 'area_buildings', formula_area_buildings.format(layer_name=buildings_layer_name))
                        feedback.pushInfo(f"Default value expression for 'area_buildings' set to {formula_area_buildings.format(layer_name=buildings_layer_name)} in layer: {output_layer.name()}")

        return results
        



        
       


