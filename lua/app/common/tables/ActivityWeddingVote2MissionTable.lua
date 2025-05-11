-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeddingVote2MissionTable.lua

local ActivityWeddingVote2MissionTable = class("ActivityWeddingVote2MissionTable", import("app.common.tables.BaseTable"))

function ActivityWeddingVote2MissionTable:ctor()
	ActivityWeddingVote2MissionTable.super.ctor(self, "activity_wedding_vote2_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityWeddingVote2MissionTable:getIDs()
	return self.ids_
end

function ActivityWeddingVote2MissionTable:getComplete(id)
	return self:getNumber(id, "complete_value")
end

function ActivityWeddingVote2MissionTable:getAward(id)
	local status = self:getCurStatus()

	return self:split2Cost(id, "award" .. status, "#")
end

function ActivityWeddingVote2MissionTable:getCurStatus()
	local timestamp = xyd.tables.miscTable:split2Cost("wedding_vote2_time_interval", "value", "|")
	local data = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_VOTE2)

	if data then
		local start_time = data.start_time
		local cur_time = xyd.getServerTime() - start_time

		for i = 1, #timestamp do
			local stamp = timestamp[i] * 24 * 60 * 60

			if cur_time < stamp then
				return i
			end
		end

		return #timestamp
	else
		return -1
	end
end

function ActivityWeddingVote2MissionTable:getGoWindow(id)
	return self:getString(id, "go_window")
end

function ActivityWeddingVote2MissionTable:getGoWindowParams(id)
	local params = {}
	local arr = xyd.split(self:getString(id, "go_params"), "|")

	for idx, data in ipairs(arr) do
		local param = xyd.split(data, ":")

		if tonumber(param[2]) then
			param[2] = tonumber(param[2])
		end

		params[param[1]] = param[2]
	end

	return params
end

function ActivityWeddingVote2MissionTable:getGetWayID(id)
	return self:getNumber(id, "getway")
end

return ActivityWeddingVote2MissionTable
