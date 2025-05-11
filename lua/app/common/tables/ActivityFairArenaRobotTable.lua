-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairArenaRobotTable.lua

local ActivityFairArenaRobotTable = class("ActivityFairArenaRobotTable", import("app.common.tables.BaseTable"))

function ActivityFairArenaRobotTable:ctor()
	ActivityFairArenaRobotTable.super.ctor(self, "activity_fair_arena_robot")
end

function ActivityFairArenaRobotTable:getName(id)
	return self:getString(id, "name")
end

function ActivityFairArenaRobotTable:getLev(id)
	return self:getNumber(id, "lv")
end

function ActivityFairArenaRobotTable:getServerID(id)
	return self:getNumber(id, "server") or 0
end

function ActivityFairArenaRobotTable:getAvatar(id)
	return self:getNumber(id, "avatar_id")
end

return ActivityFairArenaRobotTable
