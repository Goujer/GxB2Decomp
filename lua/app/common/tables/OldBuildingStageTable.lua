-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingStageTable.lua

local OldBuildingStageTable = class("OldBuildingStageTable", import("app.common.tables.BaseTable"))

function OldBuildingStageTable:ctor()
	OldBuildingStageTable.super.ctor(self, "old_building_stage")

	self.ids_ = {}
	self.idsByFloor_ = {}
	self.idsByType = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)

	for _, id in ipairs(self.ids_) do
		local floor = self:getFloor(id)

		if not self.idsByFloor_[floor] then
			self.idsByFloor_[floor] = {}
		end

		table.insert(self.idsByFloor_[floor], tonumber(id))

		if not self.idsByType[self:getType(id)] then
			self.idsByType[self:getType(id)] = {}
		end

		table.insert(self.idsByType[self:getType(id)], id)
	end
end

function OldBuildingStageTable:getIDs()
	return self.ids_
end

function OldBuildingStageTable:getArea(id)
	return self:getNumber(id, "area")
end

function OldBuildingStageTable:getType(id)
	return self:getNumber(id, "type")
end

function OldBuildingStageTable:getFloorIndex(stageId)
	local floor = self:getFloor(stageId)
	local stageArr = xyd.models.oldSchool:getOldBuildingTableTable():getStage(floor)

	for i in pairs(stageArr) do
		if stageArr[i] == stageId then
			return i
		end
	end

	return -1
end

function OldBuildingStageTable:getFloor(id)
	return self:getNumber(id, "floor")
end

function OldBuildingStageTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function OldBuildingStageTable:getPoint(id)
	return self:getNumber(id, "point")
end

function OldBuildingStageTable:getPartnerId(id)
	return self:getNumber(id, "partner_id")
end

function OldBuildingStageTable:getIdsByType(type)
	return self.idsByType[type]
end

return OldBuildingStageTable
