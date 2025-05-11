-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleRouteTable.lua

local ShrineHurdleRouteTable = class("ShrineHurdleRouteTable", import("app.common.tables.BaseTable"))

function ShrineHurdleRouteTable:ctor()
	ShrineHurdleRouteTable.super.ctor(self, "shrine_route")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ShrineHurdleRouteTable:getEnviroment(id, count)
	return self:split2Cost(id, "environment" .. count, "|")
end

function ShrineHurdleRouteTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

return ShrineHurdleRouteTable
