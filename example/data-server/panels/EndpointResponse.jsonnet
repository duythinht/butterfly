local g = import '../../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local target = g.target.Prometheus.new(
  expr='histogram_quantile(0.95, sum(rate(echo_request_duration_seconds_bucket{code!="404", method!="OPTIONS"}[5m])) by (method, url, le)) > 0',
  legend='{{ method }} {{ url }}',
);

local reduceId = g.panel.field.option.reduceId;

graph.TimeSeries.new(
  title='Endpoint Response p90',
  targets=[
    target,
  ],
  options=[
    graph.option.legend.displayMode.table,
    graph.option.legend.placement.right,
    graph.option.legend.calcs([
      reduceId.mean,
    ]),
  ],
  fieldConfigs=[
    graph.fieldConfig.lineInterpolation.smooth,
    graph.fieldConfig.lineWidth(2),
    graph.fieldConfig.fillOpacity(10),
    graph.fieldConfig.unit('s'),
    graph.fieldConfig.overrides([
    ]),
  ],
  transformations=[
  ],
)
