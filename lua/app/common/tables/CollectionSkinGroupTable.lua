-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CollectionSkinGroupTable.lua

local CollectionSkinGroupTable = class("CollectionSkinGroupTable", import("app.common.tables.BaseTable"))

function CollectionSkinGroupTable:ctor()
	CollectionSkinGroupTable.super.ctor(self, "collection_skin_group")

	self.ids_ = {}
	self.skinsByid = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local skins = self:split2Cost(id, "skins", "|", true)
		local result = {}

		for i = 1, #skins do
			local collectionID = xyd.tables.itemTable:getCollectionId(skins[i])
			local showTime = xyd.tables.collectionTable:getShowTime(collectionID)

			if not showTime or showTime <= xyd.getServerTime() then
				table.insert(result, skins[i])
			end
		end

		self.skinsByid[tonumber(id)] = result
	end

	table.sort(self.ids_)
end

function CollectionSkinGroupTable:getIDs()
	return self.ids_
end

function CollectionSkinGroupTable:getType(id)
	return self:getNumber(id, "type")
end

function CollectionSkinGroupTable:getName(id)
	return self:getString(id, "name")
end

function CollectionSkinGroupTable:getSkins(id)
	return self.skinsByid[id]
end

function CollectionSkinGroupTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function CollectionSkinGroupTable:getRank(id)
	return self:getNumber(id, "rank")
end

return CollectionSkinGroupTable
