-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/EmotionTextTable.lua

local EmotionTextTable = class("EmotionTextTable", import("app.common.tables.BaseTable"))

function EmotionTextTable:ctor()
	EmotionTextTable.super.ctor(self, "emoticon_text_" .. tostring(xyd.Global.lang))

	self.ids = {}

	if self.TableLua then
		local colIndexTable = self.TableLua.keys

		for id, _ in pairs(self.TableLua.rows) do
			local row = self.TableLua.rows[id]

			table.insert(self.ids, self:Number(id))
		end
	end
end

function EmotionTextTable:getImg(id)
	if not self.TableLua then
		return ""
	end

	return self:getString(id, "image")
end

function EmotionTextTable:getIds()
	return self.ids
end

function EmotionTextTable:getLength()
	return #self.ids
end

function EmotionTextTable:getWords(id)
	if not self.TableLua then
		return ""
	end

	return self:getString(id, "words")
end

return EmotionTextTable
