-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionCellsTypeTextTable.lua

local ArcticExpeditionCellsTypeTextTable = class("ArcticExpeditionCellsTypeTextTable", import(".BaseTable"))

function ArcticExpeditionCellsTypeTextTable:ctor()
	ArcticExpeditionCellsTypeTextTable.super.ctor(self, "activity_ept_cell_type_text_" .. tostring(xyd.Global.lang))
end

function ArcticExpeditionCellsTypeTextTable:getName(id)
	return self:getString(id, "name")
end

function ArcticExpeditionCellsTypeTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ArcticExpeditionCellsTypeTextTable
