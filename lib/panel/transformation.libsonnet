{
  merge:: {
    id: 'merge',
  },
  filterFieldsByName(names=[], pattern=null):: {
    id: 'filterFieldsByName',
    options: {
      include: {
        [if pattern != null then 'pattern']: pattern,
        [if pattern == null then 'names']: names
      }
    }
  }
}