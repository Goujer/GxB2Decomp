-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterAwardTable.lua

local TimeCloisterAwardTable = class("TimeCloisterAwardTable", import("app.common.tables.BaseTable"))

function TimeCloisterAwardTable:ctor()
	TimeCloisterAwardTable.super.ctor(self, "time_cloister_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterAwardTable:getIDs()
	return self.ids_
end

function TimeCloisterAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function TimeCloisterAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

return TimeCloisterAwardTable
