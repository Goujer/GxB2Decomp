-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLevelUpTable.lua

local ActivityLevelUpTable = class("ActivityLevelUpTable", import("app.common.tables.BaseTable"))

function ActivityLevelUpTable:ctor()
	ActivityLevelUpTable.super.ctor(self, "activity_level_up")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLevelUpTable:getLevel(id)
	return self:getNumber(id, "level")
end

function ActivityLevelUpTable:getRewards(id)
	return self:split(id, "award", "#")
end

function ActivityLevelUpTable:getIds()
	return self.ids_
end

function ActivityLevelUpTable:getTotalAwardNum()
	local awardNum = 0

	for i = 1, #self.ids_ do
		awardNum = awardNum + tonumber(self:getRewards(self.ids_[i])[2])
	end

	return awardNum
end

return ActivityLevelUpTable
