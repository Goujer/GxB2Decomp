-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityClockAwardsTable.lua

local ActivityClockAwardsTable = class("ActivityClockAwardsTable", import("app.common.tables.BaseTable"))

function ActivityClockAwardsTable:ctor()
	ActivityClockAwardsTable.super.ctor(self, "activity_clock_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityClockAwardsTable:getIDs()
	return self.ids_
end

function ActivityClockAwardsTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityClockAwardsTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return ActivityClockAwardsTable
