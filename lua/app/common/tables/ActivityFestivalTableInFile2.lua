-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFestivalTableInFile2.lua

local ActivityFestivalTableInFile2 = class("ActivityFestivalTableInFile2", import("app.common.tables.BaseTable"))

function ActivityFestivalTableInFile2:ctor()
	ActivityFestivalTableInFile2.super.ctor(self, "activity_festival_in_file2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityFestivalTableInFile2:getIDs()
	return self.ids_
end

function ActivityFestivalTableInFile2:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityFestivalTableInFile2:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityFestivalTableInFile2:getConditionID(id)
	return self:getNumber(id, "condition_id")
end

return ActivityFestivalTableInFile2
