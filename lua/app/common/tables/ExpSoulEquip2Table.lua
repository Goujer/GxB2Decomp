-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExpSoulEquip2Table.lua

local ExpSoulEquip2Table = class("ExpSoulEquip2Table", import("app.common.tables.BaseTable"))

function ExpSoulEquip2Table:ctor()
	ExpSoulEquip2Table.super.ctor(self, "exp_soul_equip2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ExpSoulEquip2Table:getIDs()
	return self.ids_
end

function ExpSoulEquip2Table:getCost(id)
	return self:getNumber(id, "cost")
end

function ExpSoulEquip2Table:getAllExp(id)
	return self:getNumber(id, "all_exp")
end

return ExpSoulEquip2Table
