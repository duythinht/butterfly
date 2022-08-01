local g = import '../../../lib/grafana.libsonnet';

local table = g.panel.table;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local targets = [
  g.target.Prometheus.new(
    expr='sum(cdc_kafka_delay{stream="s2k"}) by (schema, table)',
    format='table',
    instant=true
  ),
  g.target.Prometheus.new(
    expr='sum(cdc_kafka_delay{stream="k2p"}) by (schema, table)',
    format='table',
    instant=true
  ),
  g.target.Prometheus.new(
    expr='sum(cdc_kafka_delay) by (schema, table)',
    format='table',
    instant=true
  ),
];

table.Table.new(
  title='CDC Delay',
  targets=targets,
  options=[
  ],
  fieldConfigs=[
    table.fieldConfig.align.auto,
    table.fieldConfig.unit('s'),
    table.fieldConfig.mappings([

    ]),
    table.fieldConfig.overrides([
      Override.new(byName='Value #A', props=[
        property.displayName('Source To Kafka'),
      ]),
      Override.new(byName='Value #B', props=[
        property.displayName('Kafka To Parquet'),
      ]),
      Override.new(byName='Value #C', props=[
        property.displayName('Source To Parquet'),
      ]),
    ]),
  ],
  transformations=[
    g.panel.transformation.filterFieldsByName(names=['schema', 'table', 'Value #A', 'Value #B', 'Value #C']),
    g.panel.transformation.merge,
  ],
)
