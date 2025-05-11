-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmMissionTable.lua

local BaseTable = import(".BaseTable")
local ActivitySpfarmMissionTable = class("ActivitySpfarmMissionTable", BaseTable)

function ActivitySpfarmMissionTable:ctor()
	BaseTable.ctor(self, "activity_spfarm_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySpfarmMissionTable:getIds()
	return self.ids_
end

function ActivitySpfarmMissionTable:getAward(id)
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

function ActivitySpfarmMissionTable:isDaily(id)
	return self:getNumber(id, "is_daily")
end

function ActivitySpfarmMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivitySpfarmMissionTable:getCompleteNum(id)
	return self:getNumber(id, "complete")
end

function ActivitySpfarmMissionTable:getGetway(id)
	return self:getNumber(id, "getway") or 0
end

function ActivitySpfarmMissionTable:getParams(id)
	return self:getNumber(id, "params")
end

return ActivitySpfarmMissionTable
