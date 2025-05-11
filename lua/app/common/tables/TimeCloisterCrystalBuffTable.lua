-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterCrystalBuffTable.lua

local TimeCloisterCrystalBuffTable = class("TimeCloisterCrystalBuffTable", import("app.common.tables.BaseTable"))

function TimeCloisterCrystalBuffTable:ctor()
	TimeCloisterCrystalBuffTable.super.ctor(self, "time_cloister_crystal_buff")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterCrystalBuffTable:getIDs()
	return self.ids_
end

function TimeCloisterCrystalBuffTable:getItems(id)
	return self:split2Cost(id, "items", "|", true)
end

function TimeCloisterCrystalBuffTable:getCloister(id)
	return self:getNumber(id, "cloister")
end

function TimeCloisterCrystalBuffTable:getTecId(id)
	return self:split2Cost(id, "tec_id", "|", true)
end

function TimeCloisterCrystalBuffTable:getNum(id)
	return self:split2Cost(id, "num", "|", true)
end

return TimeCloisterCrystalBuffTable
