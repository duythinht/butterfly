local g = import '../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local target = g.target.Prometheus.new(
  expr='sum(increase(ontopy_cdc_op_counter{}[5m])) by (op) / 5',
  legend='{{ op }}',
);

graph.TimeSeries.new(
  title='CDC Operation per Minute',
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
      Override.new(byName='c', props=[
        property.displayName('Create'),
      ]),
      Override.new(byName='u', props=[
        property.displayName('Update'),
      ]),
      Override.new(byName='d', props=[
        property.displayName('Delete'),
      ])
    ]),
  ],
  transformations=[
  ],
)
