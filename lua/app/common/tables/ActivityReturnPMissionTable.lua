-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityReturnPMissionTable.lua

local ActivityReturnPMissionTable = class("ActivityReturnPMissionTable", import(".BaseTable"))

function ActivityReturnPMissionTable:ctor()
	ActivityReturnPMissionTable.super.ctor(self, "activity_return_pmission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityReturnPMissionTable:getIds()
	return self.ids_
end

function ActivityReturnPMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityReturnPMissionTable:getRepeatTimes(id)
	return self:getNumber(id, "repeat_times")
end

function ActivityReturnPMissionTable:getGoWindow(id)
	return self:getString(id, "go_window")
end

function ActivityReturnPMissionTable:getGoParams(id)
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

function ActivityReturnPMissionTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityReturnPMissionTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityReturnPMissionTable:getDesc(id)
	return xyd.tables.activityReturnPMissionTextTable:getDesc(id)
end

return ActivityReturnPMissionTable
