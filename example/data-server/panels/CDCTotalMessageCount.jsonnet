local g = import '../../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local target = g.target.Prometheus.new(
  expr='increase(cdc_stream_total_msg_count{}[5m]) / 5 > 0',
  legend='{{ instance }}',
);

graph.TimeSeries.new(
  title='CDC Messages per minute',
  targets=[
    target,
  ],
  options=[
    graph.option.tooltip.mode.multi,
    graph.option.legend.displayMode.table,
    graph.option.legend.placement.right,
  ],
  fieldConfigs=[
    graph.fieldConfig.lineInterpolation.smooth,
    graph.fieldConfig.lineWidth(1),
    graph.fieldConfig.fillOpacity(10),
    graph.fieldConfig.overrides([
      
    ]),
  ],
  transformations=[
  ],
)
