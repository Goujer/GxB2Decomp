-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGambleTable.lua

local ActivityGambleTable = class("ActivityGambleTable", import("app.common.tables.BaseTable"))

function ActivityGambleTable:ctor()
	ActivityGambleTable.super.ctor(self, "activity_gamble")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityGambleTable:getIDs()
	return self.ids_
end

function ActivityGambleTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityGambleTable:getLastPoint()
	return self:getNumber(self.ids_[#self.ids_], "point")
end

function ActivityGambleTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityGambleTable
