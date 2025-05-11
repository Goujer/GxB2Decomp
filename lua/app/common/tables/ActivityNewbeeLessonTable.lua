-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewbeeLessonTable.lua

local ActivityNewbeeLessonTable = class("ActivityNewbeeLessonTable", import(".BaseTable"))

function ActivityNewbeeLessonTable:ctor()
	local tableName

	tableName = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_LEESON) and "activity_newbee_lesson" or "activity_newbee_lesson_2"

	ActivityNewbeeLessonTable.super.ctor(self, tableName)

	self.dailyMissionListByDay = {}
	self.accumulateTaskList = {}

	for id in pairs(self.TableLua.rows) do
		local openDay = self:getOpenDay(id)

		if openDay ~= 0 then
			if not self.dailyMissionListByDay[openDay] then
				self.dailyMissionListByDay[openDay] = {}
			end

			table.insert(self.dailyMissionListByDay[openDay], tonumber(id))
		else
			local type = self:getType(id)

			if not self.accumulateTaskList[type] then
				self.accumulateTaskList[type] = {}
			end

			table.insert(self.accumulateTaskList[type], tonumber(id))
		end
	end

	for _, list in ipairs(self.dailyMissionListByDay) do
		table.sort(list)
	end

	for _, list in pairs(self.accumulateTaskList) do
		table.sort(list)
	end
end

function ActivityNewbeeLessonTable:getDailyMissionByDay(day)
	return self.dailyMissionListByDay[day]
end

function ActivityNewbeeLessonTable:getAccumulateTaskByType(type)
	return self.accumulateTaskList[type]
end

function ActivityNewbeeLessonTable:getName(id)
	return xyd.tables.activityNewbeeLessonTextTable:getName(self:getType(id))
end

function ActivityNewbeeLessonTable:getDesc(id)
	return xyd.stringFormat(xyd.tables.activityNewbeeLessonTextTable:getDesc(self:getType(id)), self:getCompleteValue(id))
end

function ActivityNewbeeLessonTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityNewbeeLessonTable:getOpenDay(id)
	return self:getNumber(id, "day_limit")
end

function ActivityNewbeeLessonTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityNewbeeLessonTable:getAward(id)
	return self:split2Cost(id, "award", "|#", true)
end

function ActivityNewbeeLessonTable:getGetway(id)
	return self:getNumber(id, "getway")
end

return ActivityNewbeeLessonTable
