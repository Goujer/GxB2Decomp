-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewbeeGachaTable.lua

local ActivityNewbeeGachaTable = class("ActivityNewbeeGachaTable", import("app.common.tables.BaseTable"))

function ActivityNewbeeGachaTable:ctor()
	ActivityNewbeeGachaTable.super.ctor(self, "activity_newbee_gacha")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityNewbeeGachaTable:getIds()
	return self.ids_
end

function ActivityNewbeeGachaTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityNewbeeGachaTable:getLimit(id)
	return self:getNumber(id, "point")
end

return ActivityNewbeeGachaTable
