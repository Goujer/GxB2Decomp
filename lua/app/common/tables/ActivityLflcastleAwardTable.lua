-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLflcastleAwardTable.lua

local ActivityLflcastleAwardTable = class("ActivityLflcastleAwardTable", import("app.common.tables.BaseTable"))

function ActivityLflcastleAwardTable:ctor()
	ActivityLflcastleAwardTable.super.ctor(self, "activity_lflcastle_award")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityLflcastleAwardTable:getIDs()
	return self.ids
end

function ActivityLflcastleAwardTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityLflcastleAwardTable:getCount(id)
	return self:getNumber(id, "count")
end

function ActivityLflcastleAwardTable:getType(id)
	return self:getNumber(id, "type")
end

return ActivityLflcastleAwardTable
