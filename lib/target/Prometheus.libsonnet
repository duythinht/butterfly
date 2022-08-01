{
  new(
    expr=null,
    datasource='default',
    format='time_series',
    instant=false,
    legend=null,
    refId=null,
    hide=false,
    exemplar=true,
  ):: {
    hide: hide,
    datasource: datasource,
    expr: expr,
    format: format,
    instant: instant,
    exemplar: exemplar,
    [if legend != null then 'legendFormat']: legend,
    [if refId != null then 'refId']: refId,
  },
}
