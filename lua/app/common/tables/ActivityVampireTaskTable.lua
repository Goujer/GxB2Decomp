-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityVampireTaskTable.lua

local ActivityVampireTaskTable = class("ActivityVampireTaskTable", import("app.common.tables.BaseTable"))

function ActivityVampireTaskTable:ctor()
	ActivityVampireTaskTable.super.ctor(self, "activity_vampire_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityVampireTaskTable:getIDs()
	return self.ids_
end

function ActivityVampireTaskTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityVampireTaskTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityVampireTaskTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityVampireTaskTable:getGetway(id)
	return self:getNumber(id, "getway")
end

function ActivityVampireTaskTable:getTips(id)
	return self:getNumber(id, "tips")
end

return ActivityVampireTaskTable
