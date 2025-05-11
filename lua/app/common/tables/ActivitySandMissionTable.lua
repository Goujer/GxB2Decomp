-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySandMissionTable.lua

local BaseTable = import(".BaseTable")
local ActivitySandMissionTable = class("ActivitySandMissionTable", BaseTable)

function ActivitySandMissionTable:ctor()
	BaseTable.ctor(self, "activity_sand_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySandMissionTable:getIds()
	return self.ids_
end

function ActivitySandMissionTable:getAward(id)
	local arr = xyd.split(self:getString(id, "free_awards"), "|")
	local items = {}

	for _, v in ipairs(arr) do
		v = xyd.split(v, "#", true)

		local item = {
			itemId = v[1],
			itemNum = v[2]
		}

		table.insert(items, item)
	end

	return items
end

function ActivitySandMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivitySandMissionTable:getCompleteNum(id)
	return self:getNumber(id, "complete_value")
end

function ActivitySandMissionTable:getGetway(id)
	return self:getNumber(id, "getway") or 0
end

function ActivitySandMissionTable:getToggleType(id)
	if self:getNumber(id, "is_daily") == 1 then
		return xyd.ActivitySandMissionEnum.TOGGLE_TYPE.DAILY
	else
		return xyd.ActivitySandMissionEnum.TOGGLE_TYPE.WEEKLY
	end
end

function ActivitySandMissionTable:getIDs()
	return self.ids_
end

function ActivitySandMissionTable:getPaidAwards(id)
	return self:split2Cost(id, "paid_awards", "#", true)
end

return ActivitySandMissionTable
