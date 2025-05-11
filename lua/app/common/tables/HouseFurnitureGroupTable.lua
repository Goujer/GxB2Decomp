-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseFurnitureGroupTable.lua

local HouseFurnitureGroupTable = class("HouseFurnitureGroupTable", import("app.common.tables.BaseTable"))
local HouseFurnitureGroupTextTable = xyd.tables.houseFurnitureGroupTextTable

function HouseFurnitureGroupTable:ctor()
	HouseFurnitureGroupTable.super.ctor(self, "house_furniture_group")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function HouseFurnitureGroupTable:getIDs()
	return self.ids_
end

function HouseFurnitureGroupTable:getName(id)
	return HouseFurnitureGroupTextTable:getName(id)
end

function HouseFurnitureGroupTable:getImg(id)
	return self:getString(id, "img")
end

function HouseFurnitureGroupTable:getNewTime(id)
	return self:getNumber(id, "new_time")
end

return HouseFurnitureGroupTable
