-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity3BirthdayGambleTable.lua

local Activity3BirthdayGambleTable = class("Activity3BirthdayGambleTable", import("app.common.tables.BaseTable"))

function Activity3BirthdayGambleTable:ctor()
	Activity3BirthdayGambleTable.super.ctor(self, "activity_3birthday_gamble")

	self.ids_ = {}
	self.type_ids = {}
	self.max_nums = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		if not self.type_ids[self:getType(tonumber(id))] then
			self.type_ids[self:getType(tonumber(id))] = {}
		end

		table.insert(self.type_ids[self:getType(tonumber(id))], tonumber(id))
	end

	table.sort(self.ids_)

	for i in pairs(self.type_ids) do
		table.sort(self.type_ids[i])
	end

	for i in pairs(self.ids_) do
		self.max_nums[self.ids_[i]] = self:getNumFirst(self.ids_[i])
	end
end

function Activity3BirthdayGambleTable:getIDs()
	return self.ids_
end

function Activity3BirthdayGambleTable:getByType(type)
	return self.type_ids[type]
end

function Activity3BirthdayGambleTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function Activity3BirthdayGambleTable:getType(id)
	return self:getNumber(id, "type")
end

function Activity3BirthdayGambleTable:getWeight(id)
	return self:getNumber(id, "weight")
end

function Activity3BirthdayGambleTable:getNum(id)
	return self.max_nums[id]
end

function Activity3BirthdayGambleTable:getNumFirst(id)
	return self:getNumber(id, "num")
end

return Activity3BirthdayGambleTable
