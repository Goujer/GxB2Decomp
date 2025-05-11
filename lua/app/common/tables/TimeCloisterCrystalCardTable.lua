-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterCrystalCardTable.lua

local TimeCloisterCrystalCardTable = class("TimeCloisterCrystalCardTable", import("app.common.tables.BaseTable"))

function TimeCloisterCrystalCardTable:ctor()
	TimeCloisterCrystalCardTable.super.ctor(self, "time_cloister_crystal_card")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterCrystalCardTable:getIDs()
	return self.ids_
end

function TimeCloisterCrystalCardTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function TimeCloisterCrystalCardTable:getCardNum(id)
	return self:getNumber(id, "card_num")
end

function TimeCloisterCrystalCardTable:getLevel(id)
	return self:getNumber(id, "level")
end

function TimeCloisterCrystalCardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function TimeCloisterCrystalCardTable:getSkill(id)
	return self:getNumber(id, "skill")
end

function TimeCloisterCrystalCardTable:getImg(id)
	return self:getString(id, "img")
end

function TimeCloisterCrystalCardTable:getCost(id)
	return self:split2Cost(id, "cost", "|#", true)
end

function TimeCloisterCrystalCardTable:getType(id)
	return self:getNumber(id, "type")
end

return TimeCloisterCrystalCardTable
