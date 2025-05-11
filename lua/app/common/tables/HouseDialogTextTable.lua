-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseDialogTextTable.lua

local HouseDialogTextTable = class("HouseDialogTextTable", import("app.common.tables.BaseTable"))

function HouseDialogTextTable:ctor()
	HouseDialogTextTable.super.ctor(self, "house_dialog_text_" .. xyd.lang)
end

function HouseDialogTextTable:getName(id)
	return self:getString(id, "name")
end

function HouseDialogTextTable:getDialog(id)
	return self:getString(id, "dialog")
end

return HouseDialogTextTable
