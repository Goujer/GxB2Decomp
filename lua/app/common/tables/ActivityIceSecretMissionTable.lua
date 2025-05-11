-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityIceSecretMissionTable.lua

local BaseTable = import(".BaseTable")
local ActivityIceSecretMissionTable = class("ActivityIceSecretMissionTable", BaseTable)

function ActivityIceSecretMissionTable:ctor()
	BaseTable.ctor(self, "activity_ice_secret_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivityIceSecretMissionTable:getIds()
	return self.ids_
end

function ActivityIceSecretMissionTable:getAward(id)
	local arr = xyd.split(self:getString(id, "award"), "#", true)
	local item = {
		itemId = arr[1],
		itemNum = arr[2]
	}

	return item
end

function ActivityIceSecretMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityIceSecretMissionTable:getCompleteNum(id)
	return self:getNumber(id, "complete_value")
end

function ActivityIceSecretMissionTable:getTimeArray(id)
	local change = self:getString(id, "if_change")

	if change ~= "" then
		local arr = xyd.split(change, "#", true)
		local time = {
			start = arr[1],
			endtime = arr[2]
		}

		return time
	end
end

function ActivityIceSecretMissionTable:getActivityID(id)
	return self:getNumber(id, "activity_id")
end

function ActivityIceSecretMissionTable:getGetway(id)
	return self:getNumber(id, "getway") or 0
end

return ActivityIceSecretMissionTable
