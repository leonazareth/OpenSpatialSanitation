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
                       QgsFeatureSink,
                       QgsProcessingException,
                       QgsProcessingAlgorithm,
                       QgsProcessingParameterVectorLayer,
                       QgsProcessingParameterRasterLayer,
                       QgsProcessingParameterFeatureSink,
                       QgsProcessingParameterBoolean,
                       QgsProcessingParameterNumber,
                       QgsProcessingParameterField,
                       QgsProcessingParameterEnum,
                       QgsProcessingParameterDefinition,
                       QgsExpression,
                       QgsProject,
                       QgsProcessingUtils,
                       QgsProcessingOutputLayerDefinition,
                       QgsProcessingMultiStepFeedback)
from qgis import processing
import os

class SubareasDelimitation(QgsProcessingAlgorithm):
    """
    This algorithm processes subareas delimitation based on provided input layers and conditions.
    """

    # Constants used to refer to parameters and outputs. They will be used when calling the algorithm from another algorithm, or when calling from the QGIS console.
    INPUT_AOI = 'area_of_interest_aoi_polygon_layer'
    INPUT_ADMIN = 'administrative_boundaries_layer'
    INPUT_SANITATION = 'existing_sanitation_system_layer'
    INPUT_WATER = 'water_availability_area_layer'
    INPUT_AREA_MIN = 'minimum_area_filter'
    OUTPUT_SUBAREAS_LAYER = 'subareas_output_layer'
    
    #Advanced parameters inputs and outputs (population density GRID)
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
        return SubareasDelimitation()

    def name(self):
        """
        Returns the algorithm name, used for identifying the algorithm. This string should be fixed for the algorithm, and must not be localized. The name should be unique within each provider. Names should contain lowercase alphanumeric characters only and no spaces or other formatting characters.
        """
        return '02SubareasDelimitation'

    def displayName(self):
        """
        Returns the translated algorithm name, which should be used for any user-visible display of the algorithm name.
        """
        return self.tr('02 Delimitation of Subareas')

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
                        This algorithm consolidates input base layers with similar characteristics into a single output layer (Subareas Layer).
                        
                        Base layers:
                        <b>Area of Interest (AOI) [Mandatory Layer]</b> 
                        The delimitation of the area of study. For instance the urban area of a city, or part of a city.
                                                
                        <b>Administrative Boundaries</b>
                        Any type of boundary that can be used to delimitate areas (official or not). For instance neighborhoods, delimitation of informal settlements, low-income areas, commercial and industrial areas...
                        
                        <b>Existing Sanitation Area</b>
                        Identification of areas where a sanitation system already exists and its type (Onsite or Offsite).
                        <i>*It is important to indicate only the areas where the sanitation system is safely managed and operated.</i>
                        
                        <b>Water Availability Area</b>
                        Identification of areas with regular water supply and the average water consumption of the area in liters per inhabitant per day.
                           
                        <b>Output Subareas Layer Flexibility:</b> The resulting subareas layer from this algorithm is flexible and can be edited manually, whether by adjusting the information, subdividing into smaller areas, or grouping into larger ones as needed.
                    
                        <b>Advanced Parameters:</b>
                        It is possible to create an auxiliary vector layer of grids with the classification of the population density of each grid. This layer can help the user visualize the population distribution and better delimit the project areas (it is recommended to use the Administrative Boundaries layer for this).
                        
                        <li><b>Population Layer:</b> The user must select either a Raster or a Vector layer containing the population data. If it is a Vector Layer, the field where the population value is stored must be provided.</li>
                        <li><b>Grid Size and Type:</b> The user can define the size and shape of the grid cells that will be used for population density calculation. Available options are rectangular, diamond, or hexagonal grids, and the size can be customized within a specific range.</li>
                        <li><b>Population Growth Parameters:</b> These parameters allow the user to project population growth over time. The user must specify the annual growth rate, the year of the population dataset, and the target year. These inputs help to calculate population densities for the target year in each grid cell.</li>
                        <li><b>Population Density Classification Limits:</b> The user can define the upper limits for low and medium population density classifications (in inhabitants per hectare). This helps categorize areas based on their density, such as low, medium, and high density.</li>
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
            QgsProcessingParameterVectorLayer(
                self.INPUT_AOI,
                self.tr('Area of Interest (AOI) Polygon Layer'),
                [QgsProcessing.TypeVectorPolygon],
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.INPUT_ADMIN,
                self.tr('Administrative Boundaries Layer'),
                optional=True,
                types=[QgsProcessing.TypeVectorPolygon],
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.INPUT_SANITATION,
                self.tr('Existing Sanitation System Layer'),
                optional=True,
                types=[QgsProcessing.TypeVectorPolygon],
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.INPUT_WATER,
                self.tr('Water Availability Area Layer'),
                optional=True,
                types=[QgsProcessing.TypeVectorPolygon],
                defaultValue=None
            )
        )

        self.addParameter(
            QgsProcessingParameterFeatureSink(
                self.OUTPUT_SUBAREAS_LAYER,
                self.tr('subareas (optional layers selected)'),
                type=QgsProcessing.TypeVectorAnyGeometry,
                createByDefault=True,
                defaultValue='TEMPORARY_OUTPUT'
            )
        )
        
        self.addParameter( 
            QgsProcessingParameterNumber(
                self.INPUT_AREA_MIN,
                self.tr('Remove subarea polygons smaller than (ha)'),
                type=QgsProcessingParameterNumber.Double,
                defaultValue=2.0
            )
        )
        
        #Advanced parameters
        param = QgsProcessingParameterRasterLayer(
                self.INPUT_POPULATION_RASTER,
                'Population Raster Layer',
                optional=True,
                defaultValue=None
        )
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)

        param = QgsProcessingParameterVectorLayer(
                self.INPUT_POPULATION_VECTOR,
                'Population Vector Layer',
                optional=True,
                types=[QgsProcessing.TypeVectorAnyGeometry],
                defaultValue=None
        )
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)

        param = QgsProcessingParameterField(
                self.INPUT_POPULATION_FIELD,
                'Select the population field',
                optional=True,
                type=QgsProcessingParameterField.Numeric,
                parentLayerParameterName=self.INPUT_POPULATION_VECTOR,
                allowMultiple=False,
                defaultValue=None
        )
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)


        param = QgsProcessingParameterNumber(
            self.INPUT_YEAR_POP_DATASET,
            self.tr('Year of Population Dataset'),
            type=QgsProcessingParameterNumber.Integer,
            minValue=2020,
            maxValue=2050,
            defaultValue=2020
        )        
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)

        param = QgsProcessingParameterEnum(
            self.INPUT_GRID_TYPE,
            self.tr('Grid Type'),
            options=['Rectangle', 'Diamond', 'Hexagon'],
            defaultValue=2  # Index of 'Hexagon' (since it's the 3rd option, the index is 2)
        )
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)

        param = QgsProcessingParameterNumber(
            self.INPUT_GRID_SIZE,
            self.tr('Grid Size'),
            type=QgsProcessingParameterNumber.Integer,
            minValue=100,
            maxValue=5000,
            defaultValue=200
        )
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)

        param = QgsProcessingParameterNumber(
            self.INPUT_ANNUAL_GROWTH_RATE,
            self.tr('Annual Growth Rate (%)'),
            type=QgsProcessingParameterNumber.Double,
            minValue=0,
            maxValue=100,
            defaultValue=1.5
        )
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)

        param = QgsProcessingParameterNumber(
            self.INPUT_TARGET_YEAR,
            self.tr('Year target for calculating population density'),
            type=QgsProcessingParameterNumber.Integer,
            minValue=2020,
            maxValue=2100,
            defaultValue=2024
        )
        param.setFlags(param.flags() | QgsProcessingParameterDefinition.FlagAdvanced)
        self.addParameter(param)

        
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
        parameters[self.OUTPUT_SUBAREAS_LAYER] = QgsProcessingOutputLayerDefinition(parameters[self.OUTPUT_SUBAREAS_LAYER])
        parameters[self.OUTPUT_SUBAREAS_LAYER].destinationName = 'Subareas - Delimited'
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

        # Raise exception - CRS projection UTM
        alg_params = {
            'CONDITION': " @project_crs_acronym is not 'utm'",
            'MESSAGE':"'The project CRS: ' ||  @project_crs_description  || ' is not an UTM projection. To ensure the accuracy of the area calculation, please change it before continuing.'"
        }
        outputs['RaiseExceptionCrsProjectionUtm'] = processing.run('native:raiseexception', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        feedback.setCurrentStep(1)
        if feedback.isCanceled():
            return {}

        # AOI Fixed
        alg_params = {
            'INPUT': parameters[self.INPUT_AOI],
            'METHOD': 1,  # Structure
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['AoiFixed'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        feedback.setCurrentStep(2)
        if feedback.isCanceled():
            return {}

        # AOI Fixed 2
        alg_params = {
            'INPUT': outputs['AoiFixed']['OUTPUT'],
            'METHOD': 0,  # Linework
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['AoiFixed2'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        feedback.setCurrentStep(3)
        if feedback.isCanceled():
            return {}

        # AOI Singleparts fixed
        alg_params = {
            'INPUT': outputs['AoiFixed2']['OUTPUT'],
            'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
        }
        outputs['AoiSinglepartsFixed'] = processing.run('native:multiparttosingleparts', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

        feedback.setCurrentStep(4)
        if feedback.isCanceled():
            return {}

        # Advanced Parameters (population grid)
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
                'INTERSECT': parameters[self.INPUT_AOI],
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
                'MASK': parameters[self.INPUT_AOI],
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

        # Aggregate the OUTPUT_POP_POINTS (from the selected vector or raster layer) in the grids
        # Exclusive OR (XOR) " ^ " to evaluate if only one of population_vector_informed or population_raster_informed is True (and not both)
        if population_vector_informed ^ population_raster_informed:

            # Map the selected grid type to its corresponding TYPE value
            grid_type_mapping = {0: 2, 1: 3, 2: 4}  # Rectangle -> 2, Diamond -> 3, Hexagon -> 4
            selected_grid_type = grid_type_mapping[parameters[self.INPUT_GRID_TYPE]]

            # Create grid
            alg_params = {
                'CRS': 'ProjectCrs',
                'EXTENT': parameters[self.INPUT_AOI],
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

        #########################################################################
        #########################################################################

        # CONDITIONAL - selected optional layers
        selected_optional_layers = any([
            parameters[self.INPUT_ADMIN] is not None,
            parameters[self.INPUT_SANITATION] is not None,
            parameters[self.INPUT_WATER] is not None
        ])

        # BRANCH 01: Only AOI layer selected (no optional layers selected)
        if not selected_optional_layers:
            # Reprojected subareas AOI
            alg_params = {
                'CONVERT_CURVED_GEOMETRIES': False,
                'INPUT': outputs['AoiSinglepartsFixed']['OUTPUT'],
                'OPERATION': None,
                'TARGET_CRS': 'ProjectCrs',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ReprojectedSubareasAoi'] = processing.run('native:reprojectlayer', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(23)
            if feedback.isCanceled():
                return {}

            # Calc Area ha AOI
            alg_params = {
                'FIELD_LENGTH': 10,
                'FIELD_NAME': 'area_ha',
                'FIELD_PRECISION': 2,
                'FIELD_TYPE': 0,  # Decimal (double)
                'FORMULA': '$area/10000',
                'INPUT': outputs['ReprojectedSubareasAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CalcAreaHaAoi'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(24)
            if feedback.isCanceled():
                return {}

            # Remove fid and uuid Fields AOI
            alg_params = {
                'COLUMN': ['fid', 'uuid'],
                'INPUT': outputs['CalcAreaHaAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['RemoveFidAndUuidFieldsAoi'] = processing.run('native:deletecolumn', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(25)
            if feedback.isCanceled():
                return {}

            # Create uuid attribute AOI
            alg_params = {
                'FIELD_LENGTH': 50,
                'FIELD_NAME': 'uuid',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 2,  # Text (string)
                'FORMULA': "uuid('Id128')",
                'INPUT': outputs['RemoveFidAndUuidFieldsAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CreateUuidAttributeAoi'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(26)
            if feedback.isCanceled():
                return {}

            # Add attribute informal settlement AOI
            alg_params = {
                'FIELD_ALIAS': None,
                'FIELD_COMMENT': None,
                'FIELD_LENGTH': 1,
                'FIELD_NAME': 'InformalSettlement',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 3,  # Boolean
                'INPUT': outputs['CreateUuidAttributeAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['AddAttributeInformalSettlementAoi'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(27)
            if feedback.isCanceled():
                return {}

            # Add attribute low-income area AOI
            alg_params = {
                'FIELD_ALIAS': None,
                'FIELD_COMMENT': None,
                'FIELD_LENGTH': 1,
                'FIELD_NAME': 'LowIncomeArea',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 3,  # Boolean
                'INPUT': outputs['AddAttributeInformalSettlementAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['AddAttributeLowIncomeAreaAoi'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(28)
            if feedback.isCanceled():
                return {}

            # Add attribute existing sanitation AOI
            alg_params = {
                'FIELD_ALIAS': None,
                'FIELD_COMMENT': None,
                'FIELD_LENGTH': 1,
                'FIELD_NAME': 'ExistingSanitation',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 3,  # Boolean
                'INPUT': outputs['AddAttributeLowIncomeAreaAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['AddAttributeExistingSanitationAoi'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(29)
            if feedback.isCanceled():
                return {}

            # Add attribute sanitation type AOI
            alg_params = {
                'FIELD_ALIAS': None,
                'FIELD_COMMENT': None,
                'FIELD_LENGTH': 50,
                'FIELD_NAME': 'SanitationType',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 2,  # Text (string)
                'INPUT': outputs['AddAttributeExistingSanitationAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['AddAttributeSanitationTypeAoi'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(30)
            if feedback.isCanceled():
                return {}

            # Add attribute water availability AOI
            alg_params = {
                'FIELD_ALIAS': None,
                'FIELD_COMMENT': None,
                'FIELD_LENGTH': 1,
                'FIELD_NAME': 'WaterAvailable',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 3,  # Boolean
                'INPUT': outputs['AddAttributeSanitationTypeAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['AddAttributeWaterAvailabilityAoi'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(31)
            if feedback.isCanceled():
                return {}

            # Add attribute water consumption AOI
            alg_params = {
                'FIELD_ALIAS': None,
                'FIELD_COMMENT': None,
                'FIELD_LENGTH': 10,
                'FIELD_NAME': 'AverageWaterConsumption',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 1,  # Decimal (double)
                'INPUT': outputs['AddAttributeWaterAvailabilityAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['AddAttributeWaterConsumptionAoi'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(32)
            if feedback.isCanceled():
                return {}

            # Remove duplicate vertices AOI
            alg_params = {
                'INPUT': outputs['AddAttributeWaterConsumptionAoi']['OUTPUT'],
                'TOLERANCE': 1e-06,
                'USE_Z_VALUE': False,
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['RemoveDuplicateVerticesAoi'] = processing.run('native:removeduplicatevertices', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(33)
            if feedback.isCanceled():
                return {}

            # Remove Features with no area AOI
            alg_params = {
                'FIELD': 'area_ha',
                'INPUT': outputs['RemoveDuplicateVerticesAoi']['OUTPUT'],
                'OPERATOR': 2,  # >
                'VALUE': parameters[self.INPUT_AREA_MIN],
                'FAIL_OUTPUT': QgsProcessing.TEMPORARY_OUTPUT,
                'OUTPUT': parameters[self.OUTPUT_SUBAREAS_LAYER]
            }
            outputs['RemoveFeaturesWithNoAreaAoi'] = processing.run('native:extractbyattribute', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_SUBAREAS_LAYER] = outputs['RemoveFeaturesWithNoAreaAoi']['OUTPUT']

            feedback.setCurrentStep(34)
            if feedback.isCanceled():
                return {}

            # Subareas SPATIALINDEX AOI
            alg_params = {
                'INPUT': outputs['RemoveFeaturesWithNoAreaAoi']['FAIL_OUTPUT']
            }
            outputs['SubareasSpatialindexAoi'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(35)
            if feedback.isCanceled():
                return {}

            # Apply style to the AOI output
            apply_style(QgsProcessingUtils.mapLayerFromString(results[self.OUTPUT_SUBAREAS_LAYER], context), os.path.join(QgsProject.instance().readPath("./"), "Styles", "1subareas.qml"))

        else:
            # BRANCH 02: at least one optional layer is selected

            # Handle sanitation layer
            if parameters[self.INPUT_SANITATION] is not None:
                alg_params = {
                    'INPUT': parameters[self.INPUT_SANITATION],
                    'METHOD': 1,  # Structure
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['SanitationAreaFixed'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(36)
                if feedback.isCanceled():
                    return {}

                alg_params = {
                    'INPUT': outputs['SanitationAreaFixed']['OUTPUT'],
                    'METHOD': 0,  # Linework
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['SanitationAreaFixed2'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(37)
                if feedback.isCanceled():
                    return {}

                alg_params = {
                    'INPUT': outputs['SanitationAreaFixed2']['OUTPUT'],
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['SanitationSinglepartsFixed'] = processing.run('native:multiparttosingleparts', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(38)
                if feedback.isCanceled():
                    return {}

            # Handle admin layer
            if parameters[self.INPUT_ADMIN] is not None:
                alg_params = {
                    'INPUT': parameters[self.INPUT_ADMIN],
                    'METHOD': 1,  # Structure
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['AdminBoundariesFixed'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(39)
                if feedback.isCanceled():
                    return {}

                alg_params = {
                    'INPUT': outputs['AdminBoundariesFixed']['OUTPUT'],
                    'METHOD': 0,  # Linework
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['AdminBoundariesFixed2'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(40)
                if feedback.isCanceled():
                    return {}

                alg_params = {
                    'INPUT': outputs['AdminBoundariesFixed2']['OUTPUT'],
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['AdminSinglepartsFixed'] = processing.run('native:multiparttosingleparts', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(41)
                if feedback.isCanceled():
                    return {}

            # Handle water layer
            if parameters[self.INPUT_WATER] is not None:
                alg_params = {
                    'INPUT': parameters[self.INPUT_WATER],
                    'METHOD': 1,  # Structure
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['WaterAreaFixed'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(42)
                if feedback.isCanceled():
                    return {}

                alg_params = {
                    'INPUT': outputs['WaterAreaFixed']['OUTPUT'],
                    'METHOD': 0,  # Linework
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['WaterAreaFixed2'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(43)
                if feedback.isCanceled():
                    return {}

                alg_params = {
                    'INPUT': outputs['WaterAreaFixed2']['OUTPUT'],
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['WaterSinglepartsFixed'] = processing.run('native:multiparttosingleparts', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(44)
                if feedback.isCanceled():
                    return {}

            # Union (multiple)
            overlays = [outputs['AoiSinglepartsFixed']['OUTPUT']]
            if 'SanitationSinglepartsFixed' in outputs:
                overlays.append(outputs['SanitationSinglepartsFixed']['OUTPUT'])
            if 'AdminSinglepartsFixed' in outputs:
                overlays.append(outputs['AdminSinglepartsFixed']['OUTPUT'])
            if 'WaterSinglepartsFixed' in outputs:
                overlays.append(outputs['WaterSinglepartsFixed']['OUTPUT'])

            if overlays:
                alg_params = {
                    'INPUT': outputs['AoiSinglepartsFixed']['OUTPUT'],
                    'OVERLAYS': overlays,
                    'OVERLAY_FIELDS_PREFIX': None,
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['UnionMultiple'] = processing.run('native:multiunion', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(45)
                if feedback.isCanceled():
                    return {}

                # Union Fixed
                alg_params = {
                    'INPUT': outputs['UnionMultiple']['OUTPUT'],
                    'METHOD': 1,  # Structure
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['UnionFixed'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(46)
            if feedback.isCanceled():
                return {}

            # Union Fixed2
            alg_params = {
                'INPUT': outputs['UnionFixed']['OUTPUT'],
                'METHOD': 0,  # Linework
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['UnionFixed2'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(47)
            if feedback.isCanceled():
                return {}

            # Clip union by AOI
            alg_params = {
                'INPUT': outputs['UnionFixed2']['OUTPUT'],
                'OVERLAY': outputs['AoiSinglepartsFixed']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ClipUnionByAoi'] = processing.run('native:clip', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(48)
            if feedback.isCanceled():
                return {}

            # subareas Singleparts
            alg_params = {
                'INPUT': outputs['ClipUnionByAoi']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['SubareasSingleparts'] = processing.run('native:multiparttosingleparts', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(49)
            if feedback.isCanceled():
                return {}

            # Remove fid and uuid Fields
            alg_params = {
                'COLUMN': ['fid', 'fid_1', 'fid_2', 'fid_3', 'fid_4', 'fid_5', 'uuid', 'uuid_1', 'uuid_2', 'uuid_3', 'uuid_4', 'uuid_5'],
                'INPUT': outputs['SubareasSingleparts']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['RemoveFidAndUuidFields'] = processing.run('native:deletecolumn', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(50)
            if feedback.isCanceled():
                return {}

            # Reprojected subareas
            alg_params = {
                'CONVERT_CURVED_GEOMETRIES': False,
                'INPUT': outputs['RemoveFidAndUuidFields']['OUTPUT'],
                'OPERATION': None,
                'TARGET_CRS': 'ProjectCrs',
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['ReprojectedSubareas'] = processing.run('native:reprojectlayer', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(51)
            if feedback.isCanceled():
                return {}

            # Create uuid attribute
            alg_params = {
                'FIELD_LENGTH': 50,
                'FIELD_NAME': 'uuid',
                'FIELD_PRECISION': 0,
                'FIELD_TYPE': 2,  # Text (string)
                'FORMULA': "uuid('Id128')",
                'INPUT': outputs['ReprojectedSubareas']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CreateUuidAttribute'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(52)
            if feedback.isCanceled():
                return {}

            # Calc Area ha
            alg_params = {
                'FIELD_LENGTH': 10,
                'FIELD_NAME': 'area_ha',
                'FIELD_PRECISION': 2,
                'FIELD_TYPE': 0,  # Decimal (double)
                'FORMULA': '$area/10000',
                'INPUT': outputs['CreateUuidAttribute']['OUTPUT'],
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['CalcAreaHa'] = processing.run('native:fieldcalculator', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(53)
            if feedback.isCanceled():
                return {}


            # Load the output layer to access its fields
            calc_area_layer = QgsProcessingUtils.mapLayerFromString(outputs['CalcAreaHa']['OUTPUT'], context)
            if calc_area_layer is None:
                raise QgsProcessingException(self.tr('Error loading layer from CalcAreaHa output'))

            # CONDITIONAL – evaluate if the output of the “Calc Area ha” algorithm have the fields: ExistingSanitation, WaterAvailable, and AverageWaterConsumption
            existing_fields = [field.name() for field in calc_area_layer.fields()]

            # Add attribute informal settlements if not present
            if 'InformalSettlement' not in existing_fields:
                alg_params = {
                    'FIELD_ALIAS': None,
                    'FIELD_COMMENT': None,
                    'FIELD_LENGTH': 1,
                    'FIELD_NAME': 'InformalSettlement',
                    'FIELD_PRECISION': 0,
                    'FIELD_TYPE': 3,  # Boolean
                    'INPUT': outputs['CalcAreaHa']['OUTPUT'],
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['AddAttributeInformalSettlement'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(54)
                if feedback.isCanceled():
                    return {}
                final_output = outputs['AddAttributeInformalSettlement']['OUTPUT']
            else:
                final_output = outputs['CalcAreaHa']['OUTPUT']

            # Add attribute low-income area if not present
            if 'LowIncomeArea' not in existing_fields:
                alg_params = {
                    'FIELD_ALIAS': None,
                    'FIELD_COMMENT': None,
                    'FIELD_LENGTH': 1,
                    'FIELD_NAME': 'LowIncomeArea',
                    'FIELD_PRECISION': 0,
                    'FIELD_TYPE': 3,  # Boolean
                    'INPUT': final_output,
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['AddAttributeLowIncomeArea'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(55)
                if feedback.isCanceled():
                    return {}
                final_output = outputs['AddAttributeLowIncomeArea']['OUTPUT']
            else:
                final_output

            # Add attribute existing sanitation if not present
            if 'ExistingSanitation' not in existing_fields:
                alg_params = {
                    'FIELD_ALIAS': None,
                    'FIELD_COMMENT': None,
                    'FIELD_LENGTH': 1,
                    'FIELD_NAME': 'ExistingSanitation',
                    'FIELD_PRECISION': 0,
                    'FIELD_TYPE': 3,  # Boolean
                    'INPUT': final_output,
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['AddAttributeExistingSanitation'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(56)
                if feedback.isCanceled():
                    return {}
                final_output = outputs['AddAttributeExistingSanitation']['OUTPUT']
            else:
                final_output

            # Add attribute sanitation type if not present
            if 'SanitationType' not in existing_fields:
                alg_params = {
                    'FIELD_ALIAS': None,
                    'FIELD_COMMENT': None,
                    'FIELD_LENGTH': 50,
                    'FIELD_NAME': 'SanitationType',
                    'FIELD_PRECISION': 0,
                    'FIELD_TYPE': 2,  # Text (string)
                    'INPUT': final_output,
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['AddAttributeSanitationType'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(57)
                if feedback.isCanceled():
                    return {}
                final_output = outputs['AddAttributeSanitationType']['OUTPUT']
            else:
                final_output

            # Add attribute water availability if not present
            if 'WaterAvailable' not in existing_fields:
                alg_params = {
                    'FIELD_ALIAS': None,
                    'FIELD_COMMENT': None,
                    'FIELD_LENGTH': 1,
                    'FIELD_NAME': 'WaterAvailable',
                    'FIELD_PRECISION': 0,
                    'FIELD_TYPE': 3,  # Boolean
                    'INPUT': final_output,
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['AddAttributeWaterAvailability'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(58)
                if feedback.isCanceled():
                    return {}
                final_output = outputs['AddAttributeWaterAvailability']['OUTPUT']
            else:
                final_output

            # Add attribute water consumption if not present
            if 'AverageWaterConsumption' not in existing_fields:
                alg_params = {
                    'FIELD_ALIAS': None,
                    'FIELD_COMMENT': None,
                    'FIELD_LENGTH': 10,
                    'FIELD_NAME': 'AverageWaterConsumption',
                    'FIELD_PRECISION': 0,
                    'FIELD_TYPE': 1,  # Decimal (double)
                    'INPUT': final_output,
                    'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
                }
                outputs['AddAttributeWaterConsumption'] = processing.run('native:addfieldtoattributestable', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

                feedback.setCurrentStep(59)
                if feedback.isCanceled():
                    return {}
                final_output = outputs['AddAttributeWaterConsumption']['OUTPUT']
            else:
                final_output

            # Subareas Fixed
            alg_params = {
                'INPUT': final_output,
                'METHOD': 1,  # Structure
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['SubareasFixed'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(60)
            if feedback.isCanceled():
                return {}

            # Subareas Fixed2
            alg_params = {
                'INPUT': outputs['SubareasFixed']['OUTPUT'],
                'METHOD': 0,  # Linework
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['SubareasFixed2'] = processing.run('native:fixgeometries', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(61)
            if feedback.isCanceled():
                return {}

            # Remove duplicate vertices
            alg_params = {
                'INPUT': outputs['SubareasFixed2']['OUTPUT'],
                'TOLERANCE': 1e-06,
                'USE_Z_VALUE': False,
                'OUTPUT': QgsProcessing.TEMPORARY_OUTPUT
            }
            outputs['RemoveDuplicateVertices'] = processing.run('native:removeduplicatevertices', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(62)
            if feedback.isCanceled():
                return {}

            # Remove Features with no area
            alg_params = {
                'FIELD': 'area_ha',
                'INPUT': outputs['RemoveDuplicateVertices']['OUTPUT'],
                'OPERATOR': 2,  # >
                'VALUE': parameters[self.INPUT_AREA_MIN],
                'FAIL_OUTPUT': QgsProcessing.TEMPORARY_OUTPUT,
                'OUTPUT': parameters[self.OUTPUT_SUBAREAS_LAYER]
            }
            outputs['RemoveFeaturesWithNoArea'] = processing.run('native:extractbyattribute', alg_params, context=context, feedback=feedback, is_child_algorithm=True)
            results[self.OUTPUT_SUBAREAS_LAYER] = outputs['RemoveFeaturesWithNoArea']['OUTPUT']

            feedback.setCurrentStep(63)
            if feedback.isCanceled():
                return {}

            # Subareas SPATIALINDEX
            alg_params = {
                'INPUT': outputs['RemoveFeaturesWithNoArea']['FAIL_OUTPUT']
            }
            outputs['SubareasSpatialindex'] = processing.run('native:createspatialindex', alg_params, context=context, feedback=feedback, is_child_algorithm=True)

            feedback.setCurrentStep(64)
            if feedback.isCanceled():
                return {}

            # Apply style to the optional output
            apply_style(QgsProcessingUtils.mapLayerFromString(results[self.OUTPUT_SUBAREAS_LAYER], context), os.path.join(QgsProject.instance().readPath("./"), "Styles", "1subareas.qml"))

        return results

