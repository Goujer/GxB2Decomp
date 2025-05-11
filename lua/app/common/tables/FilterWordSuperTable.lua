-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FilterWordSuperTable.lua

local FilterWordSuperTable = class("FilterWordSuperTable", import("app.common.tables.BaseTable"))

function FilterWordSuperTable:ctor()
	FilterWordSuperTable.super.ctor(self, "filterword_super")

	self.words = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]
		local word = row[colIndexTable.word]

		self.words[word] = true
	end
end

function FilterWordSuperTable:getWord(id)
	return self:getString(id, "word")
end

function FilterWordSuperTable:isInWords(str)
	local word = string.gsub(str, " ", "")

	if self.words[word] then
		return true
	end

	local flag = false

	for key, _ in pairs(self.words) do
		if string.find(word, key) ~= nil then
			flag = true

			break
		end
	end

	return flag
end

return FilterWordSuperTable
