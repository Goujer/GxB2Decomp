-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChristmasSocksLevelTable.lua

local ActivityChristmasSocksLevelTable = class("ActivityChristmasSocksLevelTable", import("app.common.tables.BaseTable"))

function ActivityChristmasSocksLevelTable:ctor()
	ActivityChristmasSocksLevelTable.super.ctor(self, "activity_christmas_socks_level")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityChristmasSocksLevelTable:getIDs()
	return self.ids_
end

function ActivityChristmasSocksLevelTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityChristmasSocksLevelTable:getLevel(id)
	return self:getNumber(id, "level")
end

return ActivityChristmasSocksLevelTable
