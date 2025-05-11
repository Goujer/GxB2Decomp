-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/GiftbagPushControllerSpecail.lua

local GiftbagPushControllerSpecail = class("GiftbagPushControllerSpecail", import(".BaseController"))

function GiftbagPushControllerSpecail:ctor(...)
	GiftbagPushControllerSpecail.super.ctor(self, ...)

	self.win_list_ = {}
	self.month_card_flag_ = false
	self.subscription_flag_ = false
	self.fundation_flag_ = false
	self.vip_flag_ = false
	self.first_recharge_flag_ = false
	self.data_ = {}

	self:onRegister()

	self.popTypeIndexList = {
		"TRIAL",
		"DUNGEON",
		"LEVEL_FOUND",
		"TOWER_FOUND",
		"NEW_FIRST_RECHARGE"
	}

	for i in pairs(POPUP_TYPE) do
		local localState = xyd.db.misc:getValue(POPUP_TYPE[i].saveName)

		if localState ~= nil then
			POPUP_TYPE[i].localStateComplete = true
		end

		if i == xyd.POPUP_STATE.TRIAL then
			self:checkTrialOpen()
		end

		if i == xyd.POPUP_STATE.NEW_FIRST_RECHARGE then
			self:checkNewFirtRechargePop()
		end
	end

	self.isJumping = false
end

return GiftbagPushControllerSpecail
