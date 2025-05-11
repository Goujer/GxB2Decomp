-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MidasTable.lua

local MidasTable = class("MidasTable", import("app.common.tables.BaseTable"))

function MidasTable:ctor()
	MidasTable.super.ctor(self, "midas")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function MidasTable:getIDs()
	return self.ids_
end

function MidasTable:getGold(id)
	local gold = self:split2num(id, "gold", "#")

	return gold[2]
end

function MidasTable:getGoldNew(id)
	local gold = self:split2num(id, "gold_new", "#")

	return gold[2]
end

return MidasTable
