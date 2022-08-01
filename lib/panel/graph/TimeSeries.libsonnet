local Panel = import '../Panel.libsonnet';

{
  new(
    datasource='default',
    description=null,
    repeat=null,
    repeatDirection=null,
    title=null,
    transparent=false,
    grid=null,
    //table specific
    targets=[],
    options=[],
    transformations=[],
    fieldConfigs=[],
  ):: Panel.new(
    datasource=datasource,
    description=description,
    repeat=repeat,
    repeatDirection=repeatDirection,
    title=title,
    transparent=transparent,
    grid=grid,
    type='timeseries',
  ) + {

    targets: targets,
    transformations: transformations,
    
    [if std.length(fieldConfigs) > 0 then 'fieldConfig']: std.foldl(
      function(x, y) std.mergePatch(x, y),
      fieldConfigs,
      {
        defaults: {
          mappings: [],
        },
        overrides: [],
      }
    ),

    [if std.length(options) > 0 then 'options']: std.foldl(
      function(x, y) std.mergePatch(x, y),
      options,
      {}
    ),
  },
}
