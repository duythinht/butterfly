local Time = import 'Time.libsonnet';
local TimePicker = import 'TimePicker.libsonnet';

{
  new(
    description=null,
    editable=true,
    graphTooltip=0,
    refresh='1m',
    schemaVersion=25,
    style='dark',
    tags=[],
    timezone=null,
    title=null,
    uid=null,
    time=Time.new(),
    timepicker=TimePicker.new(),
    panels=[],
    templating=[],
  ):: {
    [if description != null then 'description']: description,
    [if editable != null then 'editable']: editable,
    [if graphTooltip != null then 'graphTooltip']: graphTooltip,
    [if refresh != null then 'refresh']: refresh,
    [if schemaVersion != null then 'schemaVersion']: schemaVersion,
    [if style != null then 'style']: style,
    [if tags != null then 'tags']: tags,
    [if timezone != null then 'timezone']: timezone,
    [if title != null then 'title']: title,
    [if uid != null then 'uid']: uid,
    [if time != null then 'time']: time,
    [if timepicker != null then 'timepicker']: timepicker,
    [if std.length(templating) > 0 then 'templating']: {
      list: templating
    },

    local panelWithIds = {
      _i:: 3,
      add(panel):: self {
        local i = super._i,
        list+: [
          panel {id: i} +
          if std.objectHas(panel, "panels") && panel.type == 'row' && panel.collapsed then {
            panels:  std.mapWithIndex(function(j, p) p { id: i + j +1 }, panel.panels)
          } else { panels:: null }
        ] + if std.objectHas(panel, "panels") && panel.type == 'row' && ! panel.collapsed then std.mapWithIndex(function(j, p) p { id: i + j +1 }, panel.panels) else [],
        _i:: i + 1 + if std.objectHas(panel, "panels") then std.length(panel.panels) else 0,
      },
    },
    
    _p:: std.foldl(function(l, p) l.add(p), panels, panelWithIds),

    panels: self._p.list,
  },
}
