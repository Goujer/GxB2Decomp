-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/GiftbagPushController2.lua

local BaseController = import(".BaseController")
local GiftbagPushController2 = class("GiftbagPushController2", import(".BaseController"))

function GiftbagPushController2:ctor()
	GiftbagPushController2.super.ctor(self)

	self.win_list_ = {
		"main_window"
	}
	self.month_card_flag_ = false
	self.subscription_flag_ = false
	self.fundation_flag_ = false
	self.vip_flag_ = false
	self.first_recharge_flag_ = false
	self.data_ = {}
	self.timeout_id_list_ = {}
	self.wait_to_open_ = 0

	self:onRegister()
	self:levUp()
	self:vipUp()
end

function GiftbagPushController2:month_card_flag(value)
	self.month_card_flag_ = value
end

function GiftbagPushController2.get()
	if not GiftbagPushController2.INSTANCE then
		GiftbagPushController2.INSTANCE = GiftbagPushController2.new()
	end

	return GiftbagPushController2.INSTANCE
end

function GiftbagPushController2:reset()
	if GiftbagPushController2.INSTANCE then
		GiftbagPushController2.super.reset(self)

		local list = GiftbagPushController2.INSTANCE.timeout_id_list_

		for i in pairs(list) do
			xyd.removeGlobalTimer(list[i])
		end
	end
end

function GiftbagPushController2:onRegister()
	GiftbagPushController2.super.onRegister(self)
	self.eventProxy_:addEventListener(xyd.event.WINDOW_WILL_OPEN, handler(self, self.onWindowOpen))
	self.eventProxy_:addEventListener(xyd.event.WINDOW_WILL_CLOSE, handler(self, self.onWindowClose))
	self.eventProxy_:addEventListener(xyd.event.LEV_CHANGE, function(event)
		self:levUp(event.data)
	end)
	self.eventProxy_:addEventListener(xyd.event.ITEM_CHANGE, handler(self, self.vipUp))
	self.eventProxy_:addEventListener(xyd.event.POPUP_GET_INFO, function(event)
		local data = xyd.decodeProtoBuf(event.data)
		local list = data.popup_infos

		list = list or {}

		for i in pairs(list) do
			local id = list[i].popup_id

			self.data_[id] = list[i]
		end

		do
			local i = 0

			while i < 5 do
				local cur_record_buy_times

				cur_record_buy_times = (not self.data_[i] or not self.data_[i].buy_times or self.data_[i].buy_times == 0) and 0 or self.data_[i].buy_times

				if i == xyd.PopupType.MONTH_CARD then
					local month_card_data = xyd.models.activity:getActivity(xyd.ActivityID.MONTH_CARD)

					if month_card_data and month_card_data.detail then
						local buy_times = month_card_data.detail.buy_times

						buy_times = buy_times or 0

						local days = month_card_data:getDays()

						if cur_record_buy_times < buy_times and days <= 0 then
							self:clearRecord(i, buy_times)
						end
					end
				elseif i == xyd.PopupType.SUBSCRIPTION then
					local subscription_data = xyd.models.activity:getActivity(xyd.ActivityID.SUBSCRIPTION)

					if subscription_data and subscription_data.detail then
						local buy_times = subscription_data.detail.buy_times
						local end_time = subscription_data.detail.end_time

						if cur_record_buy_times < buy_times and end_time <= xyd.getServerTime() then
							self:clearRecord(i, buy_times)
						end
					end
				end

				i = i + 1
			end
		end

		if self:canOpen() then
			self:checkOpen()
		end
	end)
	xyd.Backend.get():request(xyd.mid.POPUP_GET_INFO)
end

function GiftbagPushController2:getWinList()
	return self.win_list_
end

function GiftbagPushController2:onWindowOpen(event)
	local win_name = event.params.windowName

	if win_name == "float_message_window2" or win_name == "float_message_window2" then
		return
	end

	table.insert(self.win_list_, win_name)
end

function GiftbagPushController2:onWindowClose(event)
	local win_name = event.params.windowName
	local ind = xyd.arrayIndexOf(self.win_list_, win_name)

	if ind == -1 then
		return
	end

	table.remove(self.win_list_, ind)

	local loading_ind = xyd.arrayIndexOf(self.win_list_, "loading_window")

	if loading_ind ~= -1 then
		table.remove(self.win_list_, loading_ind)
	end

	if not self.win_list_ or not #self.win_list_ then
		return
	end

	if win_name == "month_card_push_window" then
		return
	end

	if self.win_list_[1] == "main_window" and #self.win_list_ == 1 and win_name ~= "func_open_window" and win_name ~= "guide_window" then
		self:checkOpen()
	elseif win_name == "guide_window" then
		local guide_window = xyd.WindowManager.get():getWindow("guide_window")

		if guide_window then
			local guide_id = guide_window:getGuideId()

			if guide_id == 89 then
				self.month_card_flag_ = true
				self.first_recharge_flag_ = true
			end
		end
	end
end

function GiftbagPushController2:canOpen()
	if not xyd.GuideController.get():isGuideComplete() or not xyd.models.selfPlayer:isKaimenPlayed() or xyd.models.selfPlayer:ifCallback() and not xyd.models.selfPlayer:ifCallbackAwarded() or xyd.GuideController.get():isPlayGuide() or not self:checkFuncsComplete() or xyd.MainController.get().openPopWindowNum > 0 then
		return false
	end

	if xyd.Global.lang ~= "ja_jp" then
		return false
	end

	return true
end

function GiftbagPushController2:checkOpen()
	if not self:canOpen() then
		return
	end

	self.wait_to_open_ = 0

	if self.month_card_flag_ then
		self:openMonthCard()
	end

	if self.subscription_flag_ then
		self:openSubscription()
	end

	if self.vip_flag_ then
		self:openVip()
	end

	self:openWindow()
end

function GiftbagPushController2:getWaitToOpenCount()
	local count = 0

	do
		local i = 0

		while i < 5 do
			if xyd.andOp(xyd.lShiftOp(1, i), self.wait_to_open_) ~= 0 then
				count = count + 1
			end

			i = i + 1
		end
	end

	return count
end

function GiftbagPushController2:levUp(data)
	local cur_lev = xyd.models.backpack:getLev()

	if cur_lev >= 26 then
		self.month_card_flag_ = true
		self.first_recharge_flag_ = true
	end

	if cur_lev >= 30 then
		self.subscription_flag_ = true
	end

	if cur_lev >= 40 and (cur_lev % 10 == 0 or cur_lev >= 60) then
		self.fundation_flag_ = true
	end

	local vip = xyd.models.backpack:getVipLev()

	if cur_lev >= 32 and vip < 3 then
		self.vip_flag_ = true
	end

	if data then
		local new_lev = data.newLev
		local old_lev = data.oldLev
		local has = false

		do
			local i = new_lev

			while i <= old_lev do
				if i % 10 == 0 then
					has = true
				end

				i = i + 1
			end
		end

		if has and new_lev >= 40 then
			self.fundation_flag_ = true
		end
	end
end

function GiftbagPushController2:vipUp()
	local vip = xyd.models.backpack:getVipLev()
	local lv = xyd.models.backpack:getLev()

	if lv >= 32 and vip < 3 then
		self.vip_flag_ = true
	end
end

function GiftbagPushController2:clickGoldEgg()
	local vip = xyd.models.backpack:getVipLev()

	if vip < 3 then
		self.vip_flag_ = true
	end
end

function GiftbagPushController2:checkHasMonthCard()
	local month_card_data = xyd.models.activity:getActivity(xyd.ActivityID.MONTH_CARD)

	if not month_card_data then
		return true
	end

	if month_card_data and month_card_data:getDays() > 0 then
		return true
	end

	local min_month_card_data = xyd.models.activity:getActivity(xyd.ActivityID.MINI_MONTH_CARD)

	if min_month_card_data and min_month_card_data:getDays() > 0 then
		return true
	end

	return false
end

function GiftbagPushController2:checkHasSubscription()
	local subscription_data = xyd.models.activity:getActivity(xyd.ActivityID.SUBSCRIPTION)

	if not subscription_data then
		return true
	end

	if subscription_data.detail.end_time > xyd.getServerTime() then
		return true
	end

	return false
end

function GiftbagPushController2:checkHasFundation()
	local fundation_data = xyd.models.activity:getActivity(xyd.ActivityID.LEVEL_FUND)

	if not fundation_data then
		return true
	end

	if fundation_data.detail.charges[1].buy_times >= fundation_data.detail.charges[1].limit_times then
		return true
	else
		return false
	end
end

function GiftbagPushController2:checkHasFirstRecharge()
	local recharge_data = xyd.models.activity:getActivity(xyd.ActivityID.FIRST_RECHARGE)

	if not recharge_data then
		return true
	end

	if recharge_data.detail.can_award or recharge_data.detail.is_awarded then
		return true
	end

	return false
end

function GiftbagPushController2:checkVip()
	local vip = xyd.models.backpack:getVipLev()

	if vip >= 3 then
		return false
	end

	return true
end

function GiftbagPushController2:openWindow()
	local count = self:getWaitToOpenCount()

	if count == 0 then
		return
	end

	local open_month = self:checkActive(xyd.PopupType.MONTH_CARD)
	local open_sub = self:checkActive(xyd.PopupType.SUBSCRIPTION)
	local open_first = false
	local open_vip = self:checkActive(xyd.PopupType.VIP)
	local open_fund = false
	local list = {}

	if not open_month then
		if open_sub and not open_fund then
			table.insert(list, xyd.ActivityID.SUBSCRIPTION)
		elseif open_sub and open_fund then
			table.insert(list, xyd.ActivityID.MONTH_CARD)
			table.insert(list, xyd.ActivityID.MINI_MONTH_CARD)
			table.insert(list, xyd.ActivityID.SUBSCRIPTION)
		elseif not open_sub and open_fund then
			-- block empty
		elseif not open_sub and not open_fund and open_vip then
			table.insert(list, -1)
		end
	elseif (open_fund or open_sub) and (not open_fund or true) then
		table.insert(list, xyd.ActivityID.MONTH_CARD)
		table.insert(list, xyd.ActivityID.MINI_MONTH_CARD)
		table.insert(list, xyd.ActivityID.SUBSCRIPTION)
	elseif open_first then
		table.insert(list, xyd.ActivityID.MONTH_CARD)
		table.insert(list, xyd.ActivityID.MINI_MONTH_CARD)
	else
		table.insert(list, xyd.ActivityID.MONTH_CARD)
		table.insert(list, xyd.ActivityID.MINI_MONTH_CARD)
	end

	if not list or #list == 0 then
		return
	end

	xyd.WindowManager.get():openWindow("month_card_push_window", {
		list = list
	})
end

function GiftbagPushController2:openMonthCard()
	if self:checkHasMonthCard() then
		return
	end

	if not self.data_[xyd.PopupType.MONTH_CARD] or not self.data_[xyd.PopupType.MONTH_CARD].times or self.data_[xyd.PopupType.MONTH_CARD] and self.data_[xyd.PopupType.MONTH_CARD].times and self.data_[xyd.PopupType.MONTH_CARD].times == 0 then
		self:doOpenMonthCard()
		self:setRecord(xyd.PopupType.MONTH_CARD, 1)
		self:addTimeOut(function()
			self.subscription_flag_ = true
		end)
	else
		local times = self.data_[xyd.PopupType.MONTH_CARD].times
		local last_time = self.data_[xyd.PopupType.MONTH_CARD].time
		local interval = xyd.tables.miscTable:split2num("giftbag_japan_interval", "value", "|")
		local add_t = interval[math.min(2, times - 1) + 1] * 24 * 60 * 60
		local nxt_time = last_time + add_t

		if nxt_time <= xyd.getServerTime() then
			self:doOpenMonthCard()
			self:setRecord(xyd.PopupType.MONTH_CARD, times + 1)
		end
	end
end

function GiftbagPushController2:doOpenMonthCard()
	self.month_card_flag_ = false
	self.wait_to_open_ = xyd.orOp(self.wait_to_open_, xyd.lShiftOp(1, xyd.PopupType.MONTH_CARD))
end

function GiftbagPushController2:openSubscription()
	if self:checkHasSubscription() then
		return
	end

	if not self.data_[xyd.PopupType.SUBSCRIPTION] or not self.data_[xyd.PopupType.SUBSCRIPTION].times or self.data_[xyd.PopupType.SUBSCRIPTION] and self.data_[xyd.PopupType.SUBSCRIPTION].times and self.data_[xyd.PopupType.SUBSCRIPTION].times == 0 then
		self:doOpenSubscription()
		self:setRecord(xyd.PopupType.SUBSCRIPTION, 1)
	else
		local times = self.data_[xyd.PopupType.SUBSCRIPTION].times

		if times >= 3 then
			return
		end

		if times < 1 then
			times = 1
		end

		local last_time = self.data_[xyd.PopupType.SUBSCRIPTION].time
		local interval = xyd.tables.miscTable:split2num("giftbag_japan_interval", "value", "|")
		local add_t = interval[math.min(2, times - 1) + 1] * 24 * 60 * 60
		local nxt_time = last_time + add_t

		if nxt_time <= xyd.getServerTime() then
			self:doOpenSubscription()
			self:setRecord(xyd.PopupType.SUBSCRIPTION, times + 1)
		end
	end
end

function GiftbagPushController2:doOpenSubscription()
	self.subscription_flag_ = false
	self.wait_to_open_ = xyd.orOp(self.wait_to_open_, xyd.lShiftOp(1, xyd.PopupType.SUBSCRIPTION))
end

function GiftbagPushController2:openFundation()
	if self:checkHasFundation() then
		return
	end

	if not self.data_[xyd.PopupType.FUNDATION] or not self.data_[xyd.PopupType.FUNDATION].times or self.data_[xyd.PopupType.FUNDATION] and self.data_[xyd.PopupType.FUNDATION].times and self.data_[xyd.PopupType.FUNDATION].times == 0 then
		self:doOpenFundation()
		self:setRecord(xyd.PopupType.FUNDATION, 1)
	else
		local times = self.data_[xyd.PopupType.FUNDATION].times
		local last_time = self.data_[xyd.PopupType.FUNDATION].time
		local interval = xyd.tables.miscTable:split2num("giftbag_japan_interval", "value", "|")
		local add_t = interval[math.min(2, times - 1) + 1] * 24 * 60 * 60
		local nxt_time = last_time + add_t

		if nxt_time <= xyd.getServerTime() then
			self:doOpenFundation()
			self:setRecord(xyd.PopupType.FUNDATION, times + 1)
		end
	end
end

function GiftbagPushController2:doOpenFundation()
	self.fundation_flag_ = false
	self.wait_to_open_ = xyd.orOp(self.wait_to_open_, xyd.lShiftOp(1, xyd.PopupType.FUNDATION))
end

function GiftbagPushController2:openVip()
	if not self:checkVip() then
		return
	end

	if not self.data_[xyd.PopupType.VIP] or not self.data_[xyd.PopupType.VIP].times or self.data_[xyd.PopupType.VIP] and self.data_[xyd.PopupType.VIP].times and self.data_[xyd.PopupType.VIP].times == 0 then
		self:doOpenVip()
		self:setRecord(xyd.PopupType.VIP, 1)
	else
		local times = self.data_[xyd.PopupType.VIP].times
		local last_time = self.data_[xyd.PopupType.VIP].time
		local interval = 7
		local add_t = interval * 24 * 60 * 60
		local nxt_time = last_time + add_t

		if nxt_time <= xyd.getServerTime() then
			self:doOpenVip()
			self:setRecord(xyd.PopupType.VIP, times + 1)
		end
	end
end

function GiftbagPushController2:doOpenVip()
	self.vip_flag_ = false
	self.wait_to_open_ = xyd.orOp(self.wait_to_open_, xyd.lShiftOp(1, xyd.PopupType.VIP))
end

function GiftbagPushController2:openFirstRecharge()
	if self:checkHasFirstRecharge() then
		return
	end

	if not self.data_[xyd.PopupType.FIRST_RECHARGE] or not self.data_[xyd.PopupType.FIRST_RECHARGE].times or self.data_[xyd.PopupType.FIRST_RECHARGE] and self.data_[xyd.PopupType.FIRST_RECHARGE].times and self.data_[xyd.PopupType.FIRST_RECHARGE].times == 0 then
		self:doOpenFirstRecharge()
		self:setRecord(xyd.PopupType.FIRST_RECHARGE, 1)
	else
		local times = self.data_[xyd.PopupType.FIRST_RECHARGE].times
		local last_time = self.data_[xyd.PopupType.FIRST_RECHARGE].time
		local interval = xyd.tables.miscTable:split2num("giftbag_japan_interval", "value", "|")
		local add_t = interval[math.min(2, times - 1) + 1] * 24 * 60 * 60
		local nxt_time = last_time + add_t

		if nxt_time <= xyd.getServerTime() then
			self:doOpenFirstRecharge()
			self:setRecord(xyd.PopupType.FIRST_RECHARGE, times + 1)
		end
	end
end

function GiftbagPushController2:doOpenFirstRecharge()
	self.first_recharge_flag_ = false
	self.wait_to_open_ = xyd.orOp(self.wait_to_open_, xyd.lShiftOp(1, xyd.PopupType.FIRST_RECHARGE))
end

function GiftbagPushController2:setRecord(id, times)
	local activity_id

	if id == xyd.PopupType.MONTH_CARD then
		activity_id = xyd.ActivityID.MONTH_CARD
	elseif id == xyd.PopupType.SUBSCRIPTION then
		activity_id = xyd.ActivityID.SUBSCRIPTION
	else
		activity_id = 0
	end

	local buy_times = 0

	if activity_id then
		local data = xyd.models.activity:getActivity(activity_id)

		if data and data.detail and data.detail.buy_times then
			buy_times = data.detail.buy_times
		elseif data and data.detail.charges and data.detail.charges[1].buy_times then
			buy_times = data.detail.charges[1].buy_times
		end
	end

	self.data_[id] = {
		popup_id = id,
		times = times,
		time = xyd.getServerTime(),
		buy_times = buy_times
	}

	local msg = messages_pb:popup_set_info_req()

	msg.popup_id = id
	msg.times = times
	msg.buy_times = buy_times

	xyd.Backend.get():request(xyd.mid.POPUP_SET_INFO, msg)
end

function GiftbagPushController2:openMultiWindow(list)
	for i in pairs(list) do
		local id = list[i]

		if id == xyd.PopupType.MONTH_CARD then
			self.month_card_flag_ = true
		elseif id == xyd.PopupType.FUNDATION then
			self.fundation_flag_ = true
		elseif id == xyd.PopupType.FIRST_RECHARGE then
			self.first_recharge_flag_ = true
		elseif id == xyd.PopupType.SUBSCRIPTION then
			self.subscription_flag_ = true
		elseif id == xyd.PopupType.VIP then
			self.vip_flag_ = true
		end
	end
end

function GiftbagPushController2:clearRecord(id, buy_times)
	self.data_[id] = {
		times = 0,
		popup_id = id,
		time = xyd.getServerTime(),
		buy_times = buy_times
	}

	local msg = messages_pb:popup_set_info_req()

	msg.popup_id = id
	msg.times = 0
	msg.buy_times = buy_times

	xyd.Backend.get():request(xyd.mid.POPUP_SET_INFO, msg)
end

function GiftbagPushController2:checkActive(type)
	if xyd.andOp(self.wait_to_open_, (xyd.lShiftOp(1, type))) ~= 0 then
		return true
	end

	return false
end

function GiftbagPushController2:addTimeOut(callback)
	local time = 600000
	local id = -1

	local function timeFun()
		if callback then
			callback()
		end

		table.remove(self.timeout_id_list_, xyd.arrayIndexOf(self.timeout_id_list_, id))
	end

	id = xyd.addGlobalTimer(timeFun, time, 1)

	table.insert(self.timeout_id_list_, id)
end

function GiftbagPushController2:checkFuncsComplete()
	local ids = xyd.GuideController.get():getFuncIDs()
	local funcID = -1
	local curGuideRank = -1

	do
		local i = #ids

		while i >= 1 do
			do
				local id = ids[i]

				if xyd.Global.isReview == 1 and not xyd.tables.functionTable:openInReview(id) then
					-- block empty
				else
					local guideRank = xyd.tables.functionTable:guideRank(id)

					if xyd.arrayIndexOf(xyd.GuideController.get().funcIDs_, id) == -1 and curGuideRank <= guideRank then
						curGuideRank = guideRank
						funcID = id
					end
				end
			end

			i = i - 1
		end
	end

	if funcID > 0 then
		return false
	end

	return true
end

return GiftbagPushController2
