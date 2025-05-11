-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySandShopTable.lua

local ActivitySandShopTable = class("ActivitySandShopTable", import("app.common.tables.BaseTable"))

function ActivitySandShopTable:ctor()
	ActivitySandShopTable.super.ctor(self, "activity_sand_shop")

	self.ids_ = {}
	self.idsByType = {}

	for id, _ in pairs(self.TableLua.rows) do
		local type = self:getType(tonumber(id))

		if not self.idsByType[type] then
			self.idsByType[type] = {}
		end

		table.insert(self.idsByType[type], tonumber(id))
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySandShopTable:getIDs()
	return self.ids_
end

function ActivitySandShopTable:getIDsByType(type)
	return self.idsByType[type]
end

function ActivitySandShopTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

function ActivitySandShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function ActivitySandShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivitySandShopTable:getCondition(id)
	return self:getNumber(id, "condition")
end

function ActivitySandShopTable:getType(id)
	return self:getNumber(id, "type")
end

return ActivitySandShopTable
