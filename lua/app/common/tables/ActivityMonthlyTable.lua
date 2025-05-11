-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMonthlyTable.lua

local ActivityMonthlyTable = class("ActivityMonthlyTable", import("app.common.tables.BaseTable"))

function ActivityMonthlyTable:ctor()
	ActivityMonthlyTable.super.ctor(self, "activity_monthly_total")

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityMonthlyTable:getIDs()
	return self.ids_
end

function ActivityMonthlyTable:getValue(id)
	return self:getNumber(id, "point")
end

function ActivityMonthlyTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityMonthlyTable:getExtraAwards(id)
	return self:split2Cost(id, "ex_awards", "|#")
end

return ActivityMonthlyTable
