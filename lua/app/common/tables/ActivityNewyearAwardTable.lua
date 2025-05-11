-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewyearAwardTable.lua

local ActivityNewyearAwardTable = class("ActivityNewyearAwardTable", import("app.common.tables.BaseTable"))

function ActivityNewyearAwardTable:ctor()
	ActivityNewyearAwardTable.super.ctor(self, "activity_newyear_award")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityNewyearAwardTable:getIds()
	return self.ids_
end

function ActivityNewyearAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityNewyearAwardTable:getItemID(id)
	return self:getNumber(id, "item_id")
end

function ActivityNewyearAwardTable:getAward(id)
	return self:split2Cost(id, "awards", "#")
end

return ActivityNewyearAwardTable
