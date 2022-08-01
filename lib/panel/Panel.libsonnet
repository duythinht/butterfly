local layout = import '../layout/index.libsonnet';

{
  new(
    type='unknown',
    datasource='default',
    description=null,
    repeat=null,
    repeatDirection=null,
    title=null,
    transparent=false,
    grid=null,
    targets=[],
  ):: {
    [if datasource != null then 'datasource']: datasource,
    [if description != null then 'description']: description,
    [if repeat != null then 'repeat']: repeat,
    [if repeatDirection != null then 'repeatDirection']: repeatDirection,
    [if title != null then 'title']: title,
    [if transparent then 'transparent']: transparent,
    [if std.length(targets) > 0 then 'targets']: targets,
    type: type,
  } + if grid != null then grid else layout.Grid.new(w=12, h=8),
}
