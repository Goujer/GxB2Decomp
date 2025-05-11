-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerDialogTypeTextTable.lua

local PartnerDialogTypeTextTable = class("PartnerDialogTypeTextTable", import("app.common.tables.BaseTable"))

function PartnerDialogTypeTextTable:ctor()
	PartnerDialogTypeTextTable.super.ctor(self, "partner_dialog_type_text_" .. tostring(xyd.Global.lang))
end

function PartnerDialogTypeTextTable:getText(id, index)
	local string_ = self:getString(id, "text")
	local str = xyd.stringFormat(string_, index)

	return str
end

return PartnerDialogTypeTextTable
