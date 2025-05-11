-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulLandEquip2GachaTable.lua

local SoulLandEquip2GachaTable = class("SoulLandEquip2GachaTable", import("app.common.tables.BaseTable"))

function SoulLandEquip2GachaTable:ctor()
	SoulLandEquip2GachaTable.super.ctor(self, "soul_land_equip2_gacha")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulLandEquip2GachaTable:getIDs()
	return self.ids_
end

function SoulLandEquip2GachaTable:getSummonNum(id)
	return self:getNumber(id, "summon_num")
end

function SoulLandEquip2GachaTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function SoulLandEquip2GachaTable:getExp(id)
	return self:getNumber(id, "exp")
end

function SoulLandEquip2GachaTable:getDropboxType(id)
	return self:getNumber(id, "dropbox_type")
end

return SoulLandEquip2GachaTable
