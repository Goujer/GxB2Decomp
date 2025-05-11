-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AcitiviyEquipLevelAntiqueTable.lua

local AcitiviyEquipLevelAntiqueTable = class("AcitiviyEquipLevelAntiqueTable", import("app.common.tables.BaseTable"))

function AcitiviyEquipLevelAntiqueTable:ctor()
	AcitiviyEquipLevelAntiqueTable.super.ctor(self, "activity_equip_level_antique")

	self.idsByType = {}
	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		local type = self:getType(id)

		if not self.idsByType[type] then
			self.idsByType[type] = {}
		end

		table.insert(self.idsByType[type], tonumber(id))
		table.insert(self.ids_, tonumber(id))
	end

	for _, list in ipairs(self.idsByType) do
		table.sort(list)
	end

	table.sort(self.ids_)
end

function AcitiviyEquipLevelAntiqueTable:getIDs()
	return self.ids_
end

function AcitiviyEquipLevelAntiqueTable:getIDsByType(type)
	return self.idsByType[type]
end

function AcitiviyEquipLevelAntiqueTable:getAward(id)
	return self:split2Cost(id, "awards", "#")
end

function AcitiviyEquipLevelAntiqueTable:getCost1(id)
	return self:split2Cost(id, "cost", "#")
end

function AcitiviyEquipLevelAntiqueTable:getCost2(id)
	return self:split2Cost(id, "cost2", "|#")
end

function AcitiviyEquipLevelAntiqueTable:getCost3(id)
	return self:split2Cost(id, "cost3", "#")
end

function AcitiviyEquipLevelAntiqueTable:getReverse(id)
	return self:split2Cost(id, "reverse", "|#")
end

function AcitiviyEquipLevelAntiqueTable:getType(id)
	return self:getNumber(id, "type")
end

function AcitiviyEquipLevelAntiqueTable:getIsShow(id)
	return self:getNumber(id, "is_show")
end

return AcitiviyEquipLevelAntiqueTable
