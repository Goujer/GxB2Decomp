-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityReturnTMissionTable.lua

local ActivityReturnTMissionTable = class("ActivityPMissionTable", import(".BaseTable"))

function ActivityReturnTMissionTable:ctor()
	ActivityReturnTMissionTable.super.ctor(self, "activity_return_tmission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityReturnTMissionTable:getIds()
	return self.ids_
end

function ActivityReturnTMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value1")
end

function ActivityReturnTMissionTable:getCompleteValue2(id)
	return self:getNumber(id, "complete_value2")
end

function ActivityReturnTMissionTable:getRepeatTimes(id)
	return self:getNumber(id, "repeat_times")
end

function ActivityReturnTMissionTable:getGoWindow(id)
	if tonumber(id) == 4 then
		if xyd.models.dailyQuiz:isAllMaxLev() then
			return "daily_quiz2_window"
		else
			return "daily_quiz_window"
		end
	else
		return self:getString(id, "go_window")
	end
end

function ActivityReturnTMissionTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityReturnTMissionTable:getAward1(id)
	return self:split2Cost(id, "award1", "#")
end

function ActivityReturnTMissionTable:getAward2(id)
	return self:split2Cost(id, "award2", "#")
end

function ActivityReturnTMissionTable:getDesc(id)
	return xyd.tables.activityReturnTMissionTextTable:getDesc(id)
end

return ActivityReturnTMissionTable
