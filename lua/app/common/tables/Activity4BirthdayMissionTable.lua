-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity4BirthdayMissionTable.lua

local Activity4BirthdayMissionTable = class("Activity4BirthdayMissionTable", import("app.common.tables.BaseTable"))

function Activity4BirthdayMissionTable:ctor()
	Activity4BirthdayMissionTable.super.ctor(self, "activity_4birthday_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function Activity4BirthdayMissionTable:getIDs()
	return self.ids_
end

function Activity4BirthdayMissionTable:getCompValue(id)
	return self:getNumber(id, "value")
end

function Activity4BirthdayMissionTable:getGetWay(id)
	return self:getNumber(id, "getway")
end

function Activity4BirthdayMissionTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function Activity4BirthdayMissionTable:getAward(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function Activity4BirthdayMissionTable:getDesc(id)
	return xyd.tables.activity4BirthdayMissionTextTable:getDesc(id)
end

return Activity4BirthdayMissionTable
