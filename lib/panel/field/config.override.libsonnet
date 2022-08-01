{
  Override:: {
    new(byName=null, props=[]):: {
      matcher: if byName != null then {
        id: 'byName',
        options: byName,
      } else {},
      properties: props,
    },
  },
  property:: {
    displayName(name):: {
      id: 'displayName',
      value: name,
    },
    fixedColor(c):: {
      id: 'color',
      value: {
        mode: 'fixed',
        fixedColor: c,
      },
    },
  },
}