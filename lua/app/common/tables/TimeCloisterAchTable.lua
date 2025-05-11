-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterAchTable.lua

local TimeCloisterAchTable = class("TimeCloisterAchTable", import("app.common.tables.BaseTable"))

function TimeCloisterAchTable:ctor()
	TimeCloisterAchTable.super.ctor(self, "time_cloister_ach")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterAchTable:getIDs()
	return self.ids_
end

function TimeCloisterAchTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function TimeCloisterAchTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function TimeCloisterAchTable:getNext(id)
	return self:getNumber(id, "next_achieve_id")
end

function TimeCloisterAchTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function TimeCloisterAchTable:getDesc(id)
	return xyd.tables.timeCloisterAchTextTable:getDesc(id)
end

return TimeCloisterAchTable
