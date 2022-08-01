local g = import '../../../lib/grafana.libsonnet';

local table = g.panel.table;

local Override = g.panel.field.config.override.Override;
local property = g.panel.field.config.override.property;

local mapping = g.panel.field.config.mapping;

local targets = [
  g.target.Prometheus.new(
    expr='sum(cdc_op_per_table_counter{op="c"}) by (table)',
    legend='Create',
    format='table',
    instant=true
  ),
  g.target.Prometheus.new(
    expr='sum(cdc_op_per_table_counter{op="u"}) by (table)',
    legend='Update',
    format='table',
    instant=true
  ),
  g.target.Prometheus.new(
    expr='sum(cdc_op_per_table_counter{op="d"}) by (table)',
    legend='Delete',
    format='table',
    instant=true
  ),
];

table.Table.new(
  title='Table Operation',
  targets=targets,
  options=[
  ],
  fieldConfigs=[
    table.fieldConfig.align.auto,
    table.fieldConfig.unit('short'),
    table.fieldConfig.mappings([
      mapping.names({
        c: 'Create',
        u: 'Update',
        d: 'Delete',
      }),
    ]),
    table.fieldConfig.overrides([
      Override.new(byName='table', props=[
        property.displayName('Table'),
      ]),
      Override.new(byName='Value #A', props=[
        property.displayName('Create'),
      ]),
      Override.new(byName='Value #B', props=[
        property.displayName('Update'),
      ]),
      Override.new(byName='Value #C', props=[
        property.displayName('Delete'),
      ]),
    ]),
  ],
  transformations=[
    g.panel.transformation.filterFieldsByName(names=['table', 'Value #A', 'Value #B', 'Value #C']),
    g.panel.transformation.merge,
  ],
)
