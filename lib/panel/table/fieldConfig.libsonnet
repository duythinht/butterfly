local field = import '../field/index.libsonnet';

local utils = import '../utils.libsonnet';

field.config.defaults {
  
  align:: utils.items(
    ['defaults', 'custom', 'align'],
    ['auto', 'left', 'center', 'right']
  ),

  displayMode: {
    auto: utils.item(['defaults', 'custom', 'displayMode'], 'auto'),
    colorBackground: utils.item(['defaults', 'custom', 'displayMode'], 'color-background'),
    colorBackgroundSolid: utils.item(['defaults', 'custom', 'displayMode'], 'color-background-solid'),
  },

  filterable:: utils.item(['defaults', 'custom', 'filterable'], true),
  width(w):: utils.item(['defaults', 'custom', 'width'], w)
}
