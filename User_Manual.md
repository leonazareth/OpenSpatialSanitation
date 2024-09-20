<h2 align="center">User Manual</h2>

<p align="right">
  <br>
  <em>Leonardo Porto Nazareth</em>
</p>


---

The step-by-step instructions for using the scripts developed are described below.

## Creating and configuring a new project in QGIS

The first step in using the scripts you have created is to create a new project in QGIS.

1. Open QGIS

2. Click on the “New Project” button in the top left-hand corner of the window

3. Choose the directory where the new project will be saved and the name of the project

4. Add the project layers, for example a vector layer with the administrative regions, or a raster layer with the available satellite image.

*Note: we recommend using the QGIS plugin “QuickMapServices” to add satellite image base layers or OpenStreetMaps.*

*Note2: you can download the project and base files used in the research case study (city of Boca Chica, Dominican Republic) from the <a href="https://github.com/leonazareth/OpenSpatialSanitation/blob/main/Example_project/Example_project_Boca_Chica.zip">LINK</a> However, the water consumption data of the polygons has been altered for privacy reasons*


## Project settings 

In order for the scripts to work correctly, some settings must be made in the project:

1. The project must be configured with a Coordinate Reference System (CRS) that uses the mercator projection and the metos unit. To do this, after creating the project and adding the vector layers, the user must click on the button in the bottom right-hand corner of the screen, which indicates the project's current EPSG code, and in the window displayed select the CRS of the location they are working in.

<div align="center">
Example of a Mercator CRS configuration using meters:
</div>
<div align="center">
<img src="./rep_images/CRS_config.png" alt="CRS_config" width="500">
</div>


2. The *Styles* folder downloaded with the scripts must be saved in the same directory as the QGIS project.
For example, if the Exemplo_sanitation.qgz project is saved in the *“C:/user/QGIS_project”* directory, the Styles folder must be saved in the same location.

<img src="./rep_images/01_ProjectFolderStyle.gif" alt="CRS_config" width="700">

*Note: This must be done for every new project in which the user wants to use the scripts developed.*

## Step one - Create Base Layers

The Create Base Layers script is designed to assist planners in defining project areas and ensuring that all necessary data is included. It facilitates the process of creating and organizing essential spatial information for sanitation planning.

The Create Base Layers script generates standardized layers essential for sanitation planning:

- **Area of Interest (AOI)** – Mandatory layer
- **Existing Sanitation Systems** – Auxiliary layer
- **Water Availability** – Auxiliary layer
- **Administrative Boundaries** – Auxiliary layer

Additionally, under the *Advanced Parameters*, the script can optionally generate a Population Density Grid.

### Creating the base layers (configuring and running the script):

1. Open the **Processing Toolbox Panel** and double-click on **01 Create Base Layers** under the *Scripts > Sanitation Planning* section.

2. In the **Processing Algorithm Window**, select the checkboxes for the layers you wish to create.

3. Ensure a **Mercator CRS (meter-based)** is selected (if not, manually select one).

4. Choose the **format** and **directory** for the output layers. If no directory is specified, the script will generate **temporary layers**.

   *Note: Temporary layers will be lost when QGIS is closed, even if the project is saved.*

5. Click **Run** to execute the script.

#### Advanced Parameters (Optional)

1. To generate a population density grid, expand the *Advanced Parameters* by clicking the arrow beside it.

2. Specify the **extent** for the grid creation (e.g., the current map canvas extent).

3. Choose either a **Raster** or **Vector** layer that contains population data. For **Vector** layers, select the field that stores the population data.

4. Provide additional information such as:
   - The **year** of the population dataset,
   - The **type** and **size** of the grid to be created,
   - The **annual growth rate**, and
   - The **target year** for the population projection.

   *Note: The population will be projected to the target year using a linear growth model, and the population density will be calculated accordingly.*

<img src="./rep_images/02_CreateBaseLayer01.gif" alt="CRS_config" width="700">

### Delimiting the Areas:

To delimit the areas, follow these steps:

1. Select the layer you want to use for delimitation. For example, to outline the project area, select the **AOI (Area of Interest)** layer.

2. Toggle the selected layer to **Edit Mode**.

3. Use the **Drawing Features** tool in QGIS to begin delineating the area of interest for the project.

4. Once you have finished drawing, right-click to complete the shape, and then click **OK** in the form dialog.

5. Depending on the layer in use, certain mandatory information may need to be entered before clicking **OK** in the form window.

<img src="./rep_images/03-BaseLayer_Delimitating.gif" alt="CRS_config" width="700">

*Note: To edit, delete, or modify the attributes of the polygons, use QGIS’ native tools, such as Delete Features, Vertex Tool, or Attribute table.*

## Step Two - Delimitation of Subareas

Subareas are the smallest polygons formed by the intersection of the layers created in the previous step.

The delimitation of the subareas is not done manually. Instead, the algorithm **02 - Delimitation of Subareas** automatically generates them by intersecting all the parent layers defined in Step 1. The subareas are consolidated into a single layer, with all attributes combined and organized accordingly.

### Creating the Subareas:

1. Double-click on **02 - Delimitation of Subareas** under the *Scripts > Sanitation Planning* section.

2. Select the layers with the delimited areas created in Step One.

3. Define the **minimum size** for the subareas. This helps to avoid generating small polygons in the gaps between previously delimited areas.

4. Choose the name and directory for the Subarea Layer.

5. Click **Run** to execute the algorithm.

<img src="./rep_images/04-Step02_SubareaDelimitation.gif" alt="CRS_config" width="700">

*Note: You can modify the attributes of the subareas at any time. This can be done using the attribute table or the Identify tool by clicking on the polygon and editing it via the feature form.*


