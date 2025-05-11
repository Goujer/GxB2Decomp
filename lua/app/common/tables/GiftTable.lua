-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GiftTable.lua

local GiftTable = class("GiftTable", import("app.common.tables.BaseTable"))

function GiftTable:ctor()
	GiftTable.super.ctor(self, "gift")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end
end

function GiftTable:getIDs()
	return self.ids_
end

function GiftTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function GiftTable:getDailyAwards(id)
	return self:split2Cost(id, "daily_awards", "|#")
end

function GiftTable:getDropboxId(id)
	return self:getNumber(id, "dropbox_ids")
end

return GiftTable
