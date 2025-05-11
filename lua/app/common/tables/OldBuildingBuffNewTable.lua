-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingBuffNewTable.lua

local OldBuildingBuffNewTable = class("OldBuildingBuffNewTable", import("app.common.tables.BaseTable"))

function OldBuildingBuffNewTable:ctor()
	OldBuildingBuffNewTable.super.ctor(self, "old_building_buff_new")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function OldBuildingBuffNewTable:getType(id)
	for i in pairs(self:getAllTypeBuffs()) do
		for j in pairs(self:getAllTypeBuffs()[i]) do
			if self:getAllTypeBuffs()[i][j] == id then
				return i
			end
		end
	end
end

function OldBuildingBuffNewTable:getSkill(id)
	return self:split2Cost(id, "skill", "|")
end

function OldBuildingBuffNewTable:getIconName(id)
	return self:getString(id, "icon")
end

function OldBuildingBuffNewTable:getPoint(id)
	return self:getNumber(id, "point")
end

function OldBuildingBuffNewTable:getAllTypeBuffs()
	if not self.allTypeBuffs then
		self.allTypeBuffs = {}

		local buffs = xyd.models.oldSchool:getBuffs()
		local buffType = 1

		for i in pairs(buffs) do
			for j in pairs(buffs[i]) do
				local default_0_buffs = xyd.tables.miscTable:split2num("old_building_buff_lock_1", "value", "|")
				local default_20_buffs = xyd.tables.miscTable:split2num("old_building_buff_lock_2", "value", "|")
				local default_40_buffs = xyd.tables.miscTable:split2num("old_building_buff_lock_3", "value", "|")

				buffType = j <= default_0_buffs[i] and 1 or j > default_0_buffs[i] and j <= default_20_buffs[i] and 2 or j > default_20_buffs[i] and j <= default_40_buffs[i] and 3 or 4

				if not self.allTypeBuffs[buffType] then
					self.allTypeBuffs[buffType] = {}
				end

				if self.allTypeBuffs[buffType] then
					table.insert(self.allTypeBuffs[buffType], tonumber(buffs[i][j]))
				end
			end
		end
	end

	return self.allTypeBuffs
end

return OldBuildingBuffNewTable
