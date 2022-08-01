{
  local kv = function(k, v) {
    [k]: v,
  },

  local list = function(l) std.foldl(function(l, item) l { [item]:: item }, l, {}),

  local item = function(path, value) std.foldr(kv, path, value),

  local items = function(path, values) std.foldl(function(result, value) result {
    [value]: item(path, value),
  }, values, {}),

  kv:: kv,
  list:: list,
  item:: item,
  items:: items,
}
