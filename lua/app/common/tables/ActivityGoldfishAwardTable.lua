-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGoldfishAwardTable.lua

local ActivityGoldfishAwardTable = class("ActivityGoldfishAwardTable", import("app.common.tables.BaseTable"))

function ActivityGoldfishAwardTable:ctor()
	ActivityGoldfishAwardTable.super.ctor(self, "activity_goldfish_awards")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityGoldfishAwardTable:getIDs()
	return self.ids
end

function ActivityGoldfishAwardTable:getPoint(id)
	return self:getNumber(id, "complete")
end

function ActivityGoldfishAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityGoldfishAwardTable
