### Mjolnir - Build grafana dashboard with components

Mjolnir is designed to be the simplest way possible to make grafana dashboard. It define set of grafana as jsonnet, you just need to declare the query, choose the options and set up easily.

The project is forked from internal original project (owned by me), I need you help to add more component option (other component and the transform is not completed)

```
local g = import '../../lib/grafana.libsonnet';

local graph = g.panel.graph;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local target = g.target.Prometheus.new(
  expr='increase(stream_total_msg_count{}[5m]) / 5 > 0',
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

```

### Why not grafonnet-lib?

Because the the project seems like in-active, and i'm tired to make boilderplate code.
