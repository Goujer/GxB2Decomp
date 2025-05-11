-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NoticeTextTable.lua

local NoticeTextTable = class("NoticeTextTable", import("app.common.tables.BaseTable"))

function NoticeTextTable:ctor()
	NoticeTextTable.super.ctor(self, "notice_text_" .. tostring(xyd.Global.lang))
end

function NoticeTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return NoticeTextTable
