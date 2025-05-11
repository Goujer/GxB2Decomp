-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEquipGachaTable.lua

local ActivityEquipGachaTable = class("ActivityEquipGachaTable", import("app.common.tables.BaseTable"))

function ActivityEquipGachaTable:ctor()
	ActivityEquipGachaTable.super.ctor(self, "activity_equip_gacha")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityEquipGachaTable:getIDs()
	return self.ids
end

function ActivityEquipGachaTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityEquipGachaTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityEquipGachaTable
