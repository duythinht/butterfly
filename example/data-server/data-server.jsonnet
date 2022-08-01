local g = import '../../lib/grafana.libsonnet';

g.dashboard.Dashboard.new(
  title='Data Server Example',
  uid='hello',
  time=g.dashboard.Time.new(
    from='now-15m',
    to='now'
  ),
  panels=[
    g.panel.row.Row.new(
      title='Data Server',
      collapsed=false,
      panels=[
        import 'panels/Summary.jsonnet',
        (import 'panels/CDCDelay.jsonnet').grid(x=0, y=4),
        (import 'panels/TableOperation.jsonnet').grid(x=12, y=4),
        (import 'panels/CDCOperationPerMinute.jsonnet').grid(x=0, y=12),
        (import 'panels/CDCTotalMessageCount.jsonnet').grid(x=12, y=12),
        (import 'panels/OnGoingOperation.jsonnet').grid(x=0, y=20),
        (import 'panels/EndpointResponse.jsonnet').grid(x=12, y=20),
        (import 'panels/FilesRWRatePerMinuteCount.jsonnet').grid(x=0, y=28),
        (import 'panels/FilesRWRatePerMinuteBytes.jsonnet').grid(x=12, y=28),
        (import 'panels/SQLWriteRatePerMinute.jsonnet').grid(x=0, y=36),
        (import 'panels/SQLReadRatePerMinute.jsonnet').grid(x=12, y=36),
        (import 'panels/ParquetRWRate.jsonnet').grid(x=0, y=44),
        (import 'panels/SearchReturnRatePerMinute.jsonnet').grid(x=12, y=44),
      ]
    ).grid(w=24, h=1, x=0, y=0),
  ]
)

// w = 24
// h1