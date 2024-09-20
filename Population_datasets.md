# Population Datasets for Sanitation Planning

Gridded population datasets are essential for improving early-stage sanitation planning, offering more frequent updates and granular data compared to traditional census data. 

Below is the list of population datasets selected for this thesis, following the criteria of: globally available, with a minimum resolution of 100 meters.

## 1. WorldPop

WorldPop provides global gridded population datasets using a top-down approach. The constrained dataset limits population distribution to areas with building footprints, while the unconstrained dataset spreads population data across the entire area.

| **Specification**           | **WorldPop Constrained**                                       | **WorldPop Unconstrained**                                       |
|-----------------------------|----------------------------------------------------------------|------------------------------------------------------------------|
| **Data type**                | Raster (GeoTIFF)                                               | Raster (GeoTIFF)                                                 |
| **Year**                     | 2020                                                          | 2020                                                            |
| **Resolution**               | 100 meters                                                    | 100 meters                                                      |
| **Coverage**                 | Global                                                        | Global                                                          |
| **Official source**          | [Link](https://hub.worldpop.org/geodata/listing?id=79)         | [Link](https://hub.worldpop.org/geodata/listing?id=69)           |
| **API**                      | [WorldPop API](https://www.worldpop.org/sdi/introapi/)         | [WorldPop API](https://www.worldpop.org/sdi/introapi/)           |
| **License**                  | CC BY 4.0                                                     | CC BY 4.0                                                       |

## 2. High-Resolution Settlement Layer (HRSL)

HRSL uses machine learning to detect buildings from high-resolution satellite imagery (30 meters) and redistributes the population based on these footprints.

| **Specification**           | **HRSL Dataset**                                               |
|-----------------------------|----------------------------------------------------------------|
| **Data type**                | Raster (GeoTIFF), CSV                                          |
| **Year**                     | 2020                                                          |
| **Resolution**               | 30 meters                                                     |
| **Coverage**                 | Global                                                        |
| **Official source**          | [Link](https://dataforgood.facebook.com/dfg/docs/high-resolution-population-density-maps-demographic-estimates-documentation) |
| **Alternative source**       | [Link](https://gee-community-catalog.org/projects/hrsl/)       |
| **License**                  | CC BY 4.0                                                     |

## 3. Global Human Settlement Layer (GHSL) - Copernicus

GHSL uses Sentinel-2 and Landsat imagery to create a global population grid with 100-meter resolution, spanning from 1975 to 2030 in 5-year intervals.

| **Specification**           | **GHSL Copernicus Dataset**                                    |
|-----------------------------|----------------------------------------------------------------|
| **Data type**                | Raster (GeoTIFF)                                               |
| **Year**                     | 2020                                                          |
| **Resolution**               | 100 meters                                                    |
| **Coverage**                 | Global                                                        |
| **Official source**          | [Link](https://data.jrc.ec.europa.eu/dataset/2ff68a52-5b5b-4a22-8f40-c41da8332cfe#dataaccess) |
| **Alternative source**       | [Link](https://gee-community-catalog.org/projects/ghsl/)       |
| **License**                  | CC BY 4.0                                                     |
