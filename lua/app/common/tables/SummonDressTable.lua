-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SummonDressTable.lua

local SummonDressTable = class("SummonDressTable", import("app.common.tables.BaseTable"))

function SummonDressTable:ctor()
	SummonDressTable.super.ctor(self, "summon_dress")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SummonDressTable:getIDs()
	return self.ids_
end

function SummonDressTable:getSummonType(id)
	return self:getNumber(id, "summon_type")
end

function SummonDressTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

return SummonDressTable
