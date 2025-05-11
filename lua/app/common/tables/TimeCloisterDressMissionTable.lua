-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterDressMissionTable.lua

local TimeCloisterDressMissionTable = class("TimeCloisterDressMissionTable", import("app.common.tables.BaseTable"))

function TimeCloisterDressMissionTable:ctor()
	TimeCloisterDressMissionTable.super.ctor(self, "time_cloister_dress_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function TimeCloisterDressMissionTable:getIDs()
	return self.ids_
end

function TimeCloisterDressMissionTable:getNum(id)
	return self:split2Cost(id, "num", "#")
end

function TimeCloisterDressMissionTable:getPos(id)
	return self:getNumber(id, "pos")
end

function TimeCloisterDressMissionTable:getType(id)
	return self:getNumber(id, "type")
end

return TimeCloisterDressMissionTable
