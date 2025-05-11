-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulEquip1ExBuffTable.lua

local SoulEquip1ExBuffTable = class("SoulEquip1ExBuffTable", import("app.common.tables.BaseTable"))

function SoulEquip1ExBuffTable:ctor()
	SoulEquip1ExBuffTable.super.ctor(self, "soul_equip1_ex_buff")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulEquip1ExBuffTable:getIDs()
	return self.ids_
end

function SoulEquip1ExBuffTable:getBuff(id)
	return self:getString(id, "buff")
end

function SoulEquip1ExBuffTable:getBase(id)
	return self:getNumber(id, "base")
end

function SoulEquip1ExBuffTable:getGrow(id)
	return self:getNumber(id, "grow")
end

function SoulEquip1ExBuffTable:getWeight(id)
	return self:getNumber(id, "weight")
end

return SoulEquip1ExBuffTable
