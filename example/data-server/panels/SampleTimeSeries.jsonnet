local g = import '../../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local target = g.target.Prometheus.new(
  expr='histogram_quantile(0.9, sum(rate(dremio_query_duration_seconds_bucket{}[5m])) by (instance,le))',
  legend='{{instance}}',
);

local reduceId = g.panel.field.option.reduceId;

graph.TimeSeries.new(
  title='Test Sample TimeSeries',
  targets=[
    target,
  ],
  options=[
    graph.option.tooltip.mode.multi,
    graph.option.legend.displayMode.table,
    graph.option.legend.placement.right,
    graph.option.legend.calcs([
      reduceId.max,
      reduceId.min,
      reduceId.mean,
    ]),
  ],
  fieldConfigs=[
    graph.fieldConfig.lineInterpolation.smooth,
    graph.fieldConfig.lineWidth(2),
    graph.fieldConfig.fillOpacity(10),
  ],
  transformations=[

  ],
)
