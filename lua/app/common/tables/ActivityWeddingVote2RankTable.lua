-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeddingVote2RankTable.lua

local ActivityWeddingVote2RankTable = class("ActivityWeddingVote2RankTable", import(".BaseTable"))

function ActivityWeddingVote2RankTable:ctor()
	ActivityWeddingVote2RankTable.super.ctor(self, "activity_wedding_vote2_rank")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function ActivityWeddingVote2RankTable:getRankPartner(id, index)
	return self:getNumber(id, "rank" .. index)
end

function ActivityWeddingVote2RankTable:getIds()
	return self.ids_
end

return ActivityWeddingVote2RankTable
