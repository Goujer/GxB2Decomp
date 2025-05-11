-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DailyMissionTable.lua

local DailyMissionTable = class("DailyMissionTable", import("app.common.tables.BaseTable"))

function DailyMissionTable:ctor()
	DailyMissionTable.super.ctor(self, "daily_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function DailyMissionTable:getAward(id)
	return xyd.split(self:getString(id, "award"), "#", true)
end

function DailyMissionTable:getRank(id)
	return self:getNumber(id, "rank")
end

function DailyMissionTable:getLevLimit(id)
	return self:getNumber(id, "lv_limit")
end

function DailyMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function DailyMissionTable:getDesc(id)
	return xyd.tables.missionTextTable:getDesc(id)
end

function DailyMissionTable:getGoWindow(id)
	if tonumber(id) == 9 then
		if xyd.models.dailyQuiz:isAllMaxLev() then
			return "daily_quiz2_window"
		else
			return "daily_quiz_window"
		end
	else
		return self:getString(id, "go_window")
	end
end

function DailyMissionTable:getGoParams(id)
	local params = {}
	local arr = xyd.split(self:getString(id, "go_params"), "|")

	for idx in pairs(arr) do
		local param = xyd.split(arr[idx], ":")

		if self:Number(param[2]) then
			param[2] = self:Number(param[2])
		end

		params[param[1]] = param[2]
	end

	return params
end

function DailyMissionTable:getFuncId(id)
	return 0
end

function DailyMissionTable:getType(id)
	return 1
end

return DailyMissionTable
