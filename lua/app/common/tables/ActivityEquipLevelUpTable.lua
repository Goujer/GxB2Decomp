-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEquipLevelUpTable.lua

local ActivityEquipLevelUpTable = class("ActivityEquipLevelUpTable", import("app.common.tables.BaseTable"))

function ActivityEquipLevelUpTable:ctor()
	ActivityEquipLevelUpTable.super.ctor(self, "activity_equip_levelup")

	self.ids = {}
	self.type1List = {}
	self.type2List = {}
	self.type3List = {}
	self.type4List = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, id)

		local type = self:getType(id)

		if type ~= 3 then
			table.insert(self["type" .. type .. "List"], id)
		else
			local group = self:getGroup(id)

			self.type3List[tostring(group)] = id
		end
	end

	table.sort(self.type2List)
	table.sort(self.type4List)
end

function ActivityEquipLevelUpTable:getIds()
	return self.ids
end

function ActivityEquipLevelUpTable:getIdByGroup(group)
	return self.type3List[group]
end

function ActivityEquipLevelUpTable:getListByType(type)
	return self["type" .. type .. "List"]
end

function ActivityEquipLevelUpTable:getEquipBefore(id)
	return self:split2Cost(id, "equip_show", "|#")
end

function ActivityEquipLevelUpTable:getCost(id)
	return self:split2Cost(id, "cost_show", "|#")
end

function ActivityEquipLevelUpTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityEquipLevelUpTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityEquipLevelUpTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityEquipLevelUpTable:getGroup(id)
	return self:getNumber(id, "group")
end

return ActivityEquipLevelUpTable
