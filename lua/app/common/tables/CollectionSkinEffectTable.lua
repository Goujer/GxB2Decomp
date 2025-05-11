-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CollectionSkinEffectTable.lua

local CollectionSkinEffectTable = class("CollectionSkinEffectTable", import("app.common.tables.BaseTable"))

function CollectionSkinEffectTable:ctor()
	CollectionSkinEffectTable.super.ctor(self, "collection_skin_effect")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function CollectionSkinEffectTable:getIDs()
	return self.ids_
end

function CollectionSkinEffectTable:getPoint(id)
	return self:getNumber(id, "point")
end

function CollectionSkinEffectTable:getEffect(id)
	return self:split2Cost(id, "effect", "|#", false)
end

return CollectionSkinEffectTable
