-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNsshaftAward2Table.lua

local ActivityNsshaftAward2Table = class("ActivityNsshaftAward2Table", import("app.common.tables.BaseTable"))

function ActivityNsshaftAward2Table:ctor()
	ActivityNsshaftAward2Table.super.ctor(self, "activity_nsshaft_award2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityNsshaftAward2Table:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityNsshaftAward2Table:getAwards(id)
	local awards = self:split2Cost(id, "awards", "|#")
	local res = {}

	for i = 1, #awards do
		table.insert(res, {
			item_id = awards[i][1],
			item_num = awards[i][2]
		})
	end

	return res
end

function ActivityNsshaftAward2Table:getRankFront(id)
	return self:getString(id, "rank_front")
end

function ActivityNsshaftAward2Table:getPreRank(id)
	if id == 1 then
		return 1
	else
		return self:getRank(id)
	end
end

function ActivityNsshaftAward2Table:getIds()
	return self.ids_
end

function ActivityNsshaftAward2Table:getIdByRank(rank)
	for i = 1, #self.ids_ do
		local left = self:getPreRank(self.ids_[i])
		local right = self:getRank(self.ids_[i])

		if left <= rank and rank <= right then
			return self.ids_[i]
		end
	end

	return nil
end

function ActivityNsshaftAward2Table:getRankInfo(rank, id)
	id = id or self:getIdByRank(rank)

	return {
		rank = self:getRank(id),
		rankText = self:getRankFront(id),
		award = self:getAwards(id)
	}
end

return ActivityNsshaftAward2Table
