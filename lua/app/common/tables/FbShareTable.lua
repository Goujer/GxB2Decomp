-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FbShareTable.lua

local FbShareTable = class("FbShareTable", import("app.common.tables.BaseTable"))

function FbShareTable:ctor()
	FbShareTable.super.ctor(self, "fb_share_" .. tostring(xyd.Global.lang))
end

function FbShareTable:getTitle(id)
	return self:getString(id, "title")
end

function FbShareTable:getContent(id)
	return self:getString(id, "content")
end

function FbShareTable:getLink(id)
	return self:getString(id, "link")
end

function FbShareTable:getImgLink(id)
	return self:getString(id, "img_link")
end

return FbShareTable
