-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ComicTextTable.lua

local ComicTextTable = class("ComicTextTable", import("app.common.tables.BaseTable"))

function ComicTextTable:ctor()
	ComicTextTable.super.ctor(self, "comic_text_" .. xyd.Global.lang)
end

function ComicTextTable:getUrl(id)
	return self:getString(id, "get_url_h5")
end

function ComicTextTable:getChapterName(id)
	return self:getString(id, "get_chapter")
end

return ComicTextTable
