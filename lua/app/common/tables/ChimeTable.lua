-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ChimeTable.lua

local ChimeTable = class("ChimeTable", import("app.common.tables.BaseTable"))
local chimeTextTable = xyd.tables.chimeTextTable

function ChimeTable:ctor()
	ChimeTable.super.ctor(self, "chime")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ChimeTable:getIDs()
	return self.ids_
end

function ChimeTable:getName(id)
	return self:getString(id, "name")
end

function ChimeTable:getQlt(id)
	return self:getNumber(id, "qlt")
end

function ChimeTable:getUnlock(id)
	return self:split2Cost(id, "unlock", "#")
end

function ChimeTable:getMaxLev(id)
	return self:getNumber(id, "max_lv")
end

function ChimeTable:getBase(id)
	return self:split2Cost(id, "attrs", "|#", false) or {}
end

function ChimeTable:getBuff1(id)
	return self:split2Cost(id, "buff1", "|#", false)
end

function ChimeTable:getLimit1(id)
	return self:getNumber(id, "limit1")
end

function ChimeTable:getCost1(id)
	return self:split2Cost(id, "cost1", "|#")
end

function ChimeTable:getBuff2(id)
	return self:split2Cost(id, "buff2", "|#", false)
end

function ChimeTable:getLimit2(id)
	return self:getNumber(id, "limit2")
end

function ChimeTable:getCost2(id)
	return self:split2Cost(id, "cost2", "|#")
end

function ChimeTable:getBuff3(id)
	return self:split2Cost(id, "buff3", "|#", false)
end

function ChimeTable:getLimit3(id)
	return self:getNumber(id, "limit3")
end

function ChimeTable:getCost3(id)
	return self:split2Cost(id, "cost3", "|#")
end

function ChimeTable:getBuff4(id)
	return self:split2Cost(id, "buff4", "|#", false)
end

function ChimeTable:getLimit4(id)
	return self:split2Cost(id, "limit4", "|")
end

function ChimeTable:getCost4(id)
	return self:split2Cost(id, "cost4", "|#")
end

function ChimeTable:getBuff(id, index)
	return self:split2Cost(id, "buff" .. index, "|#", false) or {}
end

function ChimeTable:getIcon(id)
	return self:getString(id, "icon")
end

function ChimeTable:getSort(id)
	return self:getNumber(id, "sort")
end

function ChimeTable:getEffectName(id)
	return self:getString(id, "resource")
end

function ChimeTable:getBuffDesc(id, index)
	return chimeTextTable:getBuff(id, index)
end

return ChimeTable
