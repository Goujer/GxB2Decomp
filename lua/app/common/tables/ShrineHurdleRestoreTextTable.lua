-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleRestoreTextTable.lua

local ShrineHurdleRestoreTextTable = class("ShrineHurdleBuffTable", import("app.common.tables.BaseTable"))

function ShrineHurdleRestoreTextTable:ctor()
	ShrineHurdleRestoreTextTable.super.ctor(self, "shrine_hurdle_restore_text_" .. tostring(xyd.Global.lang))
end

function ShrineHurdleRestoreTextTable:getTitle(id)
	return self:getString(id, "title")
end

function ShrineHurdleRestoreTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ShrineHurdleRestoreTextTable
