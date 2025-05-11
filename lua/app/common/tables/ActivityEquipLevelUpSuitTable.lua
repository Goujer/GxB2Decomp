-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEquipLevelUpSuitTable.lua

local ActivityEquipLevelUpSuitTable = class("ActivityEquipLevelUpSuitTable", import("app.common.tables.BaseTable"))

function ActivityEquipLevelUpSuitTable:ctor()
	ActivityEquipLevelUpSuitTable.super.ctor(self, "activity_equip_levelup_suit")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, id)
	end

	table.sort(self.ids)
end

function ActivityEquipLevelUpSuitTable:getIds()
	return self.ids
end

function ActivityEquipLevelUpSuitTable:getSuit(id)
	return self:split2Cost(id, "suit", "|#")
end

return ActivityEquipLevelUpSuitTable
