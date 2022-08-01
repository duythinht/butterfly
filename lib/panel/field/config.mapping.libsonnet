{
  names(kv):: {
    type: 'value',
    options: std.foldl(function(obj, field) std.mergePatch(obj, {
      [field]: {
        text: kv[field],
      },
    }), std.objectFields(kv), {}),
  },
}
