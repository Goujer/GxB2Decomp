-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPopularityVoteTaskTable.lua

local ActivityPopularityVoteTaskTable = class("ActivityPopularityVoteTaskTable", import("app.common.tables.BaseTable"))

function ActivityPopularityVoteTaskTable:ctor()
	ActivityPopularityVoteTaskTable.super.ctor(self, "activity_popularity_vote_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		if self:getDisplay(id) and self:getDisplay(tonumber(id)) > 0 then
			table.insert(self.ids_, tonumber(id))
		end
	end

	table.sort(self.ids_)
end

function ActivityPopularityVoteTaskTable:getIDs()
	return self.ids_
end

function ActivityPopularityVoteTaskTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityPopularityVoteTaskTable:getId(id)
	return self:getNumber(id, "id")
end

function ActivityPopularityVoteTaskTable:getDisplay(id)
	return self:getNumber(id, "display")
end

function ActivityPopularityVoteTaskTable:getCompleteNum(id)
	return self:getNumber(id, "complete")
end

function ActivityPopularityVoteTaskTable:getDesc(id)
	return xyd.tables.activityPopularityVoteTaskTextTable:getDesc(id)
end

function ActivityPopularityVoteTaskTable:getGoWay(id)
	return self:split2Cost(id, "getway", "|")
end

return ActivityPopularityVoteTaskTable
