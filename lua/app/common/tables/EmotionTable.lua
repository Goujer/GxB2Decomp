-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/EmotionTable.lua

local EmotionTable = class("EmotionTable", import("app.common.tables.BaseTable"))

function EmotionTable:ctor()
	EmotionTable.super.ctor(self, "emoticon")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, self:Number(id))
	end

	table.sort(self.ids)
end

function EmotionTable:getImg(id)
	local src = self:getString(id, "image")

	return src
end

function EmotionTable:getCollectionId(id)
	return self:getNumber(id, "collection_id")
end

function EmotionTable:getIds()
	return self.ids
end

function EmotionTable:getLength()
	return #self.ids
end

return EmotionTable
