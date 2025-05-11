-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpaceExploreAwardTable.lua

local ActivitySpaceExploreAwardTable = class("ActivitySpaceExploreAwardTable", import(".BaseTable"))

function ActivitySpaceExploreAwardTable:ctor()
	ActivitySpaceExploreAwardTable.super.ctor(self, "activity_space_explore_reward")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySpaceExploreAwardTable:getLImitNum(id)
	return self:getNumber(id, "limit")
end

function ActivitySpaceExploreAwardTable:getAward(id)
	return self:split2Cost(id, "reward", "|#")
end

function ActivitySpaceExploreAwardTable:getIds()
	return self.ids_
end

return ActivitySpaceExploreAwardTable
