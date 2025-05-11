-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingShop2Table.lua

local OldBuildingShop2Table = class("OldBuildingShop2Table", import("app.common.tables.BaseTable"))

function OldBuildingShop2Table:ctor()
	OldBuildingShop2Table.super.ctor(self, "old_building_shop2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
	self:makePointsArr()
end

function OldBuildingShop2Table:getIds()
	return self.ids_
end

function OldBuildingShop2Table:makePointsArr()
	self.pointsArr = {}

	local list = {}

	for _, id in ipairs(self.ids_) do
		local key = self:getNum(id) * 10000 + self:getPoint(id)

		list[key] = 1
	end

	for key, _ in pairs(list) do
		table.insert(self.pointsArr, tonumber(key))
	end

	table.sort(self.pointsArr)
end

function OldBuildingShop2Table:getPointsArr()
	return self.pointsArr
end

function OldBuildingShop2Table:getPoint(id)
	return self:getNumber(id, "point")
end

function OldBuildingShop2Table:getBuyTime(id)
	return self:getNumber(id, "buy_time")
end

function OldBuildingShop2Table:getNum(id)
	return self:getNumber(id, "num")
end

function OldBuildingShop2Table:getItem(id)
	return self:split2num(id, "item", "#")
end

function OldBuildingShop2Table:getCost(id)
	return self:split2num(id, "cost", "#")
end

return OldBuildingShop2Table
