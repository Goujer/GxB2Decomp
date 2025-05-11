-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity3BirthdayDinnerTable.lua

local Activity3BirthdayDinnerTable = class("Activity3BirthdayDinnerTable", import("app.common.tables.BaseTable"))

function Activity3BirthdayDinnerTable:ctor()
	Activity3BirthdayDinnerTable.super.ctor(self, "activity_3birthday_dinner")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function Activity3BirthdayDinnerTable:getIDs()
	return self.ids_
end

function Activity3BirthdayDinnerTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function Activity3BirthdayDinnerTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function Activity3BirthdayDinnerTable:getWeight(id)
	return self:getNumber(id, "weight")
end

function Activity3BirthdayDinnerTable:getGet(id)
	return self:getNumber(id, "get")
end

function Activity3BirthdayDinnerTable:getDropboxId(id)
	return self:getNumber(id, "dropbox_id")
end

return Activity3BirthdayDinnerTable
