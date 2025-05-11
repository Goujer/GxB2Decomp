-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleAward3Table.lua

local ActivityFairyTaleAward3Table = class("ActivityFairyTaleAward3Table", import("app.common.tables.BaseTable"))

function ActivityFairyTaleAward3Table:ctor()
	ActivityFairyTaleAward3Table.super.ctor(self, "activity_fairytale_award3")
end

function ActivityFairyTaleAward3Table:getAward(id)
	return self:split2num(id, "award", "#")
end

return ActivityFairyTaleAward3Table
