{
  config:: {
    defaults:: import 'config.defaults.libsonnet',
    mapping:: import 'config.mapping.libsonnet',
    override:: import 'config.override.libsonnet',
  },
  option:: import 'option.libsonnet',
}
