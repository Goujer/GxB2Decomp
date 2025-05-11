-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityOldBuildingAward2Table.lua

local ActivityOldBuildingAward2Table = class("ActivityOldBuildingAward2Table", import("app.common.tables.BaseTable"))

function ActivityOldBuildingAward2Table:ctor()
	ActivityOldBuildingAward2Table.super.ctor(self, "activity_old_building_award2")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityOldBuildingAward2Table:getIds()
	return self.ids_
end

function ActivityOldBuildingAward2Table:getRankFront(id)
	return self:getString(id, "rank_front")
end

function ActivityOldBuildingAward2Table:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivityOldBuildingAward2Table:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityOldBuildingAward2Table:getRankIdByRank(rank)
	for _, id in ipairs(self.ids_) do
		local rank_ = self:getRank(id)

		if rank <= rank_ and rank > 0 then
			return id
		end
	end

	return #self.ids_
end

return ActivityOldBuildingAward2Table
