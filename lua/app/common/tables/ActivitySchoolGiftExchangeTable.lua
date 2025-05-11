-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySchoolGiftExchangeTable.lua

local ActivitySchoolGiftExchangeTable = class("ActivitySchoolGiftExchangeTable", import("app.common.tables.BaseTable"))

function ActivitySchoolGiftExchangeTable:ctor()
	ActivitySchoolGiftExchangeTable.super.ctor(self, "activity_school_gift_exchange")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySchoolGiftExchangeTable:getIDs()
	return self.ids_
end

function ActivitySchoolGiftExchangeTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivitySchoolGiftExchangeTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivitySchoolGiftExchangeTable:getConditionID(id)
	return self:getNumber(id, "condition_id")
end

return ActivitySchoolGiftExchangeTable
