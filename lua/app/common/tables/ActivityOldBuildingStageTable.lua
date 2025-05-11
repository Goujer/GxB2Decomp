-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityOldBuildingStageTable.lua

local ActivityOldBuildingStageTable = class("ActivityOldBuildingStageTable", import("app.common.tables.BaseTable"))

function ActivityOldBuildingStageTable:ctor()
	ActivityOldBuildingStageTable.super.ctor(self, "activity_old_building_stage")

	self.ids_ = {}
	self.idsByFloor_ = {}
	self.floorByArea_ = {}

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

		local area = self:getArea(id)

		if not self.floorByArea_[area] then
			self.floorByArea_[area] = {}
		end

		if xyd.arrayIndexOf(self.floorByArea_[area], floor) < 0 then
			table.insert(self.floorByArea_[area], floor)
		end
	end
end

function ActivityOldBuildingStageTable:getIDs()
	return self.ids_
end

function ActivityOldBuildingStageTable:getArea(id)
	return self:getNumber(id, "area")
end

function ActivityOldBuildingStageTable:getFloorIndex(stageId)
	local floor = self:getFloor(stageId)

	for idx, id in ipairs(self.idsByFloor_[floor]) do
		if tonumber(id) == stageId then
			return idx
		end
	end

	return -1
end

function ActivityOldBuildingStageTable:getAreaIndex(stageId)
	local floor = self:getFloor(stageId)
	local area = self:getArea(stageId)

	for idx, id in ipairs(self.floorByArea_[area]) do
		if id == floor then
			return idx
		end
	end

	return -1
end

function ActivityOldBuildingStageTable:getAreaIndexByFloor(floorId)
	for idx, floors in ipairs(self.floorByArea_) do
		local index = xyd.arrayIndexOf(floors, floorId)

		if index > 0 then
			return index
		end
	end

	return -1
end

function ActivityOldBuildingStageTable:getFloor(id)
	return self:getNumber(id, "floor")
end

function ActivityOldBuildingStageTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function ActivityOldBuildingStageTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityOldBuildingStageTable:getPartnerId(id)
	return self:getNumber(id, "partner_id")
end

return ActivityOldBuildingStageTable
