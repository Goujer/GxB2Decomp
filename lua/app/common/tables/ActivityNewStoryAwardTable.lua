-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewStoryAwardTable.lua

local ActivityNewStoryAwardTable = class("ActivityNewStoryAwardTable", import("app.common.tables.BaseTable"))

function ActivityNewStoryAwardTable:ctor()
	ActivityNewStoryAwardTable.super.ctor(self, "activity_new_story_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityNewStoryAwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityNewStoryAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityNewStoryAwardTable:getIds()
	return self.ids_
end

return ActivityNewStoryAwardTable
