local g = import '../../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local target = g.target.Prometheus.new(
  expr='sum(rate(operation_count{name="query"}[5m])) by (instance)',
  legend='{{ name }}',
);

graph.TimeSeries.new(
  title='Queries Per Minute',
  targets=[
    target,
  ],
  options=[
    graph.option.tooltip.mode.multi,
    graph.option.legend.displayMode.table,
  ],
  fieldConfigs=[
    graph.fieldConfig.lineInterpolation.smooth,
    graph.fieldConfig.lineWidth(2),
    graph.fieldConfig.fillOpacity(10),
    graph.fieldConfig.overrides([
    ]),
  ],
  transformations=[
  ],
)
