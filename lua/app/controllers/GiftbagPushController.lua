-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/GiftbagPushController.lua

local GiftbagPushController = class("GiftbagPushController", import(".BaseController"))
local POPUP_TYPE = {
	TRIAL = {
		id = 1,
		localStateComplete = false,
		saveName = "trial_pop_window_type",
		state = false
	},
	DUNGEON = {
		id = 2,
		localStateComplete = false,
		saveName = "dungeon_pop_window_type",
		state = false
	},
	LEVEL_FOUND = {
		id = 10,
		localStateComplete = false,
		saveName = "level_found_pop_window_type",
		state = true
	},
	TOWER_FOUND = {
		id = 11,
		localStateComplete = false,
		saveName = "tower_found_pop_window_type",
		state = true
	},
	TULIN_GROWUP_GIFTBAG = {
		id = 30,
		localStateComplete = false,
		saveName = "gropup_pop_up_window_check",
		state = false
	},
	NEWBEE_FUND = {
		id = 40,
		localStateComplete = false,
		saveName = "newbee_fund_popup_check",
		state = true
	},
	NEWBEE_FUND3 = {
		id = 42,
		localStateComplete = false,
		saveName = "newbee_fund3_popup_check",
		state = true
	},
	ACTIVITY_RESIDENT_RETURN = {
		id = 41,
		localStateComplete = false,
		saveName = "activity_resident_return",
		state = true
	}
}

xyd.POPUP_STATE = {
	LEVEL_FOUND = "LEVEL_FOUND",
	NEWBEE_FUND = "NEWBEE_FUND",
	DUNGEON = "DUNGEON",
	TULIN_GROWUP_GIFTBAG = "TULIN_GROWUP_GIFTBAG",
	NEWBEE_FUND3 = "NEWBEE_FUND3",
	ACTIVITY_RESIDENT_RETURN = "ACTIVITY_RESIDENT_RETURN",
	TRIAL = "TRIAL",
	TOWER_FOUND = "TOWER_FOUND"
}

function GiftbagPushController:ctor(...)
	GiftbagPushController.super.ctor(self, ...)

	self.win_list_ = {}
	self.pushList = {
		77,
		76,
		82,
		81,
		78,
		79,
		107,
		110,
		111,
		151,
		152,
		153,
		154,
		215,
		241
	}

	self:onRegister()

	self.popTypeIndexList = {
		"TRIAL",
		"DUNGEON",
		"LEVEL_FOUND",
		"TOWER_FOUND",
		"TULIN_GROWUP_GIFTBAG",
		"NEWBEE_FUND",
		"NEWBEE_FUND3",
		"ACTIVITY_RESIDENT_RETURN"
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

		if i == xyd.POPUP_STATE.TULIN_GROWUP_GIFTBAG then
			self:checkGropupRechargePop(localState)
		end

		if i == xyd.POPUP_STATE.NEWBEE_FUND then
			self:checkNewbeePop(localState)
		end

		if i == xyd.POPUP_STATE.NEWBEE_FUND3 then
			self:checkNewbee3Pop(localState)
		end

		if i == xyd.POPUP_STATE.ACTIVITY_RESIDENT_RETURN then
			self:checkActivityResidentReturn()
		end
	end

	self.isJumping = false
end

function GiftbagPushController.get()
	if not GiftbagPushController.INSTANCE then
		GiftbagPushController.INSTANCE = GiftbagPushController.new()
	end

	return GiftbagPushController.INSTANCE
end

function GiftbagPushController:insertWindow(winName)
	table.insert(self.win_list_, winName)
end

function GiftbagPushController:onRegister()
	GiftbagPushController.super.onRegister(self)
	self.eventProxy_:addEventListener(xyd.event.WINDOW_WILL_OPEN, handler(self, self.onWindowOpen))
	self.eventProxy_:addEventListener(xyd.event.WINDOW_WILL_CLOSE, handler(self, self.onWindowClose))
	self.eventProxy_:addEventListener(xyd.event.LEV_CHANGE, handler(self, function()
		self:checkTrialOpen()
	end))
end

function GiftbagPushController:onWindowOpen(event)
	local windowName = event.params.windowName

	if windowName == "float_message_window2" or windowName == "float_message_window2" then
		return
	end

	table.insert(self.win_list_, windowName)
end

function GiftbagPushController:onWindowClose(event)
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

	if not self.win_list_ or #self.win_list_ <= 0 then
		return
	end

	if win_name == "month_card_push_window" then
		return
	end

	if self.win_list_[1] == "main_window" and #self.win_list_ == 1 and win_name ~= "func_open_window" and win_name ~= "guide_window" and not self.isJumping then
		self:checkOpen()
		xyd.models.functionOpen:onWindowClose()
	end
end

function GiftbagPushController:checkOpen()
	if not self:canOpen() then
		return
	end

	local params = {}
	local pushParams = xyd.models.activity:getLimitGiftParams()

	if pushParams and #pushParams > 0 then
		for j = #pushParams, 1, -1 do
			local param = pushParams[j]

			if param and param.activity_id and xyd.arrayIndexOf(self.pushList, tonumber(param.activity_id)) > 0 then
				table.insert(params, {
					activity_id = param.activity_id,
					giftbag_id = param.giftbag_id
				})
				xyd.models.activity:removeLimitGiftParams(param.giftbag_id)
			end
		end
	end

	if #params > 0 then
		table.sort(params, function(a, b)
			return xyd.arrayIndexOf(self.pushList, a.activity_id) < xyd.arrayIndexOf(self.pushList, b.activity_id)
		end)
		xyd.WindowManager.get():openWindow("push_activity_window", params)
	else
		self:checkIndependentPopUpWindow()
	end
end

function GiftbagPushController:canOpen()
	if not xyd.GuideController.get():isGuideComplete() or xyd.GuideController.get():isPlayGuide() or not self:checkFuncsComplete() or xyd.isIosTest() then
		return false
	end

	return true
end

function GiftbagPushController:checkFuncsComplete()
	local ids = xyd.GuideController.get():funcIDs()
	local funcID = -1
	local curGuideRank = -1

	if ids and #ids > 0 then
		for i = #ids, 1 do
			local id = ids[i]

			if xyd.Global.isReview == 1 and not xyd.tables.functionTable:openInReview(id) and xyd.arrayIndexOf(xyd.GuideController.get():funcIDs(), id) == -1 then
				-- block empty
			else
				local guideRank = xyd.tables.functionTable:guideRank(id)

				if xyd.arrayIndexOf(xyd.GuideController.get():funcIDs(), id) == -1 and curGuideRank <= guideRank then
					curGuideRank = guideRank
					funcID = id
				end
			end
		end
	end

	if funcID > 0 then
		return false
	end

	return true
end

function GiftbagPushController:checkIndependentPopUpWindow(popup_type)
	if xyd.MainController.get().openPopWindowNum > 0 then
		return
	end

	local type = -1

	if popup_type == nil then
		type = self.popTypeIndexList[1]

		if POPUP_TYPE[type].state == false or POPUP_TYPE[type].localStateComplete == true then
			type = self:checkIndependentNextType(type)
		end
	else
		type = self:checkIndependentNextType(popup_type)
	end

	if type == -1 then
		return
	end

	if type == xyd.POPUP_STATE.TRIAL then
		local privilegeData = xyd.models.activity:getActivity(xyd.ActivityID.PRIVILEGE_CARD)

		if privilegeData and privilegeData:isOpen() == true then
			-- block empty
		else
			self:checkIndependentPopUpWindow(xyd.POPUP_STATE.TRIAL)

			return
		end

		xyd.WindowManager.get():openWindow("privilege_card_activity_pop_up_window", {
			giftid = xyd.GIFTBAG_ID.PRIVILEGE_CARD_TRIAL
		})
		xyd.db.misc:setValue({
			value = "1",
			key = POPUP_TYPE[type].saveName
		})

		POPUP_TYPE[type].localStateComplete = true

		return
	end

	if type == xyd.POPUP_STATE.DUNGEON then
		local privilegeData = xyd.models.activity:getActivity(xyd.ActivityID.PRIVILEGE_CARD)

		if privilegeData and privilegeData:isOpen() == true then
			-- block empty
		else
			self:checkIndependentPopUpWindow(xyd.POPUP_STATE.DUNGEON)

			return
		end

		xyd.WindowManager.get():openWindow("privilege_card_activity_pop_up_window", {
			giftid = xyd.GIFTBAG_ID.PRIVILEGE_CARD_DUNGEON
		})
		xyd.db.misc:setValue({
			value = "1",
			key = POPUP_TYPE[type].saveName
		})

		POPUP_TYPE[type].localStateComplete = true

		return
	end

	if type == xyd.POPUP_STATE.LEVEL_FOUND then
		local giftbag = self:checkLevelFund()

		if giftbag then
			xyd.WindowManager.get():openWindow("foud_giftbag_push_window", giftbag)

			return
		else
			self:checkIndependentPopUpWindow(xyd.POPUP_STATE.LEVEL_FOUND)

			return
		end
	end

	if type == xyd.POPUP_STATE.TOWER_FOUND then
		local giftbag = self:checkTowerFund()

		if giftbag then
			xyd.WindowManager.get():openWindow("foud_giftbag_push_window", giftbag)

			return
		else
			self:checkIndependentPopUpWindow(xyd.POPUP_STATE.TOWER_FOUND)

			return
		end
	end

	if type == xyd.POPUP_STATE.NEW_FIRST_RECHARGE then
		xyd.WindowManager.get():openWindow("new_first_recharge_pop_up_window", {
			noCount = true
		})
		xyd.db.misc:setValue({
			value = "1",
			key = POPUP_TYPE[type].saveName
		})

		POPUP_TYPE[type].localStateComplete = true

		return
	end

	if type == xyd.POPUP_STATE.TULIN_GROWUP_GIFTBAG then
		xyd.WindowManager.get():openWindow("limit_gropup_giftbag_pop_up_window", {
			noCount = true
		})
		xyd.db.misc:setValue({
			key = "gropup_pop_up_window_check",
			value = xyd.getServerTime()
		})

		POPUP_TYPE[type].localStateComplete = true

		return
	end

	if type == xyd.POPUP_STATE.NEWBEE_FUND then
		local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND)

		if activityData and not activityData:isHide() and xyd.models.backpack:getLev() >= 25 and activityData:checkPop() then
			xyd.db.misc:setValue({
				key = "newbee_fund_popup_check",
				value = xyd.getServerTime()
			})

			POPUP_TYPE[type].localStateComplete = true

			xyd.WindowManager.get():openWindow("newbee_fund_popup_window", {})

			return
		else
			self:checkIndependentPopUpWindow(xyd.POPUP_STATE.NEWBEE_FUND)

			return
		end
	end

	if type == xyd.POPUP_STATE.NEWBEE_FUND3 then
		local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND3)

		if activityData and not activityData:isHide() and xyd.models.backpack:getLev() >= 25 and activityData:checkPop() then
			xyd.db.misc:setValue({
				key = "newbee_fund3_popup_check",
				value = xyd.getServerTime()
			})

			POPUP_TYPE[type].localStateComplete = true

			xyd.WindowManager.get():openWindow("newbee_fund3_popup_window", {})

			return
		else
			self:checkIndependentPopUpWindow(xyd.POPUP_STATE.NEWBEE_FUND3)

			return
		end
	end

	if type == xyd.POPUP_STATE.ACTIVITY_RESIDENT_RETURN then
		self:checkActivityResidentReturn()

		if POPUP_TYPE[xyd.POPUP_STATE.ACTIVITY_RESIDENT_RETURN].state then
			local return_data = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_RESIDENT_RETURN)

			return_data:doAfterPop()
			xyd.WindowManager.get():openWindow(return_data:getPopWinName(), {})
		else
			self:checkIndependentPopUpWindow(xyd.POPUP_STATE.ACTIVITY_RESIDENT_RETURN)
		end

		return
	end
end

function GiftbagPushController:setIndependentState(popup_type, state)
	POPUP_TYPE[popup_type].state = state
end

function GiftbagPushController:checkIndependentNextType(popup_type)
	local type = -1
	local index = xyd.arrayIndexOf(self.popTypeIndexList, popup_type)

	if index > 0 and index < #self.popTypeIndexList then
		type = self.popTypeIndexList[index + 1]
	else
		return type
	end

	if POPUP_TYPE[type].state == false or POPUP_TYPE[type].localStateComplete == true then
		type = self:checkIndependentNextType(type)
	end

	return type
end

function GiftbagPushController:checkLevelFund()
	local activity_id = xyd.ActivityID.LEVEL_FUND
	local data = xyd.models.activity:getActivity(activity_id)

	if not data then
		return false
	end

	if data.detail.charges[1].buy_times <= 0 then
		local flag = false
		local needLev = xyd.tables.miscTable:split2num("level_fund_window_lvl", "value", "|")
		local selfLev = xyd.models.backpack:getLev()

		if selfLev >= needLev[1] then
			local mark = xyd.db.misc:getValue("level_fund_gifbag_push_mark")

			if not mark then
				flag = true
			else
				local markLev = tonumber(mark)

				for i = #needLev, 1, -1 do
					if selfLev >= needLev[i] and markLev < needLev[i] then
						flag = true

						break
					end
				end
			end
		end

		if flag then
			xyd.db.misc:setValue({
				key = "level_fund_gifbag_push_mark",
				value = selfLev
			})

			return {
				{
					activity_id = activity_id,
					giftbag_id = tonumber(xyd.tables.activityTable:getGiftBag(activity_id)[1])
				}
			}
		end
	end

	return false
end

function GiftbagPushController:checkTowerFund()
	local activity_id = xyd.ActivityID.TOWER_FUND_GIFTBAG
	local data = xyd.models.activity:getActivity(activity_id)

	if not data then
		return false
	end

	local charges = data.detail.charges
	local nowStage = xyd.models.towerMap.stage or 1

	for i = 1, #charges do
		local charge = charges[i]
		local needStage = xyd.tables.miscTable:split2num("tower_giftbag_floors" .. i, "value", "|")

		if needStage then
			if charge.buy_times <= 0 and nowStage >= needStage[1] then
				local flag = false
				local mark = xyd.db.misc:getValue("tower_fund_gifbag_push_mark" .. i)

				if not mark then
					flag = true
				else
					local markStage = tonumber(mark)

					for j = #needStage, 1, -1 do
						if nowStage >= needStage[j] and markStage < needStage[j] then
							flag = true

							break
						end
					end
				end

				if flag then
					xyd.db.misc:setValue({
						key = "tower_fund_gifbag_push_mark" .. i,
						value = nowStage
					})

					return {
						{
							activity_id = activity_id,
							giftbag_id = charge.table_id
						}
					}
				end

				return false
			end
		else
			return false
		end
	end
end

function GiftbagPushController:checkTrialOpen()
	local openStateIdArr = xyd.tables.miscTable:split2Cost("activity_privileged_card_function_open", "value", "|")
	local playerLev = xyd.models.backpack:getLev()

	for j in pairs(openStateIdArr) do
		if xyd.checkFunctionOpen(tonumber(openStateIdArr[j]), true) then
			if tonumber(openStateIdArr[j]) == xyd.FunctionID.TRIAL then
				POPUP_TYPE[xyd.POPUP_STATE.TRIAL].state = true
			end

			if tonumber(openStateIdArr[j]) == xyd.FunctionID.DUNGEON then
				POPUP_TYPE[xyd.POPUP_STATE.DUNGEON].state = true
			end
		end
	end
end

function GiftbagPushController:checkNewFirtRechargePop()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.NEW_FIRST_RECHARGE)

	if activityData and activityData:getLoginDay() <= 7 then
		POPUP_TYPE[xyd.POPUP_STATE.NEW_FIRST_RECHARGE].state = true
	end
end

function GiftbagPushController:checkNewbeePop(saveTime)
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND)

	if activityData and not activityData:isHide() then
		POPUP_TYPE[xyd.POPUP_STATE.NEWBEE_FUND].state = true
	end

	if saveTime then
		POPUP_TYPE[xyd.POPUP_STATE.NEWBEE_FUND].localStateComplete = xyd.isSameDay(tonumber(saveTime), xyd.getServerTime())
	end
end

function GiftbagPushController:checkNewbee3Pop(saveTime)
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND3)

	if activityData and not activityData:isHide() then
		POPUP_TYPE[xyd.POPUP_STATE.NEWBEE_FUND3].state = true
	end

	if saveTime then
		POPUP_TYPE[xyd.POPUP_STATE.NEWBEE_FUND3].localStateComplete = xyd.isSameDay(tonumber(saveTime), xyd.getServerTime())
	end
end

function GiftbagPushController:checkGropupRechargePop(localState)
	if xyd.GuideController.get():isGuideComplete() then
		local ActivityData = xyd.models.activity:getActivity(xyd.ActivityID.TULIN_GROWUP_GIFTBAG)

		if ActivityData then
			for i = 1, 2 do
				if tonumber(ActivityData.detail.charge[i].buy_times) == 0 then
					POPUP_TYPE[xyd.POPUP_STATE.TULIN_GROWUP_GIFTBAG].state = true

					break
				end
			end
		else
			POPUP_TYPE[xyd.POPUP_STATE.TULIN_GROWUP_GIFTBAG].state = false
		end
	end

	if localState then
		POPUP_TYPE[xyd.POPUP_STATE.TULIN_GROWUP_GIFTBAG].localStateComplete = xyd.isSameDay(tonumber(localState), xyd.getServerTime())
	end
end

function GiftbagPushController:checkActivityResidentReturn()
	local return_data = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_RESIDENT_RETURN)

	if return_data and return_data:checkPop() then
		POPUP_TYPE[xyd.POPUP_STATE.ACTIVITY_RESIDENT_RETURN].state = true
		POPUP_TYPE[xyd.POPUP_STATE.ACTIVITY_RESIDENT_RETURN].localStateComplete = false
	else
		POPUP_TYPE[xyd.POPUP_STATE.ACTIVITY_RESIDENT_RETURN].state = false
		POPUP_TYPE[xyd.POPUP_STATE.ACTIVITY_RESIDENT_RETURN].localStateComplete = true
	end
end

return GiftbagPushController
