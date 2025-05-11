-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWeddingVoteMissionTable.lua

local ActivityWeddingVoteMissionTable = class("ActivityWeddingVoteMissionTable", import("app.common.tables.BaseTable"))

function ActivityWeddingVoteMissionTable:ctor()
	ActivityWeddingVoteMissionTable.super.ctor(self, "activity_wedding_vote_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityWeddingVoteMissionTable:getIDs()
	return self.ids_
end

function ActivityWeddingVoteMissionTable:getComplete(id)
	return self:getNumber(id, "complete_value")
end

function ActivityWeddingVoteMissionTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityWeddingVoteMissionTable:getGoWindow(id)
	return self:getString(id, "go_window")
end

function ActivityWeddingVoteMissionTable:getGoWindowParams(id)
	local params = {}
	local arr = xyd.split(self:getString(id, "go_params"), "|")

	for id, _ in pairs(arr) do
		local param = xyd.split(arr[id], ":")

		params[param[0]] = self:Number(param[2]) or nil
	end

	return params
end

return ActivityWeddingVoteMissionTable
