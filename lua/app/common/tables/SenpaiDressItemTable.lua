-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressItemTable.lua

local SenpaiDressItemTable = class("SenpaiDressItemTable", import("app.common.tables.BaseTable"))

function SenpaiDressItemTable:ctor()
	SenpaiDressItemTable.super.ctor(self, "senpai_dress_item")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressItemTable:getIDs()
	return self.ids_
end

function SenpaiDressItemTable:getQlt(id)
	return self:getNumber(id, "qlt")
end

function SenpaiDressItemTable:getStar(id)
	return self:getNumber(id, "star")
end

function SenpaiDressItemTable:getBase1(id)
	return self:getNumber(id, "base1")
end

function SenpaiDressItemTable:getBase2(id)
	return self:getNumber(id, "base2")
end

function SenpaiDressItemTable:getBase3(id)
	return self:getNumber(id, "base3")
end

function SenpaiDressItemTable:getGroup(id)
	return self:getNumber(id, "group")
end

function SenpaiDressItemTable:getDressId(id)
	return self:getNumber(id, "dress_id")
end

function SenpaiDressItemTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function SenpaiDressItemTable:getIcon(id)
	return self:split2Cost(id, "icon", "|", false)
end

function SenpaiDressItemTable:getUpgradeCost(id)
	return self:split2Cost(id, "upgrade_cost", "|#", true)
end

function SenpaiDressItemTable:getUpgradeCost2(id)
	return self:split2Cost(id, "upgrade_cost2", "|#", true)
end

function SenpaiDressItemTable:getSkillIds(id)
	return self:split2Cost(id, "skill_ids", "|")
end

function SenpaiDressItemTable:getDressShard(id)
	return self:split2Cost(id, "dress_shard", "#", true)
end

return SenpaiDressItemTable
