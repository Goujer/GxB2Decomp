-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLflcastleTaskTable.lua

local ActivityLflcastleTaskTable = class("ActivityLflcastleTaskTable", import("app.common.tables.BaseTable"))

function ActivityLflcastleTaskTable:ctor()
	ActivityLflcastleTaskTable.super.ctor(self, "activity_lflcastle_task")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityLflcastleTaskTable:getIDs()
	return self.ids
end

function ActivityLflcastleTaskTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityLflcastleTaskTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityLflcastleTaskTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityLflcastleTaskTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityLflcastleTaskTable
