-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GiftBagTable.lua

local GiftBagTable = class("GiftBagTable", import("app.common.tables.BaseTable"))

function GiftBagTable:ctor()
	GiftBagTable.super.ctor(self, "giftbag")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function GiftBagTable:getIDs()
	return self.ids_
end

function GiftBagTable:getCharge(id)
	return self:getNumber(id, "charge")
end

function GiftBagTable:getCurrency(id)
	return self:getString(id, "currency")
end

function GiftBagTable:getRank(id)
	return self:getNumber(id, "rank")
end

function GiftBagTable:getDiamond(id)
	return self:getNumber(id, "diamond")
end

function GiftBagTable:getExtraDiamond(id)
	return self:getNumber(id, "extra_diamond")
end

function GiftBagTable:getFirstChargeDiamond(id)
	return self:split2Cost(id, "first_extra_diamond", "#")
end

function GiftBagTable:getVipExp(id)
	return self:getNumber(id, "vip_exp")
end

function GiftBagTable:getDailyDiamond(id)
	return self:split2Cost(id, "daily_diamond", "#")
end

function GiftBagTable:getDays(id)
	return self:getNumber(id, "days")
end

function GiftBagTable:getIcon(id)
	return self:getString(id, "icon")
end

function GiftBagTable:getGiftID(id)
	return self:getNumber(id, "gift_id")
end

function GiftBagTable:getBuyLimit(id)
	return self:getNumber(id, "limit_times")
end

function GiftBagTable:getActivityID(id)
	return self:getNumber(id, "activity_id")
end

function GiftBagTable:getPrice(id)
	return self:getNumber(id, "price")
end

function GiftBagTable:getLastTime(id)
	return self:getNumber(id, "last_time")
end

function GiftBagTable:getParams(id)
	return self:split2num(id, "parameter", "|")
end

function GiftBagTable:getGiftType(id)
	if id == 302 then
		return 1
	end

	return self:getNumber(id, "giftbag_type")
end

function GiftBagTable:getTokenAmount(id)
	return self:getNumber(id, "token_amount")
end

function GiftBagTable:getParamVIP(id)
	return self:getString(id, "parameter_vip")
end

function GiftBagTable:isNeedReview(id)
	return self:getNumber(id, "need_review") == 1
end

function GiftBagTable:getCD(id)
	return self:getNumber(id, "cd")
end

function GiftBagTable:getMailId(id)
	return self:getNumber(id, "mail_id")
end

return GiftBagTable
