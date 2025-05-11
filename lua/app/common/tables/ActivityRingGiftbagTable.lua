-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityRingGiftbagTable.lua

local ActivityRingGiftbagTable = class("ActivityRingGiftbagTable", import("app.common.tables.BaseTable"))

function ActivityRingGiftbagTable:ctor()
	ActivityRingGiftbagTable.super.ctor(self, "activity_ring_giftbag")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityRingGiftbagTable:getIds()
	return self.ids_
end

function ActivityRingGiftbagTable:getLogoSide(id)
	return self:getNumber(id, "logo_side")
end

function ActivityRingGiftbagTable:getLogoScale(id)
	return self:getNumber(id, "logo_scale")
end

function ActivityRingGiftbagTable:getBuySide(id)
	return self:getNumber(id, "buy_side")
end

function ActivityRingGiftbagTable:getModel(id)
	return self:getString(id, "model")
end

function ActivityRingGiftbagTable:getTimeY(id)
	return self:getNumber(id, "time_y")
end

function ActivityRingGiftbagTable:getModelXY(id)
	return self:split2num(id, "model_xy", "|")
end

function ActivityRingGiftbagTable:getModelScale(id)
	return self:getNumber(id, "model_scale")
end

function ActivityRingGiftbagTable:getImgFront(id)
	return self:getString(id, "img_front")
end

function ActivityRingGiftbagTable:getImgBehind(id)
	return self:getString(id, "img_behind")
end

function ActivityRingGiftbagTable:getImgBg(id)
	return self:getString(id, "img_bg")
end

function ActivityRingGiftbagTable:getItemId(id)
	return self:getNumber(id, "item_id")
end

function ActivityRingGiftbagTable:getModelSide(id)
	return self:getNumber(id, "model_side")
end

return ActivityRingGiftbagTable
