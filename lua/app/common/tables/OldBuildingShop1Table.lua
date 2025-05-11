-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingShop1Table.lua

local OldBuildingShop1Table = class("OldBuildingShop1Table", import("app.common.tables.BaseTable"))

function OldBuildingShop1Table:ctor()
	OldBuildingShop1Table.super.ctor(self, "old_building_shop1")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
	self:makePointsArr()
end

function OldBuildingShop1Table:getIds()
	return self.ids_
end

function OldBuildingShop1Table:makePointsArr()
	self.pointsArr = {}

	local list = {}

	for _, id in ipairs(self.ids_) do
		local point = self:getPoint(id)

		list[point] = 1
	end

	for key, _ in pairs(list) do
		table.insert(self.pointsArr, tonumber(key))
	end

	table.sort(self.pointsArr)
end

function OldBuildingShop1Table:getPointsArr()
	return self.pointsArr
end

function OldBuildingShop1Table:getPoint(id)
	return self:getNumber(id, "point")
end

function OldBuildingShop1Table:getBuyTime(id)
	return self:getNumber(id, "buy_time")
end

function OldBuildingShop1Table:getItem(id)
	return self:split2num(id, "item", "#")
end

function OldBuildingShop1Table:getCost(id)
	return self:split2num(id, "cost", "#")
end

function OldBuildingShop1Table:getNum(id)
	return 0
end

return OldBuildingShop1Table
