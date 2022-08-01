local g = import '../../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local target = g.target.Prometheus.new(
  expr='sum(rate(op_n_count{op=~"Search|Query|QueryFn"}[5m])) by (op, type) * 60 > 0',
  legend='{{type}}.{{ op }}',
);

graph.TimeSeries.new(
  title='Search Return Rate per Minute',
  targets=[
    target,
  ],
  options=[
    graph.option.tooltip.mode.multi,
  ],
  fieldConfigs=[
    graph.fieldConfig.lineWidth(1),
    graph.fieldConfig.overrides([
    ]),
  ],
  transformations=[
  ],
)
