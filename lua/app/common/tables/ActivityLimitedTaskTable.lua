-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLimitedTaskTable.lua

local ActivityLimitedTaskTable = class("ActivityLimitedTaskTable", import(".BaseTable"))

function ActivityLimitedTaskTable:ctor()
	ActivityLimitedTaskTable.super.ctor(self, "activity_limited_task_award")

	self.ids = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityLimitedTaskTable:getMissionList()
	local list = {}

	for id in ipairs(self.ids) do
		if self:getMasterMission(id) == 0 then
			table.insert(list, id)
		end
	end

	return list
end

function ActivityLimitedTaskTable:getMasterMission(id)
	return self:getNumber(id, "master_mission")
end

function ActivityLimitedTaskTable:getSubMission(id)
	return self:split2num(id, "sub_mission", "|")
end

function ActivityLimitedTaskTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityLimitedTaskTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityLimitedTaskTable:getDesc(id)
	return xyd.tables.activityLimitedTaskTextTable:getDesc(id)
end

return ActivityLimitedTaskTable
