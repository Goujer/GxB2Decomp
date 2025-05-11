-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingAAward1Table.lua

local OldBuildingAAward1Table = class("OldBuildingAAward1Table", import("app.common.tables.BaseTable"))

function OldBuildingAAward1Table:ctor()
	OldBuildingAAward1Table.super.ctor(self, "old_building_a_award1")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function OldBuildingAAward1Table:getIds()
	return self.ids_
end

function OldBuildingAAward1Table:getPoint(id)
	return self:getNumber(id, "point")
end

function OldBuildingAAward1Table:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return OldBuildingAAward1Table
