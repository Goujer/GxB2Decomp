-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBeachAwardsTable.lua

local ActivityBeachAwardsTable = class("ActivityBeachAwardsTable", import("app.common.tables.BaseTable"))

function ActivityBeachAwardsTable:ctor()
	ActivityBeachAwardsTable.super.ctor(self, "activity_beach_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityBeachAwardsTable:getIDs()
	return self.ids_
end

function ActivityBeachAwardsTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityBeachAwardsTable:getCost(id)
	return self:split2Cost(id, "buy_cost", "#")
end

function ActivityBeachAwardsTable:getAwards(id, index)
	return self:split2Cost(id, "awards_" .. tostring(index), "#")
end

return ActivityBeachAwardsTable
