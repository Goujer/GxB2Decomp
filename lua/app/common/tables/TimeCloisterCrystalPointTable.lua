-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterCrystalPointTable.lua

local TimeCloisterCrystalPointTable = class("TimeCloisterCrystalPointTable", import("app.common.tables.BaseTable"))

function TimeCloisterCrystalPointTable:ctor()
	TimeCloisterCrystalPointTable.super.ctor(self, "time_cloister_crystal_point")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterCrystalPointTable:getIDs()
	return self.ids_
end

function TimeCloisterCrystalPointTable:getPoint(id)
	return self:getNumber(id, "point")
end

function TimeCloisterCrystalPointTable:getBase1(id)
	return self:getNumber(id, "base1")
end

function TimeCloisterCrystalPointTable:getBase2(id)
	return self:getNumber(id, "base2")
end

function TimeCloisterCrystalPointTable:getBase3(id)
	return self:getNumber(id, "base3")
end

function TimeCloisterCrystalPointTable:getPointToId(point)
	local id = 1

	for i in pairs(self.ids_) do
		if point >= self:getPoint(self.ids_[i]) then
			id = self.ids_[i]
		else
			break
		end
	end

	return id
end

return TimeCloisterCrystalPointTable
