-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityOldBuildingAward1Table.lua

local ActivityOldBuildingAward1Table = class("ActivityOldBuildingAward1Table", import("app.common.tables.BaseTable"))

function ActivityOldBuildingAward1Table:ctor()
	ActivityOldBuildingAward1Table.super.ctor(self, "activity_old_building_award1")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityOldBuildingAward1Table:getIds()
	return self.ids_
end

function ActivityOldBuildingAward1Table:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityOldBuildingAward1Table:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return ActivityOldBuildingAward1Table
