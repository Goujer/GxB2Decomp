-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHw2022SummonAwardsTable.lua

local ActivityHw2022SummonAwardsTable = class("ActivityHw2022SummonAwardsTable", import("app.common.tables.BaseTable"))

function ActivityHw2022SummonAwardsTable:ctor()
	ActivityHw2022SummonAwardsTable.super.ctor(self, "activity_halloween2022_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityHw2022SummonAwardsTable:getIDs()
	return self.ids_
end

function ActivityHw2022SummonAwardsTable:getValue(id)
	return self:split2num(id, "complete_value", "#")
end

function ActivityHw2022SummonAwardsTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityHw2022SummonAwardsTable
