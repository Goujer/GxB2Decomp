-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySchoolGiftTable.lua

local ActivitySchoolGiftTable = class("ActivitySchoolGiftTable", import("app.common.tables.BaseTable"))

function ActivitySchoolGiftTable:ctor()
	ActivitySchoolGiftTable.super.ctor(self, "activity_school_gift")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivitySchoolGiftTable:getIDs()
	return self.ids_
end

function ActivitySchoolGiftTable:getDailyAwards(id)
	return self:split2Cost(id, "daily_awards", "|#")
end

function ActivitySchoolGiftTable:getUnlockType(id)
	local data = self:getString(id, "unlock_type")
	local splitData = xyd.split(data, ":")
	local params = {}

	params.type = self:Number(splitData[1])

	if params.type == 2 then
		params.cost = xyd.split(splitData[2], "#")
	elseif params.type == 3 then
		params.cost = self:Number(splitData[2])
	end

	return params
end

return ActivitySchoolGiftTable
