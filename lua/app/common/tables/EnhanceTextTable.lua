-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/EnhanceTextTable.lua

local EnhanceTextTable = class("EnhanceTextTable", import("app.common.tables.BaseTable"))

function EnhanceTextTable:ctor()
	EnhanceTextTable.super.ctor(self, "be_stronger_text_" .. tostring(xyd.Global.lang))
end

function EnhanceTextTable:getTitle(id)
	return self:getString(id, "title")
end

function EnhanceTextTable:getText(id)
	return self:split(id, "text", "|")
end

return EnhanceTextTable
