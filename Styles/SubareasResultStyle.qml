<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="1" version="3.34.10-Prizren" styleCategories="Symbology|Labeling|Fields|Forms|Actions|AttributeTable|GeometryOptions">
  <renderer-v2 symbollevels="0" forceraster="0" referencescale="-1" enableorderby="0" type="RuleRenderer">
    <rules key="{3b80a8e3-d78b-4026-9473-7e89b47c52e6}">
      <rule filter=" &quot;WaterAvailable&quot; is not TRUE and   &quot;ExistingSanitation&quot;  is not TRUE" symbol="0" key="{1dfc094d-a835-47a8-82dc-ad9b8dd0ac4a}"/>
      <rule filter=" &quot;WaterAvailable&quot; = true" label="Water Available" symbol="1" key="{e00913fc-b2d8-493b-9d88-d604343b4c0b}"/>
      <rule checkstate="0" filter=" &quot;water_consump_requirem&quot; = true&#xd;&#xa; " label="Meets water requirement" symbol="2" key="{73ccd888-5d16-49a4-bd81-bca3d6f26ce7}"/>
      <rule filter=" &quot;ExistingSanitation&quot; = true and &quot;SanitationType&quot; = 'Offsite'" label="Existing Offsite Sanitation" symbol="3" key="{08a9f24d-f6cd-413b-a9f8-4c434885fe84}"/>
      <rule filter=" &quot;ExistingSanitation&quot; = true and &quot;SanitationType&quot; = 'Onsite'" label="Existing Onsite Sanitation" symbol="4" key="{5baafa0e-7b01-4191-8cab-56b267694578}"/>
      <rule filter=" &quot;ExistingSanitation&quot; = true and  &quot;SanitationType&quot; is NULL" label="Existing Sanitation (no specified)" symbol="5" key="{3b50943e-cd10-4855-92f1-b442091d03a2}"/>
      <rule label="Boundaries" symbol="6" key="{88af1a6e-09d7-44bd-9b98-9016e392c83d}"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="0">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" enabled="1" locked="0" id="{8127aac0-b0b6-42e1-b281-ec52dbb086fc}">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="255,255,255,88" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="255,255,255,255" type="QString" name="outline_color"/>
            <Option value="no" type="QString" name="outline_style"/>
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
      <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="1">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" enabled="1" locked="0" id="{6b3f3336-747d-422e-b034-d211b0a2b154}">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="103,108,255,125" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="1,9,255,255" type="QString" name="outline_color"/>
            <Option value="no" type="QString" name="outline_style"/>
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
      <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="2">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" enabled="1" locked="0" id="{6b3f3336-747d-422e-b034-d211b0a2b154}">
          <Option type="Map">
            <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
            <Option value="77,228,255,45" type="QString" name="color"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="0,0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="1,9,255,255" type="QString" name="outline_color"/>
            <Option value="no" type="QString" name="outline_style"/>
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
      <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="3">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="LinePatternFill" enabled="1" locked="0" id="{72fce6f8-6449-44bb-b14c-74cd26e5c2c5}">
          <Option type="Map">
            <Option value="49" type="QString" name="angle"/>
            <Option value="before_render" type="QString" name="clip_mode"/>
            <Option value="255,180,89,255" type="QString" name="color"/>
            <Option value="feature" type="QString" name="coordinate_reference"/>
            <Option value="2" type="QString" name="distance"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="distance_map_unit_scale"/>
            <Option value="MM" type="QString" name="distance_unit"/>
            <Option value="0.26" type="QString" name="line_width"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="line_width_map_unit_scale"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="line" name="@3@0">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" enabled="1" locked="0" id="{76e06122-2ed1-40b6-b626-7f62e51d6d66}">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="255,180,89,255" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="0.4" type="QString" name="line_width"/>
                <Option value="MM" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="trim_distance_start_unit"/>
                <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
                <Option value="0" type="QString" name="use_custom_dash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
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
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="4">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="LinePatternFill" enabled="1" locked="0" id="{72fce6f8-6449-44bb-b14c-74cd26e5c2c5}">
          <Option type="Map">
            <Option value="49" type="QString" name="angle"/>
            <Option value="before_render" type="QString" name="clip_mode"/>
            <Option value="12,255,36,255" type="QString" name="color"/>
            <Option value="feature" type="QString" name="coordinate_reference"/>
            <Option value="2" type="QString" name="distance"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="distance_map_unit_scale"/>
            <Option value="MM" type="QString" name="distance_unit"/>
            <Option value="0.26" type="QString" name="line_width"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="line_width_map_unit_scale"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="line" name="@4@0">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" enabled="1" locked="0" id="{76e06122-2ed1-40b6-b626-7f62e51d6d66}">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="12,255,36,255" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="0.4" type="QString" name="line_width"/>
                <Option value="MM" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="trim_distance_start_unit"/>
                <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
                <Option value="0" type="QString" name="use_custom_dash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
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
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="5">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="LinePatternFill" enabled="1" locked="0" id="{72fce6f8-6449-44bb-b14c-74cd26e5c2c5}">
          <Option type="Map">
            <Option value="49" type="QString" name="angle"/>
            <Option value="before_render" type="QString" name="clip_mode"/>
            <Option value="227,26,28,255" type="QString" name="color"/>
            <Option value="feature" type="QString" name="coordinate_reference"/>
            <Option value="2" type="QString" name="distance"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="distance_map_unit_scale"/>
            <Option value="MM" type="QString" name="distance_unit"/>
            <Option value="0.26" type="QString" name="line_width"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="line_width_map_unit_scale"/>
            <Option value="MM" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
            <Option value="MM" type="QString" name="outline_width_unit"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
          <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="line" name="@5@0">
            <data_defined_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </data_defined_properties>
            <layer pass="0" class="SimpleLine" enabled="1" locked="0" id="{76e06122-2ed1-40b6-b626-7f62e51d6d66}">
              <Option type="Map">
                <Option value="0" type="QString" name="align_dash_pattern"/>
                <Option value="square" type="QString" name="capstyle"/>
                <Option value="5;2" type="QString" name="customdash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="customdash_unit"/>
                <Option value="0" type="QString" name="dash_pattern_offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="dash_pattern_offset_unit"/>
                <Option value="0" type="QString" name="draw_inside_polygon"/>
                <Option value="bevel" type="QString" name="joinstyle"/>
                <Option value="227,26,28,255" type="QString" name="line_color"/>
                <Option value="solid" type="QString" name="line_style"/>
                <Option value="0.4" type="QString" name="line_width"/>
                <Option value="MM" type="QString" name="line_width_unit"/>
                <Option value="0" type="QString" name="offset"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="offset_unit"/>
                <Option value="0" type="QString" name="ring_filter"/>
                <Option value="0" type="QString" name="trim_distance_end"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="trim_distance_end_unit"/>
                <Option value="0" type="QString" name="trim_distance_start"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
                <Option value="RenderMetersInMapUnits" type="QString" name="trim_distance_start_unit"/>
                <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
                <Option value="0" type="QString" name="use_custom_dash"/>
                <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
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
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="6">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleLine" enabled="1" locked="0" id="{90b6cdc1-454a-4efe-beef-a95b6e8bfd0c}">
          <Option type="Map">
            <Option value="0" type="QString" name="align_dash_pattern"/>
            <Option value="square" type="QString" name="capstyle"/>
            <Option value="5;2" type="QString" name="customdash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="customdash_map_unit_scale"/>
            <Option value="MM" type="QString" name="customdash_unit"/>
            <Option value="0" type="QString" name="dash_pattern_offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="dash_pattern_offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="dash_pattern_offset_unit"/>
            <Option value="0" type="QString" name="draw_inside_polygon"/>
            <Option value="bevel" type="QString" name="joinstyle"/>
            <Option value="211,12,255,255" type="QString" name="line_color"/>
            <Option value="solid" type="QString" name="line_style"/>
            <Option value="6" type="QString" name="line_width"/>
            <Option value="RenderMetersInMapUnits" type="QString" name="line_width_unit"/>
            <Option value="0" type="QString" name="offset"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
            <Option value="MM" type="QString" name="offset_unit"/>
            <Option value="0" type="QString" name="ring_filter"/>
            <Option value="0" type="QString" name="trim_distance_end"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_end_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_end_unit"/>
            <Option value="0" type="QString" name="trim_distance_start"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="trim_distance_start_map_unit_scale"/>
            <Option value="MM" type="QString" name="trim_distance_start_unit"/>
            <Option value="0" type="QString" name="tweak_dash_pattern_on_corners"/>
            <Option value="0" type="QString" name="use_custom_dash"/>
            <Option value="3x:0,0,0,0,0,0" type="QString" name="width_map_unit_scale"/>
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
  </renderer-v2>
  <selection mode="Default">
    <selectionColor invalid="1"/>
    <selectionSymbol>
      <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="">
        <data_defined_properties>
          <Option type="Map">
            <Option value="" type="QString" name="name"/>
            <Option name="properties"/>
            <Option value="collection" type="QString" name="type"/>
          </Option>
        </data_defined_properties>
        <layer pass="0" class="SimpleFill" enabled="1" locked="0" id="{fb793fca-5445-46ba-b4a9-21ea5680e5c6}">
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
  <labeling type="rule-based">
    <rules key="{0809b5bd-1b74-4451-a88b-e8d4794afd66}">
      <rule key="{d8c4e08e-7ab1-4d50-83cd-e747c48c2168}">
        <settings calloutType="simple">
          <text-style fontSizeMapUnitScale="3x:0,0,0,0,0,0" textColor="255,255,255,255" textOrientation="horizontal" fontWordSpacing="0" fontItalic="0" fontFamily="Arial Black" blendMode="0" fontKerning="1" fontSizeUnit="RenderMetersInMapUnits" fieldName="'Sanitation System Suggestions'" multilineHeight="1" namedStyle="Normal" textOpacity="1" forcedItalic="0" fontUnderline="0" useSubstitutions="0" forcedBold="0" capitalization="0" isExpression="1" allowHtml="1" fontStrikeout="0" legendString="Aa" fontWeight="87" previewBkgrdColor="255,255,255,255" multilineHeightUnit="Percentage" fontSize="25" fontLetterSpacing="0">
            <families/>
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferDraw="0" bufferColor="250,250,250,255" bufferNoFill="1" bufferBlendMode="0" bufferJoinStyle="128" bufferSize="1" bufferSizeUnits="MM" bufferOpacity="1"/>
            <text-mask maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskType="0" maskSize="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1"/>
            <background shapeRadiiUnit="RenderMetersInMapUnits" shapeDraw="1" shapeSizeType="0" shapeRotation="0" shapeBorderWidthUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeSVGFile="" shapeRotationType="0" shapeBorderColor="128,128,128,255" shapeRadiiX="0" shapeRadiiY="0" shapeBorderWidth="0" shapeOffsetY="65" shapeFillColor="95,95,95,255" shapeSizeX="60" shapeJoinStyle="64" shapeOffsetUnit="RenderMetersInMapUnits" shapeSizeY="65" shapeBlendMode="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeOpacity="1" shapeSizeUnit="RenderMetersInMapUnits" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="marker" name="markerSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="183,72,75,255" type="QString" name="color"/>
                    <Option value="1" type="QString" name="horizontal_anchor_point"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="circle" type="QString" name="name"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="35,35,35,255" type="QString" name="outline_color"/>
                    <Option value="solid" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                    <Option value="MM" type="QString" name="outline_width_unit"/>
                    <Option value="diameter" type="QString" name="scale_method"/>
                    <Option value="2" type="QString" name="size"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                    <Option value="MM" type="QString" name="size_unit"/>
                    <Option value="1" type="QString" name="vertical_anchor_point"/>
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
              <symbol alpha="0.690196" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="fillSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="95,95,95,255" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="128,128,128,255" type="QString" name="outline_color"/>
                    <Option value="no" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="Point" type="QString" name="outline_width_unit"/>
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
            </background>
            <shadow shadowDraw="0" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowColor="0,0,0,255" shadowOffsetAngle="135" shadowRadius="1.5" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowRadiusUnit="MM" shadowUnder="0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" rightDirectionSymbol=">" plussign="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" multilineAlign="1" autoWrapLength="25" formatNumbers="0" decimals="3" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0"/>
          <placement rotationUnit="AngleDegrees" geometryGeneratorType="PointGeometry" dist="0" offsetUnits="RenderMetersInMapUnits" maxCurvedCharAngleIn="25" priority="10" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" offsetType="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" lineAnchorTextPoint="FollowPlacement" polygonPlacementFlags="2" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" layerType="PolygonGeometry" lineAnchorPercent="0.5" quadOffset="4" rotationAngle="0" overlapHandling="AllowOverlapAtNoCost" overrunDistance="0" xOffset="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" allowDegraded="0" fitInPolygonOnly="0" repeatDistanceUnits="MM" repeatDistance="0" geometryGeneratorEnabled="0" lineAnchorType="0" distUnits="MM" distMapUnitScale="3x:0,0,0,0,0,0" geometryGenerator="" yOffset="-85" centroidInside="1" overrunDistanceUnit="MM" centroidWhole="1" placement="1" lineAnchorClipping="0" placementFlags="10"/>
          <rendering maxNumLabels="2000" obstacle="1" upsidedownLabels="0" fontMaxPixelSize="10000" scaleMin="0" limitNumLabels="0" unplacedVisibility="0" mergeLines="0" fontLimitPixelSize="0" zIndex="0" scaleVisibility="0" obstacleFactor="1" fontMinPixelSize="3" obstacleType="1" drawLabels="1" labelPerPart="0" minFeatureSize="0" scaleMax="0"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="LineAnchorClipping">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorclipping" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorPercent">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorpercent" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorTextPoint">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortextpoint" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorType">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortype" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionX">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positionx&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionY">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positiony&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="ShapeOffset">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="if(length(&quot;AdditionalRecommendations&quot;) > 1,  @value , '0,47')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="ShapeSizeY">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="if(length(&quot;AdditionalRecommendations&quot;) > 1,  @value , @value -15)" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
              <Option value="0" type="int" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
              <Option value="false" type="bool" name="drawToAllParts"/>
              <Option value="0" type="QString" name="enabled"/>
              <Option value="point_on_exterior" type="QString" name="labelAnchorPoint"/>
              <Option value="&lt;symbol alpha=&quot;1&quot; clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot; locked=&quot;0&quot; id=&quot;{9356d1cf-3390-43f4-8340-24bfbbf25919}&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
              <Option value="0" type="double" name="minLength"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
              <Option value="MM" type="QString" name="minLengthUnit"/>
              <Option value="0" type="double" name="offsetFromAnchor"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
              <Option value="0" type="double" name="offsetFromLabel"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule key="{fa2f3ad2-611c-4981-b312-060324d1b986}">
        <settings calloutType="simple">
          <text-style fontSizeMapUnitScale="3x:0,0,0,0,0,0" textColor="0,0,0,255" textOrientation="horizontal" fontWordSpacing="0" fontItalic="0" fontFamily="Calibri" blendMode="0" fontKerning="1" fontSizeUnit="RenderMetersInMapUnits" fieldName="'Start of plan:|&lt;br>' || '&lt;b>' || if(&quot;SuggestedSanitSystemStart&quot; = 'The sanitation system already exists', 'System Already Sufficient', &quot;SuggestedSanitSystemStart&quot;) || '&lt;/b>'&#xd;&#xa;&#xd;&#xa;&#xd;&#xa;" multilineHeight="0.80000000000000004" namedStyle="Regular" textOpacity="1" forcedItalic="0" fontUnderline="0" useSubstitutions="0" forcedBold="0" capitalization="0" isExpression="1" allowHtml="1" fontStrikeout="0" legendString="Aa" fontWeight="50" previewBkgrdColor="255,255,255,255" multilineHeightUnit="Percentage" fontSize="25" fontLetterSpacing="0">
            <families/>
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferDraw="0" bufferColor="250,250,250,255" bufferNoFill="1" bufferBlendMode="0" bufferJoinStyle="128" bufferSize="1" bufferSizeUnits="MM" bufferOpacity="1"/>
            <text-mask maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskType="0" maskSize="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1"/>
            <background shapeRadiiUnit="Point" shapeDraw="1" shapeSizeType="0" shapeRotation="0" shapeBorderWidthUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeSVGFile="" shapeRotationType="0" shapeBorderColor="128,128,128,255" shapeRadiiX="0" shapeRadiiY="0" shapeBorderWidth="0" shapeOffsetY="0" shapeFillColor="255,255,255,255" shapeSizeX="5" shapeJoinStyle="64" shapeOffsetUnit="Point" shapeSizeY="0" shapeBlendMode="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeOpacity="1" shapeSizeUnit="RenderMetersInMapUnits" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="marker" name="markerSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="183,72,75,255" type="QString" name="color"/>
                    <Option value="1" type="QString" name="horizontal_anchor_point"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="circle" type="QString" name="name"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="35,35,35,255" type="QString" name="outline_color"/>
                    <Option value="solid" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                    <Option value="MM" type="QString" name="outline_width_unit"/>
                    <Option value="diameter" type="QString" name="scale_method"/>
                    <Option value="2" type="QString" name="size"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                    <Option value="MM" type="QString" name="size_unit"/>
                    <Option value="1" type="QString" name="vertical_anchor_point"/>
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
              <symbol alpha="0.690196" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="fillSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,255,255,255" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="128,128,128,255" type="QString" name="outline_color"/>
                    <Option value="no" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="Point" type="QString" name="outline_width_unit"/>
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
            </background>
            <shadow shadowDraw="0" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowColor="0,0,0,255" shadowOffsetAngle="135" shadowRadius="1.5" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowRadiusUnit="MM" shadowUnder="0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="|" rightDirectionSymbol=">" plussign="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" multilineAlign="1" autoWrapLength="14" formatNumbers="0" decimals="3" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0"/>
          <placement rotationUnit="AngleDegrees" geometryGeneratorType="PointGeometry" dist="0" offsetUnits="RenderMetersInMapUnits" maxCurvedCharAngleIn="25" priority="10" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" offsetType="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" lineAnchorTextPoint="FollowPlacement" polygonPlacementFlags="2" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" layerType="PolygonGeometry" lineAnchorPercent="0.5" quadOffset="4" rotationAngle="0" overlapHandling="AllowOverlapAtNoCost" overrunDistance="0" xOffset="-90" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" allowDegraded="0" fitInPolygonOnly="0" repeatDistanceUnits="MM" repeatDistance="0" geometryGeneratorEnabled="0" lineAnchorType="0" distUnits="MM" distMapUnitScale="3x:0,0,0,0,0,0" geometryGenerator="" yOffset="0" centroidInside="1" overrunDistanceUnit="MM" centroidWhole="1" placement="1" lineAnchorClipping="0" placementFlags="10"/>
          <rendering maxNumLabels="2000" obstacle="1" upsidedownLabels="0" fontMaxPixelSize="10000" scaleMin="0" limitNumLabels="0" unplacedVisibility="0" mergeLines="0" fontLimitPixelSize="0" zIndex="0" scaleVisibility="0" obstacleFactor="1" fontMinPixelSize="3" obstacleType="1" drawLabels="1" labelPerPart="0" minFeatureSize="0" scaleMax="0"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="LineAnchorClipping">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorclipping" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorPercent">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorpercent" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorTextPoint">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortextpoint" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorType">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortype" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionX">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positionx&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionY">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positiony&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
              <Option value="0" type="int" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
              <Option value="false" type="bool" name="drawToAllParts"/>
              <Option value="0" type="QString" name="enabled"/>
              <Option value="point_on_exterior" type="QString" name="labelAnchorPoint"/>
              <Option value="&lt;symbol alpha=&quot;1&quot; clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot; locked=&quot;0&quot; id=&quot;{9356d1cf-3390-43f4-8340-24bfbbf25919}&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
              <Option value="0" type="double" name="minLength"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
              <Option value="MM" type="QString" name="minLengthUnit"/>
              <Option value="0" type="double" name="offsetFromAnchor"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
              <Option value="0" type="double" name="offsetFromLabel"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule key="{e050f988-03c3-4068-ba27-3b47241a1e78}">
        <settings calloutType="simple">
          <text-style fontSizeMapUnitScale="3x:0,0,0,0,0,0" textColor="0,0,0,255" textOrientation="horizontal" fontWordSpacing="0" fontItalic="0" fontFamily="Calibri" blendMode="0" fontKerning="1" fontSizeUnit="RenderMetersInMapUnits" fieldName="'End of plan:|&lt;br>' || '&lt;b>' ||  if(&quot;SuggestedSanitSystemEnd&quot; = 'The sanitation system already exists', 'System Already Sufficient', &quot;SuggestedSanitSystemEnd&quot;) || '&lt;/b>'" multilineHeight="0.82999999999999996" namedStyle="Regular" textOpacity="1" forcedItalic="0" fontUnderline="0" useSubstitutions="0" forcedBold="0" capitalization="0" isExpression="1" allowHtml="1" fontStrikeout="0" legendString="Aa" fontWeight="50" previewBkgrdColor="255,255,255,255" multilineHeightUnit="Percentage" fontSize="25" fontLetterSpacing="0">
            <families/>
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferDraw="0" bufferColor="250,250,250,255" bufferNoFill="1" bufferBlendMode="0" bufferJoinStyle="128" bufferSize="1" bufferSizeUnits="MM" bufferOpacity="1"/>
            <text-mask maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskType="0" maskSize="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1"/>
            <background shapeRadiiUnit="Point" shapeDraw="1" shapeSizeType="0" shapeRotation="0" shapeBorderWidthUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeSVGFile="" shapeRotationType="0" shapeBorderColor="128,128,128,255" shapeRadiiX="0" shapeRadiiY="0" shapeBorderWidth="0" shapeOffsetY="0" shapeFillColor="255,255,255,255" shapeSizeX="5" shapeJoinStyle="64" shapeOffsetUnit="Point" shapeSizeY="0" shapeBlendMode="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeOpacity="1" shapeSizeUnit="RenderMetersInMapUnits" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="marker" name="markerSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="183,72,75,255" type="QString" name="color"/>
                    <Option value="1" type="QString" name="horizontal_anchor_point"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="circle" type="QString" name="name"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="35,35,35,255" type="QString" name="outline_color"/>
                    <Option value="solid" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                    <Option value="MM" type="QString" name="outline_width_unit"/>
                    <Option value="diameter" type="QString" name="scale_method"/>
                    <Option value="2" type="QString" name="size"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                    <Option value="MM" type="QString" name="size_unit"/>
                    <Option value="1" type="QString" name="vertical_anchor_point"/>
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
              <symbol alpha="0.690196" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="fillSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,255,255,255" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="128,128,128,255" type="QString" name="outline_color"/>
                    <Option value="no" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="Point" type="QString" name="outline_width_unit"/>
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
            </background>
            <shadow shadowDraw="0" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowColor="0,0,0,255" shadowOffsetAngle="135" shadowRadius="1.5" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowRadiusUnit="MM" shadowUnder="0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="|" rightDirectionSymbol=">" plussign="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" multilineAlign="1" autoWrapLength="14" formatNumbers="0" decimals="3" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0"/>
          <placement rotationUnit="AngleDegrees" geometryGeneratorType="PointGeometry" dist="0" offsetUnits="RenderMetersInMapUnits" maxCurvedCharAngleIn="25" priority="10" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" offsetType="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" lineAnchorTextPoint="FollowPlacement" polygonPlacementFlags="2" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" layerType="PolygonGeometry" lineAnchorPercent="0.5" quadOffset="4" rotationAngle="0" overlapHandling="AllowOverlapAtNoCost" overrunDistance="0" xOffset="90" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" allowDegraded="0" fitInPolygonOnly="0" repeatDistanceUnits="MM" repeatDistance="0" geometryGeneratorEnabled="0" lineAnchorType="0" distUnits="MM" distMapUnitScale="3x:0,0,0,0,0,0" geometryGenerator="" yOffset="0" centroidInside="1" overrunDistanceUnit="MM" centroidWhole="1" placement="1" lineAnchorClipping="0" placementFlags="10"/>
          <rendering maxNumLabels="2000" obstacle="1" upsidedownLabels="0" fontMaxPixelSize="10000" scaleMin="0" limitNumLabels="0" unplacedVisibility="0" mergeLines="0" fontLimitPixelSize="0" zIndex="0" scaleVisibility="0" obstacleFactor="1" fontMinPixelSize="3" obstacleType="1" drawLabels="1" labelPerPart="0" minFeatureSize="0" scaleMax="0"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="LineAnchorClipping">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorclipping" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorPercent">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorpercent" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorTextPoint">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortextpoint" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorType">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortype" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionX">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positionx&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionY">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positiony&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
              <Option value="0" type="int" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
              <Option value="false" type="bool" name="drawToAllParts"/>
              <Option value="0" type="QString" name="enabled"/>
              <Option value="point_on_exterior" type="QString" name="labelAnchorPoint"/>
              <Option value="&lt;symbol alpha=&quot;1&quot; clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot; locked=&quot;0&quot; id=&quot;{9356d1cf-3390-43f4-8340-24bfbbf25919}&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
              <Option value="0" type="double" name="minLength"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
              <Option value="MM" type="QString" name="minLengthUnit"/>
              <Option value="0" type="double" name="offsetFromAnchor"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
              <Option value="0" type="double" name="offsetFromLabel"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule filter="if(length(&quot;AdditionalRecommendations&quot;) > 1, true, false)" active="0" key="{b0d7f1ea-d11a-462a-99b3-fbcecb709c20}">
        <settings calloutType="simple">
          <text-style fontSizeMapUnitScale="3x:0,0,0,0,0,0" textColor="0,0,0,255" textOrientation="horizontal" fontWordSpacing="0" fontItalic="0" fontFamily="Calibri" blendMode="0" fontKerning="1" fontSizeUnit="RenderMetersInMapUnits" fieldName="if(length(&quot;AdditionalRecommendations&quot;) > 1, 'Check additional recommendations', '') &#xd;&#xa;&#xd;&#xa;||  '\n' || &#xd;&#xa;if(&quot;InformalSettlement&quot;  = true, 'Informal Settlement', '') &#xd;&#xa;&#xd;&#xa;||  '\n'  || &#xd;&#xa;if(&quot;LowIncomeArea&quot; = true, 'Low-Income Area', '') &#xd;&#xa;" multilineHeight="1" namedStyle="Bold" textOpacity="1" forcedItalic="0" fontUnderline="0" useSubstitutions="0" forcedBold="0" capitalization="0" isExpression="1" allowHtml="0" fontStrikeout="0" legendString="Aa" fontWeight="75" previewBkgrdColor="255,255,255,255" multilineHeightUnit="Percentage" fontSize="20" fontLetterSpacing="0">
            <families/>
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferDraw="0" bufferColor="250,250,250,255" bufferNoFill="1" bufferBlendMode="0" bufferJoinStyle="128" bufferSize="1" bufferSizeUnits="MM" bufferOpacity="1"/>
            <text-mask maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskType="0" maskSize="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1"/>
            <background shapeRadiiUnit="RenderMetersInMapUnits" shapeDraw="1" shapeSizeType="0" shapeRotation="0" shapeBorderWidthUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="20" shapeSVGFile="" shapeRotationType="0" shapeBorderColor="128,128,128,255" shapeRadiiX="0" shapeRadiiY="0" shapeBorderWidth="0" shapeOffsetY="5" shapeFillColor="255,251,27,255" shapeSizeX="32" shapeJoinStyle="64" shapeOffsetUnit="RenderMetersInMapUnits" shapeSizeY="0" shapeBlendMode="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeOpacity="1" shapeSizeUnit="RenderMetersInMapUnits" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="marker" name="markerSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="183,72,75,255" type="QString" name="color"/>
                    <Option value="1" type="QString" name="horizontal_anchor_point"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="circle" type="QString" name="name"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="35,35,35,255" type="QString" name="outline_color"/>
                    <Option value="solid" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                    <Option value="MM" type="QString" name="outline_width_unit"/>
                    <Option value="diameter" type="QString" name="scale_method"/>
                    <Option value="2" type="QString" name="size"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                    <Option value="MM" type="QString" name="size_unit"/>
                    <Option value="1" type="QString" name="vertical_anchor_point"/>
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
              <symbol alpha="0.615686" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="fillSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,251,27,255" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="128,128,128,255" type="QString" name="outline_color"/>
                    <Option value="no" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="Point" type="QString" name="outline_width_unit"/>
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
            </background>
            <shadow shadowDraw="0" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowColor="0,0,0,255" shadowOffsetAngle="135" shadowRadius="1.5" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowRadiusUnit="MM" shadowUnder="0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" rightDirectionSymbol=">" plussign="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" multilineAlign="0" autoWrapLength="0" formatNumbers="0" decimals="3" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0"/>
          <placement rotationUnit="AngleDegrees" geometryGeneratorType="PointGeometry" dist="0" offsetUnits="RenderMetersInMapUnits" maxCurvedCharAngleIn="25" priority="10" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" offsetType="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" lineAnchorTextPoint="FollowPlacement" polygonPlacementFlags="2" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" layerType="PolygonGeometry" lineAnchorPercent="0.5" quadOffset="4" rotationAngle="0" overlapHandling="AllowOverlapAtNoCost" overrunDistance="0" xOffset="-20" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" allowDegraded="0" fitInPolygonOnly="0" repeatDistanceUnits="MM" repeatDistance="0" geometryGeneratorEnabled="0" lineAnchorType="0" distUnits="MM" distMapUnitScale="3x:0,0,0,0,0,0" geometryGenerator="" yOffset="78" centroidInside="1" overrunDistanceUnit="MM" centroidWhole="1" placement="1" lineAnchorClipping="0" placementFlags="10"/>
          <rendering maxNumLabels="2000" obstacle="1" upsidedownLabels="0" fontMaxPixelSize="10000" scaleMin="0" limitNumLabels="0" unplacedVisibility="0" mergeLines="0" fontLimitPixelSize="0" zIndex="0" scaleVisibility="0" obstacleFactor="1" fontMinPixelSize="3" obstacleType="1" drawLabels="1" labelPerPart="0" minFeatureSize="0" scaleMax="0"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="LineAnchorClipping">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorclipping" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorPercent">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorpercent" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorTextPoint">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortextpoint" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorType">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortype" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionX">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positionx&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionY">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positiony&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
              <Option value="0" type="int" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
              <Option value="false" type="bool" name="drawToAllParts"/>
              <Option value="0" type="QString" name="enabled"/>
              <Option value="point_on_exterior" type="QString" name="labelAnchorPoint"/>
              <Option value="&lt;symbol alpha=&quot;1&quot; clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot; locked=&quot;0&quot; id=&quot;{9356d1cf-3390-43f4-8340-24bfbbf25919}&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
              <Option value="0" type="double" name="minLength"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
              <Option value="MM" type="QString" name="minLengthUnit"/>
              <Option value="0" type="double" name="offsetFromAnchor"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
              <Option value="0" type="double" name="offsetFromLabel"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
      <rule filter="if(length(&quot;AdditionalRecommendations&quot;) > 1, true, false)" key="{305e6bd6-4c37-40ea-87d1-2d73fe7024bb}">
        <settings calloutType="simple">
          <text-style fontSizeMapUnitScale="3x:0,0,0,0,0,0" textColor="255,242,0,255" textOrientation="horizontal" fontWordSpacing="0" fontItalic="0" fontFamily="Bahnschrift" blendMode="0" fontKerning="1" fontSizeUnit="RenderMetersInMapUnits" fieldName="if(length(&quot;AdditionalRecommendations&quot;) > 1, '● Check additional recommendations', '') " multilineHeight="1" namedStyle="Bold" textOpacity="1" forcedItalic="0" fontUnderline="0" useSubstitutions="0" forcedBold="0" capitalization="0" isExpression="1" allowHtml="0" fontStrikeout="0" legendString="Aa" fontWeight="75" previewBkgrdColor="255,255,255,255" multilineHeightUnit="Percentage" fontSize="23" fontLetterSpacing="0">
            <families/>
            <text-buffer bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferDraw="0" bufferColor="250,250,250,255" bufferNoFill="1" bufferBlendMode="0" bufferJoinStyle="128" bufferSize="1" bufferSizeUnits="MM" bufferOpacity="1"/>
            <text-mask maskSize2="1.5" maskSizeMapUnitScale="3x:0,0,0,0,0,0" maskType="0" maskSize="1.5" maskSizeUnits="MM" maskedSymbolLayers="" maskJoinStyle="128" maskEnabled="0" maskOpacity="1"/>
            <background shapeRadiiUnit="RenderMetersInMapUnits" shapeDraw="0" shapeSizeType="0" shapeRotation="0" shapeBorderWidthUnit="Point" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="20" shapeSVGFile="" shapeRotationType="0" shapeBorderColor="128,128,128,255" shapeRadiiX="0" shapeRadiiY="0" shapeBorderWidth="0" shapeOffsetY="5" shapeFillColor="255,251,27,255" shapeSizeX="32" shapeJoinStyle="64" shapeOffsetUnit="RenderMetersInMapUnits" shapeSizeY="0" shapeBlendMode="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeOpacity="1" shapeSizeUnit="RenderMetersInMapUnits" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0">
              <symbol alpha="1" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="marker" name="markerSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleMarker" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="0" type="QString" name="angle"/>
                    <Option value="square" type="QString" name="cap_style"/>
                    <Option value="183,72,75,255" type="QString" name="color"/>
                    <Option value="1" type="QString" name="horizontal_anchor_point"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="circle" type="QString" name="name"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="35,35,35,255" type="QString" name="outline_color"/>
                    <Option value="solid" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="outline_width_map_unit_scale"/>
                    <Option value="MM" type="QString" name="outline_width_unit"/>
                    <Option value="diameter" type="QString" name="scale_method"/>
                    <Option value="2" type="QString" name="size"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="size_map_unit_scale"/>
                    <Option value="MM" type="QString" name="size_unit"/>
                    <Option value="1" type="QString" name="vertical_anchor_point"/>
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
              <symbol alpha="0.615686" clip_to_extent="1" is_animated="0" force_rhr="0" frame_rate="10" type="fill" name="fillSymbol">
                <data_defined_properties>
                  <Option type="Map">
                    <Option value="" type="QString" name="name"/>
                    <Option name="properties"/>
                    <Option value="collection" type="QString" name="type"/>
                  </Option>
                </data_defined_properties>
                <layer pass="0" class="SimpleFill" enabled="1" locked="0" id="">
                  <Option type="Map">
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="border_width_map_unit_scale"/>
                    <Option value="255,251,27,255" type="QString" name="color"/>
                    <Option value="bevel" type="QString" name="joinstyle"/>
                    <Option value="0,0" type="QString" name="offset"/>
                    <Option value="3x:0,0,0,0,0,0" type="QString" name="offset_map_unit_scale"/>
                    <Option value="MM" type="QString" name="offset_unit"/>
                    <Option value="128,128,128,255" type="QString" name="outline_color"/>
                    <Option value="no" type="QString" name="outline_style"/>
                    <Option value="0" type="QString" name="outline_width"/>
                    <Option value="Point" type="QString" name="outline_width_unit"/>
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
            </background>
            <shadow shadowDraw="0" shadowRadiusAlphaOnly="0" shadowOpacity="0.69999999999999996" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowOffsetGlobal="1" shadowColor="0,0,0,255" shadowOffsetAngle="135" shadowRadius="1.5" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowRadiusUnit="MM" shadowUnder="0"/>
            <dd_properties>
              <Option type="Map">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format wrapChar="" rightDirectionSymbol=">" plussign="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" multilineAlign="0" autoWrapLength="0" formatNumbers="0" decimals="3" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0"/>
          <placement rotationUnit="AngleDegrees" geometryGeneratorType="PointGeometry" dist="0" offsetUnits="RenderMetersInMapUnits" maxCurvedCharAngleIn="25" priority="10" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-25" offsetType="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" lineAnchorTextPoint="FollowPlacement" polygonPlacementFlags="2" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" preserveRotation="1" layerType="PolygonGeometry" lineAnchorPercent="0.5" quadOffset="4" rotationAngle="0" overlapHandling="AllowOverlapAtNoCost" overrunDistance="0" xOffset="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" allowDegraded="0" fitInPolygonOnly="0" repeatDistanceUnits="MM" repeatDistance="0" geometryGeneratorEnabled="0" lineAnchorType="0" distUnits="MM" distMapUnitScale="3x:0,0,0,0,0,0" geometryGenerator="" yOffset="60" centroidInside="1" overrunDistanceUnit="MM" centroidWhole="1" placement="1" lineAnchorClipping="0" placementFlags="10"/>
          <rendering maxNumLabels="2000" obstacle="1" upsidedownLabels="0" fontMaxPixelSize="10000" scaleMin="0" limitNumLabels="0" unplacedVisibility="0" mergeLines="0" fontLimitPixelSize="0" zIndex="0" scaleVisibility="0" obstacleFactor="1" fontMinPixelSize="3" obstacleType="1" drawLabels="1" labelPerPart="0" minFeatureSize="0" scaleMax="0"/>
          <dd_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="LineAnchorClipping">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorclipping" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorPercent">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchorpercent" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorTextPoint">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortextpoint" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="LineAnchorType">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="auxiliary_storage_labeling_lineanchortype" type="QString" name="field"/>
                  <Option value="2" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionX">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positionx&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="PositionY">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(&quot;auxiliary_storage_labeling_positiony&quot;,'')" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option value="pole_of_inaccessibility" type="QString" name="anchorPoint"/>
              <Option value="0" type="int" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option value="" type="QString" name="name"/>
                <Option name="properties"/>
                <Option value="collection" type="QString" name="type"/>
              </Option>
              <Option value="false" type="bool" name="drawToAllParts"/>
              <Option value="0" type="QString" name="enabled"/>
              <Option value="point_on_exterior" type="QString" name="labelAnchorPoint"/>
              <Option value="&lt;symbol alpha=&quot;1&quot; clip_to_extent=&quot;1&quot; is_animated=&quot;0&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; type=&quot;line&quot; name=&quot;symbol&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer pass=&quot;0&quot; class=&quot;SimpleLine&quot; enabled=&quot;1&quot; locked=&quot;0&quot; id=&quot;{9356d1cf-3390-43f4-8340-24bfbbf25919}&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option value=&quot;square&quot; type=&quot;QString&quot; name=&quot;capstyle&quot;/>&lt;Option value=&quot;5;2&quot; type=&quot;QString&quot; name=&quot;customdash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;customdash_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option value=&quot;bevel&quot; type=&quot;QString&quot; name=&quot;joinstyle&quot;/>&lt;Option value=&quot;60,60,60,255&quot; type=&quot;QString&quot; name=&quot;line_color&quot;/>&lt;Option value=&quot;solid&quot; type=&quot;QString&quot; name=&quot;line_style&quot;/>&lt;Option value=&quot;0.3&quot; type=&quot;QString&quot; name=&quot;line_width&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;line_width_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;offset&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;offset_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;ring_filter&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option value=&quot;MM&quot; type=&quot;QString&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option value=&quot;0&quot; type=&quot;QString&quot; name=&quot;use_custom_dash&quot;/>&lt;Option value=&quot;3x:0,0,0,0,0,0&quot; type=&quot;QString&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option value=&quot;&quot; type=&quot;QString&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option value=&quot;collection&quot; type=&quot;QString&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>" type="QString" name="lineSymbol"/>
              <Option value="0" type="double" name="minLength"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="minLengthMapUnitScale"/>
              <Option value="MM" type="QString" name="minLengthUnit"/>
              <Option value="0" type="double" name="offsetFromAnchor"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromAnchorMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromAnchorUnit"/>
              <Option value="0" type="double" name="offsetFromLabel"/>
              <Option value="3x:0,0,0,0,0,0" type="QString" name="offsetFromLabelMapUnitScale"/>
              <Option value="MM" type="QString" name="offsetFromLabelUnit"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <geometryOptions removeDuplicateNodes="1" geometryPrecision="0">
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
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ExistingSanitation" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowNullState"/>
            <Option type="invalid" name="CheckedState"/>
            <Option value="0" type="int" name="TextDisplayMethod"/>
            <Option type="invalid" name="UncheckedState"/>
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
                <Option value="Onsite" type="QString" name="Onsite"/>
              </Option>
              <Option type="Map">
                <Option value="Offsite" type="QString" name="Offsite"/>
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
            <Option value="false" type="bool" name="AllowNullState"/>
            <Option type="invalid" name="CheckedState"/>
            <Option value="0" type="int" name="TextDisplayMethod"/>
            <Option type="invalid" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="LowIncomeArea" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowNullState"/>
            <Option type="invalid" name="CheckedState"/>
            <Option value="0" type="int" name="TextDisplayMethod"/>
            <Option type="invalid" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="WaterAvailable" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowNullState"/>
            <Option type="invalid" name="CheckedState"/>
            <Option value="0" type="int" name="TextDisplayMethod"/>
            <Option type="invalid" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="AverageWaterConsumption" configurationFlags="NoFlag">
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
    <field name="area_ha" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fid_sum" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="PopDataset_sum" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="street_length_sum" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="count_buildings" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_LowDensityPop" configurationFlags="NoFlag">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="2147483647" type="int" name="Max"/>
            <Option value="0" type="int" name="Min"/>
            <Option value="0" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_MediumDensityPop" configurationFlags="NoFlag">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="2147483647" type="int" name="Max"/>
            <Option value="-2147483648" type="int" name="Min"/>
            <Option value="0" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_WaterConsumReq" configurationFlags="NoFlag">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="2147483647" type="int" name="Max"/>
            <Option value="0" type="int" name="Min"/>
            <Option value="0" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_PopDatasetYear" configurationFlags="NoFlag">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="2147483647" type="int" name="Max"/>
            <Option value="1900" type="int" name="Min"/>
            <Option value="0" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_StartPlanYear" configurationFlags="NoFlag">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="2500" type="int" name="Max"/>
            <Option value="2020" type="int" name="Min"/>
            <Option value="0" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_PeopleHHStart" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_EndPlanYear" configurationFlags="NoFlag">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="2500" type="int" name="Max"/>
            <Option value="2020" type="int" name="Min"/>
            <Option value="0" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_PeopleHHEnd" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_AnnualGrowthRate" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="PARAM_streetWidth" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="water_consump_requirem" configurationFlags="NoFlag">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowNullState"/>
            <Option type="invalid" name="CheckedState"/>
            <Option value="0" type="int" name="TextDisplayMethod"/>
            <Option type="invalid" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pop_startPlan" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pop_density_startPlan" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="classif_pop_density_startPlan" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="households_startPlan" configurationFlags="NoFlag">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="2147483647" type="int" name="Max"/>
            <Option value="0" type="int" name="Min"/>
            <Option value="2" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="SuggestedSanitSystemStart" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pop_endPlan" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="pop_density_endPlan" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="classif_pop_density_endPlan" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="households_endPlan" configurationFlags="NoFlag">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="2147483647" type="int" name="Max"/>
            <Option value="-2147483648" type="int" name="Min"/>
            <Option value="2" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="SuggestedSanitSystemEnd" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="building_per_ha" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="AdditionalRecommendations" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="identificator" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_x" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="label_y" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="WConsump_Liters_inhab_day_count" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="WConsump_Liters_inhab_day_mean" configurationFlags="NoFlag">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="" field="fid" index="0"/>
    <alias name="Existing Sanitation?" field="ExistingSanitation" index="1"/>
    <alias name="Type of existing sanitation" field="SanitationType" index="2"/>
    <alias name="Informal Settlement?" field="InformalSettlement" index="3"/>
    <alias name="Low-Income Area?" field="LowIncomeArea" index="4"/>
    <alias name="Available water?" field="WaterAvailable" index="5"/>
    <alias name="Average water consumption (liters/inhab./day)" field="AverageWaterConsumption" index="6"/>
    <alias name="" field="uuid" index="7"/>
    <alias name="Area (ha)" field="area_ha" index="8"/>
    <alias name="" field="fid_sum" index="9"/>
    <alias name="Total Population (dataset)" field="PopDataset_sum" index="10"/>
    <alias name="Total street length" field="street_length_sum" index="11"/>
    <alias name="Number of buildings" field="count_buildings" index="12"/>
    <alias name="Low-density pop. limit (inhab.ha)" field="PARAM_LowDensityPop" index="13"/>
    <alias name="Medium-density pop. limit (inhab.ha)" field="PARAM_MediumDensityPop" index="14"/>
    <alias name="Water consumpt. requirement (liters/inhab.day)" field="PARAM_WaterConsumReq" index="15"/>
    <alias name="Population dataset year" field="PARAM_PopDatasetYear" index="16"/>
    <alias name="Start of planning year" field="PARAM_StartPlanYear" index="17"/>
    <alias name="People/household - Start" field="PARAM_PeopleHHStart" index="18"/>
    <alias name="End of planning year" field="PARAM_EndPlanYear" index="19"/>
    <alias name="People/household - End" field="PARAM_PeopleHHEnd" index="20"/>
    <alias name="Annual growth rate (%)" field="PARAM_AnnualGrowthRate" index="21"/>
    <alias name="Average street width (m)" field="PARAM_streetWidth" index="22"/>
    <alias name="Mininum water consumption for sewage systems?" field="water_consump_requirem" index="23"/>
    <alias name="Population - Start" field="pop_startPlan" index="24"/>
    <alias name="Population density - Start (inhab./ha)" field="pop_density_startPlan" index="25"/>
    <alias name="Pop. density classification - Start" field="classif_pop_density_startPlan" index="26"/>
    <alias name="Number of households - Start" field="households_startPlan" index="27"/>
    <alias name="Suggested Sanitation System - Start" field="SuggestedSanitSystemStart" index="28"/>
    <alias name="Population - End" field="pop_endPlan" index="29"/>
    <alias name="Population density - End (inhab./ha)" field="pop_density_endPlan" index="30"/>
    <alias name="Pop. density classification - End" field="classif_pop_density_endPlan" index="31"/>
    <alias name="Number of households - End" field="households_endPlan" index="32"/>
    <alias name="" field="SuggestedSanitSystemEnd" index="33"/>
    <alias name="Building density (building/ha)" field="building_per_ha" index="34"/>
    <alias name="Additional Recommendations" field="AdditionalRecommendations" index="35"/>
    <alias name="" field="identificator" index="36"/>
    <alias name="" field="label_x" index="37"/>
    <alias name="" field="label_y" index="38"/>
    <alias name="" field="WConsump_Liters_inhab_day_count" index="39"/>
    <alias name="" field="WConsump_Liters_inhab_day_mean" index="40"/>
  </aliases>
  <splitPolicies>
    <policy policy="Duplicate" field="fid"/>
    <policy policy="Duplicate" field="ExistingSanitation"/>
    <policy policy="Duplicate" field="SanitationType"/>
    <policy policy="Duplicate" field="InformalSettlement"/>
    <policy policy="Duplicate" field="LowIncomeArea"/>
    <policy policy="Duplicate" field="WaterAvailable"/>
    <policy policy="Duplicate" field="AverageWaterConsumption"/>
    <policy policy="Duplicate" field="uuid"/>
    <policy policy="Duplicate" field="area_ha"/>
    <policy policy="Duplicate" field="fid_sum"/>
    <policy policy="Duplicate" field="PopDataset_sum"/>
    <policy policy="Duplicate" field="street_length_sum"/>
    <policy policy="Duplicate" field="count_buildings"/>
    <policy policy="Duplicate" field="PARAM_LowDensityPop"/>
    <policy policy="Duplicate" field="PARAM_MediumDensityPop"/>
    <policy policy="Duplicate" field="PARAM_WaterConsumReq"/>
    <policy policy="Duplicate" field="PARAM_PopDatasetYear"/>
    <policy policy="Duplicate" field="PARAM_StartPlanYear"/>
    <policy policy="Duplicate" field="PARAM_PeopleHHStart"/>
    <policy policy="Duplicate" field="PARAM_EndPlanYear"/>
    <policy policy="Duplicate" field="PARAM_PeopleHHEnd"/>
    <policy policy="Duplicate" field="PARAM_AnnualGrowthRate"/>
    <policy policy="Duplicate" field="PARAM_streetWidth"/>
    <policy policy="Duplicate" field="water_consump_requirem"/>
    <policy policy="Duplicate" field="pop_startPlan"/>
    <policy policy="Duplicate" field="pop_density_startPlan"/>
    <policy policy="Duplicate" field="classif_pop_density_startPlan"/>
    <policy policy="Duplicate" field="households_startPlan"/>
    <policy policy="Duplicate" field="SuggestedSanitSystemStart"/>
    <policy policy="Duplicate" field="pop_endPlan"/>
    <policy policy="Duplicate" field="pop_density_endPlan"/>
    <policy policy="Duplicate" field="classif_pop_density_endPlan"/>
    <policy policy="Duplicate" field="households_endPlan"/>
    <policy policy="Duplicate" field="SuggestedSanitSystemEnd"/>
    <policy policy="Duplicate" field="building_per_ha"/>
    <policy policy="Duplicate" field="AdditionalRecommendations"/>
    <policy policy="Duplicate" field="identificator"/>
    <policy policy="Duplicate" field="label_x"/>
    <policy policy="Duplicate" field="label_y"/>
    <policy policy="Duplicate" field="WConsump_Liters_inhab_day_count"/>
    <policy policy="Duplicate" field="WConsump_Liters_inhab_day_mean"/>
  </splitPolicies>
  <defaults>
    <default applyOnUpdate="0" expression="" field="fid"/>
    <default applyOnUpdate="0" expression="" field="ExistingSanitation"/>
    <default applyOnUpdate="0" expression="" field="SanitationType"/>
    <default applyOnUpdate="0" expression="" field="InformalSettlement"/>
    <default applyOnUpdate="0" expression="" field="LowIncomeArea"/>
    <default applyOnUpdate="0" expression="" field="WaterAvailable"/>
    <default applyOnUpdate="0" expression="" field="AverageWaterConsumption"/>
    <default applyOnUpdate="1" expression="uuid('Id128')" field="uuid"/>
    <default applyOnUpdate="1" expression="round($area/10000,2)" field="area_ha"/>
    <default applyOnUpdate="0" expression="" field="fid_sum"/>
    <default applyOnUpdate="0" expression="round(aggregate(layer:='WPConstrPopPoints', aggregate:='sum', expression:=&quot;PopDataset&quot;, filter:=intersects(@geometry, geometry(@parent))),2)" field="PopDataset_sum"/>
    <default applyOnUpdate="0" expression="round(aggregate(layer:='OSMStreetLayer', aggregate:='sum', expression:=&quot;length&quot;, filter:=within(@geometry, geometry(@parent))), 2)" field="street_length_sum"/>
    <default applyOnUpdate="0" expression="aggregate(layer:='OMFBuildingFootprints', aggregate:='count', expression:=&quot;fid&quot;, filter:=intersects(@geometry, geometry(@parent)))" field="count_buildings"/>
    <default applyOnUpdate="0" expression="" field="PARAM_LowDensityPop"/>
    <default applyOnUpdate="0" expression="" field="PARAM_MediumDensityPop"/>
    <default applyOnUpdate="0" expression="" field="PARAM_WaterConsumReq"/>
    <default applyOnUpdate="0" expression="" field="PARAM_PopDatasetYear"/>
    <default applyOnUpdate="0" expression="" field="PARAM_StartPlanYear"/>
    <default applyOnUpdate="0" expression="" field="PARAM_PeopleHHStart"/>
    <default applyOnUpdate="0" expression="" field="PARAM_EndPlanYear"/>
    <default applyOnUpdate="0" expression="" field="PARAM_PeopleHHEnd"/>
    <default applyOnUpdate="0" expression="" field="PARAM_AnnualGrowthRate"/>
    <default applyOnUpdate="0" expression="" field="PARAM_streetWidth"/>
    <default applyOnUpdate="0" expression="CASE WHEN &quot;AverageWaterConsumption&quot; IS NULL THEN FALSE WHEN &quot;AverageWaterConsumption&quot; >= &quot;PARAM_WaterConsumReq&quot; THEN TRUE ELSE FALSE END" field="water_consump_requirem"/>
    <default applyOnUpdate="0" expression="round(&quot;PopDataset_sum&quot; * (1 + (&quot;PARAM_AnnualGrowthRate&quot;/100))^(&quot;PARAM_StartPlanYear&quot; - &quot;PARAM_PopDatasetYear&quot;),0)" field="pop_startPlan"/>
    <default applyOnUpdate="0" expression="round(&quot;pop_startPlan&quot;/&quot;area_ha&quot;,2)" field="pop_density_startPlan"/>
    <default applyOnUpdate="0" expression="CASE WHEN &quot;pop_startPlan&quot; = 0 OR &quot;pop_startPlan&quot; is NULL THEN 'Without population' WHEN &quot;pop_density_startPlan&quot; &lt;= &quot;PARAM_LowDensityPop&quot; THEN 'Low density' WHEN &quot;pop_density_startPlan&quot; > &quot;PARAM_LowDensityPop&quot; AND &quot;pop_density_startPlan&quot; &lt;= &quot;PARAM_MediumDensityPop&quot; THEN 'Medium density' ELSE 'High density' END" field="classif_pop_density_startPlan"/>
    <default applyOnUpdate="0" expression="&quot;pop_startPlan&quot;/ &quot;PARAM_PeopleHHStart&quot;" field="households_startPlan"/>
    <default applyOnUpdate="0" expression="CASE WHEN &quot;pop_density_startPlan&quot; >= &quot;PARAM_MediumDensityPop&quot; AND (&quot;ExistingSanitation&quot; IS NOT TRUE OR &quot;SanitationType&quot; IS NOT 'Offsite') AND &quot;water_consump_requirem&quot; IS TRUE THEN 'Offsite' WHEN &quot;pop_density_startPlan&quot; >= &quot;PARAM_LowDensityPop&quot; AND &quot;ExistingSanitation&quot; IS NOT TRUE AND &quot;water_consump_requirem&quot; IS TRUE THEN 'Onsite or Offsite' WHEN &quot;ExistingSanitation&quot; IS TRUE THEN 'The sanitation system already exists' ELSE 'Onsite' END" field="SuggestedSanitSystemStart"/>
    <default applyOnUpdate="0" expression="round(&quot;PopDataset_sum&quot; * (1 + (&quot;PARAM_AnnualGrowthRate&quot;/100))^(&quot;PARAM_EndPlanYear&quot; - &quot;PARAM_PopDatasetYear&quot;),0)" field="pop_endPlan"/>
    <default applyOnUpdate="0" expression="round(&quot;pop_endPlan&quot;/&quot;area_ha&quot;,2)" field="pop_density_endPlan"/>
    <default applyOnUpdate="0" expression="CASE WHEN &quot;pop_endPlan&quot; = 0 OR &quot;pop_endPlan&quot; is NULL THEN 'Without population' WHEN &quot;pop_density_endPlan&quot; &lt;= &quot;PARAM_LowDensityPop&quot; THEN 'Low density' WHEN &quot;pop_density_endPlan&quot; > &quot;PARAM_LowDensityPop&quot; AND &quot;pop_density_endPlan&quot; &lt;= &quot;PARAM_MediumDensityPop&quot; THEN 'Medium density' ELSE 'High density' END" field="classif_pop_density_endPlan"/>
    <default applyOnUpdate="0" expression="&quot;pop_endPlan&quot;/ &quot;PARAM_PeopleHHEnd&quot;" field="households_endPlan"/>
    <default applyOnUpdate="0" expression="CASE WHEN &quot;pop_density_endPlan&quot; >= &quot;PARAM_MediumDensityPop&quot; AND (&quot;ExistingSanitation&quot; IS NOT TRUE OR &quot;SanitationType&quot; IS NOT 'Offsite') AND &quot;water_consump_requirem&quot; IS TRUE THEN 'Offsite' WHEN &quot;pop_density_endPlan&quot; >= &quot;PARAM_LowDensityPop&quot; AND &quot;ExistingSanitation&quot; IS NOT TRUE AND &quot;water_consump_requirem&quot; IS TRUE THEN 'Onsite or Offsite' WHEN &quot;ExistingSanitation&quot; IS TRUE THEN 'The sanitation system already exists' ELSE 'Onsite' END" field="SuggestedSanitSystemEnd"/>
    <default applyOnUpdate="0" expression="coalesce(round(&quot;count_buildings&quot;/&quot;area_ha&quot;,2),0)" field="building_per_ha"/>
    <default applyOnUpdate="0" expression="replace((CASE WHEN (&quot;classif_pop_density_startPlan&quot; = 'High density' OR &quot;classif_pop_density_endPlan&quot; = 'High density') AND &quot;water_consump_requirem&quot; IS NOT TRUE AND &quot;SanitationType&quot; IS NOT 'Offsite' THEN 'Be aware of the increase in water consumption; if it reaches the minimum requirements, explore an OFFSITE solution' ELSE '' END || '&#xa;' || CASE WHEN &quot;InformalSettlement&quot; IS TRUE AND &quot;ExistingSanitation&quot; IS NOT TRUE THEN 'Explore adaptive/resilient alternatives for informal settlements to sanitation systems to increase the likelihood of success' ELSE '' END || '&#xa;' || CASE WHEN &quot;LowIncomeArea&quot; IS TRUE AND &quot;ExistingSanitation&quot; IS NOT TRUE THEN 'Explore economic solutions to ensure affordability for the low-income population' ELSE '' END), '&#xa;&#xa;', '&#xa;')" field="AdditionalRecommendations"/>
    <default applyOnUpdate="0" expression="" field="identificator"/>
    <default applyOnUpdate="0" expression="" field="label_x"/>
    <default applyOnUpdate="0" expression="" field="label_y"/>
    <default applyOnUpdate="0" expression="" field="WConsump_Liters_inhab_day_count"/>
    <default applyOnUpdate="0" expression="" field="WConsump_Liters_inhab_day_mean"/>
  </defaults>
  <constraints>
    <constraint constraints="3" notnull_strength="1" exp_strength="0" field="fid" unique_strength="1"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="ExistingSanitation" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="SanitationType" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="InformalSettlement" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="LowIncomeArea" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="WaterAvailable" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="AverageWaterConsumption" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="uuid" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="area_ha" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="fid_sum" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PopDataset_sum" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="street_length_sum" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="count_buildings" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_LowDensityPop" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_MediumDensityPop" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_WaterConsumReq" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_PopDatasetYear" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_StartPlanYear" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_PeopleHHStart" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_EndPlanYear" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_PeopleHHEnd" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_AnnualGrowthRate" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="PARAM_streetWidth" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="water_consump_requirem" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="pop_startPlan" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="pop_density_startPlan" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="classif_pop_density_startPlan" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="households_startPlan" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="SuggestedSanitSystemStart" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="pop_endPlan" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="pop_density_endPlan" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="classif_pop_density_endPlan" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="households_endPlan" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="SuggestedSanitSystemEnd" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="building_per_ha" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="AdditionalRecommendations" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="identificator" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="label_x" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="label_y" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="WConsump_Liters_inhab_day_count" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="WConsump_Liters_inhab_day_mean" unique_strength="0"/>
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
    <constraint desc="" field="fid_sum" exp=""/>
    <constraint desc="" field="PopDataset_sum" exp=""/>
    <constraint desc="" field="street_length_sum" exp=""/>
    <constraint desc="" field="count_buildings" exp=""/>
    <constraint desc="" field="PARAM_LowDensityPop" exp=""/>
    <constraint desc="" field="PARAM_MediumDensityPop" exp=""/>
    <constraint desc="" field="PARAM_WaterConsumReq" exp=""/>
    <constraint desc="" field="PARAM_PopDatasetYear" exp=""/>
    <constraint desc="" field="PARAM_StartPlanYear" exp=""/>
    <constraint desc="" field="PARAM_PeopleHHStart" exp=""/>
    <constraint desc="" field="PARAM_EndPlanYear" exp=""/>
    <constraint desc="" field="PARAM_PeopleHHEnd" exp=""/>
    <constraint desc="" field="PARAM_AnnualGrowthRate" exp=""/>
    <constraint desc="" field="PARAM_streetWidth" exp=""/>
    <constraint desc="" field="water_consump_requirem" exp=""/>
    <constraint desc="" field="pop_startPlan" exp=""/>
    <constraint desc="" field="pop_density_startPlan" exp=""/>
    <constraint desc="" field="classif_pop_density_startPlan" exp=""/>
    <constraint desc="" field="households_startPlan" exp=""/>
    <constraint desc="" field="SuggestedSanitSystemStart" exp=""/>
    <constraint desc="" field="pop_endPlan" exp=""/>
    <constraint desc="" field="pop_density_endPlan" exp=""/>
    <constraint desc="" field="classif_pop_density_endPlan" exp=""/>
    <constraint desc="" field="households_endPlan" exp=""/>
    <constraint desc="" field="SuggestedSanitSystemEnd" exp=""/>
    <constraint desc="" field="building_per_ha" exp=""/>
    <constraint desc="" field="AdditionalRecommendations" exp=""/>
    <constraint desc="" field="identificator" exp=""/>
    <constraint desc="" field="label_x" exp=""/>
    <constraint desc="" field="label_y" exp=""/>
    <constraint desc="" field="WConsump_Liters_inhab_day_count" exp=""/>
    <constraint desc="" field="WConsump_Liters_inhab_day_mean" exp=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting notificationMessage="" isEnabledOnlyWhenEditable="1" shortTitle="Recalculate the subarea" capture="0" type="1" name="Recalculate the subarea" action="from qgis.core import QgsExpression, QgsExpressionContext, QgsExpressionContextUtils, QgsProject, Qgis&#xd;&#xa;from qgis.gui import QgsAttributeForm&#xd;&#xa;&#xd;&#xa;def execute_action():&#xd;&#xa;    try:&#xd;&#xa;        # Access the current feature and layer&#xd;&#xa;        current_feature = form.currentFormFeature()&#xd;&#xa;        layer = form.layer()&#xd;&#xa;&#xd;&#xa;        # Save the current feature ID and layer name&#xd;&#xa;        feature_id = current_feature.id()&#xd;&#xa;        layer_name = layer.name()&#xd;&#xa;&#xd;&#xa;        # Save modifications done to the feature&#xd;&#xa;        if not form.save():&#xd;&#xa;            return&#xd;&#xa;&#xd;&#xa;        # Define fields to exclude from recalculation&#xd;&#xa;        excluded_fields = {&quot;area_ha&quot;, &quot;uuid&quot;}&#xd;&#xa;&#xd;&#xa;        # Recalculate fields with a default value assigned&#xd;&#xa;        context = QgsExpressionContext()&#xd;&#xa;        context.appendScopes(QgsExpressionContextUtils.globalProjectLayerScopes(layer))&#xd;&#xa;        context.setFeature(current_feature)&#xd;&#xa;&#xd;&#xa;        # Track whether any recalculation occurred&#xd;&#xa;        recalculated = False&#xd;&#xa;&#xd;&#xa;        for field in layer.fields():&#xd;&#xa;            # Skip excluded fields&#xd;&#xa;            if field.name() in excluded_fields:&#xd;&#xa;                continue&#xd;&#xa;&#xd;&#xa;            default_value_def = field.defaultValueDefinition()&#xd;&#xa;            if default_value_def.isValid():&#xd;&#xa;                expression = QgsExpression(default_value_def.expression())&#xd;&#xa;&#xd;&#xa;                # Evaluate the expression in the current context&#xd;&#xa;                evaluated_value = expression.evaluate(context)&#xd;&#xa;&#xd;&#xa;                if expression.hasEvalError():&#xd;&#xa;                    # Use displayWarning to inform the user about evaluation errors&#xd;&#xa;                    form.displayWarning(&#xd;&#xa;                        f&quot;Evaluation error for field '{field.name()}': {expression.evalErrorString()}&quot;&#xd;&#xa;                    )&#xd;&#xa;                    continue&#xd;&#xa;&#xd;&#xa;                # Check if the value has changed&#xd;&#xa;                if current_feature.attribute(field.name()) != evaluated_value:&#xd;&#xa;                    # Update the attribute in-memory&#xd;&#xa;                    current_feature.setAttribute(field.name(), evaluated_value)&#xd;&#xa;                    recalculated = True&#xd;&#xa;&#xd;&#xa;                    # Immediately apply the update to the feature&#xd;&#xa;                    if not layer.updateFeature(current_feature):&#xd;&#xa;                        # Use displayWarning for update failure&#xd;&#xa;                        form.displayWarning(&#xd;&#xa;                            f&quot;Failed to update feature ID {feature_id} for field '{field.name()}'&quot;&#xd;&#xa;                        )&#xd;&#xa;&#xd;&#xa;                    # Refresh the expression context with updated feature&#xd;&#xa;                    context.setFeature(current_feature)&#xd;&#xa;&#xd;&#xa;        # Update the feature with recalculated values&#xd;&#xa;        if recalculated:&#xd;&#xa;            # Refresh the feature form&#xd;&#xa;            form.setFeature(current_feature)  # Set the updated feature&#xd;&#xa;&#xd;&#xa;            # Refresh the widget values to show changes immediately&#xd;&#xa;            form.resetValues()&#xd;&#xa;&#xd;&#xa;    except Exception as e:&#xd;&#xa;        # Display an error message for unexpected exceptions&#xd;&#xa;        form.displayWarning(&#xd;&#xa;            f&quot;An unexpected error occurred: {e}&quot;&#xd;&#xa;        )&#xd;&#xa;&#xd;&#xa;# Call the function when the button is clicked&#xd;&#xa;execute_action()&#xd;&#xa;" id="{90a9e58a-aeb6-4645-855b-815866b808f0}" icon="">
      <actionScope id="Form"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="1" actionWidgetStyle="dropDown" sortExpression="&quot;AverageWaterConsumption&quot;">
    <columns>
      <column hidden="0" width="265" type="field" name="uuid"/>
      <column hidden="0" width="171" type="field" name="ExistingSanitation"/>
      <column hidden="0" width="173" type="field" name="SanitationType"/>
      <column hidden="0" width="100" type="field" name="WaterAvailable"/>
      <column hidden="0" width="221" type="field" name="AverageWaterConsumption"/>
      <column hidden="0" width="128" type="field" name="InformalSettlement"/>
      <column hidden="0" width="124" type="field" name="LowIncomeArea"/>
      <column hidden="0" width="229" type="field" name="PopDataset_sum"/>
      <column hidden="0" width="-1" type="field" name="PARAM_PopDatasetYear"/>
      <column hidden="0" width="100" type="field" name="area_ha"/>
      <column hidden="0" width="100" type="field" name="street_length_sum"/>
      <column hidden="0" width="150" type="field" name="count_buildings"/>
      <column hidden="0" width="187" type="field" name="building_per_ha"/>
      <column hidden="0" width="-1" type="field" name="PARAM_LowDensityPop"/>
      <column hidden="0" width="-1" type="field" name="PARAM_MediumDensityPop"/>
      <column hidden="0" width="-1" type="field" name="PARAM_WaterConsumReq"/>
      <column hidden="0" width="-1" type="field" name="PARAM_StartPlanYear"/>
      <column hidden="0" width="-1" type="field" name="PARAM_PeopleHHStart"/>
      <column hidden="0" width="100" type="field" name="PARAM_EndPlanYear"/>
      <column hidden="0" width="100" type="field" name="PARAM_PeopleHHEnd"/>
      <column hidden="0" width="166" type="field" name="PARAM_AnnualGrowthRate"/>
      <column hidden="0" width="100" type="field" name="PARAM_streetWidth"/>
      <column hidden="0" width="128" type="field" name="water_consump_requirem"/>
      <column hidden="0" width="-1" type="field" name="pop_startPlan"/>
      <column hidden="0" width="-1" type="field" name="pop_density_startPlan"/>
      <column hidden="0" width="-1" type="field" name="classif_pop_density_startPlan"/>
      <column hidden="0" width="100" type="field" name="households_startPlan"/>
      <column hidden="0" width="100" type="field" name="SuggestedSanitSystemStart"/>
      <column hidden="0" width="154" type="field" name="pop_endPlan"/>
      <column hidden="0" width="234" type="field" name="pop_density_endPlan"/>
      <column hidden="0" width="209" type="field" name="classif_pop_density_endPlan"/>
      <column hidden="0" width="209" type="field" name="households_endPlan"/>
      <column hidden="0" width="-1" type="field" name="SuggestedSanitSystemEnd"/>
      <column hidden="0" width="-1" type="field" name="AdditionalRecommendations"/>
      <column hidden="0" width="221" type="field" name="WConsump_Liters_inhab_day_count"/>
      <column hidden="0" width="-1" type="field" name="WConsump_Liters_inhab_day_mean"/>
      <column hidden="0" width="-1" type="field" name="fid"/>
      <column hidden="0" width="-1" type="field" name="fid_sum"/>
      <column hidden="0" width="-1" type="field" name="identificator"/>
      <column hidden="0" width="-1" type="field" name="label_x"/>
      <column hidden="0" width="-1" type="field" name="label_y"/>
      <column hidden="1" width="-1" type="actions"/>
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
    <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
      <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
    </labelStyle>
    <attributeEditorContainer columnCount="2" groupBox="1" visibilityExpressionEnabled="0" collapsed="0" horizontalStretch="0" visibilityExpression="" name="Information of the area" type="GroupBox" collapsedExpressionEnabled="0" collapsedExpression="" showLabel="1" verticalStretch="0">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
        <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="ExistingSanitation" showLabel="1" index="1" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="SanitationType" showLabel="1" index="2" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="WaterAvailable" showLabel="1" index="5" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="AverageWaterConsumption" showLabel="1" index="6" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="InformalSettlement" showLabel="1" index="3" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="LowIncomeArea" showLabel="1" index="4" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PopDataset_sum" showLabel="1" index="10" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PARAM_PopDatasetYear" showLabel="1" index="16" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="255,252,203,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="area_ha" showLabel="1" index="8" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="street_length_sum" showLabel="1" index="11" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="count_buildings" showLabel="1" index="12" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="building_per_ha" showLabel="1" index="34" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="2" groupBox="1" visibilityExpressionEnabled="0" collapsed="0" horizontalStretch="0" visibilityExpression="" name="Parameters" type="GroupBox" collapsedExpressionEnabled="0" collapsedExpression="" showLabel="1" verticalStretch="0">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
        <labelFont description="MS Shell Dlg 2,10,-1,5,75,0,0,0,0,0" underline="0" style="" italic="0" bold="1" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="PARAM_LowDensityPop" showLabel="1" index="13" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PARAM_MediumDensityPop" showLabel="1" index="14" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PARAM_WaterConsumReq" showLabel="1" index="15" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PARAM_AnnualGrowthRate" showLabel="1" index="21" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PARAM_StartPlanYear" showLabel="1" index="17" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PARAM_EndPlanYear" showLabel="1" index="19" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PARAM_PeopleHHStart" showLabel="1" index="18" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PARAM_PeopleHHEnd" showLabel="1" index="20" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="PARAM_streetWidth" showLabel="1" index="22" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,1,0,0,0,0" underline="0" style="" italic="1" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorField horizontalStretch="0" name="water_consump_requirem" showLabel="1" index="23" verticalStretch="0">
      <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
        <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,1,0,0,0" underline="1" style="" italic="0" bold="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorField>
    <attributeEditorContainer columnCount="2" groupBox="1" visibilityExpressionEnabled="0" collapsed="0" horizontalStretch="0" visibilityExpression="" name="Indicators" type="GroupBox" collapsedExpressionEnabled="0" collapsedExpression="" showLabel="1" verticalStretch="0">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
        <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="pop_startPlan" showLabel="1" index="24" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="pop_endPlan" showLabel="1" index="29" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="pop_density_startPlan" showLabel="1" index="25" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="pop_density_endPlan" showLabel="1" index="30" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="classif_pop_density_startPlan" showLabel="1" index="26" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="classif_pop_density_endPlan" showLabel="1" index="31" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="households_startPlan" showLabel="1" index="27" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="households_endPlan" showLabel="1" index="32" verticalStretch="0">
        <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="SuggestedSanitSystemStart" showLabel="1" index="28" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,75,0,0,0,0,0" underline="0" style="" italic="0" bold="1" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
      <attributeEditorField horizontalStretch="0" name="SuggestedSanitSystemEnd" showLabel="1" index="33" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,75,0,0,0,0,0" underline="0" style="" italic="0" bold="1" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorContainer columnCount="1" groupBox="1" visibilityExpressionEnabled="0" collapsed="0" horizontalStretch="0" visibilityExpression="" name="Additional Recommendations" type="GroupBox" collapsedExpressionEnabled="0" collapsedExpression="" showLabel="1" verticalStretch="0">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
        <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
      </labelStyle>
      <attributeEditorField horizontalStretch="0" name="AdditionalRecommendations" showLabel="0" index="35" verticalStretch="0">
        <labelStyle overrideLabelFont="1" overrideLabelColor="0" labelColor="0,0,0,255">
          <labelFont description="MS Shell Dlg 2,10,-1,5,75,0,0,0,0,0" underline="0" style="" italic="0" bold="1" strikethrough="0"/>
        </labelStyle>
      </attributeEditorField>
    </attributeEditorContainer>
    <attributeEditorAction ActionUUID="{90a9e58a-aeb6-4645-855b-815866b808f0}" horizontalStretch="0" name="{90a9e58a-aeb6-4645-855b-815866b808f0}" showLabel="1" verticalStretch="0">
      <labelStyle overrideLabelFont="0" overrideLabelColor="0" labelColor="0,0,0,255">
        <labelFont description="MS Shell Dlg 2,10,-1,5,50,0,0,0,0,0" underline="0" style="" italic="0" bold="0" strikethrough="0"/>
      </labelStyle>
    </attributeEditorAction>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="AdditionalRecommendations"/>
    <field editable="1" name="AverageWaterConsumption"/>
    <field editable="1" name="ExistingSanitation"/>
    <field editable="1" name="InformalSettlement"/>
    <field editable="1" name="LowIncomeArea"/>
    <field editable="1" name="Measured_Liters_inhab_day_mean"/>
    <field editable="1" name="PARAM_AnnualGrowthRate"/>
    <field editable="1" name="PARAM_EndPlanYear"/>
    <field editable="1" name="PARAM_LowDensityPop"/>
    <field editable="1" name="PARAM_MediumDensityPop"/>
    <field editable="1" name="PARAM_PeopleHHEnd"/>
    <field editable="1" name="PARAM_PeopleHHStart"/>
    <field editable="1" name="PARAM_PopDatasetYear"/>
    <field editable="1" name="PARAM_StartPlanYear"/>
    <field editable="1" name="PARAM_WaterConsumReq"/>
    <field editable="1" name="PARAM_streetWidth"/>
    <field editable="0" name="PopDataset_sum"/>
    <field editable="1" name="SanitationType"/>
    <field editable="0" name="SuggestedSanitSystemEnd"/>
    <field editable="0" name="SuggestedSanitSystemStart"/>
    <field editable="1" name="WConsump_Liters_inhab_day_count"/>
    <field editable="1" name="WConsump_Liters_inhab_day_mean"/>
    <field editable="1" name="WConsump_Liters_inhab_day_sum"/>
    <field editable="1" name="WP_Const_density"/>
    <field editable="1" name="WP_Const_sum"/>
    <field editable="1" name="WP_Unc_density"/>
    <field editable="1" name="WP_Unconst_sum"/>
    <field editable="1" name="WaterAvailable"/>
    <field editable="1" name="abc"/>
    <field editable="0" name="area_availability"/>
    <field editable="0" name="area_buildings"/>
    <field editable="0" name="area_ha"/>
    <field editable="0" name="auxiliary_storage_labeling_lineanchorclipping"/>
    <field editable="0" name="auxiliary_storage_labeling_lineanchorpercent"/>
    <field editable="0" name="auxiliary_storage_labeling_lineanchortextpoint"/>
    <field editable="0" name="auxiliary_storage_labeling_lineanchortype"/>
    <field editable="0" name="auxiliary_storage_labeling_positionx"/>
    <field editable="0" name="auxiliary_storage_labeling_positiony"/>
    <field editable="1" name="building_per_ha"/>
    <field editable="0" name="classif_pop_density_endPlan"/>
    <field editable="0" name="classif_pop_density_startPlan"/>
    <field editable="0" name="count_buildings"/>
    <field editable="1" name="fid"/>
    <field editable="1" name="fid_sum"/>
    <field editable="0" name="households_endPlan"/>
    <field editable="0" name="households_startPlan"/>
    <field editable="1" name="identificator"/>
    <field editable="1" name="label_x"/>
    <field editable="1" name="label_y"/>
    <field editable="0" name="people_per_building"/>
    <field editable="0" name="pop_density_endPlan"/>
    <field editable="0" name="pop_density_startPlan"/>
    <field editable="0" name="pop_endPlan"/>
    <field editable="0" name="pop_startPlan"/>
    <field editable="0" name="street_length_sum"/>
    <field editable="0" name="uuid"/>
    <field editable="0" name="water_consump_requirem"/>
  </editable>
  <labelOnTop>
    <field name="AdditionalRecommendations" labelOnTop="1"/>
    <field name="AverageWaterConsumption" labelOnTop="0"/>
    <field name="ExistingSanitation" labelOnTop="0"/>
    <field name="InformalSettlement" labelOnTop="0"/>
    <field name="LowIncomeArea" labelOnTop="0"/>
    <field name="Measured_Liters_inhab_day_mean" labelOnTop="0"/>
    <field name="PARAM_AnnualGrowthRate" labelOnTop="0"/>
    <field name="PARAM_EndPlanYear" labelOnTop="0"/>
    <field name="PARAM_LowDensityPop" labelOnTop="0"/>
    <field name="PARAM_MediumDensityPop" labelOnTop="0"/>
    <field name="PARAM_PeopleHHEnd" labelOnTop="0"/>
    <field name="PARAM_PeopleHHStart" labelOnTop="0"/>
    <field name="PARAM_PopDatasetYear" labelOnTop="0"/>
    <field name="PARAM_StartPlanYear" labelOnTop="0"/>
    <field name="PARAM_WaterConsumReq" labelOnTop="0"/>
    <field name="PARAM_streetWidth" labelOnTop="0"/>
    <field name="PopDataset_sum" labelOnTop="0"/>
    <field name="SanitationType" labelOnTop="0"/>
    <field name="SuggestedSanitSystemEnd" labelOnTop="0"/>
    <field name="SuggestedSanitSystemStart" labelOnTop="0"/>
    <field name="WConsump_Liters_inhab_day_count" labelOnTop="0"/>
    <field name="WConsump_Liters_inhab_day_mean" labelOnTop="0"/>
    <field name="WConsump_Liters_inhab_day_sum" labelOnTop="0"/>
    <field name="WP_Const_density" labelOnTop="0"/>
    <field name="WP_Const_sum" labelOnTop="0"/>
    <field name="WP_Unc_density" labelOnTop="0"/>
    <field name="WP_Unconst_sum" labelOnTop="0"/>
    <field name="WaterAvailable" labelOnTop="0"/>
    <field name="abc" labelOnTop="0"/>
    <field name="area_availability" labelOnTop="0"/>
    <field name="area_buildings" labelOnTop="0"/>
    <field name="area_ha" labelOnTop="0"/>
    <field name="auxiliary_storage_labeling_lineanchorclipping" labelOnTop="0"/>
    <field name="auxiliary_storage_labeling_lineanchorpercent" labelOnTop="0"/>
    <field name="auxiliary_storage_labeling_lineanchortextpoint" labelOnTop="0"/>
    <field name="auxiliary_storage_labeling_lineanchortype" labelOnTop="0"/>
    <field name="auxiliary_storage_labeling_positionx" labelOnTop="0"/>
    <field name="auxiliary_storage_labeling_positiony" labelOnTop="0"/>
    <field name="building_per_ha" labelOnTop="0"/>
    <field name="classif_pop_density_endPlan" labelOnTop="0"/>
    <field name="classif_pop_density_startPlan" labelOnTop="0"/>
    <field name="count_buildings" labelOnTop="0"/>
    <field name="fid" labelOnTop="0"/>
    <field name="fid_sum" labelOnTop="0"/>
    <field name="households_endPlan" labelOnTop="0"/>
    <field name="households_startPlan" labelOnTop="0"/>
    <field name="identificator" labelOnTop="0"/>
    <field name="label_x" labelOnTop="0"/>
    <field name="label_y" labelOnTop="0"/>
    <field name="people_per_building" labelOnTop="0"/>
    <field name="pop_density_endPlan" labelOnTop="0"/>
    <field name="pop_density_startPlan" labelOnTop="0"/>
    <field name="pop_endPlan" labelOnTop="0"/>
    <field name="pop_startPlan" labelOnTop="0"/>
    <field name="street_length_sum" labelOnTop="0"/>
    <field name="uuid" labelOnTop="0"/>
    <field name="water_consump_requirem" labelOnTop="0"/>
  </labelOnTop>
  <reuseLastValue>
    <field reuseLastValue="0" name="AdditionalRecommendations"/>
    <field reuseLastValue="0" name="AverageWaterConsumption"/>
    <field reuseLastValue="0" name="ExistingSanitation"/>
    <field reuseLastValue="0" name="InformalSettlement"/>
    <field reuseLastValue="0" name="LowIncomeArea"/>
    <field reuseLastValue="0" name="Measured_Liters_inhab_day_mean"/>
    <field reuseLastValue="0" name="PARAM_AnnualGrowthRate"/>
    <field reuseLastValue="0" name="PARAM_EndPlanYear"/>
    <field reuseLastValue="0" name="PARAM_LowDensityPop"/>
    <field reuseLastValue="0" name="PARAM_MediumDensityPop"/>
    <field reuseLastValue="0" name="PARAM_PeopleHHEnd"/>
    <field reuseLastValue="0" name="PARAM_PeopleHHStart"/>
    <field reuseLastValue="0" name="PARAM_PopDatasetYear"/>
    <field reuseLastValue="0" name="PARAM_StartPlanYear"/>
    <field reuseLastValue="0" name="PARAM_WaterConsumReq"/>
    <field reuseLastValue="0" name="PARAM_streetWidth"/>
    <field reuseLastValue="0" name="PopDataset_sum"/>
    <field reuseLastValue="0" name="SanitationType"/>
    <field reuseLastValue="0" name="SuggestedSanitSystemEnd"/>
    <field reuseLastValue="0" name="SuggestedSanitSystemStart"/>
    <field reuseLastValue="0" name="WConsump_Liters_inhab_day_count"/>
    <field reuseLastValue="0" name="WConsump_Liters_inhab_day_mean"/>
    <field reuseLastValue="0" name="WConsump_Liters_inhab_day_sum"/>
    <field reuseLastValue="0" name="WP_Const_density"/>
    <field reuseLastValue="0" name="WP_Const_sum"/>
    <field reuseLastValue="0" name="WP_Unc_density"/>
    <field reuseLastValue="0" name="WP_Unconst_sum"/>
    <field reuseLastValue="0" name="WaterAvailable"/>
    <field reuseLastValue="0" name="abc"/>
    <field reuseLastValue="0" name="area_availability"/>
    <field reuseLastValue="0" name="area_buildings"/>
    <field reuseLastValue="0" name="area_ha"/>
    <field reuseLastValue="0" name="auxiliary_storage_labeling_lineanchorclipping"/>
    <field reuseLastValue="0" name="auxiliary_storage_labeling_lineanchorpercent"/>
    <field reuseLastValue="0" name="auxiliary_storage_labeling_lineanchortextpoint"/>
    <field reuseLastValue="0" name="auxiliary_storage_labeling_lineanchortype"/>
    <field reuseLastValue="0" name="auxiliary_storage_labeling_positionx"/>
    <field reuseLastValue="0" name="auxiliary_storage_labeling_positiony"/>
    <field reuseLastValue="0" name="building_per_ha"/>
    <field reuseLastValue="0" name="classif_pop_density_endPlan"/>
    <field reuseLastValue="0" name="classif_pop_density_startPlan"/>
    <field reuseLastValue="0" name="count_buildings"/>
    <field reuseLastValue="0" name="fid"/>
    <field reuseLastValue="0" name="fid_sum"/>
    <field reuseLastValue="0" name="households_endPlan"/>
    <field reuseLastValue="0" name="households_startPlan"/>
    <field reuseLastValue="0" name="identificator"/>
    <field reuseLastValue="0" name="label_x"/>
    <field reuseLastValue="0" name="label_y"/>
    <field reuseLastValue="0" name="people_per_building"/>
    <field reuseLastValue="0" name="pop_density_endPlan"/>
    <field reuseLastValue="0" name="pop_density_startPlan"/>
    <field reuseLastValue="0" name="pop_endPlan"/>
    <field reuseLastValue="0" name="pop_startPlan"/>
    <field reuseLastValue="0" name="street_length_sum"/>
    <field reuseLastValue="0" name="uuid"/>
    <field reuseLastValue="0" name="water_consump_requirem"/>
  </reuseLastValue>
  <dataDefinedFieldProperties/>
  <widgets/>
  <layerGeometryType>2</layerGeometryType>
</qgis>
