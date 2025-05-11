-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DropboxShowTable.lua

local DropboxShowTable = class("DropboxShowTable", import("app.common.tables.BaseTable"))

function DropboxShowTable:ctor()
	DropboxShowTable.super.ctor(self, "dropbox_show")

	self.items_by_dropbox_id_ = {}
	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		local boxid = self:getDropboxId(id)

		if not self.items_by_dropbox_id_[boxid] then
			self.items_by_dropbox_id_[boxid] = {
				all_weight = 0,
				list = {}
			}
		end

		local list = self.items_by_dropbox_id_[boxid].list

		if list then
			table.insert(list, tonumber(id))
		end

		self.items_by_dropbox_id_[boxid].all_weight = self.items_by_dropbox_id_[boxid].all_weight + self:getWeight(id)

		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function DropboxShowTable:getDropboxId(id)
	return self:getNumber(id, "dropbox_id")
end

function DropboxShowTable:getIdsByBoxId(box_id)
	return self.items_by_dropbox_id_[box_id]
end

function DropboxShowTable:getWeight(id)
	return self:getNumber(id, "weight")
end

function DropboxShowTable:getItem(id)
	return self:split2num(id, "item", "#")
end

function DropboxShowTable:getIds()
	return self.ids
end

return DropboxShowTable
