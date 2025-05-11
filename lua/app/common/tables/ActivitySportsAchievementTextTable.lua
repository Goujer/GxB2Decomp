-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsAchievementTextTable.lua

local ActivitySportsAchievementTextTable = class("ActivitySportsAchievementTextTable", import("app.common.tables.BaseTable"))

function ActivitySportsAchievementTextTable:ctor()
	ActivitySportsAchievementTextTable.super.ctor(self, "activity_sports_achievement_text_" .. tostring(xyd.Global.lang))
end

function ActivitySportsAchievementTextTable:getDesc(id, setNum)
	local content = self:getString(id, "desc")

	content = content or ""

	local ordinals = {}

	for num in content:gmatch("{(%d+)}") do
		table.insert(ordinals, tonumber(num))
	end

	for _, num in ipairs(ordinals) do
		content = string.gsub(content, "{" .. num .. "}", tostring(setNum))
	end

	return content
end

return ActivitySportsAchievementTextTable
