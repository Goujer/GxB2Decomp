-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressAchievementTypeTable.lua

local SenpaiDressAchievementTypeTable = class("SenpaiDressAchievementTypeTable", import("app.common.tables.BaseTable"))

function SenpaiDressAchievementTypeTable:ctor()
	SenpaiDressAchievementTypeTable.super.ctor(self, "senpai_dress_achievement_type")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressAchievementTypeTable:getIDs()
	return self.ids_
end

function SenpaiDressAchievementTypeTable:getStartAchievement(id)
	return self:getNumber(id, "start_achievement")
end

function SenpaiDressAchievementTypeTable:getEndAchievement(id)
	return self:getNumber(id, "end_achievement")
end

function SenpaiDressAchievementTypeTable:getType(id)
	return self:getNumber(id, "type")
end

function SenpaiDressAchievementTypeTable:getShowRank(id)
	return self:getNumber(id, "show_rank")
end

function SenpaiDressAchievementTypeTable:getShowRankDone(id)
	return self:getNumber(id, "show_rank_done")
end

return SenpaiDressAchievementTypeTable
