-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairArenaBoxEquipTable.lua

local ActivityFairArenaBoxEquipTable = class("ActivityFairArenaBoxEquipTable", import("app.common.tables.BaseTable"))

function ActivityFairArenaBoxEquipTable:ctor()
	ActivityFairArenaBoxEquipTable.super.ctor(self, "activity_fair_arena_box_equip")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairArenaBoxEquipTable:getIDs()
	return self.ids_
end

function ActivityFairArenaBoxEquipTable:getEquipID(id)
	return self:getNumber(id, "equip_id")
end

return ActivityFairArenaBoxEquipTable
