-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpaceExploreSkillTable.lua

local ActivitySpaceExploreSkillTable = class("ActivitySpaceExploreSkillTable", import("app.common.tables.BaseTable"))

function ActivitySpaceExploreSkillTable:ctor()
	ActivitySpaceExploreSkillTable.super.ctor(self, "activity_space_explore_skill")
end

function ActivitySpaceExploreSkillTable:getValue(id)
	return self:split2Cost(id, "value", "|", true)
end

function ActivitySpaceExploreSkillTable:getSkillLevel(id)
	return self:getNumber(id, "skill_level")
end

function ActivitySpaceExploreSkillTable:getType1(id)
	return self:getNumber(id, "type1")
end

function ActivitySpaceExploreSkillTable:getType2(id)
	return self:getNumber(id, "type2")
end

function ActivitySpaceExploreSkillTable:getTarget(id)
	return self:getNumber(id, "target")
end

function ActivitySpaceExploreSkillTable:getBuffId(id)
	return self:getString(id, "buff_id")
end

return ActivitySpaceExploreSkillTable
