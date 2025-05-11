-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulEquip2Table.lua

local SoulEquip2Table = class("SoulEquip2Table", import("app.common.tables.BaseTable"))

function SoulEquip2Table:ctor()
	SoulEquip2Table.super.ctor(self, "soul_equip2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulEquip2Table:getIDs()
	return self.ids_
end

function SoulEquip2Table:getNextId(id)
	return self:getNumber(id, "next_id")
end

function SoulEquip2Table:getType(id)
	return self:getNumber(id, "type")
end

function SoulEquip2Table:getPos(id)
	return self:getNumber(id, "pos")
end

function SoulEquip2Table:getMaxQlt(id)
	return self:getNumber(id, "max_qlt")
end

function SoulEquip2Table:getMaxLev(id)
	return self:getNumber(id, "max_lvl")
end

function SoulEquip2Table:getStar(id)
	return self:getNumber(id, "star")
end

function SoulEquip2Table:getGroup(id)
	return self:getNumber(id, "group")
end

function SoulEquip2Table:getBase(id)
	return self:split2Cost(id, "base", "|", true)
end

function SoulEquip2Table:getBaseWeight(id)
	return self:split2Cost(id, "base_weight", "|", true)
end

function SoulEquip2Table:getExp(id)
	return self:getNumber(id, "exp")
end

function SoulEquip2Table:getMaterial(id)
	return self:split2Cost(id, "material", "|@#", true)
end

return SoulEquip2Table
