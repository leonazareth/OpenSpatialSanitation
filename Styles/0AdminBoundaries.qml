<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Symbology|Labeling|Fields|Forms|Actions|AttributeTable|GeometryOptions" version="3.34.9-Prizren" labelsEnabled="0">
  <renderer-v2 symbollevels="0" type="singleSymbol" forceraster="0" referencescale="-1" enableorderby="0">
    <symbols>
      <symbol type="fill" frame_rate="10" force_rhr="0" is_animated="0" alpha="1" name="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleFill" locked="0" id="{0be477a5-9a5a-4250-bc52-1a30742c1118}">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="196,57,168,24" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="255,255,255,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="10" type="QString" name="outline_width"/>
            <Option value="RenderMetersInMapUnits" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol type="fill" frame_rate="10" force_rhr="0" is_animated="0" alpha="1" name="" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" enabled="1" class="SimpleFill" locked="0" id="{b8b14ec9-fe67-4b30-9ac8-ea6e4bb3fa9e}">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="0,0,255,255" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="35,35,35,255" type="QString" name="outline_color"/>
            <Option value="solid" type="QString" name="outline_style"/>
            <Option value="0.26" type="QString" name="outline_width"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
            <Option value="solid" type="QString" name="style"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="1">
    <activeChecks type="StringList">
      <Option value="QgsGeometryOverlapCheck" type="QString"/>
    </activeChecks>
    <checkConfiguration type="Map">
      <Option type="Map" name="QgsGeometryGapCheck">
        <Option value="0" type="double" name="allowedGapsBuffer"/>
        <Option value="false" type="bool" name="allowedGapsEnabled"/>
        <Option value="" type="QString" name="allowedGapsLayer"/>
      </Option>
    </checkConfiguration>
  </geometryOptions>
  <fieldConfiguration>
    <field name="fid" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="uuid" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="LowIncomeArea" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowNullState"/>
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="0" type="int" name="TextDisplayMethod"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="InformalSettlement" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowNullState"/>
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="0" type="int" name="TextDisplayMethod"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="fid" index="0" name=""/>
    <alias field="uuid" index="1" name=""/>
    <alias field="LowIncomeArea" index="2" name="Low-lncome Area?"/>
    <alias field="InformalSettlement" index="3" name="Informal Settlement?"/>
  </aliases>
  <splitPolicies>
    <policy policy="Duplicate" field="fid"/>
    <policy policy="Duplicate" field="uuid"/>
    <policy policy="Duplicate" field="LowIncomeArea"/>
    <policy policy="Duplicate" field="InformalSettlement"/>
  </splitPolicies>
  <defaults>
    <default expression="" field="fid" applyOnUpdate="0"/>
    <default expression="uuid('Id128')" field="uuid" applyOnUpdate="1"/>
    <default expression="" field="LowIncomeArea" applyOnUpdate="0"/>
    <default expression="" field="InformalSettlement" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="fid" unique_strength="1" notnull_strength="1" exp_strength="0" constraints="3"/>
    <constraint field="uuid" unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="LowIncomeArea" unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="InformalSettlement" unique_strength="0" notnull_strength="0" exp_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" field="fid" desc=""/>
    <constraint exp="" field="uuid" desc=""/>
    <constraint exp="" field="LowIncomeArea" desc=""/>
    <constraint exp="" field="InformalSettlement" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="&quot;InformalSettlement&quot;">
    <columns>
      <column hidden="0" type="field" width="-1" name="uuid"/>
      <column hidden="0" type="field" width="-1" name="fid"/>
      <column hidden="0" type="field" width="-1" name="InformalSettlement"/>
      <column hidden="0" type="field" width="-1" name="LowIncomeArea"/>
      <column hidden="1" type="actions" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
    geom = feature.geometry()
    control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
      <labelFont bold="0" underline="0" italic="0" strikethrough="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" style=""/>
    </labelStyle>
    <attributeEditorField horizontalStretch="0" index="3" verticalStretch="0" showLabel="1" name="InformalSettlement">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
        <labelFont bold="0" underline="0" italic="0" strikethrough="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" style=""/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorField horizontalStretch="0" index="2" verticalStretch="0" showLabel="1" name="LowIncomeArea">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
        <labelFont bold="0" underline="0" italic="0" strikethrough="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" style=""/>
      </labelStyle>
    </attributeEditorField>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="InformalSettlement"/>
    <field editable="1" name="LowIncomeArea"/>
    <field editable="1" name="fid"/>
    <field editable="1" name="uuid"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="InformalSettlement"/>
    <field labelOnTop="0" name="LowIncomeArea"/>
    <field labelOnTop="0" name="fid"/>
    <field labelOnTop="0" name="uuid"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="InformalSettlement"/>
    <field reuseLastValue="0" name="LowIncomeArea"/>
    <field reuseLastValue="0" name="fid"/>
    <field reuseLastValue="0" name="uuid"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <layerGeometryType>2</layerGeometryType>
</qgis>
