-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity4birthdayAwardTable.lua

local Activity4birthdayAwardTable = class("Activity4birthdayAwardTable", import("app.common.tables.BaseTable"))

function Activity4birthdayAwardTable:ctor()
	Activity4birthdayAwardTable.super.ctor(self, "activity_4birthday_award")

	self.ids_ = {}
	self.idsByType = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local type = self:getType(tonumber(id))

		if not self.idsByType[type] then
			self.idsByType[type] = {}
		end

		table.insert(self.idsByType[type], tonumber(id))
	end

	table.sort(self.ids_)

	for key, value in pairs(self.idsByType) do
		table.sort(value)
	end
end

function Activity4birthdayAwardTable:getIDs()
	return self.ids_
end

function Activity4birthdayAwardTable:getIDsByType(type)
	return self.idsByType[type]
end

function Activity4birthdayAwardTable:getType(id)
	return self:getNumber(id, "type")
end

function Activity4birthdayAwardTable:getPoint(id)
	return self:getNumber(id, "num")
end

function Activity4birthdayAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

return Activity4birthdayAwardTable
