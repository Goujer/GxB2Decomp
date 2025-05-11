-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityShelterGiftBagTable.lua

local ActivityShelterGiftBagTable = class("ActivityShelterGiftBagTable", import("app.common.tables.BaseTable"))

function ActivityShelterGiftBagTable:ctor()
	ActivityShelterGiftBagTable.super.ctor(self, "activity_shelter")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityShelterGiftBagTable:getIDs()
	return self.ids_
end

function ActivityShelterGiftBagTable:getPartner(id)
	return self:getNumber(id, "show_partner")
end

function ActivityShelterGiftBagTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityShelterGiftBagTable:getHeroCost(id)
	return self:split2Cost(id, "partner_cost", "|#")
end

function ActivityShelterGiftBagTable:getItemCost(id)
	return self:split2Cost(id, "item_cost", "|#")
end

function ActivityShelterGiftBagTable:getBg(id)
	return self:getString(id, "bg_source")
end

function ActivityShelterGiftBagTable:getFx(id)
	return self:getString(id, "show_fx")
end

function ActivityShelterGiftBagTable:getPicXY(id)
	return self:split2num(id, "partner_picture_xy", "#")
end

function ActivityShelterGiftBagTable:getPicScale(id)
	return self:getNumber(id, "partner_picture_scale")
end

function ActivityShelterGiftBagTable:getPicOffset(id)
	return self:split2num(id, "partner_picture_offset", "#")
end

function ActivityShelterGiftBagTable:getPicOffset2(id)
	return self:split2num(id, "partner_picture_offset_unity", "#")
end

return ActivityShelterGiftBagTable
