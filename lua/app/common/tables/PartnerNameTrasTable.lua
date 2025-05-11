-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerNameTrasTable.lua

local PartnerNameTrasTable = class("PartnerNameTrasTable", import("app.common.tables.BaseTable"))

function PartnerNameTrasTable:ctor()
	PartnerNameTrasTable.super.ctor(self, "partner_name_translation")

	self.ids = {}
	self.zh_tw_names_ = {}
	self.en_en_names_ = {}
	self.ja_jp_names_ = {}
	self.fr_fr_names_ = {}
	self.ko_kr_names_ = {}
	self.de_de_names_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)

	for _, id in pairs(self.ids) do
		id = tostring(id)

		local row = self.TableLua.rows[id]
		local colIndex = self.TableLua.keys.name_zh_tw
		local name_zh_tw = row[colIndex]

		table.insert(self.zh_tw_names_, name_zh_tw)

		colIndex = self.TableLua.keys.name_en_en

		local name_en_en = row[colIndex]

		table.insert(self.en_en_names_, name_en_en)

		colIndex = self.TableLua.keys.name_ja_jp

		local name_ja_jp = row[colIndex]

		table.insert(self.ja_jp_names_, name_ja_jp)

		colIndex = self.TableLua.keys.name_fr_fr

		local name_fr_fr = row[colIndex]

		table.insert(self.fr_fr_names_, name_fr_fr)

		colIndex = self.TableLua.keys.name_ko_kr

		local name_ko_kr = row[colIndex]

		table.insert(self.ko_kr_names_, name_ko_kr)

		colIndex = self.TableLua.keys.name_de_de

		local name_de_de = row[colIndex]

		table.insert(self.de_de_names_, name_de_de)
	end
end

function PartnerNameTrasTable:getLangNames(lang)
	return self[lang .. "_names_"]
end

function PartnerNameTrasTable:getZWnamesByENnames(name)
	local i = 0

	while i < #self.en_en_names_ do
		if self.en_en_names_[i + 1] == name then
			return self.zh_tw_names_[i + 1]
		end

		i = i + 1
	end
end

return PartnerNameTrasTable
