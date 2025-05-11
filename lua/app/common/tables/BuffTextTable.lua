-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BuffTextTable.lua

local BuffTextTable = class("BuffTextTable", import("app.common.tables.BaseTable"))

function BuffTextTable:ctor()
	BuffTextTable.super.ctor(self, "buff_text_" .. string.lower(xyd.lang))
end

function BuffTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return BuffTextTable
