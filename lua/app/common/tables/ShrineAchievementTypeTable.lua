-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineAchievementTypeTable.lua

local ShrineAchievementTypeTable = class("ShrineAchievementTypeTable", import("app.common.tables.BaseTable"))

function ShrineAchievementTypeTable:ctor()
	ShrineAchievementTypeTable.super.ctor(self, "shrine_achievement_type")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ShrineAchievementTypeTable:getDesc(id, ...)
	return xyd.tables.shrineAchievementTextTable:getDesc(id, ...)
end

function ShrineAchievementTypeTable:getEndAchievement(id)
	return self:getNumber(id, "end_achievement")
end

function ShrineAchievementTypeTable:getStartAchievement(id)
	return self:getNumber(id, "start_achievement")
end

function ShrineAchievementTypeTable:getShowRank(id)
	return self:getNumber(id, "show_rank")
end

function ShrineAchievementTypeTable:getShowRankDone(id)
	return self:getNumber(id, "show_rank_done")
end

function ShrineAchievementTypeTable:getType(id)
	return self:getNumber(id, "type")
end

function ShrineAchievementTypeTable:getIDs()
	return self.ids_
end

return ShrineAchievementTypeTable
