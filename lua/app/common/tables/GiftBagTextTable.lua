-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GiftBagTextTable.lua

local GiftBagTextTable = class("GiftBagTextTable", import("app.common.tables.BaseTable"))

function GiftBagTextTable:ctor()
	GiftBagTextTable.super.ctor(self, "giftbag_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}
end

function GiftBagTextTable:getName(id)
	return self:getString(id, "name")
end

function GiftBagTextTable:getCharge(id)
	if UNITY_IOS or UNITY_EDITOR then
		local checkValue = tonumber(xyd.tables.miscTable:getVal("ios_price_version"))

		if xyd.Global.IOS_PRICE_VERSION then
			if checkValue >= xyd.Global.IOS_PRICE_VERSION then
				return self:getNumber(id, "charge_ios")
			else
				return self:getNumber(id, "charge_ios_new")
			end
		else
			return self:getNumber(id, "charge_ios")
		end
	end

	return self:getNumber(id, "charge")
end

function GiftBagTextTable:getCurrency(id)
	return self:getString(id, "currency")
end

function GiftBagTextTable:getShowName(id)
	return self:getString(id, "show_name")
end

return GiftBagTextTable
