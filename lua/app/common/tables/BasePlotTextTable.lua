-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BasePlotTextTable.lua

local BasePlotTextTable = class("BasePlotTextTable", import("app.common.tables.BaseTable"))

function BasePlotTextTable:ctor(tableName)
	BasePlotTextTable.super.ctor(self, tostring(tableName) .. "_text_" .. tostring(xyd.Global.lang))
end

function BasePlotTextTable:getName(id)
	return self:getString(id, "name")
end

function BasePlotTextTable:getDialog(id)
	return self:getString(id, "dialog") or ""
end

function BasePlotTextTable:getTitle(id)
	return self:getString(id, "title")
end

function BasePlotTextTable:getSelects(id)
	return self:split(id, "select_text", "|")
end

return BasePlotTextTable
