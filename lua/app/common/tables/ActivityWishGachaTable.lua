-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWishGachaTable.lua

local ActivityWishGachaTable = class("ActivityWishGachaTable", import("app.common.tables.BaseTable"))

function ActivityWishGachaTable:ctor()
	ActivityWishGachaTable.super.ctor(self, "activity_wish_gacha")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityWishGachaTable:getIDs()
	return self.ids_
end

function ActivityWishGachaTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityWishGachaTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityWishGachaTable:getType(id)
	return self:getNumber(id, "type")
end

return ActivityWishGachaTable
