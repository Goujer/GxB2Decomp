-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BattlePassTable.lua

local BattlePassTable = class("BattlePassTable", import("app.common.tables.BaseTable"))

function BattlePassTable:ctor()
	BattlePassTable.super.ctor(self, "battlepass")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function BattlePassTable:getIds()
	return self.ids_
end

function BattlePassTable:getCoreAward(id)
	return self:split2Cost(id, "core_award", "|#")
end

function BattlePassTable:getPreAward(id)
	return self:split2Cost(id, "pre_award", "|#")
end

return BattlePassTable
