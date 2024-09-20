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
from qgis.core import (QgsProcessing,
                       QgsProcessingAlgorithm,
                       QgsProcessingParameterVectorLayer,
                       QgsProcessingParameterRasterLayer,
                       QgsProcessingParameterFeatureSink,
                       QgsProcessingParameterNumber,
                       QgsProcessingParameterField,
                       QgsProcessingParameterEnum,
                       QgsProcessingParameterExtent,
                       QgsExpression,
                       QgsProject,
                       QgsProcessingUtils,
                       QgsProcessingOutputLayerDefinition,
                       QgsProcessingMultiStepFeedback)
from qgis import processing
import os

class PopulationGrid(QgsProcessingAlgorithm):
    """
    This algorithm creates a population grid and calculates various population metrics based on input parameters.
    """
   
    #Advanced parameters inputs and outputs (population density GRID)
    INPUT_GRID_EXTENSION = 'select_grid_extension'
    INPUT_GRID_SIZE = 'GRID_SIZE'
    INPUT_GRID_TYPE = 'GRID_TYPE'
    INPUT_POPULATION_RASTER = 'population_raster_layer'
    INPUT_POPULATION_VECTOR = 'population_vector_layer'
    INPUT_POPULATION_FIELD = 'select_the_population_field'
    INPUT_ANNUAL_GROWTH_RATE = 'anual_growth_rate_'
    INPUT_YEAR_POP_DATASET = 'year_of_population_data_set'
    INPUT_TARGET_YEAR = 'target_year'
    OUTPUT_POPDENSITY_GRID = 'population_density_grids'

    def tr(self, string):
        """
        Returns a translatable string with the self.tr() function.
        """
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return PopulationGrid()

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm. This string should be fixed for the algorithm, and must not be localized. The name should be unique within each provider. Names should contain lowercase alphanumeric characters only and no spaces or other formatting characters.
        """
        return '05_create_gridded_pop'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any user-visible display of the algorithm name.
        """
        return self.tr('05 Create Gridded Population')

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
        
    alg_description = '''
                        This algorithm generates a population grid and calculates population density
                        <b>Steps involved:</b>
                        <ul>
                        <li>Generate a grid based on the specified grid size.</li>
                        <li>Aggregate population data within each grid cell.</li>
                        </ul>
                    '''             
        

    def shortHelpString(self):
        """
        Returns a localized short helper string for the algorithm. This string should provide a basic description about what the algorithm does and the parameters and outputs associated with it.
        """
        return self.alg_description

    def initAlgorithm(self, config=None):
        """
        Here we define the inputs and output of the algorithm, along with some other properties.
        """

        self.addParameter(
            QgsProcessingParameterExtent(
                self.INPUT_GRID_EXTENSION,
                self.tr('Select grid extension'),
                defaultValue=None
            )
        )
        #param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        #self.addParameter(param)
        
        self.addParameter(
                QgsProcessingParameterRasterLayer(
                self.INPUT_POPULATION_RASTER,
                'Population Raster Layer',
                optional=True,
                defaultValue=None
            )
        )
        #param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        #self.addParameter(param)

        self.addParameter(
                QgsProcessingParameterVectorLayer(
                self.INPUT_POPULATION_VECTOR,
                'Population Vector Layer',
                optional=True,
                types=[QgsProcessing.TypeVectorAnyGeometry],
                defaultValue=None
            )
        )
        #param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        #self.addParameter(param)

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
        #param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        #self.addParameter(param)


        self.addParameter(
            QgsProcessingParameterNumber(
            self.INPUT_YEAR_POP_DATASET,
            self.tr('Year of Population Dataset'),
            type=QgsProcessingParameterNumber.Integer,
            minValue=2020,
            maxValue=2050,
            defaultValue=2020
        ) 
        )       
        #param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        #self.addParameter(param)

        self.addParameter( 
                QgsProcessingParameterEnum(
                self.INPUT_GRID_TYPE,
                self.tr('Grid Type'),
                options=['Rectangle', 'Diamond', 'Hexagon'],
                defaultValue=2  # Index of 'Hexagon' (since it's the 3rd option, the index is 2)
            )
        )
        #param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        #self.addParameter(param)

        self.addParameter(
                QgsProcessingParameterNumber(
                self.INPUT_GRID_SIZE,
                self.tr('Grid Size'),
                type=QgsProcessingParameterNumber.Integer,
                minValue=100,
                maxValue=5000,
                defaultValue=200
            )
        )
        #param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        #self.addParameter(param)

        self.addParameter(
                QgsProcessingParameterNumber(
                self.INPUT_ANNUAL_GROWTH_RATE,
                self.tr('Annual Growth Rate (%)'),
                type=QgsProcessingParameterNumber.Double,
                minValue=0,
                maxValue=100,
                defaultValue=1.5
            )
        )
        #param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        #self.addParameter(param)

        self.addParameter(
                QgsProcessingParameterNumber(
                self.INPUT_TARGET_YEAR,
                self.tr('Year target for calculating population density'),
                type=QgsProcessingParameterNumber.Integer,
                minValue=2020,
                maxValue=2100,
                defaultValue=2024
            )
        )
        #param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        #self.addParameter(param)

        
        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT_POPDENSITY_GRID,
                self.tr('Population density grid'),
                type=QgsProcessing.TypeVectorAnyGeometry,
                createByDefault=True,
                defaultValue='TEMPORARY_OUTPUT'
            )
        )

    def processAlgorithm(self, parameters, context, model_feedback):
        """
        Here is where the processing itself takes place.
        """
        # Use a multi-step feedback, so that individual child algorithm progress reports are adjusted for the overall progress through the model
        feedback = QgsProcessingMultiStepFeedback(64, model_feedback)  # Updated total steps to 53
        results = {}
        outputs = {}

        # Set OUTPUT names
        parameters[self.OUTPUT_POPDENSITY_GRID] = QgsProcessingOutputLayerDefinition(parameters[self.OUTPUT_POPDENSITY_GRID])
        parameters[self.OUTPUT_POPDENSITY_GRID].destinationName = 'Grided Population Density'

        # Helper function to apply style from .qml file
        def apply_style(layer, qml_path):
            if layer is None:
                feedback.pushInfo(f"No layer provided for style file '{qml_path}'")
                return
            if os.path.exists(qml_path):
                layer.loadNamedStyle(qml_path)
                layer.triggerRepaint()
                feedback.pushInfo(f"Style from '{qml_path}' applied to layer: {layer.name()}")
            else:
                feedback.pushInfo(f"Style file '{qml_path}' not found for layer: {layer.name()}")

        # Population Grid
        # Conditional - Type of Population Layer (evaluate if the informed layer with the population data is vector, raster or if it was not selected)
        population_vector_informed = parameters[self.INPUT_POPULATION_VECTOR] is not None
        population_raster_informed = parameters[self.INPUT_POPULATION_RASTER] is not None

        if population_vector_informed and population_raster_informed:
            # Exception - Select population layer
            alg_params = {
                'CONDITION': None,
                'MESSAGE': "'Please select only one population layer type (raster or vector layer)'"
            }
            outputs['ExceptionSelectPopulationLayer'] = processing.run('native:raiseexception', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            return {}

        #########################################################################
        #########################################################################

        # Aggregate the OUTPUT_POP_POINTS (from the selected vector or raster layer) in the grids
        # Exclusive OR (XOR) " ^ " to evaluate if only one of population_vector_informed or population_raster_informed is True (and not both)
        if population_vector_informed ^ population_raster_informed:

            # Map the selected grid type to its corresponding TYPE value
            grid_type_mapping = {0: 2, 1: 3, 2: 4}  # Rectangle -> 2, Diamond -> 3, Hexagon -> 4
            selected_grid_type = grid_type_mapping[parameters[self.INPUT_GRID_TYPE]]

            # Create grid
            alg_params = {
                'CRS': 'ProjectCrs',
                'EXTENT': parameters[self.INPUT_GRID_EXTENSION],
                'HOVERLAY': 0,
                'HSPACING': parameters[self.INPUT_GRID_SIZE],
                'TYPE': selected_grid_type,  # Use the selected value
                'VOVERLAY': 0,
                'VSPACING': parameters[self.INPUT_GRID_SIZE],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CreateGrid'] = processing.run('native:creategrid', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            feedback.pushInfo(f"Grid created: {outputs['CreateGrid']}")

            feedback.setCurrentStep(14)
            if feedback.isCanceled():
                return {}
            
        # VECTOR Population layer selected
        if population_vector_informed:
            # Population Vector Layer - Standard field name
            alg_params = {
                'FIELD': parameters[self.INPUT_POPULATION_FIELD],
                'INPUT': parameters[self.INPUT_POPULATION_VECTOR],
                'NEW_NAME': 'PopDataset',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['PopulationVectorLayerStandardFieldName'] = processing.run('native:renametablefield', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(5)
            if feedback.isCanceled():
                return {}

            # SPATIALINDEX Population Vector
            alg_params = {
                'INPUT': outputs['PopulationVectorLayerStandardFieldName']['OUTPUT']
            }
            outputs['SpatialindexPopulationVector'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(6)
            if feedback.isCanceled():
                return {}

            # Extract by location
            alg_params = {
                'INPUT': outputs['SpatialindexPopulationVector']['OUTPUT'],
                'INTERSECT': outputs['CreateGrid']['OUTPUT'],
                'PREDICATE': [0],  # intersect
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ExtractByLocation'] = processing.run('native:extractbylocation', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(7)
            if feedback.isCanceled():
                return {}

            # Reproject population (vector)
            alg_params = {
                'CONVERT_CURVED_GEOMETRIES': False,
                'INPUT': outputs['ExtractByLocation']['OUTPUT'],
                'OPERATION': None,
                'TARGET_CRS': 'ProjectCrs',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ReprojectPopulationVector'] = processing.run('native:reprojectlayer', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(8)
            if feedback.isCanceled():
                return {}

            # Centroid Population Vector
            alg_params = {
                'ALL_PARTS': False,
                'INPUT': outputs['ReprojectPopulationVector']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CentroidPopulationVector'] = processing.run('native:centroids', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            OUTPUT_POP_POINTS = outputs['CentroidPopulationVector']['OUTPUT']

            feedback.setCurrentStep(9)
            if feedback.isCanceled():
                return {}

            # Spatial Index PopV
            alg_params = {
                'INPUT': outputs['CentroidPopulationVector']['OUTPUT']
            }
            outputs['SpatialIndexPopv'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(10)
            if feedback.isCanceled():
                return {}

        # RASTER Population layer selected
        if population_raster_informed:
            # Clip raster by mask layer
            alg_params = {
                'ALPHA_BAND': False,
                'CROP_TO_CUTLINE': True,
                'DATA_TYPE': 0,  # Use Input Layer Data Type
                'EXTRA': '',
                'INPUT': parameters[self.INPUT_POPULATION_RASTER],
                'KEEP_RESOLUTION': False,
                'MASK': outputs['CreateGrid']['OUTPUT'],
                'MULTITHREADING': False,
                'NODATA': 0,
                'OPTIONS': '',
                'SET_RESOLUTION': False,
                'SOURCE_CRS': None,
                'TARGET_CRS': 'ProjectCrs',
                'TARGET_EXTENT': None,
                'X_RESOLUTION': None,
                'Y_RESOLUTION': None,
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ClipRasterByMaskLayer'] = processing.run('gdal:cliprasterbymasklayer', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(11)
            if feedback.isCanceled():
                return {}

            # Centroid Population Raster
            alg_params = {
                'FIELD_NAME': 'PopDataset',
                'INPUT_RASTER': outputs['ClipRasterByMaskLayer']['OUTPUT'],
                'RASTER_BAND': 1,
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CentroidPopulationRaster'] = processing.run('native:pixelstopoints', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            OUTPUT_POP_POINTS = outputs['CentroidPopulationRaster']['OUTPUT']

            feedback.setCurrentStep(12)
            if feedback.isCanceled():
                return {}

            # Spatial Index PopR
            alg_params = {
                'INPUT': outputs['CentroidPopulationRaster']['OUTPUT']
            }
            outputs['SpatialIndexPopr'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(13)
            if feedback.isCanceled():
                return {}
                
        # Aggregate population
        alg_params = {
            'DISCARD_NONMATCHING': False,
            'INPUT': outputs['CreateGrid']['OUTPUT'],
            'JOIN': OUTPUT_POP_POINTS,
            'JOIN_FIELDS': QgsExpression("'PopDataset'").evaluate(),
            'PREDICATE': [0],  # intersect
            'SUMMARIES': [5],  # sum
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['AggregatePopulation'] = processing.run('native:joinbylocationsummary', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        feedback.pushInfo(f"Population aggregated: {outputs['AggregatePopulation']}")

        feedback.setCurrentStep(15)
        if feedback.isCanceled():
            return {}

        # Filter Grids with data
        alg_params = {
            'INPUT': outputs['AggregatePopulation']['OUTPUT'],
            'EXPRESSION': '"PopDataset_sum" > 0 OR "PopDataset_sum" is not NULL',
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['FilterGridsWithData'] = processing.run('native:extractbyexpression', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        feedback.pushInfo(f"Filtered grids: {outputs['FilterGridsWithData']}")

        feedback.setCurrentStep(16)
        if feedback.isCanceled():
            return {}

        # Create population density target year attribute
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': 'YEAR_popdensity',
            'FIELD_PRECISION': 0,
            'FIELD_TYPE': 1,  # Integer (32 bit)
            'FORMULA': f'{parameters[self.INPUT_TARGET_YEAR]}',
            'INPUT': outputs['FilterGridsWithData']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeOfTargetYear'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        feedback.pushInfo(f"Target year attribute created: {outputs['CreateAttributeOfTargetYear']}")

        feedback.setCurrentStep(17)
        if feedback.isCanceled():
            return {}

        # Create attribute with annual growth rate
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': 'PARAM_AnnualGrowthRate',
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': f'{parameters[self.INPUT_ANNUAL_GROWTH_RATE]}',
            'INPUT': outputs['CreateAttributeOfTargetYear']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CreateAttributeWithAnnualGrowthRate'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        feedback.pushInfo(f"Annual growth rate attribute created: {outputs['CreateAttributeWithAnnualGrowthRate']}")

        feedback.setCurrentStep(19)
        if feedback.isCanceled():
            return {}

        # Calculate population for the target year
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': 'population',
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': ('CASE\r\n'
                        'WHEN "PopDataset_sum" is not NULL\r\n'
                        f'THEN "PopDataset_sum" * (1 + ({parameters[self.INPUT_ANNUAL_GROWTH_RATE]} /100))^('
                        f'{parameters[self.INPUT_TARGET_YEAR]} - {parameters[self.INPUT_YEAR_POP_DATASET]} )\r\n'
                        'ELSE 0\r\n'
                        'END'),
            'INPUT': outputs['CreateAttributeWithAnnualGrowthRate']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['CalculatePopulation'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        feedback.pushInfo(f"Population of target year calculated: {outputs['CalculatePopulation']}")

        feedback.setCurrentStep(20)
        if feedback.isCanceled():
            return {}

        # Calculate pop density for the target year
        alg_params = {
            'FIELD_LENGTH': 10,
            'FIELD_NAME': 'popDensity',
            'FIELD_PRECISION': 2,
            'FIELD_TYPE': 0,  # Decimal (double)
            'FORMULA': ('CASE\r\n'
                        'WHEN "PopDataset_sum" is not NULL\r\n'
                        'THEN "population"/($area/10000)\r\n'
                        'ELSE 0\r\n'
                        'END'),
            'INPUT': outputs['CalculatePopulation']['OUTPUT'],
            'OUTPUT': parameters[self.OUTPUT_POPDENSITY_GRID]
        }
        outputs['CalculatePopDensity'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
        feedback.pushInfo(f"Population density for target year calculated: {outputs['CalculatePopDensity']}")
        results[self.OUTPUT_POPDENSITY_GRID] = outputs['CalculatePopDensity']['OUTPUT']

        feedback.setCurrentStep(21)
        if feedback.isCanceled():
            return {}

        # Apply style to Population Grid Density Layer
        apply_style(QgsProcessingUtils.mapLayerFromString(results[self.OUTPUT_POPDENSITY_GRID], context), os.path.join(QgsProject.instance().readPath("./"), "Styles", "GridPopdensityStyle.qml"))


        return results

