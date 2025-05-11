-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityArenaTable.lua

local ActivityArenaTable = class("ActivityArenaTable", import("app.common.tables.BaseTable"))

function ActivityArenaTable:ctor()
	ActivityArenaTable.super.ctor(self, "activity_arena")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_, function(a, b)
		return tonumber(a) < tonumber(b)
	end)
end

function ActivityArenaTable:getIDs()
	return self.ids_
end

function ActivityArenaTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityArenaTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityArenaTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityArenaTable:getJumpWay(id)
	return self:getNumber(id, "getway")
end

return ActivityArenaTable
