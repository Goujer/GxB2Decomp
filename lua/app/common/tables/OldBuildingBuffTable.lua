-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingBuffTable.lua

local OldBuildingBuffTable = class("OldBuildingBuffTable", import("app.common.tables.BaseTable"))

function OldBuildingBuffTable:ctor()
	OldBuildingBuffTable.super.ctor(self, "old_building_buff")

	self.ids_ = {}
	self.buffs_arr_a = {}
	self.buffs_arr_b = {}
	self.allTypeBuffs = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)

	for i in pairs(self.ids_) do
		local buffBelongArr = self:getBuffBelong(self.ids_[i])

		for j in pairs(buffBelongArr) do
			if tonumber(buffBelongArr[j]) == 1 then
				table.insert(self.buffs_arr_a, tonumber(self.ids_[i]))
			elseif tonumber(buffBelongArr[j]) == 2 then
				table.insert(self.buffs_arr_b, tonumber(self.ids_[i]))
			end
		end

		if not xyd.models.oldSchool:getBuffs() then
			local buffType = self:getType(self.ids_[i])

			if not self.allTypeBuffs[buffType] then
				self.allTypeBuffs[buffType] = {}
			end

			if self.allTypeBuffs[buffType] then
				table.insert(self.allTypeBuffs[buffType], tonumber(self.ids_[i]))
			end
		end
	end

	table.sort(self.buffs_arr_a)
	table.sort(self.buffs_arr_b)
end

function OldBuildingBuffTable:getType(id)
	if xyd.models.oldSchool:getBuffs() then
		return xyd.tables.oldBuildingBuffNewTable:getType(id)
	else
		return self:getNumber(id, "type")
	end
end

function OldBuildingBuffTable:getSkill(id)
	if xyd.models.oldSchool:getBuffs() then
		return xyd.tables.oldBuildingBuffNewTable:getSkill(id)
	else
		return self:split2Cost(id, "skill", "|")
	end
end

function OldBuildingBuffTable:getIconName(id)
	if xyd.models.oldSchool:getBuffs() then
		return xyd.tables.oldBuildingBuffNewTable:getIconName(id)
	else
		return self:getString(id, "icon")
	end
end

function OldBuildingBuffTable:needUnlock(id)
	if xyd.models.oldSchool:getBuffs() then
		local buffs = xyd.models.oldSchool:getBuffs()

		for i in pairs(buffs) do
			for j in pairs(buffs[i]) do
				if buffs[i][j] == id then
					for k in pairs(self:getDefultLockBuff()) do
						if self:getDefultLockBuff()[k] == id then
							return 1
						end
					end
				end
			end
		end

		return nil
	else
		return self:getNumber(id, "is_lock")
	end
end

function OldBuildingBuffTable:getUnlockCost(id)
	if xyd.models.oldSchool:getBuffs() then
		local buffs = xyd.models.oldSchool:getBuffs()

		for i in pairs(buffs) do
			for j in pairs(buffs[i]) do
				if buffs[i][j] == id then
					local default_unlock_point = xyd.tables.miscTable:split2num("old_building_buff_num", "value", "|")
					local default_0_buffs = xyd.tables.miscTable:split2num("old_building_buff_lock_1", "value", "|")
					local default_20_buffs = xyd.tables.miscTable:split2num("old_building_buff_lock_2", "value", "|")
					local default_40_buffs = xyd.tables.miscTable:split2num("old_building_buff_lock_3", "value", "|")

					if j <= default_0_buffs[i] then
						return {
							default_unlock_point[1]
						}
					elseif j > default_0_buffs[i] and j <= default_20_buffs[i] then
						return {
							default_unlock_point[2]
						}
					elseif j > default_20_buffs[i] and j <= default_40_buffs[i] then
						return {
							default_unlock_point[3]
						}
					else
						return {
							default_unlock_point[4]
						}
					end
				end
			end
		end
	else
		return self:split2Cost(id, "cost", "#")
	end
end

function OldBuildingBuffTable:getPoint(id)
	if xyd.models.oldSchool:getBuffs() then
		return xyd.tables.oldBuildingBuffNewTable:getPoint(id)
	else
		return self:getNumber(id, "point")
	end
end

function OldBuildingBuffTable:getBuffBelong(id)
	return self:split2Cost(id, "buff_belong", "|")
end

function OldBuildingBuffTable:getAllTypeBuffs()
	if xyd.models.oldSchool:getBuffs() then
		return xyd.tables.oldBuildingBuffNewTable:getAllTypeBuffs()
	else
		return self.allTypeBuffs
	end
end

function OldBuildingBuffTable:getBuffBelongArr(type)
	if xyd.models.oldSchool:getBuffs() then
		return self:getDefultAllBuff()
	else
		if type == 1 then
			return self.buffs_arr_a
		end

		return self.buffs_arr_b
	end
end

function OldBuildingBuffTable:getDefultLockBuff()
	if xyd.models.oldSchool:getBuffs() then
		if not self.default_lock_buff then
			self.default_lock_buff = {}

			local default_0_buffs = xyd.tables.miscTable:split2num("old_building_buff_lock_1", "value", "|")
			local buffs = xyd.models.oldSchool:getBuffs()

			for i in pairs(buffs) do
				for j in pairs(buffs[i]) do
					if j > default_0_buffs[i] then
						table.insert(self.default_lock_buff, buffs[i][j])
					end
				end
			end
		end

		return self.default_lock_buff
	end
end

function OldBuildingBuffTable:getDefultAllBuff()
	if xyd.models.oldSchool:getBuffs() then
		if not self.all_new_buffs then
			self.all_new_buffs = {}

			local buffs = xyd.models.oldSchool:getBuffs()

			for i in pairs(buffs) do
				for j in pairs(buffs[i]) do
					table.insert(self.all_new_buffs, buffs[i][j])
				end
			end

			table.sort(self.all_new_buffs)
		end

		return self.all_new_buffs
	end
end

return OldBuildingBuffTable
