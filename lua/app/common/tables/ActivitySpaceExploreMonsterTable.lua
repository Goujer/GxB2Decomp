-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpaceExploreMonsterTable.lua

local ActivitySpaceExploreMonsterTable = class("ActivitySpaceExploreMonsterTable", import("app.common.tables.BaseTable"))

function ActivitySpaceExploreMonsterTable:ctor()
	ActivitySpaceExploreMonsterTable.super.ctor(self, "activity_space_explore_monster")
end

function ActivitySpaceExploreMonsterTable:getPartnerModel(id)
	return self:getNumber(id, "partner_model")
end

function ActivitySpaceExploreMonsterTable:getAtk(id)
	return self:getNumber(id, "atk")
end

function ActivitySpaceExploreMonsterTable:getHp(id)
	return self:getNumber(id, "hp")
end

function ActivitySpaceExploreMonsterTable:getArm(id)
	return self:getNumber(id, "arm")
end

return ActivitySpaceExploreMonsterTable
