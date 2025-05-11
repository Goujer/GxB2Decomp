-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulEquip2BaseBuffTable.lua

local SoulEquip2BaseBuffTable = class("SoulEquip2BaseBuffTable", import("app.common.tables.BaseTable"))

function SoulEquip2BaseBuffTable:ctor()
	SoulEquip2BaseBuffTable.super.ctor(self, "soul_equip2_base_buff")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulEquip2BaseBuffTable:getIDs()
	return self.ids_
end

function SoulEquip2BaseBuffTable:getBuff(id)
	return self:getString(id, "buff")
end

function SoulEquip2BaseBuffTable:getBase(id)
	return self:getNumber(id, "base")
end

function SoulEquip2BaseBuffTable:getGrow(id)
	return self:getNumber(id, "grow")
end

function SoulEquip2BaseBuffTable:getStarGrow(id)
	return self:split2Cost(id, "star_grow", "|", true)
end

function SoulEquip2BaseBuffTable:getQltGrow(id)
	return self:split2Cost(id, "qlt_grow", "|", true)
end

return SoulEquip2BaseBuffTable
