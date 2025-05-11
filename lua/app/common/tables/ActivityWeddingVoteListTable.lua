-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeddingVoteListTable.lua

local ActivityWeddingVoteListTable = class("ActivityWeddingVoteListTable", import("app.common.tables.BaseTable"))

function ActivityWeddingVoteListTable:ctor()
	ActivityWeddingVoteListTable.super.ctor(self, "activity_wedding_vote_list")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityWeddingVoteListTable:getIDs()
	return self.ids_
end

function ActivityWeddingVoteListTable:getShowIDs(id)
	return self:split2num(id, "show_ids", "|")
end

return ActivityWeddingVoteListTable
