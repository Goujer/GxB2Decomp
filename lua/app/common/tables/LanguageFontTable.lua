-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/LanguageFontTable.lua

local LanguageFontTable = class("LanguageFontTable", import("app.common.tables.BaseTable"))

function LanguageFontTable:ctor()
	LanguageFontTable.super.ctor(self, "language_font")
end

function LanguageFontTable:getFont(lang)
	return self:getString(lang, "font")
end

return LanguageFontTable
