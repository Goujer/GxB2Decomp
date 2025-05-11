-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulLandEquip2DropboxTable.lua

local SoulLandEquip2DropboxTable = class("SoulLandEquip2DropboxTable", import("app.common.tables.BaseTable"))

function SoulLandEquip2DropboxTable:ctor()
	SoulLandEquip2DropboxTable.super.ctor(self, "soul_land_equip2_dropbox")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulLandEquip2DropboxTable:getIDs()
	return self.ids_
end

function SoulLandEquip2DropboxTable:getNextId(id)
	return self:getNumber(id, "next_id")
end

function SoulLandEquip2DropboxTable:getExp(id)
	return self:getNumber(id, "exp")
end

function SoulLandEquip2DropboxTable:getEquip2(id)
	return self:split2Cost(id, "equip2", "|", true)
end

function SoulLandEquip2DropboxTable:getWeight1(id)
	return self:split2Cost(id, "weight1", "|", true)
end

function SoulLandEquip2DropboxTable:getWeight2(id)
	return self:split2Cost(id, "weight2", "|", true)
end

return SoulLandEquip2DropboxTable
