-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTalePlotTextTable.lua

local ActivityFairyTalePlotTextTable = class("ActivityFairyTalePlotTextTable", import(".BaseTable"))

function ActivityFairyTalePlotTextTable:ctor()
	ActivityFairyTalePlotTextTable.super.ctor(self, "activity_fairytale_plot_text_" .. xyd.Global.lang)
end

function ActivityFairyTalePlotTextTable:getTitle(id)
	return self:getString(id, "name")
end

return ActivityFairyTalePlotTextTable
