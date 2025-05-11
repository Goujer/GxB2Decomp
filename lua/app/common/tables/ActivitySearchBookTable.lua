-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySearchBookTable.lua

local ActivitySearchBookTable = class("ActivitySearchBookTable", import("app.common.tables.BaseTable"))

function ActivitySearchBookTable:ctor()
	ActivitySearchBookTable.super.ctor(self, "activity_search_book")

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivitySearchBookTable:getIDs()
	return self.ids_
end

function ActivitySearchBookTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivitySearchBookTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivitySearchBookTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivitySearchBookTable:getDesc(id)
	return xyd.tables.activitySearchBookTextTable:getDesc(id)
end

function ActivitySearchBookTable:getJumpWay(id)
	return self:getNumber(id, "getway")
end

return ActivitySearchBookTable
