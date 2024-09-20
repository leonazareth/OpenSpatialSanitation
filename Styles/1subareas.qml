<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.34.10-Prizren" labelsEnabled="0" styleCategories="Symbology|Labeling|Fields|Forms|Actions|AttributeTable|GeometryOptions">
  <renderer-v2 referencescale="-1" forceraster="0" enableorderby="0" type="RuleRenderer" symbollevels="0">
    <rules key="{3b80a8e3-d78b-4026-9473-7e89b47c52e6}">
      <rule key="{1dfc094d-a835-47a8-82dc-ad9b8dd0ac4a}" symbol="0" filter=" &quot;WaterAvailable&quot; is not TRUE and   &quot;ExistingSanitation&quot;  is not TRUE"/>
      <rule key="{e00913fc-b2d8-493b-9d88-d604343b4c0b}" symbol="1" filter=" &quot;WaterAvailable&quot; = true" label="Water Available"/>
      <rule key="{3ea2c56e-4a79-4772-a142-ce719ed1515f}" symbol="2" filter=" &quot;water_consump_requirem&quot; = true&#xd;&#xa; " label="Meets water requirement"/>
      <rule key="{5bdf65c5-83d0-4d39-805c-6d7e087685f4}" symbol="3" filter="(&quot;ExistingSanitation&quot; is TRUE) AND (&quot;SanitationType&quot; is 'Offsite')" label="Existing Sanitation"/>
      <rule key="{8dcc75a8-2f5f-4871-b585-da2245589c1f}" symbol="4" filter="(&quot;ExistingSanitation&quot; is TRUE) AND (&quot;SanitationType&quot; is 'Onsite')" label="Existing Sanitation"/>
      <rule key="{c33ef771-d9ff-4b0d-a871-bd777ef25f0d}" symbol="5" filter="(&quot;ExistingSanitation&quot; is TRUE) AND (&quot;SanitationType&quot; is NULL)" label="Existing Sanitation"/>
      <rule key="{80c04dc0-94b9-4846-9879-4899ddcdb6c6}" symbol="6" label="Boundaries"/>
    </rules>
    <symbols>
      <symbol frame_rate="10" type="fill" name="0" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer id="{8127aac0-b0b6-42e1-b281-ec52dbb086fc}" locked="0" enabled="1" pass="0" class="SimpleFill">
          <Option type="Map">
            <Option type="QString" name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="color" value="255,255,255,88"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="255,255,255,255"/>
            <Option type="QString" name="outline_style" value="no"/>
            <Option type="QString" name="outline_width" value="0.26"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="style" value="solid"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="fill" name="1" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer id="{6b3f3336-747d-422e-b034-d211b0a2b154}" locked="0" enabled="1" pass="0" class="SimpleFill">
          <Option type="Map">
            <Option type="QString" name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="color" value="103,108,255,125"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="1,9,255,255"/>
            <Option type="QString" name="outline_style" value="no"/>
            <Option type="QString" name="outline_width" value="0.26"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="style" value="solid"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="fill" name="2" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer id="{6b3f3336-747d-422e-b034-d211b0a2b154}" locked="0" enabled="1" pass="0" class="SimpleFill">
          <Option type="Map">
            <Option type="QString" name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="color" value="77,228,255,45"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="1,9,255,255"/>
            <Option type="QString" name="outline_style" value="no"/>
            <Option type="QString" name="outline_width" value="0.26"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="style" value="solid"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="fill" name="3" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer id="{72fce6f8-6449-44bb-b14c-74cd26e5c2c5}" locked="0" enabled="1" pass="0" class="LinePatternFill">
          <Option type="Map">
            <Option type="QString" name="angle" value="49"/>
            <Option type="QString" name="clip_mode" value="before_render"/>
            <Option type="QString" name="color" value="255,180,89,255"/>
            <Option type="QString" name="coordinate_reference" value="feature"/>
            <Option type="QString" name="distance" value="2"/>
            <Option type="QString" name="distance_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="distance_unit" value="MM"/>
            <Option type="QString" name="line_width" value="0.26"/>
            <Option type="QString" name="line_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol frame_rate="10" type="line" name="@3@0" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer id="{76e06122-2ed1-40b6-b626-7f62e51d6d66}" locked="0" enabled="1" pass="0" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" name="align_dash_pattern" value="0"/>
                <Option type="QString" name="capstyle" value="square"/>
                <Option type="QString" name="customdash" value="5;2"/>
                <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="customdash_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="dash_pattern_offset" value="0"/>
                <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="dash_pattern_offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="draw_inside_polygon" value="0"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="line_color" value="255,180,89,255"/>
                <Option type="QString" name="line_style" value="solid"/>
                <Option type="QString" name="line_width" value="0.4"/>
                <Option type="QString" name="line_width_unit" value="MM"/>
                <Option type="QString" name="offset" value="0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="ring_filter" value="0"/>
                <Option type="QString" name="trim_distance_end" value="0"/>
                <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="trim_distance_end_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="trim_distance_start" value="0"/>
                <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="trim_distance_start_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
                <Option type="QString" name="use_custom_dash" value="0"/>
                <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="fill" name="4" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer id="{72fce6f8-6449-44bb-b14c-74cd26e5c2c5}" locked="0" enabled="1" pass="0" class="LinePatternFill">
          <Option type="Map">
            <Option type="QString" name="angle" value="49"/>
            <Option type="QString" name="clip_mode" value="before_render"/>
            <Option type="QString" name="color" value="12,255,36,255"/>
            <Option type="QString" name="coordinate_reference" value="feature"/>
            <Option type="QString" name="distance" value="2"/>
            <Option type="QString" name="distance_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="distance_unit" value="MM"/>
            <Option type="QString" name="line_width" value="0.26"/>
            <Option type="QString" name="line_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol frame_rate="10" type="line" name="@4@0" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer id="{76e06122-2ed1-40b6-b626-7f62e51d6d66}" locked="0" enabled="1" pass="0" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" name="align_dash_pattern" value="0"/>
                <Option type="QString" name="capstyle" value="square"/>
                <Option type="QString" name="customdash" value="5;2"/>
                <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="customdash_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="dash_pattern_offset" value="0"/>
                <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="dash_pattern_offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="draw_inside_polygon" value="0"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="line_color" value="12,255,36,255"/>
                <Option type="QString" name="line_style" value="solid"/>
                <Option type="QString" name="line_width" value="0.4"/>
                <Option type="QString" name="line_width_unit" value="MM"/>
                <Option type="QString" name="offset" value="0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="ring_filter" value="0"/>
                <Option type="QString" name="trim_distance_end" value="0"/>
                <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="trim_distance_end_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="trim_distance_start" value="0"/>
                <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="trim_distance_start_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
                <Option type="QString" name="use_custom_dash" value="0"/>
                <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="fill" name="5" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer id="{72fce6f8-6449-44bb-b14c-74cd26e5c2c5}" locked="0" enabled="1" pass="0" class="LinePatternFill">
          <Option type="Map">
            <Option type="QString" name="angle" value="49"/>
            <Option type="QString" name="clip_mode" value="before_render"/>
            <Option type="QString" name="color" value="227,26,28,255"/>
            <Option type="QString" name="coordinate_reference" value="feature"/>
            <Option type="QString" name="distance" value="2"/>
            <Option type="QString" name="distance_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="distance_unit" value="MM"/>
            <Option type="QString" name="line_width" value="0.26"/>
            <Option type="QString" name="line_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="line_width_unit" value="MM"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
          <symbol frame_rate="10" type="line" name="@5@0" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
            <data_defined_properties>
              <Option type="Map">
                <Option type="QString" name="name" value=""/>
                <Option name="properties"/>
                <Option type="QString" name="type" value="collection"/>
              </Option>
            </data_defined_properties>
            <layer id="{76e06122-2ed1-40b6-b626-7f62e51d6d66}" locked="0" enabled="1" pass="0" class="SimpleLine">
              <Option type="Map">
                <Option type="QString" name="align_dash_pattern" value="0"/>
                <Option type="QString" name="capstyle" value="square"/>
                <Option type="QString" name="customdash" value="5;2"/>
                <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="customdash_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="dash_pattern_offset" value="0"/>
                <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="dash_pattern_offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="draw_inside_polygon" value="0"/>
                <Option type="QString" name="joinstyle" value="bevel"/>
                <Option type="QString" name="line_color" value="227,26,28,255"/>
                <Option type="QString" name="line_style" value="solid"/>
                <Option type="QString" name="line_width" value="0.4"/>
                <Option type="QString" name="line_width_unit" value="MM"/>
                <Option type="QString" name="offset" value="0"/>
                <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="offset_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="ring_filter" value="0"/>
                <Option type="QString" name="trim_distance_end" value="0"/>
                <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="trim_distance_end_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="trim_distance_start" value="0"/>
                <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
                <Option type="QString" name="trim_distance_start_unit" value="RenderMetersInMapUnits"/>
                <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
                <Option type="QString" name="use_custom_dash" value="0"/>
                <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
              </Option>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </layer>
      </symbol>
      <symbol frame_rate="10" type="fill" name="6" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer id="{90b6cdc1-454a-4efe-beef-a95b6e8bfd0c}" locked="0" enabled="1" pass="0" class="SimpleLine">
          <Option type="Map">
            <Option type="QString" name="align_dash_pattern" value="0"/>
            <Option type="QString" name="capstyle" value="square"/>
            <Option type="QString" name="customdash" value="5;2"/>
            <Option type="QString" name="customdash_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="customdash_unit" value="MM"/>
            <Option type="QString" name="dash_pattern_offset" value="0"/>
            <Option type="QString" name="dash_pattern_offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="dash_pattern_offset_unit" value="MM"/>
            <Option type="QString" name="draw_inside_polygon" value="0"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="line_color" value="211,12,255,255"/>
            <Option type="QString" name="line_style" value="solid"/>
            <Option type="QString" name="line_width" value="12"/>
            <Option type="QString" name="line_width_unit" value="MapUnit"/>
            <Option type="QString" name="offset" value="0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="ring_filter" value="0"/>
            <Option type="QString" name="trim_distance_end" value="0"/>
            <Option type="QString" name="trim_distance_end_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_end_unit" value="MM"/>
            <Option type="QString" name="trim_distance_start" value="0"/>
            <Option type="QString" name="trim_distance_start_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="trim_distance_start_unit" value="MM"/>
            <Option type="QString" name="tweak_dash_pattern_on_corners" value="0"/>
            <Option type="QString" name="use_custom_dash" value="0"/>
            <Option type="QString" name="width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol frame_rate="10" type="fill" name="" alpha="1" is_animated="0" force_rhr="0" clip_to_extent="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </data_defined_properties>
        <layer id="{fb793fca-5445-46ba-b4a9-21ea5680e5c6}" locked="0" enabled="1" pass="0" class="SimpleFill">
          <Option type="Map">
            <Option type="QString" name="border_width_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="color" value="0,0,255,255"/>
            <Option type="QString" name="joinstyle" value="bevel"/>
            <Option type="QString" name="offset" value="0,0"/>
            <Option type="QString" name="offset_map_unit_scale" value="3x:0,0,0,0,0,0"/>
            <Option type="QString" name="offset_unit" value="MM"/>
            <Option type="QString" name="outline_color" value="35,35,35,255"/>
            <Option type="QString" name="outline_style" value="solid"/>
            <Option type="QString" name="outline_width" value="0.26"/>
            <Option type="QString" name="outline_width_unit" value="MM"/>
            <Option type="QString" name="style" value="solid"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </selectionSymbol>
  </selection>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <geometryOptions removeDuplicateNodes="1" geometryPrecision="0">
    <activeChecks type="StringList">
      <Option type="QString" value="QgsGeometryOverlapCheck"/>
    </activeChecks>
    <checkConfiguration type="Map">
      <Option type="Map" name="QgsGeometryGapCheck">
        <Option type="double" name="allowedGapsBuffer" value="0"/>
        <Option type="bool" name="allowedGapsEnabled" value="false"/>
        <Option type="QString" name="allowedGapsLayer" value=""/>
      </Option>
    </checkConfiguration>
  </geometryOptions>
  <fieldConfiguration>
    <field name="fid" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ExistingSanitation" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowNullState" value="false"/>
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="int" name="TextDisplayMethod" value="0"/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="SanitationType" configurationFlags="NoFlag">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option type="QString" name="Onsite" value="Onsite"/>
              </Option>
              <Option type="Map">
                <Option type="QString" name="Offsite" value="Offsite"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="InformalSettlement" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowNullState" value="false"/>
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="int" name="TextDisplayMethod" value="0"/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="LowIncomeArea" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowNullState" value="false"/>
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="int" name="TextDisplayMethod" value="0"/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="WaterAvailable" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowNullState" value="false"/>
            <Option type="QString" name="CheckedState" value=""/>
            <Option type="int" name="TextDisplayMethod" value="0"/>
            <Option type="QString" name="UncheckedState" value=""/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="AverageWaterConsumption" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="uuid" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="area_ha" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="fid" name="" index="0"/>
    <alias field="ExistingSanitation" name="Existing Sanitation?" index="1"/>
    <alias field="SanitationType" name="Type of existing sanitation" index="2"/>
    <alias field="InformalSettlement" name="Informal Settlement?" index="3"/>
    <alias field="LowIncomeArea" name="Low-lncome Area?" index="4"/>
    <alias field="WaterAvailable" name="Available water?" index="5"/>
    <alias field="AverageWaterConsumption" name="Average water consumption (liters/inhab./day)" index="6"/>
    <alias field="uuid" name="" index="7"/>
    <alias field="area_ha" name="Area (ha)" index="8"/>
  </aliases>
  <splitPolicies>
    <policy field="fid" policy="Duplicate"/>
    <policy field="ExistingSanitation" policy="Duplicate"/>
    <policy field="SanitationType" policy="Duplicate"/>
    <policy field="InformalSettlement" policy="Duplicate"/>
    <policy field="LowIncomeArea" policy="Duplicate"/>
    <policy field="WaterAvailable" policy="Duplicate"/>
    <policy field="AverageWaterConsumption" policy="Duplicate"/>
    <policy field="uuid" policy="Duplicate"/>
    <policy field="area_ha" policy="DefaultValue"/>
  </splitPolicies>
  <defaults>
    <default applyOnUpdate="0" field="fid" expression=""/>
    <default applyOnUpdate="0" field="ExistingSanitation" expression=""/>
    <default applyOnUpdate="0" field="SanitationType" expression=""/>
    <default applyOnUpdate="0" field="InformalSettlement" expression=""/>
    <default applyOnUpdate="0" field="LowIncomeArea" expression=""/>
    <default applyOnUpdate="0" field="WaterAvailable" expression=""/>
    <default applyOnUpdate="0" field="AverageWaterConsumption" expression=""/>
    <default applyOnUpdate="1" field="uuid" expression="uuid('Id128')"/>
    <default applyOnUpdate="1" field="area_ha" expression="round($area/10000,2)"/>
  </defaults>
  <constraints>
    <constraint field="fid" notnull_strength="1" constraints="3" unique_strength="1" exp_strength="0"/>
    <constraint field="ExistingSanitation" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="SanitationType" notnull_strength="2" constraints="1" unique_strength="0" exp_strength="0"/>
    <constraint field="InformalSettlement" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="LowIncomeArea" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="WaterAvailable" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="AverageWaterConsumption" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="uuid" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
    <constraint field="area_ha" notnull_strength="0" constraints="0" unique_strength="0" exp_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="fid" exp=""/>
    <constraint desc="" field="ExistingSanitation" exp=""/>
    <constraint desc="" field="SanitationType" exp=""/>
    <constraint desc="" field="InformalSettlement" exp=""/>
    <constraint desc="" field="LowIncomeArea" exp=""/>
    <constraint desc="" field="WaterAvailable" exp=""/>
    <constraint desc="" field="AverageWaterConsumption" exp=""/>
    <constraint desc="" field="uuid" exp=""/>
    <constraint desc="" field="area_ha" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;area_ha&quot;" sortOrder="0" actionWidgetStyle="dropDown">
    <columns>
      <column type="field" name="ExistingSanitation" hidden="0" width="146"/>
      <column type="field" name="WaterAvailable" hidden="0" width="-1"/>
      <column type="field" name="AverageWaterConsumption" hidden="0" width="124"/>
      <column type="field" name="uuid" hidden="0" width="245"/>
      <column type="field" name="area_ha" hidden="0" width="-1"/>
      <column type="field" name="fid" hidden="0" width="-1"/>
      <column type="field" name="SanitationType" hidden="0" width="-1"/>
      <column type="field" name="InformalSettlement" hidden="0" width="-1"/>
      <column type="field" name="LowIncomeArea" hidden="0" width="-1"/>
      <column type="actions" hidden="1" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit>my_form_open</editforminit>
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
    <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
      <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
    </labelStyle>
    <attributeEditorContainer collapsedExpressionEnabled="0" showLabel="1" visibilityExpressionEnabled="0" horizontalStretch="0" collapsedExpression="" name="Subarea Information" type="GroupBox" visibilityExpression="" verticalStretch="0" collapsed="0" columnCount="2" groupBox="1">
      <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
        <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
      </labelStyle>
      <attributeEditorField showLabel="1" horizontalStretch="0" name="ExistingSanitation" verticalStretch="0" index="1">
        <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" horizontalStretch="0" name="SanitationType" verticalStretch="0" index="2">
        <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" horizontalStretch="0" name="WaterAvailable" verticalStretch="0" index="5">
        <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" horizontalStretch="0" name="AverageWaterConsumption" verticalStretch="0" index="6">
        <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" horizontalStretch="0" name="InformalSettlement" verticalStretch="0" index="3">
        <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorContainer collapsedExpressionEnabled="0" showLabel="0" visibilityExpressionEnabled="0" horizontalStretch="0" collapsedExpression="" name="" type="Row" visibilityExpression="" verticalStretch="0" collapsed="0" columnCount="1" groupBox="0">
        <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
        </labelStyle>
      </attributeEditorContainer>
      <attributeEditorField showLabel="1" horizontalStretch="0" name="LowIncomeArea" verticalStretch="0" index="4">
        <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField showLabel="1" horizontalStretch="0" name="area_ha" verticalStretch="0" index="8">
        <labelStyle labelColor="0,0,0,255" overrideLabelFont="0" overrideLabelColor="0">
          <labelFont underline="0" description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" strikethrough="0" italic="0" bold="0" style=""/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="AdditionalRecommendations" editable="1"/>
    <field name="AverageWaterConsumption" editable="1"/>
    <field name="ExistingSanitation" editable="1"/>
    <field name="InformalSettlement" editable="1"/>
    <field name="LowIncomeArea" editable="1"/>
    <field name="PARAM_AnnualGrowthRate" editable="1"/>
    <field name="PARAM_EndPlanYear" editable="1"/>
    <field name="PARAM_LowDensityPop" editable="1"/>
    <field name="PARAM_MediumDensityPop" editable="1"/>
    <field name="PARAM_PeopleHHEnd" editable="1"/>
    <field name="PARAM_PeopleHHStart" editable="1"/>
    <field name="PARAM_PopDatasetYear" editable="1"/>
    <field name="PARAM_StartPlanYear" editable="1"/>
    <field name="PARAM_WaterConsumReq" editable="1"/>
    <field name="PARAM_streetWidth" editable="1"/>
    <field name="PopDataset_sum" editable="0"/>
    <field name="SanitationType" editable="1"/>
    <field name="SuggestedSanitSystemEnd" editable="0"/>
    <field name="SuggestedSanitSystemStart" editable="0"/>
    <field name="WaterAvailable" editable="1"/>
    <field name="abc" editable="1"/>
    <field name="area_availability" editable="0"/>
    <field name="area_buildings" editable="0"/>
    <field name="area_ha" editable="0"/>
    <field name="auxiliary_storage_labeling_lineanchorclipping" editable="0"/>
    <field name="auxiliary_storage_labeling_lineanchorpercent" editable="0"/>
    <field name="auxiliary_storage_labeling_lineanchortextpoint" editable="0"/>
    <field name="auxiliary_storage_labeling_lineanchortype" editable="0"/>
    <field name="auxiliary_storage_labeling_positionx" editable="0"/>
    <field name="auxiliary_storage_labeling_positiony" editable="0"/>
    <field name="building_per_ha" editable="1"/>
    <field name="classif_pop_density_endPlan" editable="0"/>
    <field name="classif_pop_density_startPlan" editable="0"/>
    <field name="count_buildings" editable="0"/>
    <field name="fid" editable="1"/>
    <field name="fid_sum" editable="1"/>
    <field name="households_endPlan" editable="0"/>
    <field name="households_startPlan" editable="0"/>
    <field name="people_per_building" editable="0"/>
    <field name="pop_density_endPlan" editable="0"/>
    <field name="pop_density_startPlan" editable="0"/>
    <field name="pop_endPlan" editable="0"/>
    <field name="pop_startPlan" editable="0"/>
    <field name="street_length_sum" editable="0"/>
    <field name="uuid" editable="0"/>
    <field name="water_consump_requirem" editable="0"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="1" name="AdditionalRecommendations"/>
    <field labelOnTop="0" name="AverageWaterConsumption"/>
    <field labelOnTop="0" name="ExistingSanitation"/>
    <field labelOnTop="0" name="InformalSettlement"/>
    <field labelOnTop="0" name="LowIncomeArea"/>
    <field labelOnTop="0" name="PARAM_AnnualGrowthRate"/>
    <field labelOnTop="0" name="PARAM_EndPlanYear"/>
    <field labelOnTop="0" name="PARAM_LowDensityPop"/>
    <field labelOnTop="0" name="PARAM_MediumDensityPop"/>
    <field labelOnTop="0" name="PARAM_PeopleHHEnd"/>
    <field labelOnTop="0" name="PARAM_PeopleHHStart"/>
    <field labelOnTop="0" name="PARAM_PopDatasetYear"/>
    <field labelOnTop="0" name="PARAM_StartPlanYear"/>
    <field labelOnTop="0" name="PARAM_WaterConsumReq"/>
    <field labelOnTop="0" name="PARAM_streetWidth"/>
    <field labelOnTop="0" name="PopDataset_sum"/>
    <field labelOnTop="0" name="SanitationType"/>
    <field labelOnTop="0" name="SuggestedSanitSystemEnd"/>
    <field labelOnTop="0" name="SuggestedSanitSystemStart"/>
    <field labelOnTop="0" name="WaterAvailable"/>
    <field labelOnTop="0" name="abc"/>
    <field labelOnTop="0" name="area_availability"/>
    <field labelOnTop="0" name="area_buildings"/>
    <field labelOnTop="0" name="area_ha"/>
    <field labelOnTop="0" name="auxiliary_storage_labeling_lineanchorclipping"/>
    <field labelOnTop="0" name="auxiliary_storage_labeling_lineanchorpercent"/>
    <field labelOnTop="0" name="auxiliary_storage_labeling_lineanchortextpoint"/>
    <field labelOnTop="0" name="auxiliary_storage_labeling_lineanchortype"/>
    <field labelOnTop="0" name="auxiliary_storage_labeling_positionx"/>
    <field labelOnTop="0" name="auxiliary_storage_labeling_positiony"/>
    <field labelOnTop="0" name="building_per_ha"/>
    <field labelOnTop="0" name="classif_pop_density_endPlan"/>
    <field labelOnTop="0" name="classif_pop_density_startPlan"/>
    <field labelOnTop="0" name="count_buildings"/>
    <field labelOnTop="0" name="fid"/>
    <field labelOnTop="0" name="fid_sum"/>
    <field labelOnTop="0" name="households_endPlan"/>
    <field labelOnTop="0" name="households_startPlan"/>
    <field labelOnTop="0" name="people_per_building"/>
    <field labelOnTop="0" name="pop_density_endPlan"/>
    <field labelOnTop="0" name="pop_density_startPlan"/>
    <field labelOnTop="0" name="pop_endPlan"/>
    <field labelOnTop="0" name="pop_startPlan"/>
    <field labelOnTop="0" name="street_length_sum"/>
    <field labelOnTop="0" name="uuid"/>
    <field labelOnTop="0" name="water_consump_requirem"/>
  </labelOnTop>
  <reuseLastValue>
    <field name="AdditionalRecommendations" reuseLastValue="0"/>
    <field name="AverageWaterConsumption" reuseLastValue="0"/>
    <field name="ExistingSanitation" reuseLastValue="0"/>
    <field name="InformalSettlement" reuseLastValue="0"/>
    <field name="LowIncomeArea" reuseLastValue="0"/>
    <field name="PARAM_AnnualGrowthRate" reuseLastValue="0"/>
    <field name="PARAM_EndPlanYear" reuseLastValue="0"/>
    <field name="PARAM_LowDensityPop" reuseLastValue="0"/>
    <field name="PARAM_MediumDensityPop" reuseLastValue="0"/>
    <field name="PARAM_PeopleHHEnd" reuseLastValue="0"/>
    <field name="PARAM_PeopleHHStart" reuseLastValue="0"/>
    <field name="PARAM_PopDatasetYear" reuseLastValue="0"/>
    <field name="PARAM_StartPlanYear" reuseLastValue="0"/>
    <field name="PARAM_WaterConsumReq" reuseLastValue="0"/>
    <field name="PARAM_streetWidth" reuseLastValue="0"/>
    <field name="PopDataset_sum" reuseLastValue="0"/>
    <field name="SanitationType" reuseLastValue="0"/>
    <field name="SuggestedSanitSystemEnd" reuseLastValue="0"/>
    <field name="SuggestedSanitSystemStart" reuseLastValue="0"/>
    <field name="WaterAvailable" reuseLastValue="0"/>
    <field name="abc" reuseLastValue="0"/>
    <field name="area_availability" reuseLastValue="0"/>
    <field name="area_buildings" reuseLastValue="0"/>
    <field name="area_ha" reuseLastValue="0"/>
    <field name="auxiliary_storage_labeling_lineanchorclipping" reuseLastValue="0"/>
    <field name="auxiliary_storage_labeling_lineanchorpercent" reuseLastValue="0"/>
    <field name="auxiliary_storage_labeling_lineanchortextpoint" reuseLastValue="0"/>
    <field name="auxiliary_storage_labeling_lineanchortype" reuseLastValue="0"/>
    <field name="auxiliary_storage_labeling_positionx" reuseLastValue="0"/>
    <field name="auxiliary_storage_labeling_positiony" reuseLastValue="0"/>
    <field name="building_per_ha" reuseLastValue="0"/>
    <field name="classif_pop_density_endPlan" reuseLastValue="0"/>
    <field name="classif_pop_density_startPlan" reuseLastValue="0"/>
    <field name="count_buildings" reuseLastValue="0"/>
    <field name="fid" reuseLastValue="0"/>
    <field name="fid_sum" reuseLastValue="0"/>
    <field name="households_endPlan" reuseLastValue="0"/>
    <field name="households_startPlan" reuseLastValue="0"/>
    <field name="people_per_building" reuseLastValue="0"/>
    <field name="pop_density_endPlan" reuseLastValue="0"/>
    <field name="pop_density_startPlan" reuseLastValue="0"/>
    <field name="pop_endPlan" reuseLastValue="0"/>
    <field name="pop_startPlan" reuseLastValue="0"/>
    <field name="street_length_sum" reuseLastValue="0"/>
    <field name="uuid" reuseLastValue="0"/>
    <field name="water_consump_requirem" reuseLastValue="0"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <layerGeometryType>2</layerGeometryType>
</qgis>
