-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeddingVoteAwardTable.lua

local ActivityWeddingVoteAwardTable = class("ActivityWeddingVoteAwardTable", import("app.common.tables.BaseTable"))

function ActivityWeddingVoteAwardTable:ctor()
	ActivityWeddingVoteAwardTable.super.ctor(self, "activity_wedding_vote_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityWeddingVoteAwardTable:getIDs()
	return self.ids_
end

function ActivityWeddingVoteAwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityWeddingVoteAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

return ActivityWeddingVoteAwardTable
