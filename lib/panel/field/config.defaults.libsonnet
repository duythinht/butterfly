local utils = import '../utils.libsonnet';

{
  max(v):: utils.item(['defaults', 'max'], v),
  min(v):: utils.item(['defaults', 'min'], v),
  unit(v):: utils.item(['defaults', 'unit'], v),
  displayName(v):: utils.item(['defaults', 'displayName'], v),
  noValue(v):: utils.item(['defaults', 'noValue'], v),
  decimals(v):: utils.item(['defaults', 'decimals'], v),
  mappings(l):: utils.item(['defaults', 'mappings'], l),
  thresholds(l):: utils.item(['defaults', 'thresholds'], l),

  color:: {
    local mode = function(m, c=null) {
      mode: m,
      [if c != null then 'fixedColor']: c,
    },
    single(c):: utils.item(['defaults', 'color'], mode('fixed', c)),
    thresholds: utils.item(['defaults', 'color'], mode('thresholds')),
    paletteClassic: utils.item(['defaults', 'color'], mode('palette-classic')),
    greenYellowRed: utils.item(['defaults', 'color'], mode('continuous-GrYlRd')),
  },

  overrides(l):: utils.kv('overrides', l),
}
