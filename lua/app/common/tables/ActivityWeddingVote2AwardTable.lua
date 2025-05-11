-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeddingVote2AwardTable.lua

local ActivityWeddingVote2AwardTable = class("ActivityWeddingVote2AwardTable", import("app.common.tables.BaseTable"))

function ActivityWeddingVote2AwardTable:ctor()
	ActivityWeddingVote2AwardTable.super.ctor(self, "activity_wedding_vote2_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityWeddingVote2AwardTable:getIDs()
	return self.ids_
end

function ActivityWeddingVote2AwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityWeddingVote2AwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityWeddingVote2AwardTable
