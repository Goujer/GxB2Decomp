-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AchievementTypeTable.lua

local AchievementTypeTable = class("AchievementTypeTable", import("app.common.tables.BaseTable"))

function AchievementTypeTable:ctor()
	AchievementTypeTable.super.ctor(self, "achievement_type")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function AchievementTypeTable:getDesc(id, ...)
	return xyd.tables.achievementTextTable:getDesc(id, ...)
end

function AchievementTypeTable:getAllServerText(id, rank)
	local rankText = xyd.tables.arenaAllServerRankText:getDesc(rank)

	return xyd.tables.achievementTextTable:getDesc(id, rankText)
end

function AchievementTypeTable:getEndAchievement(id)
	return self:getNumber(id, "end_achievement")
end

function AchievementTypeTable:getStartAchievement(id)
	return self:getNumber(id, "start_achievement")
end

function AchievementTypeTable:getShowRank(id)
	return self:getNumber(id, "show_rank")
end

function AchievementTypeTable:getShowRankDone(id)
	return self:getNumber(id, "show_rank_done")
end

function AchievementTypeTable:getType(id)
	return self:getNumber(id, "type")
end

function AchievementTypeTable:getIDs()
	return self.ids_
end

return AchievementTypeTable
