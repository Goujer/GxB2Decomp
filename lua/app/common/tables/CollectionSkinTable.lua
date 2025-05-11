-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CollectionSkinTable.lua

local CollectionSkinTable = class("CollectionSkinTable", import("app.common.tables.BaseTable"))

function CollectionSkinTable:ctor()
	CollectionSkinTable.super.ctor(self, "collection_skin")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function CollectionSkinTable:getIDs()
	return self.ids_
end

function CollectionSkinTable:getName(id)
	return self:getString(id, "name")
end

function CollectionSkinTable:getRemark(id)
	return self:getString(id, "remark")
end

function CollectionSkinTable:getQlt(id)
	return self:getNumber(id, "qlt")
end

function CollectionSkinTable:getGroup(id)
	return self:getNumber(id, "group")
end

function CollectionSkinTable:getType2(id)
	return self:getNumber(id, "type2")
end

function CollectionSkinTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

function CollectionSkinTable:getItemId(id)
	return self:getNumber(id, "item_id")
end

function CollectionSkinTable:getIsShow(id)
	return self:getNumber(id, "is_show")
end

return CollectionSkinTable
