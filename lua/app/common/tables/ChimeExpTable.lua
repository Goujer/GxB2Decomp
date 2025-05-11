-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ChimeExpTable.lua

local ChimeExpTable = class("ChimeExpTable", import("app.common.tables.BaseTable"))

function ChimeExpTable:ctor()
	ChimeExpTable.super.ctor(self, "chime_lv_cost")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ChimeExpTable:getIDs()
	return self.ids_
end

function ChimeExpTable:getCost(lev, qlt)
	if qlt == 2 then
		return self:getCost2(lev)
	elseif qlt == 3 then
		return self:getCost3(lev)
	elseif qlt == 4 then
		return self:getCost4(lev)
	elseif qlt == 5 then
		return self:getCost5(lev)
	elseif qlt == 6 then
		return self:getCost6(lev)
	end

	return nil
end

function ChimeExpTable:getDebrisCost(lev, qlt)
	if qlt == 2 then
		return self:getNum2(lev)
	elseif qlt == 3 then
		return self:getNum3(lev)
	elseif qlt == 4 then
		return self:getNum4(lev)
	elseif qlt == 5 then
		return self:getNum5(lev)
	elseif qlt == 6 then
		return self:getNum6(lev)
	end

	return nil
end

function ChimeExpTable:getCost2(id)
	return self:split2Cost(id, "cost2", "|#")
end

function ChimeExpTable:getCost3(id)
	return self:split2Cost(id, "cost3", "|#")
end

function ChimeExpTable:getCost4(id)
	return self:split2Cost(id, "cost4", "|#")
end

function ChimeExpTable:getCost5(id)
	return self:split2Cost(id, "cost5", "|#")
end

function ChimeExpTable:getCost6(id)
	return self:split2Cost(id, "cost6", "|#")
end

function ChimeExpTable:getNum2(id)
	return self:getNumber(id, "num2")
end

function ChimeExpTable:getNum3(id)
	return self:getNumber(id, "num3")
end

function ChimeExpTable:getNum4(id)
	return self:getNumber(id, "num4")
end

function ChimeExpTable:getNum5(id)
	return self:getNumber(id, "num5")
end

function ChimeExpTable:getNum6(id)
	return self:getNumber(id, "num6")
end

return ChimeExpTable
