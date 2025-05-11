-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleBossTable.lua

local ShrineHurdleBossTable = class("ShrineHurdleBossTable", import("app.common.tables.BaseTable"))

function ShrineHurdleBossTable:ctor()
	ShrineHurdleBossTable.super.ctor(self, "shrine_hurdle_boss")
end

function ShrineHurdleBossTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function ShrineHurdleBossTable:getPointHurt(id)
	return self:getNumber(id, "hurt")
end

function ShrineHurdleBossTable:getModelID(id)
	return self:getNumber(id, "model")
end

return ShrineHurdleBossTable
