-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ErrorInfoTextTable.lua

local ErrorInfoTextTable = class("ErrorInfoTextTable", import("app.common.tables.BaseTable"))

function ErrorInfoTextTable:ctor()
	ErrorInfoTextTable.super.ctor(self, "error_info_text_" .. tostring(xyd.Global.lang))
end

function ErrorInfoTextTable:getText(id)
	return self:getString(id, "text")
end

return ErrorInfoTextTable
