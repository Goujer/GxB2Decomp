-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTrickortreatTable.lua

local ActivityTrickortreatTable = class("ActivityTrickortreatTable", import("app.common.tables.BaseTable"))

function ActivityTrickortreatTable:ctor()
	ActivityTrickortreatTable.super.ctor(self, "activity_trickortreat")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityTrickortreatTable:getIDs()
	return self.ids
end

function ActivityTrickortreatTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityTrickortreatTable:getWeights(id)
	return self:split2Cost(id, "weight", "|")
end

return ActivityTrickortreatTable
