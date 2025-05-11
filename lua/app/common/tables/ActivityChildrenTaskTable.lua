-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChildrenTaskTable.lua

local ActivityChildrenTaskTable = class("ActivityChildrenTaskTable", import("app.common.tables.BaseTable"))

function ActivityChildrenTaskTable:ctor()
	ActivityChildrenTaskTable.super.ctor(self, "activity_children_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityChildrenTaskTable:getIDs()
	return self.ids_
end

function ActivityChildrenTaskTable:getCompValue(id)
	return self:getNumber(id, "value")
end

function ActivityChildrenTaskTable:getGetWay(id)
	return self:getNumber(id, "getway")
end

function ActivityChildrenTaskTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityChildrenTaskTable:getAward(id)
	return self:split2Cost(id, "awards", "#", true)
end

function ActivityChildrenTaskTable:getDesc(id)
	return xyd.tables.activityChildrenTaskTextTable:getDesc(id)
end

return ActivityChildrenTaskTable
