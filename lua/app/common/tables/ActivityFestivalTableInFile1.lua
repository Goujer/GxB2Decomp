-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFestivalTableInFile1.lua

local ActivityFestivalTableInFile1 = class("ActivityFestivalTableInFile1", import("app.common.tables.BaseTable"))

function ActivityFestivalTableInFile1:ctor()
	ActivityFestivalTableInFile1.super.ctor(self, "activity_festival_in_file1")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityFestivalTableInFile1:getIDs()
	return self.ids_
end

function ActivityFestivalTableInFile1:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityFestivalTableInFile1:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityFestivalTableInFile1:getConditionID(id)
	return self:getNumber(id, "condition_id")
end

return ActivityFestivalTableInFile1
