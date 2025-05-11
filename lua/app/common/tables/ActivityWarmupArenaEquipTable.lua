-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWarmupArenaEquipTable.lua

local BaseTable = import(".BaseTable")
local ActivityWarmupArenaEquipTable = class("ActivityWarmupArenaEquipTable", BaseTable)

function ActivityWarmupArenaEquipTable:ctor()
	BaseTable.ctor(self, "activity_warmup_arena_equip")

	self.ids_ = {}
	self.typeIds_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)

	for i in pairs(self.ids_) do
		local typeId = self:getType(tonumber(self.ids_[i]))

		if not self.typeIds_[typeId] then
			self.typeIds_[typeId] = {}
		end

		table.insert(self.typeIds_[typeId], tonumber(self.ids_[i]))
	end
end

function ActivityWarmupArenaEquipTable:getIds()
	return self.ids_
end

function ActivityWarmupArenaEquipTable:getIdsByType(typeId)
	return self.typeIds_[typeId]
end

function ActivityWarmupArenaEquipTable:getEquipId(id)
	return self:getNumber(id, "equip_id")
end

function ActivityWarmupArenaEquipTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityWarmupArenaEquipTable:getRank(id)
	self:getNumber(id, "rank")
end

return ActivityWarmupArenaEquipTable
