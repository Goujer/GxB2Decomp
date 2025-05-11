-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeekMissionTable.lua

local ActivityWeekMissionTable = class("ActivityWeekMissionTable", import("app.common.tables.BaseTable"))
local cjson = require("cjson")

function ActivityWeekMissionTable:ctor()
	ActivityWeekMissionTable.super.ctor(self, "activity_week_mission")

	self.dayList = {}

	for i = 1, 7 do
		local tag = {}

		for j = 1, 3 do
			table.insert(tag, {})
		end

		table.insert(self.dayList, tag)
	end

	for id, _ in pairs(self.TableLua.rows) do
		local day = self:getDayLimit(id)
		local tag = self:getTag(id)

		table.insert(self.dayList[day][tag], id)
	end
end

function ActivityWeekMissionTable:getIDs()
	return self.ids_
end

function ActivityWeekMissionTable:getDayLimit(id)
	return self:getNumber(id, "day_limit")
end

function ActivityWeekMissionTable:getTag(id)
	return self:getNumber(id, "label")
end

function ActivityWeekMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityWeekMissionTable:getTextType(id)
	return self:getNumber(id, "text_type")
end

function ActivityWeekMissionTable:getMissionList(day, tag)
	return self.dayList[day][tag]
end

function ActivityWeekMissionTable:getMissionListByDay(day)
	return self.dayList[day]
end

function ActivityWeekMissionTable:getCompleteShow(id)
	local value = self:split2Cost(id, "complete_show", "|")

	if #value == 1 then
		return value[1]
	else
		return value[2]
	end
end

function ActivityWeekMissionTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityWeekMissionTable:getGoWindow(id)
	return self:split(id, "go_window", "|")
end

function ActivityWeekMissionTable:getGoParams(id)
	local params = {}
	local str = self:getString(id, "go_params")

	if str and #str > 0 then
		str = string.gsub(str, "'", "\"")
		params = cjson.decode(str)
	end

	return params
end

function ActivityWeekMissionTable:getFucId(id)
	return self:getNumber(id, "func_id")
end

return ActivityWeekMissionTable
