-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ComicTable.lua

local ComicTable = class("ComicTable", import("app.common.tables.BaseTable"))

function ComicTable:ctor()
	ComicTable.super.ctor(self, "comic_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ComicTable:getIDs()
	return self.ids_
end

function ComicTable:getUrl(id)
	return xyd.tables.comicTextTable:getUrl(id)
end

function ComicTable:getCoverUrl(id)
	return self:getString(id, "get_cover_url")
end

function ComicTable:getChapterName(id)
	return xyd.tables.comicTextTable:getChapterName(id)
end

function ComicTable:getBanner(id)
	return self:getString(id, "get_banner")
end

function ComicTable:getPublishTime(id)
	return self:getNumber(id, "time")
end

return ComicTable
