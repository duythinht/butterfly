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
    //row specific
    mode='markdown',
    content=null
  ):: Panel.new(
    datasource=datasource,
    description=description,
    repeat=repeat,
    repeatDirection=repeatDirection,
    title=title,
    transparent=transparent,
    grid=grid,
    type='text',
  ) + {
    options: {
      mode: mode,
      [if content != null then 'content']: content,
    },
  }
}
