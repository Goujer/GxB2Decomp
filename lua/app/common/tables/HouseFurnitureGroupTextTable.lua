-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseFurnitureGroupTextTable.lua

local HouseFurnitureGroupTextTable = class("HouseFurnitureGroupTextTable", import("app.common.tables.BaseTable"))

function HouseFurnitureGroupTextTable:ctor()
	HouseFurnitureGroupTextTable.super.ctor(self, "house_furniture_group_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function HouseFurnitureGroupTextTable:getIDs()
	return self.ids_
end

function HouseFurnitureGroupTextTable:getName(id)
	return self:getString(id, "name")
end

return HouseFurnitureGroupTextTable
