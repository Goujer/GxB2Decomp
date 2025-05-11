-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingBAward1Table.lua

local OldBuildingBAward1Table = class("OldBuildingBAward1Table", import("app.common.tables.BaseTable"))

function OldBuildingBAward1Table:ctor()
	OldBuildingBAward1Table.super.ctor(self, "old_building_b_award1")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function OldBuildingBAward1Table:getIds()
	return self.ids_
end

function OldBuildingBAward1Table:getPoint(id)
	return self:getNumber(id, "point")
end

function OldBuildingBAward1Table:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return OldBuildingBAward1Table
