{
  new(
    hidden=false,
    refreshIntervals=['5s', '10s', '30s', '1m', '5m', '15m', '30m', '1h', '2h', '1d'],
  ):: {
    hidden: hidden,
    refreshIntervals: refreshIntervals,
  },
}
