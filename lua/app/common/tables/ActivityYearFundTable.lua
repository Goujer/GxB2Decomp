-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityYearFundTable.lua

local ActivityYearFundTable = class("ActivityYearFundTable", import("app.common.tables.BaseTable"))

function ActivityYearFundTable:ctor()
	ActivityYearFundTable.super.ctor(self, "activity_year_fund")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityYearFundTable:getIds()
	return self.ids_
end

function ActivityYearFundTable:getAwards(id)
	return self:split2num(id, "awards", "#")
end

function ActivityYearFundTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivityYearFundTable:isPreview(id)
	return self:getNumber(id, "preview")
end

function ActivityYearFundTable:hasEffect(id)
	return self:getNumber(id, "effect") == 1
end

function ActivityYearFundTable:isNew(id)
	return self:getNumber(id, "new_show") == 1
end

return ActivityYearFundTable
