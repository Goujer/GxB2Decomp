-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLostSpaceSkillTable.lua

local ActivityLostSpaceSkillTable = class("ActivityLostSpaceSkillTable", import("app.common.tables.BaseTable"))

function ActivityLostSpaceSkillTable:ctor()
	ActivityLostSpaceSkillTable.super.ctor(self, "activity_lost_space_skill")
	self:parseTable(nil, true)
end

function ActivityLostSpaceSkillTable:getEnergy(id)
	return self:getNumber(id, "energy")
end

function ActivityLostSpaceSkillTable:getCanLevelUp(id)
	return self:getNumber(id, "if_level_up")
end

function ActivityLostSpaceSkillTable:getLevelUpLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityLostSpaceSkillTable:getLevelUpCost(id)
	return self:getNumber(id, "level_up") or 0
end

function ActivityLostSpaceSkillTable:getDesc(id, ...)
	return xyd.tables.activityLostSpaceSkillTextTable:getDesc(id, ...)
end

function ActivityLostSpaceSkillTable:getName(id, ...)
	return xyd.tables.activityLostSpaceSkillTextTable:getName(id, ...)
end

function ActivityLostSpaceSkillTable:getIcon(id)
	return xyd.tables.activityLostSpaceSkillTextTable:getIcon(id)
end

function ActivityLostSpaceSkillTable:getIds()
	return self.ids_
end

return ActivityLostSpaceSkillTable
