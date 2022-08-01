{
  local kv = function(k, v) {
    [k]: v,
  },

  local select = function(k, options) std.foldl(function(obj, v) obj { [v]:: kv(k, v) }, options, {}),

  orientation:: select('orientation', ['auto', 'vertical', 'horizontal']),

  justifyMode:: select('justifyMode', ['auto', 'center']),

  graphMode:: select('graphMode', ['none', 'area']),

  textMode:: select('textMode', ['auto']),

  colorMode: select('colorMode', ['background', 'value', 'none']),

  text:: {
    textSize(s):: kv('text', {textSize: s}),
    valueSize(s):: kv('text', {ValueSize: s})
  },

  reduceOptions:: {
    values:: kv('reduceOptions', {values: true}),
    limit(n)::kv('reduceOptions', {limit: n}),
    calcs(l)::kv('reduceOptions', {calcs: l}),
    fields(fs)::kv('reduceOptions', {fields: fs}),
  }
}
