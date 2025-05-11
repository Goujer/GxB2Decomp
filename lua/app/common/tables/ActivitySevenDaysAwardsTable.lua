-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySevenDaysAwardsTable.lua

local ActivitySevenDaysAwardsTable = class("ActivitySevenDaysAwardsTable", import("app.common.tables.BaseTable"))

function ActivitySevenDaysAwardsTable:ctor()
	self.ids = {}

	ActivitySevenDaysAwardsTable.super.ctor(self, "activity_sevendays_awards")

	local i = 1

	for id, _ in pairs(self.TableLua.rows) do
		self.ids[i] = tonumber(id)
		i = i + 1
	end
end

function ActivitySevenDaysAwardsTable:getIDs()
	return self.ids
end

function ActivitySevenDaysAwardsTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

return ActivitySevenDaysAwardsTable
