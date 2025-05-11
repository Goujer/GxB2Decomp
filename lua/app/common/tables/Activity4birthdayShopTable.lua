-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity4birthdayShopTable.lua

local Activity4birthdayShopTable = class("Activity4birthdayShopTable", import("app.common.tables.BaseTable"))

function Activity4birthdayShopTable:ctor()
	Activity4birthdayShopTable.super.ctor(self, "activity_4birthday_shop")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function Activity4birthdayShopTable:getIDs()
	return self.ids_
end

function Activity4birthdayShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function Activity4birthdayShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function Activity4birthdayShopTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

return Activity4birthdayShopTable
