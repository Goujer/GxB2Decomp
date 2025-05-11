-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChristmasSocksAwardTable.lua

local ActivityChristmasSocksAwardTable = class("ActivityChristmasSocksAwardTable", import("app.common.tables.BaseTable"))

function ActivityChristmasSocksAwardTable:ctor()
	ActivityChristmasSocksAwardTable.super.ctor(self, "activity_christmas_socks_award")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityChristmasSocksAwardTable:getIDs()
	return self.ids
end

function ActivityChristmasSocksAwardTable:getPoint(id)
	return self:getNumber(id, "complete")
end

function ActivityChristmasSocksAwardTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

return ActivityChristmasSocksAwardTable
