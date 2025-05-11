-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerNotationTextTable.lua

local PartnerNotationTextTable = class("PartnerNotationTextTable", import("app.common.tables.BaseTable"))

function PartnerNotationTextTable:ctor()
	PartnerNotationTextTable.super.ctor(self, "partner_notation_text_" .. tostring(xyd.Global.lang))
end

function PartnerNotationTextTable:getNotation(id)
	return self:getString(id, "notation")
end

return PartnerNotationTextTable
