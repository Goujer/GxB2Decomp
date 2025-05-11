-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopArtifactTable.lua

local ShopArtifactTable = class("ShopArtifactTable", import("app.common.tables.BaseTable"))

function ShopArtifactTable:ctor()
	ShopArtifactTable.super.ctor(self, "shop_artifact")

	self.ids = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end
end

function ShopArtifactTable:getIds()
	return self.ids
end

function ShopArtifactTable:getRank(id)
	return self:getNumber(id, "rank")
end

return ShopArtifactTable
