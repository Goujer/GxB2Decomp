-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityComposeTable.lua

local ActivityComposeTable = class("ActivityComposeTable", import("app.common.tables.BaseTable"))

function ActivityComposeTable:ctor()
	ActivityComposeTable.super.ctor(self, "activity_compose")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityComposeTable:getIDs()
	return self.ids_
end

function ActivityComposeTable:getStar(id)
	return self:getNumber(id, "star")
end

function ActivityComposeTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityComposeTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityComposeTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityComposeTable:getJumpWay(id)
	return self:getNumber(id, "getway")
end

function ActivityComposeTable:getPoint(id)
	return self:getNumber(id, "limit")
end

return ActivityComposeTable
