-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCandyCollectTable.lua

local ActivityCandyCollectTable = class("ActivityCandyCollectTable", import("app.common.tables.BaseTable"))

function ActivityCandyCollectTable:ctor()
	ActivityCandyCollectTable.super.ctor(self, "activity_candy_collect")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityCandyCollectTable:getIDs()
	return self.ids
end

function ActivityCandyCollectTable:getCost(id, index)
	return self:split2Cost(id, "cost_" .. tostring(index), "#")
end

function ActivityCandyCollectTable:getAwards(id, index)
	return self:split2Cost(id, "awards_" .. tostring(index), "#")
end

function ActivityCandyCollectTable:getTitle(id)
	return xyd.tables.activityCandyCollectTextTable:getTitle(id)
end

return ActivityCandyCollectTable
