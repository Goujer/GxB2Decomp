-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCandyCollectTaskTable.lua

local ActivityCandyCollectTaskTable = class("ActivityCandyCollectTaskTable", import("app.common.tables.BaseTable"))

function ActivityCandyCollectTaskTable:ctor()
	ActivityCandyCollectTaskTable.super.ctor(self, "activity_candy_collect_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityCandyCollectTaskTable:getIDs()
	return self.ids
end

function ActivityCandyCollectTaskTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityCandyCollectTaskTable:completeValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityCandyCollectTaskTable:limit(id)
	return self:getNumber(id, "limit")
end

function ActivityCandyCollectTaskTable:taskDesc(id)
	return self:getString(id, "task_desc")
end

return ActivityCandyCollectTaskTable
