-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TipsActivityPointTextTable.lua

local TipsActivityPointTextTable = class("TipsActivityPointTextTable", import("app.common.tables.BaseTable"))

function TipsActivityPointTextTable:ctor()
	TipsActivityPointTextTable.super.ctor(self, "tips_activity_point_text_" .. xyd.Global.lang)
end

function TipsActivityPointTextTable:getTitle(id)
	return self:getString(id, "title")
end

function TipsActivityPointTextTable:getContent(id)
	return self:split(id, "content", "|", false)
end

return TipsActivityPointTextTable
