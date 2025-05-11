-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MailTextTable.lua

local MailTextTable = class("MailTextTable", import("app.common.tables.BaseTable"))

function MailTextTable:ctor()
	MailTextTable.super.ctor(self, "mail_text_" .. tostring(xyd.Global.lang))
end

function MailTextTable:getTitle(id)
	return self:getString(id, "name")
end

function MailTextTable:getContent(id)
	return self:getString(id, "content")
end

function MailTextTable:getFrom(id)
	return self:getString(id, "from")
end

return MailTextTable
