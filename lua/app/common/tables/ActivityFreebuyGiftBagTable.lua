-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFreebuyGiftBagTable.lua

local ActivityFreebuyGiftBagTable = class("ActivityFreebuyGiftBagTable", import("app.common.tables.BaseTable"))

function ActivityFreebuyGiftBagTable:ctor()
	ActivityFreebuyGiftBagTable.super.ctor(self, "activity_freebuy_giftbag")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityFreebuyGiftBagTable:getIds()
	return self.ids_
end

function ActivityFreebuyGiftBagTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityFreebuyGiftBagTable:getDays(id)
	return self:getNumber(id, "days")
end

function ActivityFreebuyGiftBagTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityFreebuyGiftBagTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityFreebuyGiftBagTable:getRate(id)
	return self:getString(id, "rate")
end

return ActivityFreebuyGiftBagTable
