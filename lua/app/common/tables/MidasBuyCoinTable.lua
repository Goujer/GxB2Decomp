-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MidasBuyCoinTable.lua

local MidasBuyCoinTable = class("MidasBuyCoinTable", import("app.common.tables.BaseTable"))

function MidasBuyCoinTable:ctor()
	MidasBuyCoinTable.super.ctor(self, "midas_buy_coin")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function MidasBuyCoinTable:getIDs()
	return self.ids_
end

function MidasBuyCoinTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function MidasBuyCoinTable:getMultiple(id)
	return self:getNumber(id, "multiple")
end

return MidasBuyCoinTable
