-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FunctionTextTable.lua

local FunctionTextTable = class("FunctionTextTable", import("app.common.tables.BaseTable"))

function FunctionTextTable:ctor()
	FunctionTextTable.super.ctor(self, "function_text_" .. tostring(xyd.Global.lang))
end

function FunctionTextTable:getName(id)
	return self:getString(id, "name")
end

function FunctionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return FunctionTextTable
