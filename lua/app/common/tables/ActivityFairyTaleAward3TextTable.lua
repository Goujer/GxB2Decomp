-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleAward3TextTable.lua

local ActivityFairyTaleAward3TextTable = class("ActivityFairyTaleAward3TextTable", import("app.common.tables.BaseTable"))

function ActivityFairyTaleAward3TextTable:ctor()
	ActivityFairyTaleAward3TextTable.super.ctor(self, "activity_fairytale_award3_text_" .. xyd.Global.lang)
end

function ActivityFairyTaleAward3TextTable:getDes(id)
	return self:getString(id, "desc")
end

function ActivityFairyTaleAward3TextTable:getResult(id)
	return self:getString(id, "result")
end

return ActivityFairyTaleAward3TextTable
