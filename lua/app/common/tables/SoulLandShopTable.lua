-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulLandShopTable.lua

local SoulLandShopTable = class("SoulLandShopTable", import("app.common.tables.BaseTable"))

function SoulLandShopTable:ctor()
	SoulLandShopTable.super.ctor(self, "soul_land_shop")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulLandShopTable:getIDs()
	return self.ids_
end

function SoulLandShopTable:getItem(id)
	return self:split2Cost(id, "item", "#", true)
end

function SoulLandShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function SoulLandShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return SoulLandShopTable
