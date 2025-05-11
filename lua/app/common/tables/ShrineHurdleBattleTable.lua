-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleBattleTable.lua

local ShrineHurdleBattleTable = class("ShrineHurdleBattleTable", import("app.common.tables.BaseTable"))

function ShrineHurdleBattleTable:ctor()
	ShrineHurdleBattleTable.super.ctor(self, "shrine_hurdle_battle")
end

function ShrineHurdleBattleTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function ShrineHurdleBattleTable:getScore(id)
	return self:getNumber(id, "score")
end

function ShrineHurdleBattleTable:getCoin(id)
	return self:split2num(id, "coin", "|")
end

function ShrineHurdleBattleTable:getModelID(id)
	return self:getNumber(id, "model")
end

return ShrineHurdleBattleTable
