-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLevelPushOptionalTable.lua

local ActivityLevelPushOptionalTable = class("ActivityLevelPushOptionalTable", import(".BaseTable"))

function ActivityLevelPushOptionalTable:ctor()
	ActivityLevelPushOptionalTable.super.ctor(self, "activity_level_push_optional")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLevelPushOptionalTable:getIDs()
	return self.ids_
end

function ActivityLevelPushOptionalTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityLevelPushOptionalTable:getAwards(id, num)
	num = num or 1

	return self:split2Cost(id, "awards" .. num, "|#")
end

return ActivityLevelPushOptionalTable
