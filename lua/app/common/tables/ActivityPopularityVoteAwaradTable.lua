-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPopularityVoteAwaradTable.lua

local ActivityPopularityVoteAwaradTable = class("ActivityPopularityVoteAwaradTable", import("app.common.tables.BaseTable"))

function ActivityPopularityVoteAwaradTable:ctor()
	ActivityPopularityVoteAwaradTable.super.ctor(self, "activity_popularity_vote_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityPopularityVoteAwaradTable:getIDs()
	return self.ids_
end

function ActivityPopularityVoteAwaradTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityPopularityVoteAwaradTable:getId(id)
	return self:getNumber(id, "id")
end

function ActivityPopularityVoteAwaradTable:getCompleteNum(id)
	return self:getNumber(id, "complete")
end

return ActivityPopularityVoteAwaradTable
