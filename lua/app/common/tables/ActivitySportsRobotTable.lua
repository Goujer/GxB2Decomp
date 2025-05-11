-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsRobotTable.lua

local BaseTable = import(".BaseTable")
local ActivitySportsRobotTable = class("ActivitySportsRobotTable", BaseTable)

function ActivitySportsRobotTable:ctor()
	ActivitySportsRobotTable.super.ctor(self, "activity_sports_robot")
end

function ActivitySportsRobotTable:getName(id)
	return self:getString(id, "name")
end

function ActivitySportsRobotTable:getLev(id)
	return self:getNumber(id, "lv")
end

function ActivitySportsRobotTable:getPower(id)
	return self:getNumber(id, "power")
end

function ActivitySportsRobotTable:getShowID(id)
	return self:getNumber(id, "show_id")
end

function ActivitySportsRobotTable:getFormation(id)
	local items = xyd.split(self:getString(id, "partner_ids"), "|", true)
	local levs = xyd.split(self:getString(id, "partner_lv"), "|", true)
	local result = {}

	for i in pairs(items) do
		local item = {
			partner_id = items[i],
			pos = i,
			lev = levs[i]
		}

		table.insert(result, item)
	end

	return result
end

function ActivitySportsRobotTable:getAvatar(id)
	return self:getNumber(id, "avatar_id")
end

return ActivitySportsRobotTable
