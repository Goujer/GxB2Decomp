-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMonthGiftTable.lua

local ActivityMonthGiftTable = class("ActivityMonthGiftTable", import("app.common.tables.BaseTable"))

function ActivityMonthGiftTable:ctor()
	ActivityMonthGiftTable.super.ctor(self, "activity_month_gift")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityMonthGiftTable:getIDs()
	return self.ids_
end

function ActivityMonthGiftTable:getAward(id)
	return self:split2Cost(id, "award", "|#", true)
end

function ActivityMonthGiftTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function ActivityMonthGiftTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityMonthGiftTable
