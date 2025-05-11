-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExpSoulEquip1Table.lua

local ExpSoulEquip1Table = class("ExpSoulEquip1Table", import("app.common.tables.BaseTable"))

function ExpSoulEquip1Table:ctor()
	ExpSoulEquip1Table.super.ctor(self, "exp_soul_equip1")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ExpSoulEquip1Table:getIDs()
	return self.ids_
end

function ExpSoulEquip1Table:getCost(id)
	return self:split2Cost(id, "cost", "|#", true)
end

return ExpSoulEquip1Table
