-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExploreAdventureTable.lua

local ExploreAdventureTable = class("ExploreAdventureTable", import(".BaseTable"))

function ExploreAdventureTable:ctor()
	ExploreAdventureTable.super.ctor(self, "travel_explore")
end

function ExploreAdventureTable:getSlotNum(lev)
	return self:getNumber(lev, "slot")
end

function ExploreAdventureTable:getRewardBoxRate(lev)
	return self:split2Cost(lev, "reward_box_rate", "|#", true)
end

function ExploreAdventureTable:getEnemyLv(lev)
	return self:getNumber(lev, "enemy_lv")
end

function ExploreAdventureTable:getLevelUpLimit(lev)
	return self:split2Cost(lev, "update_box_limit", "|#", true)
end

return ExploreAdventureTable
