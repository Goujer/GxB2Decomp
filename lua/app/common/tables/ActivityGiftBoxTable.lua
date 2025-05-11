-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGiftBoxTable.lua

local ActivityGiftBoxTable = class("ActivityGiftBoxTable", import("app.common.tables.BaseTable"))

function ActivityGiftBoxTable:ctor()
	ActivityGiftBoxTable.super.ctor(self, "activity_giftbox")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_, function(a, b)
		return tonumber(a) < tonumber(b)
	end)
end

function ActivityGiftBoxTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityGiftBoxTable:getIcon(id)
	return self:getString(id, "icon")
end

function ActivityGiftBoxTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityGiftBoxTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityGiftBoxTable:getIDs()
	return self.ids_
end

return ActivityGiftBoxTable
