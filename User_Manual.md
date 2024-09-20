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
*Note: we recommend using the QGIS plugin “QuickMapServices” to add satellite image base layers or OpenStreetMaps.

*Note 2: you can download the project and base files used in the research case study (city of Boca Chica, Dominican Republic) from the <a href=“https://github.com/leonazareth/OpenSpatialSanitation/blob/main/Example_project/Example_project_Boca_Chica.zip”>LINK</a>. However, the water consumption data of the polygons has been altered for privacy reasons*

## Project settings 

In order for the scripts to work correctly, some settings must be made in the project:

1. The project must be configured with a Coordinate Reference System (CRS) that uses the mercator projection and the metos unit. To do this, after creating the project and adding the vector layers, the user must click on the button in the bottom right-hand corner of the screen, which indicates the project's current EPSG code, and in the window displayed select the CRS of the location they are working in.

2. The *Styles* folder downloaded with the scripts must be saved in the same directory as the QGIS project. For example, if the Exemplo_sanitation.qgz project is saved in the “C:/user/QGIS_project” directory, the Styles folder must be saved in the same location.
*Note: This must be done for every new project in which the user wishes to use the scripts developed.

## Step one - Create Base Layers

The step-by-step instructions for manually download and installing the scripts in QGIS are described below

##### Downloading:

1. Go to <a href=“https://github.com/leonazareth/OpenSpatialSanitation/blob/main/Download_Resources/Scripts_Styles.zip”>LINK</a>

2. Click on the “...” button at the top right of the page

3. Click on “Download” and select a directory on your computer to save the .zip file
*Note: The .zip file contains the scripts developed and the styles that will be used later

4. Unzip the folders from the .zip file into a directory on your computer

<img src="./rep_images/Downloads.gif" alt="download">

##### Installing:

1. Open the QGIS

2. Go to Menu *View > Panels > Processing Toolbox Panel*.

3. At the top of the Processing Toolbox panel click on the second “Scripts” button

4. Select the “Add Script to Toolbox” option

5. Select the *Scripts* folder of the unzipped file

6. Select all the scripts (.py files) and click on the “Open” option

7. The scripts will be added to the Scripts section of the Processing Toolbox Panel

<img src="./rep_images/Installation.gif" alt="download">


## Credits
Author: Leonardo Porto Nazareth.

All the material contained in this repository is part of the thesis of the MSc programme in Water and Sustainable Development (Water and Health and Governance and Management), at the Institute for Water Education, Delft, Netherlands.

The layout was inspired by the repository <a href=“https://github.com/ArmynC/ArminC-AutoExec”>Repository</a>

## License
<a href="https://www.tldrlegal.com/license/creative-commons-attribution-4-0-international-cc-by-4" target="_blank">License CC by 4.0</a>

