local g = import '../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local targets = [
  g.target.Prometheus.new(
    expr='sum(rate(ontopy_op_n_count{type="parquet"}[5m])) by (op) * 60 > 0',
    legend='{{ op }}',
  ),
];

local reduceId = g.panel.field.option.reduceId;

graph.TimeSeries.new(
  title='Parquet RW Rate (rows)',
  targets=targets,
  options=[
  ],
  fieldConfigs=[
    graph.fieldConfig.drawStyle.bars,
    graph.fieldConfig.lineWidth(1),
    graph.fieldConfig.fillOpacity(50)
  ],
  transformations=[
  ],
)