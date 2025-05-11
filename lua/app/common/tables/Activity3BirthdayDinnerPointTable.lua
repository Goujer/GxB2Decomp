-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity3BirthdayDinnerPointTable.lua

local Activity3BirthdayDinnerPointTable = class("Activity3BirthdayDinnerPointTable", import("app.common.tables.BaseTable"))

function Activity3BirthdayDinnerPointTable:ctor()
	Activity3BirthdayDinnerPointTable.super.ctor(self, "activity_3birthday_dinner_point")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function Activity3BirthdayDinnerPointTable:getIDs()
	return self.ids_
end

function Activity3BirthdayDinnerPointTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function Activity3BirthdayDinnerPointTable:getPoint(id)
	return self:getNumber(id, "point")
end

return Activity3BirthdayDinnerPointTable
