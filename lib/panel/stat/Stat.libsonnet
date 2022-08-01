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
    //stat specific
    options=[],
    fieldConfigs=[],
    targets=[],
    transformations=[],
  ):: Panel.new(
    datasource=datasource,
    description=description,
    repeat=repeat,
    repeatDirection=repeatDirection,
    title=title,
    transparent=transparent,
    grid=grid,
    type='stat',
  ) + {
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
    targets: targets,
    transformations: transformations,
  },
}
