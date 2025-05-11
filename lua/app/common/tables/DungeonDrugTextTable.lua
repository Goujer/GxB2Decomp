-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DungeonDrugTextTable.lua

local DungeonDrugTextTable = class("DungeonDrugTextTable", import("app.common.tables.BaseTable"))

function DungeonDrugTextTable:ctor()
	DungeonDrugTextTable.super.ctor(self, "dungeon_drug_text_" .. xyd.Global.lang)
end

function DungeonDrugTextTable:getName(id)
	return self:getString(id, "name")
end

function DungeonDrugTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return DungeonDrugTextTable
