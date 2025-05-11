-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHouseTable.lua

local ActivityHouseTable = class("ActivityHouseTable", import("app.common.tables.BaseTable"))

function ActivityHouseTable:ctor()
	ActivityHouseTable.super.ctor(self, "activity_house")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityHouseTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityHouseTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityHouseTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityHouseTable:getIDs()
	return self.ids_
end

return ActivityHouseTable
