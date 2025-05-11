-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TranslationTable.lua

local TranslationTable = class("TranslationTable", import("app.common.tables.BaseTable"))
local TranslationTable2 = class("TranslationTable2", import("app.common.tables.BaseTable"))

function TranslationTable:ctor()
	TranslationTable.super.ctor(self, "translation_" .. tostring(xyd.Global.lang))

	self.translateTable2 = TranslationTable2.new()
end

function TranslationTable:translate(name, ...)
	local __args = {
		...
	}
	local formatStr = self.translateTable2:getString(name, "translation")

	if not formatStr or formatStr == "" then
		formatStr = self:getString(name, "translation")
	end

	if not formatStr then
		return name
	end

	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

function TranslationTable2:ctor()
	TranslationTable2.super.ctor(self, "translation_2_" .. tostring(xyd.Global.lang))
end

return TranslationTable
