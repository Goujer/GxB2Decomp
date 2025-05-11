-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChristmasSocksTable.lua

local ActivityChristmasSocksTable = class("ActivityChristmasSocksTable", import("app.common.tables.BaseTable"))

function ActivityChristmasSocksTable:ctor()
	ActivityChristmasSocksTable.super.ctor(self, "activity_christmas_socks")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityChristmasSocksTable:getIDs()
	return self.ids_
end

function ActivityChristmasSocksTable:getAward(id, level)
	return self:split2Cost(id, "award", "|#")[level]
end

function ActivityChristmasSocksTable:getAwardMaxLevel(id)
	return #self:split2Cost(id, "award", "|#")
end

function ActivityChristmasSocksTable:getType(id)
	return self:getNumber(id, "type")
end

return ActivityChristmasSocksTable
