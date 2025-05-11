-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MailTable.lua

local MailTable = class("MailTable", import("app.common.tables.BaseTable"))

function MailTable:ctor()
	MailTable.super.ctor(self, "mail")
end

function MailTable:getTitle(id)
	return xyd.tables.mailTextTable:getTitle(id)
end

function MailTable:getContent(id)
	return xyd.tables.mailTextTable:getContent(id)
end

function MailTable:getFrom(id)
	return xyd.tables.mailTextTable:getFrom(id)
end

function MailTable:getDateIndex(id)
	return self:split2num(id, "date_num", "|")
end

function MailTable:getContentType(id)
	return self:split2Cost(id, "connect_type", "|#", false)
end

function MailTable:getWindowGo(id)
	return self:getNumber(id, "window_go")
end

return MailTable
