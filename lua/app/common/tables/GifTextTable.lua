-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GifTextTable.lua

GifTextTable = class("GifTextTable", import("app.common.tables.BaseTable"))

function GifTextTable:ctor()
	GifTextTable.super.ctor(self, "emoticon_gif_text_" .. tostring(xyd.Global.lang))
end

function GifTextTable:getAccess(id)
	return self:getString(id, "access")
end

function GifTextTable:getWords(id)
	if not self.TableLua then
		return ""
	end

	return self:getString(id, "word")
end

return GifTextTable
