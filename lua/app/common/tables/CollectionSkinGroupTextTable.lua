-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CollectionSkinGroupTextTable.lua

local CollectionSkinGroupTextTable = class("CollectionSkinGroupTextTable", import("app.common.tables.BaseTable"))

function CollectionSkinGroupTextTable:ctor()
	CollectionSkinGroupTextTable.super.ctor(self, "collection_skin_group_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function CollectionSkinGroupTextTable:getIDs()
	return self.ids_
end

function CollectionSkinGroupTextTable:getName(id)
	return self:getString(id, "name")
end

return CollectionSkinGroupTextTable
