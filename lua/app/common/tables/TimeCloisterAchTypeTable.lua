-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterAchTypeTable.lua

local TimeCloisterAchTypeTable = class("TimeCloisterAchTypeTable", import("app.common.tables.BaseTable"))

function TimeCloisterAchTypeTable:ctor()
	TimeCloisterAchTypeTable.super.ctor(self, "time_cloister_ach_type")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterAchTypeTable:getIDs()
	return self.ids_
end

function TimeCloisterAchTypeTable:getStart(id)
	return self:getNumber(id, "start_achievement")
end

function TimeCloisterAchTypeTable:getEnd(id)
	return self:getNumber(id, "end_achievement")
end

function TimeCloisterAchTypeTable:getCloister(id)
	return self:getNumber(id, "cloister")
end

function TimeCloisterAchTypeTable:getType(id)
	return self:getNumber(id, "type")
end

function TimeCloisterAchTypeTable:getStyle(id)
	return self:getNumber(id, "style")
end

return TimeCloisterAchTypeTable
