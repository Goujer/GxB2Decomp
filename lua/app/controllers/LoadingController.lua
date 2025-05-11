-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/LoadingController.lua

local LoadingController = class("LoadingController", import("app.controllers.BaseController"))
local LOGIN_WINDOW_NAME = "login_window"
local json = require("cjson")
local PlayerPrefs = UnityEngine.PlayerPrefs
local Application = UnityEngine.Application
local BanReasonConf = {
	"BAN_REASON_1",
	"BAN_REASON_2",
	"BAN_REASON_3",
	"BAN_REASON_4",
	"BAN_REASON_5",
	"BAN_REASON_6",
	"BAN_REASON_7"
}

function LoadingController.get()
	if LoadingController.INSTANCE == nil then
		LoadingController.INSTANCE = LoadingController.new()
	end

	return LoadingController.INSTANCE
end

function LoadingController:ctor(...)
	LoadingController.super.ctor(self, ...)

	self.serverParams = {}
	self.checkLoginFailed = false
	self.backendFailedTimes = 0
	self.gateFailedTimes = 0
	self.isAlreadyCleanUp = false
	self.isChoiceServer = "-1"

	self:onRegister()
end

function LoadingController:onRegister()
	LoadingController.super.onRegister(self)
	self:registerEvent(xyd.event.SDK_LOGIN_SUCCESS, handler(self, self.onSDKLogin))
	self:registerEvent(xyd.event.SDK_UNBIND_RES, handler(self, self.onUnbindRes))
	self:registerEventOut(xyd.event.BACKEND_CONNECTED, handler(self, self.onBackendConnected))
	self:registerEventOut(xyd.event.CHECK_LOGIN, handler(self, self.onCheckLogin))
	self:registerEvent(xyd.event.GET_LOGIN_INFO, handler(self, self.onLoginInfo))
	self:registerEvent(xyd.event.GAME_INITED, handler(self, self.onGameInited))
	self:registerEvent(xyd.event.ON_MAIN_MAP_LOADED, handler(self, self.onMainMapLoaded))
end

function LoadingController:onEnter()
	xyd.Global.isLoginInfoReceived = false
	self.serverParams = {}
	self.checkLoginFailed = false

	self:getLastAccountInfo()
	print("onEnter LoadingController")
	xyd.SdkManager.get():init()
	xyd.models.deviceNotify:init()

	if UNITY_EDITOR or UNITY_STANDALONE or XYD_TEST or XYDUtils.IsTest() then
		self:showLoginWindow()
	else
		self:showLoginSdkWindow()
	end
end

function LoadingController:getLastAccountInfo()
	self.lastPlayerID = PlayerPrefs.GetInt("__player_id_key__", -1)
	self.lastPlayerName = PlayerPrefs.GetString("__player_name_key__", "")
	self.lastPlayerLevel = PlayerPrefs.GetInt("__player_level_key__", 1)
	self.lastKingdomID = PlayerPrefs.GetInt("__kingdom_id_key__", 1)
	self.lastCastleLevel = PlayerPrefs.GetInt("__castle_level_key__", 1)
end

function LoadingController:showLoginWindow()
	dump("test11")
	xyd.WindowManager.get():openWindow(LOGIN_WINDOW_NAME, {
		listener = function(event)
			dump("test222")
			self:onSDKLogin(event)
		end
	})
end

function LoadingController:showLoginSdkWindow()
	self:setLoadingMessage("sdk login...")
	xyd.SdkManager.get():login()
end

function LoadingController:setLoadingMessage(msg)
	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.2.56") <= 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "1.1.66") <= 0 then
		UIManager.SetLoadingProgress(msg)

		return
	end

	UIManager.SetLoadingMessage(msg)
end

function LoadingController:onSDKLogin(event)
	if event then
		self.sdkLoginEventCache_ = event
	else
		event = self.sdkLoginEventCache_
	end

	if not event then
		return
	end

	if event.params.isFailed ~= nil then
		local errorCode = event.params.errorCode or "111111"
		local errorMsg = event.params.errorMsg

		if errorCode == 403 or errorMsg ~= nil then
			print("===Login Error===: is banned by official website")
			UIManager.ShowConfirmAlert(__("TIPS"), errorMsg, __("OK"), false, function()
				XYDUtils.QuitGame()
			end)
		else
			print("===Login Error===: sdk login failed(e:004)  errorCode = " .. errorCode)
			UIManager.ShowAlert(__("TIPS"), __("CONNECT_EXCEPTION") .. "(e:004)", __("RETRY"), __("CANCEL_2"), false, function(yes)
				if yes then
					xyd.SdkManager.get():login()
				else
					XYDUtils.QuitGame()
				end
			end)
		end

		return
	end

	xyd.SdkManager.get():afterAutoLogin()

	local function onError()
		self.backendFailedTimes = self.backendFailedTimes + 1

		local url = self:backendURL()

		print("===Login Error===: get gate info failed(e:005), failed times: " .. self.backendFailedTimes .. ", url: " .. url)

		if self.backendFailedTimes >= 2 then
			UIManager.ShowAlert(__("TIPS"), __("CONNECT_EXCEPTION") .. "(e:005)", __("RETRY"), __("CANCEL_2"), false, function(yes)
				if yes then
					self.backendFailedTimes = 0

					self:onSDKLogin(event)
				else
					XYDUtils.QuitGame()
				end
			end)
		else
			self:onSDKLogin(event)
		end
	end

	if event.params.isAnonymous then
		self.isAnonymous = event.params.isAnonymous
	end

	if event.params.tpCode then
		self.tpCode = event.params.tpCode
	end

	xyd.Global.isAnonymous_ = 0

	if self.tpCode == "anonymous" then
		xyd.Global.isAnonymous_ = 1
	end

	xyd.Global.tpCode_ = self.tpCode
	self.sid = event.params.sessionID
	xyd.Global.sid = self.sid
	xyd.Global.serverID = self:getServerID(event.params.server_id)

	xyd.models.selfPlayer:setAccount(event.params.username)

	self.login_token = event.params.loginToken
	xyd.Global.token = self.login_token
	self.isFakeLogin = event.params.isFakeLogin
	xyd.Global.platformID = event.params.platformID or 1

	if not self.isFakeLogin then
		UIManager.SetLoadingProgress(0.9, 1, false)
	end

	xyd.DataPlatform.get():retrieveToken(function(success, payload)
		if success then
			local errorCode = payload.errorCode

			self:clearServerKey()

			if errorCode ~= nil then
				print("error_code: " .. errorCode)

				return
			end
		else
			print("retrieveToken failed")
			onError()
		end
	end)
end

function LoadingController:getServerID(serverID)
	local tmpServerID = PlayerPrefs.GetInt(XYDDef.PrefServerKey, -1)

	if tmpServerID ~= -1 then
		return tmpServerID
	end

	return serverID
end

function LoadingController:clearServerKey()
	PlayerPrefs.DeleteKey(XYDDef.PrefServerKey)
end

function LoadingController:backendURL()
	if UNITY_EDITOR and self.isChoiceServer ~= "-1" then
		if self.isChoiceServer == "enzuosi" then
			return "http://" .. "xuemeih5back.twwebgame.com:9535" .. "/api/v1"
		elseif self.isChoiceServer == "heishen" then
			return "http://" .. "xuemeih5back.twwebgame.com:40401" .. "/api/v1"
		elseif self.isChoiceServer == "cbt" then
			return "http://" .. "xuemeih5back.twwebgame.com:20201" .. "/api/v1"
		end
	end

	if xyd.backendurl == "xuemeih5back.twwebgame.com" or UNITY_EDITOR or UNITY_STANDALONE or XYD_TEST or XYDUtils.IsTest() then
		return "http://" .. xyd.backendurl .. "/api/v1"
	else
		local URLS = {
			xyd.backendurl
		}
		local index = self.backendFailedTimes % #URLS + 1
		local url = URLS[index] or xyd.backendurl

		return "http://" .. url .. "/api/v1"
	end
end

function LoadingController:onLoginToken(params)
	if params.is_banned_game == 1 then
		print("===Login Error===: is banned by backend")
		UIManager.ShowConfirmAlert(__("TIPS"), __("ACCOUNT_IS_BANNED"), __("OK"), false, function()
			self:cleanUp()
		end)
	elseif params.due_date and tonumber(params.due_date) then
		xyd.Global.isDueData = true

		local loginWd = xyd.WindowManager.get():getWindow("login_window")

		if loginWd then
			loginWd:update({})
		else
			xyd.WindowManager.get():openWindow("login_window", {})
		end

		xyd.WindowManager.get():openWindow("delete_account_count_window", {
			due_time = params.due_date,
			uid = params.uid,
			server_time = params.server_time
		})
	else
		self.serverParams = params
		xyd.Global.isNewPlayer = params.is_new

		self:tryConnectGate()
		self:DeviceTrackAction()
	end
end

function LoadingController:DeviceTrackAction()
	local event = {
		tostring(xyd.getServerTime() * 1000),
		tostring(60001),
		tostring(1),
		UnityEngine.Application.unityVersion
	}
	local sys_info = UnityEngine.SystemInfo
	local infos = {
		batteryLevel = sys_info.batteryLevel,
		batteryStatus = tostring(sys_info.batteryStatus),
		copyTextureSupport = tostring(sys_info.copyTextureSupport),
		deviceModel = sys_info.deviceModel,
		deviceName = sys_info.deviceName,
		deviceType = tostring(sys_info.deviceType),
		deviceUniqueIdentifier = sys_info.deviceUniqueIdentifier,
		graphicsDeviceID = sys_info.graphicsDeviceID,
		graphicsDeviceName = sys_info.graphicsDeviceName,
		graphicsDeviceType = tostring(sys_info.graphicsDeviceType),
		graphicsDeviceVendor = sys_info.graphicsDeviceVendor,
		graphicsDeviceVendorID = sys_info.graphicsDeviceVendorID,
		graphicsDeviceVersion = sys_info.graphicsDeviceVersion,
		graphicsMemorySize = sys_info.graphicsMemorySize,
		graphicsMultiThreaded = sys_info.graphicsMultiThreaded,
		graphicsShaderLevel = sys_info.graphicsShaderLevel,
		graphicsUVStartsAtTop = sys_info.graphicsUVStartsAtTop,
		hasDynamicUniformArrayIndexingInFragmentShaders = sys_info.hasDynamicUniformArrayIndexingInFragmentShaders,
		hasHiddenSurfaceRemovalOnGPU = sys_info.hasHiddenSurfaceRemovalOnGPU,
		npotSupport = tostring(sys_info.npotSupport),
		operatingSystem = sys_info.operatingSystem,
		operatingSystemFamily = tostring(sys_info.operatingSystemFamily),
		processorCount = sys_info.processorCount,
		processorFrequency = sys_info.processorFrequency,
		processorType = sys_info.processorType,
		supports2DArrayTextures = sys_info.supports2DArrayTextures,
		supports32bitsIndexBuffer = sys_info.supports32bitsIndexBuffer,
		supports3DTextures = sys_info.supports3DTextures,
		supportsAccelerometer = sys_info.supportsAccelerometer,
		supportsAsyncCompute = sys_info.supportsAsyncCompute,
		supportsAsyncGPUReadback = sys_info.supportsAsyncGPUReadback,
		supportsAudio = sys_info.supportsAudio,
		supportsComputeShaders = sys_info.supportsComputeShaders,
		supportsCubemapArrayTextures = sys_info.supportsCubemapArrayTextures,
		supportsGyroscope = sys_info.supportsGyroscope,
		supportsHardwareQuadTopology = sys_info.supportsHardwareQuadTopology,
		supportsInstancing = sys_info.supportsInstancing,
		supportsMipStreaming = sys_info.supportsMipStreaming,
		supportsMultisampleAutoResolve = sys_info.supportsMultisampleAutoResolve,
		supportsMultisampledTextures = sys_info.supportsMultisampledTextures,
		supportsRawShadowDepthSampling = sys_info.supportsRawShadowDepthSampling,
		supportsShadows = sys_info.supportsShadows,
		supportsVibration = sys_info.supportsVibration,
		systemMemorySize = sys_info.systemMemorySize,
		unsupportedIdentifier = sys_info.unsupportedIdentifier,
		screenWidth = UnityEngine.Screen.width,
		screenHeight = UnityEngine.Screen.height,
		screenDpi = UnityEngine.Screen.dpi
	}

	event[5] = json.encode(infos)

	local str = json.encode({
		event
	})

	xyd.SdkManager.get():logEvent(str)
end

function LoadingController:tryConnectGate()
	self.checkLoginFailed = false

	local host, port = self.serverParams.gate_host, self.serverParams.gate_port
	local logUrl = self.serverParams.log_url
	local playerInfoModel = xyd.models.selfPlayer

	print("loginEvent")
	playerInfoModel:loginEvent_(self.serverParams)
	print("after loginEvent")
	xyd.Backend.get():setParams(host, port, logUrl)

	xyd.ErrorLogPoster.get().enabled = true

	print("before connect")
	xyd.Backend.get():connect()

	if not self.isFakeLogin then
		self:setLoadingMessage("connect gate")
		UIManager.SetLoadingProgress(0.9, 1, false)
	end
end

function LoadingController:onBackendConnected(event)
	local selfPlayer = xyd.models.selfPlayer
	local msg = messages_pb.check_login_req()

	msg.player_id = selfPlayer.playerID_
	msg.token = selfPlayer.token_
	msg.os_id = xyd.os_id or 0
	msg.test_id = xyd.test_id or 0
	msg.loading_id = PlayerPrefs.GetInt("__abtest_loading__", 0)
	msg.app_v = Application.version

	xyd.Backend.get():request(xyd.mid.CHECK_LOGIN, msg)

	if not self.isFakeLogin then
		self:setLoadingMessage("check login")
		UIManager.SetLoadingProgress(0.9, 1, false)
	end
end

function LoadingController:onCheckLogin(event)
	local function getLoginInfo()
		if not self.isFakeLogin then
			self:setLoadingMessage("get login info")
			UIManager.SetLoadingProgress(0.98, 1, false)
		end

		local selfPlayer = xyd.models.selfPlayer
		local msg = messages_pb.get_login_info_req()

		xyd.Backend.get():request(xyd.mid.GET_LOGIN_INFO, msg)
		XYDCo.WaitForTime(10, function()
			if not xyd.Global.isLoginInfoReceived then
				local selfPlayer = xyd.models.selfPlayer

				print("----------------------------------------")
				print("LOGIN FAILED: " .. "login failed -- Player ID: " .. tostring(selfPlayer.playerID_) .. "\n")

				local log = "LOGIN FAILED: " .. "login failed -- Player ID: " .. tostring(selfPlayer.playerID_) .. "\n"

				xyd.db.errorLog:add(log)
			end
		end, "")
	end

	local params = event.data

	if params.check_token then
		getLoginInfo()
	else
		self.checkLoginFailed = true

		print("===Login Error===: check login failed(e:007)")
		UIManager.ShowAlert(__("TIPS"), __("CONNECT_EXCEPTION") .. "(e:007)", __("RETRY"), __("CANCEL_2"), false, function(yes)
			if yes then
				self:tryConnectGate()
			else
				XYDUtils.QuitGame()
			end
		end)
	end
end

function LoadingController:onLoginInfo(event)
	xyd.Backend.get():setLoginConnectTimeOutCallback(nil)
	xyd.Backend.get():setLoginConnectCloseCallback(nil)

	local params = event.data.player_info

	self:updateMata_(params)
end

function LoadingController:updateMata_(params)
	local selfPlayer = xyd.models.selfPlayer

	if xyd.db.meta.playerID ~= selfPlayer.playerID_ then
		xyd.db.clean()

		xyd.db.meta.sid = self.sid
		xyd.db.meta.uid = params.uid
		xyd.db.meta.token = selfPlayer.token_
		xyd.db.meta.playerID = selfPlayer.playerID_
		xyd.db.meta.playerName = selfPlayer.playerName_

		xyd.db.meta:persist()
	end
end

function LoadingController:onUnbindRes(event)
	local params = event.params

	if params.status == 1 and params.unbindTp == "anonymous" then
		xyd.MainController.get():restartGame()
	end
end

function LoadingController:onGameInited(event)
	if not self.isFakeLogin then
		UIManager.SetLoadingProgress(0.99, 0.4, false)
	end
end

function LoadingController:onMainMapLoaded(event)
	UIManager.SetLoadingProgress(1, 1, false)
	self:cleanUp()
end

function LoadingController:cleanUp()
	if not self.isAlreadyCleanUp then
		UIManager.Close("ui_loading")
		xyd.setAppEntryAudioListener(false)
		xyd.setCameraManagerAudioListener(true)
		xyd.ErrorLogPoster.get():run()

		if xyd.needBackUpdate then
			xyd.BackUpdateController.get():delayBackUpdate(xyd.backUpdateParams)
		end

		self:reset()

		self.isAlreadyCleanUp = true
	end
end

return LoadingController
