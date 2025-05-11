-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsAchievementTable.lua

local ActivitySportsAchievementTable = class("ActivitySportsAchievementTable", import("app.common.tables.BaseTable"))

function ActivitySportsAchievementTable:ctor()
	ActivitySportsAchievementTable.super.ctor(self, "activity_sports_achievement")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySportsAchievementTable:getIDs()
	return self.ids_
end

function ActivitySportsAchievementTable:getAward(id)
	local awards = xyd.split(self:getString(id, "awards"), "|")
	local res = {}

	for idx in pairs(awards) do
		local award = xyd.split(awards[idx], "#", true)

		table.insert(res, award)
	end

	return res
end

function ActivitySportsAchievementTable:hasID(id)
	if self.TableLua.rows[id] then
		return true
	else
		return false
	end
end

function ActivitySportsAchievementTable:getDesc(id, num)
	return xyd.tables.activitySportsAchievementTextTable:getDesc(id, num)
end

function ActivitySportsAchievementTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivitySportsAchievementTable:getNextAchieveId(id)
	return self:getNumber(id, "next_achieve_id")
end

function ActivitySportsAchievementTable:getType(id)
	return self:getNumber(id, "type")
end

return ActivitySportsAchievementTable
