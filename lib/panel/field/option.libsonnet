local utils = import '../utils.libsonnet';

{
  reduceId:: utils.list([
    'sum',
    'max',
    'min',
    'logmin',
    'mean',
    'last',
    'first',
    'count',
    'range',
    'diff',
    'diffperc',
    'delta',
    'step',

    'firstNotNull',
    'lastNotNull',

    'changeCount',
    'distinctCount',

    'allIsZero',

    'allIsNull',
  ]),
}
