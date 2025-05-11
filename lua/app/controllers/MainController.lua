-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/MainController.lua

local MainController = class("MainController", import(".BaseController"))
local PlayerPrefs = UnityEngine.PlayerPrefs
local json = require("cjson")
local Input = UnityEngine.Input
local KeyCode = UnityEngine.KeyCode

function MainController.get()
	if not MainController.INSTANCE then
		MainController.INSTANCE = MainController.new()
	end

	return MainController.INSTANCE
end

function MainController:ctor()
	MainController.super.ctor(self)

	self.openPopWindowNum = 0

	self:onRegister()

	self.curMids_ = {}
end

function MainController:onRegister()
	self:registerEvent(xyd.event.GAME_START, handler(self, self.onGameStart))
	self:registerEvent(xyd.event.CHANGE_PLAYER_LANGUAGE, handler(self, self.onChangeLanguage))
	self:registerEvent(xyd.event.CHANGE_SERVER, handler(self, self.onChangeServer))
	self:registerEvent(xyd.event.SDK_SWITCH_LOGIN_SUCCESS, handler(self, self.onSwitchLogin))
	self:registerEvent(xyd.event.SDK_BIND_RES, handler(self, self.onSdkBindRes))
	self:registerEvent(xyd.event.EDGE_OUT_NOTIFY, handler(self, self.edgeOutNotify))
	self:registerEvent(xyd.event.ERROR_MESSAGE, handler(self, self.onError))
	self:registerEvent(xyd.event.REQUEST_INFO, handler(self, self.onRequest))
	self:registerEvent(xyd.event.RESULT_INFO, handler(self, self.onResult))
	self:registerEvent(xyd.event.PLAY_REPORT_END, handler(self, self.onPlayReportEnd))
	self:registerEvent(xyd.event.LEV_CHANGE, handler(self, self.onLevChange))
	self:registerEventOut(xyd.event.ON_UNITY_UPDATE, handler(self, self.onVersionCode))
	self:registerEvent(xyd.event.ON_MAIN_MAP_LOADED, handler(self, self.onMainMapLoaded))
end

function MainController:onGameStart(event)
	if xyd.Global.isNewPlayer then
		self:enterMainScene()
	else
		local is_change_server_to_enter_game = PlayerPrefs.GetString("is_change_server_to_enter_game_" .. xyd.Global.uid, "")

		if is_change_server_to_enter_game == "true" then
			PlayerPrefs.SetString("is_change_server_to_enter_game_" .. xyd.Global.uid, "false")
			self:enterMainScene()
		else
			self:showLoginWindow()
			xyd.models.settingUp:reqNotice()
			self.eventProxy_:addEventListener(xyd.event.GET_APP_NEW, function(event)
				local noticeData = xyd.models.settingUp:getNotice()

				if not noticeData then
					return
				end

				local wnd = xyd.WindowManager.get():getWindow("main_window")

				if not wnd then
					xyd.WindowManager.get():openWindow("notice_window")
				end
			end)
		end
	end
end

function MainController:onSdkBindRes(event)
	local data = event.params

	if data.status == 1 then
		self:restartGame()
	else
		local errorMsg = data.errorMsg or "bind failed!"

		xyd.systemAlert(xyd.AlertType.TIPS, errorMsg)
	end
end

function MainController:enterMainScene()
	local wnd = xyd.WindowManager.get():getWindow("notice_window")

	if wnd then
		xyd.WindowManager.get():closeWindow("notice_window")
	end

	local endTime = tonumber(xyd.tables.miscTable:getVal("shengdan_zhujiemian_stop"))

	if xyd.isIosTest() or endTime <= xyd.getServerTime() then
		xyd.SHOW_CHRISTMAS = false
	end

	local soundManager = xyd.SoundManager.get()

	local function callback()
		if not soundManager:isPlayBg() then
			soundManager:playSound(xyd.Global.bgMusic)
		end
	end

	if soundManager:isEffectOn() then
		soundManager:playSound(xyd.SoundID.RING, callback)
	else
		callback()
	end

	xyd.WindowManager.get():openWindow("main_window", {}, function(main)
		self:enterMap(xyd.GameMapType.MAIN, function(map, gameMapType)
			self.gameMapType = gameMapType
			xyd.HAS_ENTER_MAIN_SCENE = true

			xyd.EventDispatcher.inner():dispatchEvent({
				name = xyd.event.ON_MAIN_MAP_LOADED
			})
			xyd.WindowManager.get():closeWindow("login_window")

			local intentMsg = xyd.SdkManager.get():popLocalIntentMsg()

			if intentMsg ~= nil and #intentMsg > 0 then
				xyd.models.deviceNotify:checkOpenMsg(intentMsg)
			end

			self:updateTomorrow()
			xyd.models.settingUp:reqGameNoticeInfo()
		end, nil)
	end)
end

function MainController:enterMap(gameMapType, callback, enteredCallback)
	local map = xyd.getMapInstanceByType(gameMapType)

	if map then
		self.gameMapType = gameMapType

		map:enterMap({}, callback, enteredCallback)
	end
end

function MainController:showLoginWindow()
	xyd.WindowManager.get():openWindow("login_window", {
		login_finish = true,
		listener = function(event)
			self:enterMainScene()
		end
	})
end

function MainController:onChangeLanguage()
	self:restartGame()
end

function MainController:onSwitchLogin(event)
	print("MainController:onSwitchLogin")

	local params = event.params

	if params.isFailed ~= nil then
		local errorCode = event.params.errorCode
		local errorMsg = event.params.errorMsg or "switch error!"

		print("===Login Error===: " .. errorMsg)
		xyd.systemAlert(xyd.AlertType.TIPS, errorMsg)

		return
	end

	if params.rawStr ~= nil then
		PlayerPrefs.SetString("__sdk_login_info__", params.rawStr)
		self:restartGame()
	end
end

function MainController:onChangeServer(event)
	local serverID = event.data.server_id or 0

	PlayerPrefs.SetInt(XYDDef.PrefServerKey, serverID)
	self:restartGame()
end

function MainController:restartGame()
	xyd.Backend.get():close()
	xyd.GuideController.get():reset()
	xyd.GiftbagPushController.get():reset()
	xyd.GiftbagPushController2.get():reset()
	xyd.WindowManager.get():clearAllWnd()
	xyd.MainMap.get():clearAll()
	xyd.SoundManager.get():clear()
	xyd.ModelManager.get():reset()
	xyd.TableManager.get():reset()
	xyd.PartnerSoundController.get():reset()
	xyd.WindowManager.get():clearInstance()
	self:removeEscListener()
	self:clearTimer()
	xyd.setAppEntryAudioListener(true)
	xyd.setCameraManagerAudioListener(false)

	xyd.HAS_ENTER_MAIN_SCENE = false

	local function unloadGuiScene()
		SceneUtils.UnloadScene("GuiScene", function(scene)
			if scene.name == "GuiScene" then
				XYDApp.NeedRestart = true
			end
		end)
	end

	XYDCo.WaitForFrame(1, function()
		unloadGuiScene()
	end, nil)
end

function MainController:getCurMids()
	return self.curMids_
end

function MainController:onError(event)
	local mid = event.data.error_mid
	local index = xyd.arrayIndexOf(self.curMids_, mid)

	if index > -1 then
		table.remove(self.curMids_, index)
	end

	self:checkShowLoading()
end

function MainController:onRequest(event)
	local mid = tonumber(event.data.mid)

	if mid == xyd.mid.GET_APP_NEW or mid == xyd.mid.MARK_POINT or mid == xyd.mid.RECORD_WINDOW or mid == xyd.mid.DELAY_LOG or mid == xyd.mid.RECORD_PING or mid == xyd.mid.RECONNECT or mid == xyd.mid.HEART_BEAT_SYNC then
		return
	end

	if xyd.arrayIndexOf(self.curMids_, mid) < 0 then
		table.insert(self.curMids_, mid)
	end

	self:checkShowLoading()
end

function MainController:onResult(event)
	local mid = tonumber(event.data.mid)
	local index = xyd.arrayIndexOf(self.curMids_, mid)

	if index > -1 then
		table.remove(self.curMids_, index)
	end

	self:checkShowLoading()
end

function MainController:clearLoadingMid()
	local win = xyd.getWindow("login_window")

	if win then
		return
	end

	if #self.curMids_ > 0 then
		self.curMids_ = {}
	end

	xyd.Backend.get():heartBeat()
end

function MainController:checkShowLoading()
	local wnd = xyd.getWindow("loading_window")

	if #self.curMids_ > 0 then
		wnd = wnd or xyd.openWindow("loading_window")

		if wnd then
			wnd:show()
		end
	elseif wnd then
		wnd:hide()
	end
end

function MainController:onPlayReportEnd()
	if self.levChangeData then
		xyd.openWindow("person_lev_up_window", self.levChangeData)
		xyd.GuideController.get():checkFuncsComplete()
		xyd.SoundManager.get():stopSound(xyd.SoundID.BATTLE_WIN)

		self.levChangeData = nil
	end
end

function MainController:onLevChange(event)
	if xyd.isIosTest() then
		return
	end

	local data = event.data

	xyd.GuideController.get().isLevChange_ = true

	if not xyd.Global.playReport then
		xyd.openWindow("person_lev_up_window", data)
		xyd.GuideController.get():checkFuncsComplete()
	else
		self.levChangeData = data
	end
end

function MainController:onVersionCode(event)
	local data = event.data
	local isMaintenance = data.is_maintenance

	if isMaintenance and isMaintenance == 1 then
		UIManager.ShowConfirmAlert(__("TIPS"), __("SERVER_ERROR"), __("OK"), false, function()
			self:restartGame()
		end)

		return
	end

	if UNITY_EDITOR then
		return
	end

	local curVersion = PlayerPrefs.GetString("__version__") or ""
	local updateParams

	print("os_id: " .. xyd.os_id .. ", curVersion: " .. curVersion)
	dump(tostring(data))

	local payloadVersionInfo = {}

	if UNITY_ANDROID then
		if not data.unity_android_version or data.unity_android_version == "" then
			return
		end

		payloadVersionInfo = json.decode(data.unity_android_version or "{}")
	elseif UNITY_IOS then
		if not data.unity_ios_version or data.unity_ios_version == "" then
			return
		end

		payloadVersionInfo = json.decode(data.unity_ios_version or "{}")
	end

	local serverVersion = payloadVersionInfo.curr_version or "0.1.0"
	local minPkgVersion = payloadVersionInfo.min_version or "0.1.0"
	local minHotVersion = payloadVersionInfo.min_hot_version or "0.1.0"
	local isMaintenance = payloadVersionInfo.is_maintenance or 0

	if curVersion ~= serverVersion then
		updateParams = {
			curr_version = serverVersion,
			min_version = minPkgVersion
		}
	end

	dump(updateParams)

	if updateParams ~= nil then
		updateParams.need_restart = data.need_restart

		xyd.BackUpdateController.get():delayBackUpdate(updateParams)
	end
end

function MainController:onMainMapLoaded()
	if not xyd.Global.isInGuide and (not xyd.models.selfPlayer:ifCallback() or not not xyd.models.selfPlayer:ifCallbackAwarded()) then
		local popActIds = {
			xyd.ActivityID.NEW_FIRST_RECHARGE,
			xyd.ActivityID.CHECKIN,
			xyd.ActivityID.TULIN_GROWUP_GIFTBAG,
			xyd.ActivityID.ACTIVITY_NEWBEE_FUND,
			xyd.ActivityID.ACTIVITY_RESIDENT_RETURN,
			xyd.ActivityID.ACTIVITY_BEACH_SUMMER,
			xyd.ActivityID.ACTIVITY_FREEBUY,
			xyd.ActivityID.ACTIVITY_NEWBEE_FUND3,
			xyd.ActivityID.ACTIVITY_SAND_SEARCH,
			xyd.ActivityID.ACTIVITY_START_ALTAR_CHARGE
		}

		self.openPopWindowNum = 0

		local function popUpFunction()
			for i in pairs(popActIds) do
				local actId = popActIds[i]
				local actData = xyd.models.activity:getActivity(actId)

				if actData and actData:checkPop() then
					local popWinName = actData:getPopWinName()

					xyd.MainController.get().openPopWindowNum = xyd.MainController.get().openPopWindowNum + 1

					xyd.WindowManager.get():openWindow(popWinName, nil, function()
						actData:doAfterPop()
					end)
				end
			end

			local data = xyd.models.map:getMapInfo(xyd.MapType.CAMPAIGN)

			if data and data.economy_items and data.current_stage and #data.economy_items >= 3 then
				local dropTime = data.drop_award_time
				local hangUpTimeMax = xyd.tables.miscTable:getNumber("hang_up_time_max", "value")

				if dropTime and hangUpTimeMax <= xyd.getServerTime() - dropTime then
					xyd.openWindow("login_hang_up_window", {
						stage_id = data.current_stage,
						gold = data.economy_items[1].item_num,
						exp = data.economy_items[2].item_num,
						partner_exp = data.economy_items[3].item_num,
						items = data.drop_items
					})
				end
			end
		end

		popUpFunction()
	end

	self:addEscListener()

	if self.openPopWindowNum == 0 then
		xyd.GuideController.get():checkFuncsComplete()
	end

	if xyd.GuideController.get():isGuideComplete() then
		xyd.delayRegisterNotification(2)
	end
end

function MainController:onGuideComplete()
	if xyd.GuideController.get():isPlayGuide() then
		return
	end

	if self.isNewGameResLoaded_ then
		self.isNewGameResLoaded_ = false

		UIManager.ShowConfirmAlert(__("TIPS"), __("NEW_VERSION_RES_LOADING"), __("OK"), false, function()
			xyd.MainController.get():restartGame()
		end)
	end
end

function MainController:setNewGameResLoaded()
	self.isNewGameResLoaded_ = true
end

function MainController:edgeOutNotify(event)
	local params = event.data

	if params.is_edge_out then
		xyd.Backend.get():close()
		xyd.alert(xyd.AlertType.YES_NO, __("EDGE_OUT_NOTIFY"), function(yes)
			if yes then
				xyd.MainController.get():restartGame()
			end
		end)
	end
end

function MainController:addEscListener()
	UpdateBeat:Add(self.onKeyBoardEvent, self)
end

function MainController:removeEscListener()
	UpdateBeat:Remove(self.onKeyBoardEvent, self)
end

function MainController:onKeyBoardEvent()
	if Input.GetKeyDown(KeyCode.Escape) then
		xyd.WindowManager.get():windowBack()
	end
end

function MainController:forceGC()
	LuaManager.Instance:RefreshDelegateMap()
	ResManager.DisposeUnusedLoaders()
end

function MainController:checkDay()
	local flag = xyd.isSameDay(xyd.Global.lastRefreshTime_, xyd.getServerTime(), false)

	print("checkDay: isSameDay =" .. tostring(flag))

	if not flag then
		self:onNewDayUpdate(0)
	else
		self:updateTomorrow()
	end
end

function MainController:onNewDayUpdate(delay)
	local function dispatchEvent()
		if not xyd.Global.isLoginInfoReceived then
			return
		end

		xyd.Global.lastRefreshTime_ = xyd.getServerTime()

		xyd.EventDispatcher.outer():dispatchEvent({
			name = xyd.event.SYSTEM_REFRESH,
			data = {}
		})
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.SYSTEM_REFRESH,
			data = {}
		})
	end

	if self.nextDayUpdateTimer then
		self.nextDayUpdateTimer:Stop()

		self.nextDayUpdateTimer = nil
	end

	if delay > 0 then
		self.nextDayUpdateTimer = Timer.New(dispatchEvent, delay, 1)

		self.nextDayUpdateTimer:Start()
	else
		dispatchEvent()
	end

	self:updateTomorrow()
end

function MainController:updateTomorrow()
	if self.nextDayTimer then
		self.nextDayTimer:Stop()

		self.nextDayTimer = nil
	end

	local delay = xyd.getUpdateTime() + 1

	self.nextDayUpdateTimer = Timer.New(function()
		local dispatchEventDelay = math.random(1, 100)

		self:onNewDayUpdate(dispatchEventDelay)
	end, delay, 1)

	self.nextDayUpdateTimer:Start()
end

function MainController:clearTimer()
	if self.nextDayTimer then
		self.nextDayTimer:Stop()

		self.nextDayTimer = nil
	end

	if self.nextDayUpdateTimer then
		self.nextDayUpdateTimer:Stop()

		self.nextDayUpdateTimer = nil
	end
end

return MainController
