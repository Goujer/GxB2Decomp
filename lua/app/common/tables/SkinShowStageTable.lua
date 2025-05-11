-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SkinShowStageTable.lua

local SkinShowStageTable = class("SkinShowStageTable", import("app.common.tables.BaseTable"))

function SkinShowStageTable:ctor()
	SkinShowStageTable.super.ctor(self, "skin_show_stage")
end

function SkinShowStageTable:getBattleId1(skinId)
	return self:getNumber(skinId, "battle_id1")
end

function SkinShowStageTable:getBattleId2(skinId)
	return self:getNumber(skinId, "battle_id2")
end

return SkinShowStageTable
