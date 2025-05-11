-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityOldBuildingBuffTable.lua

local ActivityOldBuildingBuffTable = class("ActivityOldBuildingBuffTable", import("app.common.tables.BaseTable"))

function ActivityOldBuildingBuffTable:ctor()
	ActivityOldBuildingBuffTable.super.ctor(self, "activity_old_building_buff")

	self.ids_ = {}
	self.idsByType_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)

		local type_ = self:getType(id)

		if not self.idsByType_[type_] then
			self.idsByType_[type_] = {}
		end

		table.insert(self.idsByType_[type_], id)
	end

	table.sort(self.ids_)
end

function ActivityOldBuildingBuffTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityOldBuildingBuffTable:getSkill(id)
	return self:split2Cost(id, "skill", "|")
end

function ActivityOldBuildingBuffTable:getIconName(id)
	return self:getString(id, "icon")
end

function ActivityOldBuildingBuffTable:needUnlock(id)
	return self:getNumber(id, "is_lock")
end

function ActivityOldBuildingBuffTable:getUnlockCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityOldBuildingBuffTable:getPoint(id)
	return self:getNumber(id, "point")
end

return ActivityOldBuildingBuffTable
