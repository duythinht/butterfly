local g = import '../../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local target = g.target.Prometheus.new(
  expr='sum(op_running{type!="opendistro"}) by (op, type)',
  legend='{{type}}.{{ op }}',
);

local reduceId = g.panel.field.option.reduceId;

graph.TimeSeries.new(
  title='On Going Operation',
  targets=[
    target,
  ],
  options=[
    graph.option.legend.displayMode.table,
    graph.option.legend.placement.right,
    graph.option.legend.calcs([
      reduceId.last,
    ]),
  ],
  fieldConfigs=[
    graph.fieldConfig.drawStyle.bars,
    graph.fieldConfig.lineWidth(2),
    graph.fieldConfig.fillOpacity(100)
  ],
  transformations=[
  ],
)