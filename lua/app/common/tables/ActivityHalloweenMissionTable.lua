-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHalloweenMissionTable.lua

local BaseTable = import(".BaseTable")
local ActivityHalloweenMissionTable = class("ActivityHalloweenMissionTable", BaseTable)

function ActivityHalloweenMissionTable:ctor()
	BaseTable.ctor(self, "activity_trickortreat_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivityHalloweenMissionTable:getIds()
	return self.ids_
end

function ActivityHalloweenMissionTable:getAward(id)
	local arr = xyd.split(self:getString(id, "awards"), "|")
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

function ActivityHalloweenMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityHalloweenMissionTable:getCompleteNum(id)
	return self:getNumber(id, "complete")
end

function ActivityHalloweenMissionTable:getGetway(id)
	return self:getNumber(id, "getway_id") or 0
end

return ActivityHalloweenMissionTable
