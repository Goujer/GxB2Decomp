-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeddingVote2ListTable.lua

local ActivityWeddingVote2ListTable = class("ActivityWeddingVote2ListTable", import("app.common.tables.BaseTable"))

function ActivityWeddingVote2ListTable:ctor()
	ActivityWeddingVote2ListTable.super.ctor(self, "activity_wedding_vote2_list")

	self.ids_ = {
		{},
		{},
		{}
	}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_[1], tonumber(id))
		table.insert(self.ids_[1 + self:getGroup(tonumber(id))], tonumber(id))
	end

	for i = 1, 3 do
		table.sort(self.ids_[i])
	end
end

function ActivityWeddingVote2ListTable:getIds()
	return self.ids_
end

function ActivityWeddingVote2ListTable:getIdsByGroup(group)
	return self.ids_[group + 1]
end

function ActivityWeddingVote2ListTable:getGroup(id)
	local group = self:getNumber(id, "group")

	return group
end

function ActivityWeddingVote2ListTable:getShowIDs(id)
	return self:split2num(id, "show_ids", "|")
end

function ActivityWeddingVote2ListTable:getShowPos(id)
	return self:split2num(id, "partner_picture_xy", "#")
end

function ActivityWeddingVote2ListTable:getScale(id)
	return self:getNumber(id, "partner_picture_scale")
end

function ActivityWeddingVote2ListTable:getShowOffset(id)
	return self:split2num(id, "partner_picture_offset", "#")
end

function ActivityWeddingVote2ListTable:getRank(id)
	return self:getNumber(id, "rank")
end

return ActivityWeddingVote2ListTable
