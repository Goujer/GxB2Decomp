-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SenpaiDressAchievementTable.lua

local SenpaiDressAchievementTable = class("SenpaiDressAchievementTable", import("app.common.tables.BaseTable"))

function SenpaiDressAchievementTable:ctor()
	SenpaiDressAchievementTable.super.ctor(self, "senpai_dress_achievement")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function SenpaiDressAchievementTable:getIDs()
	return self.ids_
end

function SenpaiDressAchievementTable:getNextAchieveId(id)
	return self:getNumber(id, "next_achieve_id")
end

function SenpaiDressAchievementTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function SenpaiDressAchievementTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function SenpaiDressAchievementTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return SenpaiDressAchievementTable
