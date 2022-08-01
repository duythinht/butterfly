local g = import '../../lib/grafana.libsonnet';

local targets = [
  g.target.Prometheus.new(
    'sum(ontopy_op_running{})',
    legend='Op on Running',
    instant=true,
    refId='A'
  ),
  g.target.Prometheus.new(
    'sum(ontopy_op_duration_count{op="Query"})',
    legend='Total Queries Executed',
    instant=true,
    refId='B'
  ),
  g.target.Prometheus.new(
    'sum(increase(ontopy_cdc_op_counter[$__range]))',
    legend='CDC Ops Overtime',
    refId='C'
  ),
  g.target.Prometheus.new(
    'sum(increase(ontopy_engine_completed{}[$__range]))',
    legend='Ops Completed Overtime',
    refId='D'
  ),
  g.target.Prometheus.new(
    'sum(ontopy_cdc_stream_total_op_count)',
    legend='Total Stream Ops',
    refId='E'
  ),
  g.target.Prometheus.new(
    'sum(ontopy_cdc_stream_total_msg_count{})',
    legend='Total Stream Message',
    refId='F'
  ),
  g.target.Prometheus.new(
    'count(ontopy_cdc_op_per_table_counter{op="c"}) by (op)',
    legend='Total CDC Tables',
    refId='G'
  ),
  g.target.Prometheus.new(
    'ontopy_engine_running{op="engine.query"}',
    legend='Engine Query Running',
    refId='H'
  ),
];

local stat = g.panel.stat;

local options = [
  stat.option.textMode.auto,
  stat.option.colorMode.background,
  stat.option.graphMode.area,
  stat.option.justifyMode.auto,
  stat.option.orientation.auto,
];

local mappingLessThan100 = {
  type: 'range',
  options: {
    from: 0,
    to: 100,
    result: {
      text: 'Less than 100',
      index: 0,
    },
  },
};

local fieldConfigs = [
  stat.fieldConfig.color.paletteClassic,
  stat.fieldConfig.mappings([]),
];

g.panel.stat.Stat.new(
  title='Summary',
  targets=targets,
  options=options,
  fieldConfigs=fieldConfigs
).grid(w=24, h=3, x=0, y=1)
