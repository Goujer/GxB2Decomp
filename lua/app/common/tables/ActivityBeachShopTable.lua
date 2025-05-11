-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBeachShopTable.lua

local ActivityBeachShopTable = class("ActivityBeachShopTable", import("app.common.tables.BaseTable"))

function ActivityBeachShopTable:ctor()
	ActivityBeachShopTable.super.ctor(self, "activity_beach_shop")

	self.idsByType = {}

	for id, _ in pairs(self.TableLua.rows) do
		local type = self:getType(id)

		if not self.idsByType[type] then
			self.idsByType[type] = {}
		end

		table.insert(self.idsByType[type], tonumber(id))
	end

	for _, list in pairs(self.idsByType) do
		table.sort(list)
	end
end

function ActivityBeachShopTable:getIDsByType(type)
	return self.idsByType[type]
end

function ActivityBeachShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityBeachShopTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityBeachShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityBeachShopTable:getTime(id)
	return self:getNumber(id, "time") or 0
end

function ActivityBeachShopTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityBeachShopTable:getCardImg(id)
	return self:getString(id, "card_img")
end

return ActivityBeachShopTable
