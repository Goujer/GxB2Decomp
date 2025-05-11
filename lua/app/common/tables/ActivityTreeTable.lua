-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTreeTable.lua

local ActivityTreeTable = class("ActivityTreeTable", import("app.common.tables.BaseTable"))

function ActivityTreeTable:ctor()
	ActivityTreeTable.super.ctor(self, "activity_tree")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityTreeTable:getIDs()
	return self.ids_
end

function ActivityTreeTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityTreeTable:getLaterPoint(id)
	return self:getNumber(self.ids_[#self.ids_], "point")
end

function ActivityTreeTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityTreeTable
