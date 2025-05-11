-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CustomBackgroundTextTable.lua

local CustomBackgroundTextTable = class("CustomBackgroundTextTable", import("app.common.tables.BaseTable"))

function CustomBackgroundTextTable:ctor()
	CustomBackgroundTextTable.super.ctor(self, "custom_background_text_" .. xyd.Global.lang)
end

function CustomBackgroundTextTable:getName(id)
	return self:getString(id, "name")
end

function CustomBackgroundTextTable:getText(id)
	return self:getString(id, "text")
end

return CustomBackgroundTextTable
