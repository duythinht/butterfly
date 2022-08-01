local field = import '../field/index.libsonnet';
local utils = import '../utils.libsonnet';

field.config.defaults {
  drawStyle:: {
    line:: utils.item(['defaults', 'custom', 'drawStyle'], 'line'),
    bars:: utils.item(['defaults', 'custom', 'drawStyle'], 'bars'),
    points:: utils.item(['defaults', 'custom', 'drawStyle'], 'points'),
  },
  lineInterpolation:: {
    linear:: utils.item(['defaults', 'custom', 'lineInterpolation'], 'linear'),
    smooth:: utils.item(['defaults', 'custom', 'lineInterpolation'], 'smooth'),
    stepBefore:: utils.item(['defaults', 'custom', 'lineInterpolation'], 'stepBefore'),
    stepAfter:: utils.item(['defaults', 'custom', 'lineInterpolation'], 'stepAfter'),
  },
  barAlignment:: {
    left:: utils.item(['defaults', 'custom', 'barAlignment'], -1),
    center:: utils.item(['defaults', 'custom', 'barAlignment'], 0),
    right:: utils.item(['defaults', 'custom', 'barAlignment'], 1),
  },

  lineWidth(w):: utils.item(['defaults', 'custom', 'lineWidth'], w),
  fillOpacity(op):: utils.item(['defaults', 'custom', 'fillOpacity'], op),

  gradientMode:: {
    none:: utils.item(['defaults', 'custom', 'gradientMode'], 'none'),
    opacity:: utils.item(['defaults', 'custom', 'gradientMode'], 'opacity'),
    hue:: utils.item(['defaults', 'custom', 'gradientMode'], 'hue'),
  },

  lineStyles:: {
    solid:: utils.item(['defaults', 'custom', 'lineStyle'], { fill: 'solid' }),
    dash(dashArr):: utils.item(['defaults', 'custom', 'lineStyle'], { fill: 'dash', dash: dashArr }),
    dots(dashArr):: utils.item(['defaults', 'custom', 'lineStyle'], { fill: 'dot', dash: dashArr }),
  },

  connectNullValues:: {
    never:: utils.item(['defaults', 'custom', 'spanNulls'], false),
    always:: utils.item(['defaults', 'custom', 'spanNulls'], true),
    threshold(t):: utils.item(['defaults', 'custom', 'spanNulls'], t),
  },

  showPoints:: {
    auto:: utils.item(['defaults', 'custom', 'showPoints'], 'auto'),
    always:: utils.item(['defaults', 'custom', 'showPoints'], 'always'),
    never:: utils.item(['defaults', 'custom', 'showPoints'], 'never'),
  },

  pointSize(s):: utils.item(['defaults', 'custom', 'pointSize'], s),

  stacking:: {
    off:: utils.item(['defaults', 'custom', 'stacking'], { mode: 'none', group: 'A' }),
    normal:: utils.item(['defaults', 'custom', 'stacking'], { mode: 'normal', group: 'A' }),
  },

  axis:: {
    placement:: {
      auto:: utils.item(['defaults', 'custom', 'axisPlacement'], 'auto'),
      left:: utils.item(['defaults', 'custom', 'axisPlacement'], 'left'),
      right:: utils.item(['defaults', 'custom', 'axisPlacement'], 'right'),
      hidden:: utils.item(['defaults', 'custom', 'axisPlacement'], 'hidden'),
    },
    label(t):: utils.item(['defaults', 'custom', 'axisLabel'], t),
    width(w):: utils.item(['defaults', 'custom', 'axisWidth'], w),
    softMin(v):: utils.item(['defaults', 'custom', 'axisSoftMin'], v),
    softMax(v):: utils.item(['defaults', 'custom', 'axisSoftMax'], v),
    scaleDistribution:: {
      linear:: utils.item(['defaults', 'custom', 'scaleDistribution'], { type: 'linear' }),
      log(b):: utils.item(['defaults', 'custom', 'scaleDistribution'], { type: 'log', log: b }),
    },
  },
}
