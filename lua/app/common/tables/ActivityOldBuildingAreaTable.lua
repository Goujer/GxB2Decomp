-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityOldBuildingAreaTable.lua

local ActivityOldBuildingAreaTable = class("ActivityOldBuildingAreaTable", import("app.common.tables.BaseTable"))

function ActivityOldBuildingAreaTable:ctor()
	ActivityOldBuildingAreaTable.super.ctor(self, "activity_old_building_area")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityOldBuildingAreaTable:getIDs()
	return self.ids_
end

function ActivityOldBuildingAreaTable:getFloor(id)
	return self:split2Cost(id, "floor", "|")
end

function ActivityOldBuildingAreaTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityOldBuildingAreaTable:getBuff(id)
	return self:split2Cost(id, "buff", "|")
end

function ActivityOldBuildingAreaTable:getTime(id)
	return self:getNumber(id, "time")
end

return ActivityOldBuildingAreaTable
