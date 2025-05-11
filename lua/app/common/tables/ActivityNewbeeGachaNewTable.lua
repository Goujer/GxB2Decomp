-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewbeeGachaNewTable.lua

local ActivityNewbeeGachaNewTable = class("ActivityNewbeeGachaNewTable", import("app.common.tables.BaseTable"))

function ActivityNewbeeGachaNewTable:ctor()
	ActivityNewbeeGachaNewTable.super.ctor(self, "activity_newbee_gacha_new")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityNewbeeGachaNewTable:getIds()
	return self.ids_
end

function ActivityNewbeeGachaNewTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityNewbeeGachaNewTable:getLimit(id)
	return self:getNumber(id, "point")
end

return ActivityNewbeeGachaNewTable
