-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFestivalLoginTable.lua

local ActivityFestivalLoginTable = class("ActivityFestivalLoginTable", import("app.common.tables.BaseTable"))

function ActivityFestivalLoginTable:ctor()
	ActivityFestivalLoginTable.super.ctor(self, "activity_festival_login")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFestivalLoginTable:getIDs()
	return self.ids_
end

function ActivityFestivalLoginTable:getDays()
	return #self.ids_
end

function ActivityFestivalLoginTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityFestivalLoginTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

return ActivityFestivalLoginTable
