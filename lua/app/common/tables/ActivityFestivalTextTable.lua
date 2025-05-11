-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFestivalTextTable.lua

local ActivityFestivalTextTable = class("ActivityFestivalTabel", import("app.common.tables.BaseTable"))

function ActivityFestivalTextTable:ctor()
	ActivityFestivalTextTable.super.ctor(self, "activity_festival_text_" .. xyd.Global.lang)
end

function ActivityFestivalTextTable:getName(id)
	return self:getString(id, "awards_desc")
end

return ActivityFestivalTextTable
