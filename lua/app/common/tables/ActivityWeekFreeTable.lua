-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeekFreeTable.lua

local ActivityWeekFreeTable = class("ActivityWeekFreeTable", import("app.common.tables.BaseTable"))

function ActivityWeekFreeTable:ctor()
	ActivityWeekFreeTable.super.ctor(self, "activity_week_free")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityWeekFreeTable:getIds()
	return self.ids_
end

function ActivityWeekFreeTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityWeekFreeTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityWeekFreeTable
