-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChristmasSaleShowTable.lua

local ActivityChristmasSaleShowTable = class("ActivityChristmasSaleShowTable", import("app.common.tables.BaseTable"))

function ActivityChristmasSaleShowTable:ctor()
	ActivityChristmasSaleShowTable.super.ctor(self, "activity_christmas_sale_show")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityChristmasSaleShowTable:getIds()
	return self.ids
end

function ActivityChristmasSaleShowTable:getAwards(id)
	return self:split2Cost(id, "award_show", "#")
end

function ActivityChristmasSaleShowTable:getIsNew(id)
	local num = self:getNumber(id, "is_new")

	return num == 1
end

return ActivityChristmasSaleShowTable
