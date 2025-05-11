-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeekScoreTable.lua

local ActivityWeekScoreTable = class("ActivityWeekScoreTable", import("app.common.tables.BaseTable"))

function ActivityWeekScoreTable:ctor()
	ActivityWeekScoreTable.super.ctor(self, "activity_week_score")

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityWeekScoreTable:getIDs()
	return self.ids_
end

function ActivityWeekScoreTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityWeekScoreTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityWeekScoreTable
