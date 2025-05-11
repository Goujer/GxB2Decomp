-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DungeonBattleTable.lua

local DungeonBattleTable = class("DungeonBattleTable", import("app.common.tables.BaseTable"))

function DungeonBattleTable:ctor()
	DungeonBattleTable.super.ctor(self, "dungeon_battle")
end

return DungeonBattleTable
