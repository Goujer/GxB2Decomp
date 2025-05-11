-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairArenaLevelTable.lua

local ActivityFairArenaLevelTable = class("ActivityFairArenaLevelTable", import("app.common.tables.BaseTable"))

function ActivityFairArenaLevelTable:ctor()
	ActivityFairArenaLevelTable.super.ctor(self, "activity_fair_arena_level")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairArenaLevelTable:getIDs()
	return self.ids_
end

function ActivityFairArenaLevelTable:getLevel(id)
	return self:getNumber(id, "level")
end

function ActivityFairArenaLevelTable:getWinTime(id)
	return self:getNumber(id, "win_time")
end

function ActivityFairArenaLevelTable:getStyle(id)
	return self:getNumber(id, "style")
end

function ActivityFairArenaLevelTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityFairArenaLevelTable:getScore(id)
	return self:getNumber(id, "score")
end

function ActivityFairArenaLevelTable:getLevel(id)
	return self:getNumber(id, "level")
end

return ActivityFairArenaLevelTable
