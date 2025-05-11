-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySecretTreasureHuntMissionTable.lua

local BaseTable = import(".BaseTable")
local ActivitySecretTreasureHuntMissionTable = class("ActivitySecretTreasureHuntMissionTable", BaseTable)

function ActivitySecretTreasureHuntMissionTable:ctor()
	BaseTable.ctor(self, "activity_secrettreasure_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySecretTreasureHuntMissionTable:getIds()
	return self.ids_
end

function ActivitySecretTreasureHuntMissionTable:getAward(id)
	local arr = xyd.split(self:getString(id, "award"), "#", true)
	local item = {
		itemId = arr[1],
		itemNum = arr[2]
	}

	return item
end

function ActivitySecretTreasureHuntMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivitySecretTreasureHuntMissionTable:getCompleteNum(id)
	return self:getNumber(id, "complete_value")
end

function ActivitySecretTreasureHuntMissionTable:getTimeArray(id)
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

function ActivitySecretTreasureHuntMissionTable:getActivityID(id)
	return self:getNumber(id, "activity_id")
end

function ActivitySecretTreasureHuntMissionTable:getGetway(id)
	return self:getNumber(id, "getway") or 0
end

return ActivitySecretTreasureHuntMissionTable
