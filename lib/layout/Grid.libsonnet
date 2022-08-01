{
  new(w=12, h=8, x=null, y=null):: {
    gridPos: {
      [if w != null then 'w']: w,
      [if h != null then 'h']: h,
      [if x != null then 'x']: x,
      [if y != null then 'y']: y,
    },
    grid(w=null, h=null, x=null, y=null):: self {
      gridPos+: {
        [if w != null then 'w']: w,
        [if h != null then 'h']: h,
        [if x != null then 'x']: x,
        [if y != null then 'y']: y,
      },
    },
  }
}
