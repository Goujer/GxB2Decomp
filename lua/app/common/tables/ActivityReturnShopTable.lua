-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityReturnShopTable.lua

local ActivityReturnShopTable = class("ActivityReturnShopTable", import(".BaseTable"))

function ActivityReturnShopTable:ctor()
	ActivityReturnShopTable.super.ctor(self, "activity_return_shop")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityReturnShopTable:getIds()
	return self.ids_
end

function ActivityReturnShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityReturnShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityReturnShopTable:getAward(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityReturnShopTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityReturnShopTable
