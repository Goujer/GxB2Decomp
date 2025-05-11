-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpaceExploreMissionTable.lua

local BaseTable = import(".BaseTable")
local ActivitySpaceExploreMissionTable = class("ActivitySpaceExploreMissionTable", BaseTable)

function ActivitySpaceExploreMissionTable:ctor()
	BaseTable.ctor(self, "activity_space_explore_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySpaceExploreMissionTable:getIds()
	return self.ids_
end

function ActivitySpaceExploreMissionTable:getAward(id)
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

function ActivitySpaceExploreMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivitySpaceExploreMissionTable:getCompleteNum(id)
	return self:getNumber(id, "complete_value")
end

function ActivitySpaceExploreMissionTable:getActivityID(id)
	return self:getNumber(id, "activity_id")
end

function ActivitySpaceExploreMissionTable:getGetway(id)
	return self:getNumber(id, "getway") or 0
end

return ActivitySpaceExploreMissionTable
