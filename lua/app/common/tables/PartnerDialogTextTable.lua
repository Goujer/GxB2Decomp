-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerDialogTextTable.lua

local PartnerDialogTextTable = class("PartnerTextTable", import("app.common.tables.BaseTable"))

function PartnerDialogTextTable:ctor()
	PartnerDialogTextTable.super.ctor(self, "partner_dialog_text_" .. tostring(xyd.Global.lang))
end

function PartnerDialogTextTable:getText(id)
	return self:getString(id, "text")
end

return PartnerDialogTextTable
