-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleOptionTextTable.lua

local ActivityFairyTaleOptionTextTable = class("ActivityFairyTaleOptionTextTable", import("app.common.tables.BaseTable"))

function ActivityFairyTaleOptionTextTable:ctor()
	ActivityFairyTaleOptionTextTable.super.ctor(self, "activity_fairytale_option_text_" .. xyd.Global.lang)
end

function ActivityFairyTaleOptionTextTable:getDes(id)
	return self:getString(id, "decision_desc")
end

return ActivityFairyTaleOptionTextTable
