-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/WelfareSaleTable.lua

local WelfareSaleTable = class("WelfareSaleTable", import("app.common.tables.BaseTable"))

function WelfareSaleTable:ctor()
	WelfareSaleTable.super.ctor(self, "activity_point_giftbox")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function WelfareSaleTable:getIds(id)
	return self.ids_
end

function WelfareSaleTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function WelfareSaleTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function WelfareSaleTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function WelfareSaleTable:getRequirement(id)
	return self:getNumber(id, "requirement")
end

return WelfareSaleTable
