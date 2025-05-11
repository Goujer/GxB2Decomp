-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseFurnitureTable.lua

local HouseFurnitureTable = class("HouseFurnitureTable", import("app.common.tables.BaseTable"))
local ShopHouseFurnitureTable = xyd.tables.shopHouseFurnitureTable

function HouseFurnitureTable:ctor()
	HouseFurnitureTable.super.ctor(self, "house_furniture")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function HouseFurnitureTable:getIDs()
	return self.ids_
end

function HouseFurnitureTable:getName(id)
	return self:getString(id, "name")
end

function HouseFurnitureTable:groupId(id)
	return self:getNumber(id, "group_id")
end

function HouseFurnitureTable:type(id)
	return self:getNumber(id, "type")
end

function HouseFurnitureTable:specialType(id)
	return self:getNumber(id, "special_type")
end

function HouseFurnitureTable:getImg(id)
	return self:split(id, "img", "|")
end

function HouseFurnitureTable:interactImg(id)
	return self:split(id, "interact_img", "|")
end

function HouseFurnitureTable:getFurnitureFloor(id)
	return self:split2num(id, "furniture_floor", "|")
end

function HouseFurnitureTable:getFlipImg(id)
	return self:split(id, "flip_img", "|")
end

function HouseFurnitureTable:posOffset(id)
	return self:split2num(id, "pos_offset", "|")
end

function HouseFurnitureTable:floor(id)
	return self:getNumber(id, "floor")
end

function HouseFurnitureTable:placeFloor(id)
	return self:split2num(id, "place_floor", "|")
end

function HouseFurnitureTable:canPile(id)
	return self:getNumber(id, "can_pile") == 1
end

function HouseFurnitureTable:canBePile(id)
	return self:getNumber(id, "can_be_pile") == 1
end

function HouseFurnitureTable:gridType(id)
	return self:split2num(id, "grid_type", "|")
end

function HouseFurnitureTable:area(id)
	if next(self:split2num(id, "area", "|")) then
		return self:split2num(id, "area", "|")
	end

	return {
		0,
		0
	}
end

function HouseFurnitureTable:getArea(id)
	return self:split2num(id, "area", "|")
end

function HouseFurnitureTable:height(id)
	return self:getNumber(id, "height")
end

function HouseFurnitureTable:canFlip(id)
	return self:getNumber(id, "can_flip") == 1
end

function HouseFurnitureTable:pileLimitStart(id)
	return self:split2num(id, "pile_limit_start", "|")
end

function HouseFurnitureTable:pileArea(id)
	return self:split2num(id, "pile_area", "|")
end

function HouseFurnitureTable:comfort(id)
	return self:getNumber(id, "comfort")
end

function HouseFurnitureTable:price(id)
	return ShopHouseFurnitureTable:costByItemID(id)
end

function HouseFurnitureTable:limit(id)
	return ShopHouseFurnitureTable:limitByItemID(id)
end

function HouseFurnitureTable:interact(id)
	return self:getNumber(id, "interact")
end

function HouseFurnitureTable:interactFlip(id)
	return self:split2num(id, "interact_flip", "#")
end

function HouseFurnitureTable:pointXy(id)
	return self:split(id, "point_xy", "#")
end

function HouseFurnitureTable:pileOffset(id)
	return self:split2num(id, "pile_offset", "|")
end

function HouseFurnitureTable:effectType(id)
	return self:getString(id, "effect_type")
end

function HouseFurnitureTable:imgSetType(id)
	return self:getNumber(id, "img_set_type")
end

function HouseFurnitureTable:furnitureEffectIdle(id)
	return self:getNumber(id, "furniture_effect_idle")
end

function HouseFurnitureTable:furnitureEffectInteract(id)
	return self:getNumber(id, "furniture_effect_interact")
end

function HouseFurnitureTable:getCollectionImg(id)
	return self:split(id, "collection_img", "|")
end

function HouseFurnitureTable:getImgScale(id)
	return self:getNumber(id, "collection_img_scale")
end

return HouseFurnitureTable
