local utils = import '../utils.libsonnet';

{
  tooltip:: {
    mode:: utils.items(
      ['tooltip', 'mode'],
      ['simple', 'multi', 'none']
    ),
  },

  legend:: {
    displayMode:: utils.items(
      ['legend', 'displayMode'],
      ['list', 'table', 'hidden']
    ),

    placement:: utils.items(
      ['legend', 'placement'],
      ['bottom', 'right']
    ),
    calcs(l): utils.item(['legend', 'calcs'], l),
  },
}
