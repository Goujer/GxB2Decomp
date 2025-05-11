-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewFirstRechargeTable.lua

local NewFirstRechargeTable = class("NewFirstRechargeTable", import("app.common.tables.BaseTable"))

function NewFirstRechargeTable:ctor()
	NewFirstRechargeTable.super.ctor(self, "activity_new_first_recharge")

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function NewFirstRechargeTable:getIDs()
	return self.ids_
end

function NewFirstRechargeTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return NewFirstRechargeTable
