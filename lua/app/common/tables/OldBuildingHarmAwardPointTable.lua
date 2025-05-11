-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingHarmAwardPointTable.lua

local OldBuildingHarmAwardPointTable = class("OldBuildingHarmAwardTable", import("app.common.tables.BaseTable"))

function OldBuildingHarmAwardPointTable:ctor()
	OldBuildingHarmAwardPointTable.super.ctor(self, "old_building_award3_point")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function OldBuildingHarmAwardPointTable:getPoint(rank)
	return self:getNumber(rank, "point")
end

function OldBuildingHarmAwardPointTable:getIds()
	return self.ids_
end

return OldBuildingHarmAwardPointTable
