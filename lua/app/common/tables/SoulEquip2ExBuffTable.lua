-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulEquip2ExBuffTable.lua

local SoulEquip2ExBuffTable = class("SoulEquip2ExBuffTable", import("app.common.tables.BaseTable"))

function SoulEquip2ExBuffTable:ctor()
	SoulEquip2ExBuffTable.super.ctor(self, "soul_equip2_ex_buff")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulEquip2ExBuffTable:getIDs()
	return self.ids_
end

function SoulEquip2ExBuffTable:getBuff(id)
	return self:getString(id, "buff")
end

function SoulEquip2ExBuffTable:getBase(id)
	return self:getNumber(id, "base")
end

function SoulEquip2ExBuffTable:getStarGrow(id)
	return self:split2Cost(id, "star_grow", "|", true)
end

function SoulEquip2ExBuffTable:getQltGrow(id)
	return self:split2Cost(id, "qlt_grow", "|", true)
end

function SoulEquip2ExBuffTable:getWeight(id)
	return self:getNumber(id, "weight")
end

return SoulEquip2ExBuffTable
