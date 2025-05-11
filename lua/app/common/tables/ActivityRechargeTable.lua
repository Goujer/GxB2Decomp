-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityRechargeTable.lua

local ActivityRechargeTable = class("ActivityRechargeTable", import("app.common.tables.BaseTable"))

function ActivityRechargeTable:ctor()
	ActivityRechargeTable.super.ctor(self, "activity_recharge")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityRechargeTable:getIDs()
	return self.ids_
end

function ActivityRechargeTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityRechargeTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityRechargeTable:getIsNew(id)
	return self:getNumber(id, "is_new")
end

return ActivityRechargeTable
