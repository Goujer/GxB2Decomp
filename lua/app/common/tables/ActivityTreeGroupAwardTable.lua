-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTreeGroupAwardTable.lua

local ActivityTreeGroupAwardTable = class("ActivityTreeGroupAwardTable", import("app.common.tables.BaseTable"))

function ActivityTreeGroupAwardTable:ctor()
	ActivityTreeGroupAwardTable.super.ctor(self, "activity_tree_group_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityTreeGroupAwardTable:getIDs()
	return self.ids_
end

function ActivityTreeGroupAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityTreeGroupAwardTable:getAwards(id)
	return self:split2num(id, "awards", "#")
end

return ActivityTreeGroupAwardTable
