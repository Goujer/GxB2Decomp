-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BattleTargetTable.lua

local BattleTargetTable = class("BattleTargetTable", import("app.common.tables.BaseTable"))

function BattleTargetTable:ctor()
	BattleTargetTable.super.ctor(self, "battle_target")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, tonumber(id))
	end
end

function BattleTargetTable:getTargetType(id)
	return self:getNumber(id, "type")
end

function BattleTargetTable:isCanChange(id)
	return self:getNumber(id, "no_change") ~= 1
end

function BattleTargetTable:isRandomEnemy(id)
	return self:getNumber(id, "random_enemy") == 1
end

return BattleTargetTable
