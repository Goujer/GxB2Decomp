-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CustomBackgroundTypeTextTable.lua

local CustomBackgroundTypeTextTable = class("CustomBackgroundTypeTextTable", import("app.common.tables.BaseTable"))

function CustomBackgroundTypeTextTable:ctor()
	CustomBackgroundTypeTextTable.super.ctor(self, "custom_background_type_text_" .. xyd.Global.lang)
end

function CustomBackgroundTypeTextTable:getName(id)
	return self:getString(id, "name")
end

return CustomBackgroundTypeTextTable
