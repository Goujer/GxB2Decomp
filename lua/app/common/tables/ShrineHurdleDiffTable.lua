-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleDiffTable.lua

local ShrineHurdleDiffTable = class("ShrineHurdleDiffTable", import("app.common.tables.BaseTable"))

function ShrineHurdleDiffTable:ctor()
	ShrineHurdleDiffTable.super.ctor(self, "shrine_difficulty")
end

function ShrineHurdleDiffTable:getRatio(id)
	return self:getNumber(id, "score_ratio")
end

return ShrineHurdleDiffTable
