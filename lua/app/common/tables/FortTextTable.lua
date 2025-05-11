-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FortTextTable.lua

local FortTextTable = class("FortTextTable", import("app.common.tables.BaseTable"))

function FortTextTable:ctor()
	FortTextTable.super.ctor(self, "fort_text_" .. xyd.Global.lang)
end

function FortTextTable:getName(id)
	return self:getString(id, "name")
end

function FortTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function FortTextTable:getMemoryFortDesc(id)
	return self:getString(id, "memory_desc")
end

function FortTextTable:getMemoryName(id)
	return self:getString(id, "memory_name")
end

return FortTextTable
