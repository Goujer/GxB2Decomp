-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DungeonShopTable.lua

local DungeonShopTable = class("DungeonShopTable", import("app.common.tables.BaseTable"))

function DungeonShopTable:ctor()
	DungeonShopTable.super.ctor(self, "dungeon_shop")
end

function DungeonShopTable:getType(id)
	return self:getNumber(id, "type")
end

function DungeonShopTable:getItem(id)
	return xyd.split(self:getString(id, "item"), "#", true)
end

function DungeonShopTable:getCost(id)
	return xyd.split(self:getString(id, "cost"), "#", true)
end

return DungeonShopTable
