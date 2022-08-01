local Panel = import '../Panel.libsonnet';

{
  new(
    datasource=null,
    description=null,
    repeat=null,
    repeatDirection=null,
    title=null,
    transparent=false,
    grid=null,
    //row specific
    showTitle=null,
    titleSize=null,
    collapse=true,
    collapsed=true,
    panels=[],
  ):: Panel.new(
    datasource=datasource,
    description=description,
    repeat=repeat,
    repeatDirection=repeatDirection,
    title=title,
    transparent=transparent,
    grid=grid,
    type='row',
  ) + {
    [if collapse != null then 'collapse']: collapse,
    [if collapsed != null then 'collapsed']: collapsed,
    [if showTitle != null then 'showTitle']: showTitle,
    [if titleSize != null then 'titleSize']: titleSize,
  } + if std.length(panels) > 0 then {
    panels: panels,
  } else {},
}
