-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulEquip2GroupTable.lua

local SoulEquip2GroupTable = class("SoulEquip2GroupTable", import("app.common.tables.BaseTable"))

function SoulEquip2GroupTable:ctor()
	SoulEquip2GroupTable.super.ctor(self, "soul_equip2_group")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulEquip2GroupTable:getIDs()
	return self.ids_
end

function SoulEquip2GroupTable:getEquip(id)
	return self:split2Cost(id, "equip", "|", true)
end

function SoulEquip2GroupTable:getSuitSkill(id)
	return self:split2Cost(id, "skill", "|", true)[1]
end

function SoulEquip2GroupTable:getName(id)
	return "ss"
end

function SoulEquip2GroupTable:getIcon(id)
	return self:getString(id, "img")
end

function SoulEquip2GroupTable:getSkill(id)
	return self:split2Cost(id, "skill", "|")
end

function SoulEquip2GroupTable:getItem(id)
	return self:getNumber(id, "item")
end

return SoulEquip2GroupTable
