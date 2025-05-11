-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsMissionTable.lua

local ActivitySportsMissionTable = class("ActivitySportsMissionTable", import(".BaseTable"))

function ActivitySportsMissionTable:ctor()
	ActivitySportsMissionTable.super.ctor(self, "activity_sports_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySportsMissionTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivitySportsMissionTable:getIds()
	return self.ids_
end

function ActivitySportsMissionTable:getLevLimit()
	return 0
end

function ActivitySportsMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivitySportsMissionTable:getDesc(id)
	return xyd.tables.activitySportsMissionTextTable:getDesc(id)
end

function ActivitySportsMissionTable:getGoWindow(id)
	return self:getString(id, "go_window")
end

function ActivitySportsMissionTable:isLimit(id)
	return self:getNumber(id, "is_limit") == 1
end

function ActivitySportsMissionTable:getGoParams(id)
	local params = {}
	local arr = xyd.split(self:getString(id, "go_params"), "|")

	for idx, _ in ipairs(arr) do
		local param = xyd.split(arr[idx], ":")

		if tonumber(param[2]) then
			param[2] = tonumber(param[2])
		end

		params[param[1]] = param[2]
	end

	return params
end

return ActivitySportsMissionTable
