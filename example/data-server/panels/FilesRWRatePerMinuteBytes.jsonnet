local g = import '../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local target = g.target.Prometheus.new(
  expr='sum(rate(ontopy_op_n_count{op=~"Write|Read|Save|Load", unit="byte"}[5m])) by (op, type, unit) * 60',
  legend='{{type}}.{{ op }}',
);

local reduceId = g.panel.field.option.reduceId;

graph.TimeSeries.new(
  title='Files RW Rate per Minute (bytes)',
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
    graph.fieldConfig.lineWidth(1),
    graph.fieldConfig.fillOpacity(10),
    graph.fieldConfig.unit('binBps'),
  ],
  transformations=[
  ],
)