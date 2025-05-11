-- chunkname: @../../../Product/Bundles/Android/src/app/sdk/SdkManager.lua

local SdkManager = class("SdkManager")
local PlayerPrefs = UnityEngine.PlayerPrefs
local cjson = require("cjson")
local SdkOpCode2Event = {
	xyd.event.SDK_LOGIN_SUCCESS,
	xyd.event.SDK_BIND_RES,
	xyd.event.SDK_UNBIND_RES,
	xyd.event.SDK_GET_BINDTP_RES,
	xyd.event.SDK_SWITCH_LOGIN_SUCCESS,
	xyd.event.SDK_KEYBOARD_EVENT,
	xyd.event.SDK_FBSHARE_RES,
	xyd.event.SDK_INIT_GOOGLE_ACHIEVEMENT_RES,
	xyd.event.SDK_PICK_UP_GALLERY_RES,
	xyd.event.SDK_DO_BEFORE_SWITCH_RES,
	xyd.event.SDK_TAKE_PHOTO_RES,
	xyd.event.SDK_FB_INVITE_RES,
	xyd.event.SDK_COUNTRY_INFO_RES,
	xyd.event.SDK_NEW_FB_INVITE_RES,
	xyd.event.SDK_FB_FRIEND_LIST,
	xyd.event.SDK_CLOSE_HELP_WINDOW,
	xyd.event.SDK_UPDATE_FB_TOKEN,
	xyd.event.SDK_SUBSCRIBE_CALENDAR_EVENTS,
	xyd.event.SDK_ADD_CALENDAR_EVENTS,
	xyd.event.SDK_PING_RES,
	xyd.event.SDK_UPLOAD_GAME_LOG_RES,
	xyd.event.SDK_CHECK_PERMISSION,
	xyd.event.SDK_REQUEST_PERMISSION,
	xyd.event.SDK_LINESHARE_RES,
	xyd.event.SDK_TWITTERSHARE_RES,
	xyd.event.SDK_VKSHARE_RES,
	xyd.event.SDK_PICK_UP_IMG,
	xyd.event.SDK_INSSHARE_RES,
	[30] = xyd.event.SDK_GOOGLE_REWARD_AD,
	[33] = xyd.event.SDK_CHECK_SPECIAL_ORDER,
	[45] = xyd.event.SDK_GET_PRIVACY_STATE,
	[101] = xyd.event.SDK_FORUM_CALL_BACK,
	[404] = xyd.event.SDK_ON_UNPATCHED
}

function SdkManager:onSdkCallback(jsonStr)
	__TRACE("onSdkCallback", jsonStr)
	print("@SdkManager:onSdkCallback\n" .. jsonStr)

	local obj = cjson.decode(jsonStr)
	local opCode = obj.opCode

	if opCode == 1 and obj.isFailed == nil and self.isFirstLogin_ then
		self.isFirstLogin_ = false
	elseif opCode == 1 and not self.isFirstLogin_ then
		opCode = 5
		obj.rawStr = jsonStr
	end

	if obj ~= nil and obj.isRealFromSdk == nil then
		obj.isRealFromSdk = true
	end

	if SdkOpCode2Event[opCode] == xyd.event.SDK_KEYBOARD_EVENT and UNITY_IOS then
		local ScreenHeight = UnityEngine.Screen.height

		if obj.rate ~= nil then
			obj.height = ScreenHeight * (1 - obj.rate)
			obj.rate = nil
		end

		if XYDUtils.IsIPhoneX() then
			obj.height = obj.height + 10
		end
	end

	if SdkOpCode2Event[opCode] == xyd.event.SDK_CHECK_SPECIAL_ORDER then
		self:checkSpecialOrder(obj)
	end

	if opCode ~= nil and SdkOpCode2Event[opCode] then
		xyd.EventDispatcher.outer():dispatchEvent({
			name = SdkOpCode2Event[opCode],
			params = obj
		})
		xyd.EventDispatcher.inner():dispatchEvent({
			name = SdkOpCode2Event[opCode],
			params = obj
		})
	end
end

function SdkManager:ctor()
	self.sdkInterface_ = nil
	self.isInit_ = false
	self.isFirstLogin_ = true
	self.hadOpenPayWindow = false
end

function SdkManager.get()
	if SdkManager.INSTANCE == nil then
		SdkManager.INSTANCE = SdkManager.new()
	end

	return SdkManager.INSTANCE
end

function SdkManager:init()
	if self.isInit_ then
		return
	end

	self.isInit_ = true
	self.sdkInterface_ = XYDSDK.Instance
	self.sdkInterface_.onSdkCallback = handler(self, self.onSdkCallback)
end

function SdkManager:login(tp)
	local loginInfo = PlayerPrefs.GetString("__sdk_login_info__", "")

	print("SdkManager:login  loginInfo = " .. loginInfo)

	if loginInfo ~= "" then
		PlayerPrefs.SetString("__sdk_login_info__", "")
		self:onSdkCallback(loginInfo)
	else
		self.sdkInterface_:Login(tp or 0)
	end

	print("login tp", tp)
end

function SdkManager:tpLogin(tpStr)
	local tp = xyd.SdkLoginTp[tpStr] or 0

	self:login(tp)
end

function SdkManager:accountLogin(loginEmail, password)
	local loginInfo = PlayerPrefs.GetString("__sdk_login_info__", "")

	print("SdkManager:login  loginInfo = " .. loginInfo)

	if loginInfo ~= "" then
		PlayerPrefs.SetString("__sdk_login_info__", "")
		self:onSdkCallback(loginInfo)
	else
		self.sdkInterface_:AccountLogin(loginEmail, password)
	end
end

function SdkManager:startNewGame()
	print("==Start New Game==")

	if UNITY_IOS then
		self:restartGame()
	else
		self:tpUnbind("anonymous")
	end
end

function SdkManager:doPurchase(chargeID)
	local serverID = tostring(xyd.Global.serverID)

	self.sdkInterface_:DoPurchaseWithDefaultMethod("1", serverID, chargeID, false)
end

function SdkManager:anonyUpgrade(email, password, repassword)
	self.sdkInterface_:anonyUpgrade(email, password, repassword)
end

function SdkManager:tpBind(tpType)
	self.sdkInterface_:TpBind(tpType)
end

function SdkManager:tpUnbind(tpType)
	self.sdkInterface_:TpUnbind(tpType)
end

function SdkManager:getBindTpType()
	self.sdkInterface_:GetBindTpType()
end

function SdkManager:getAndroidKeyBoradHeight()
	return self.sdkInterface_:GetKeyboardHeight()
end

function SdkManager:tpShare(tp, id, desParams, params)
	if tp == xyd.ShareTp.FB then
		self:fbShare(id, desParams, params)
	elseif tp == xyd.ShareTp.TWITTER then
		self:twitterShare(id, desParams, params)
	elseif tp == xyd.ShareTp.VK then
		self:vkShare(id, desParams, params)
	elseif tp == xyd.ShareTp.INS then
		self:insShare(id, desParams, params)
	end
end

function SdkManager:fbShare(id, desParams, params)
	local cfg = xyd.tables.fbshare

	if cfg:isIDExist(id) then
		params = params or {}

		local des
		local link = params.link or cfg:getLink(id)
		local homePage = cfg:getHomePage(id)
		local msg = __(cfg:getMsg(id))
		local img = params.img or cfg:getImg(id)
		local type = cfg:getType(id)
		local useAppLink = cfg:getUseAppLink(id)
		local tag = cfg:getTag(id)

		if desParams ~= nil then
			des = __(cfg:getDes(id), unpack(desParams))
		else
			des = __(cfg:getDes(id))
		end

		if UNITY_IOS then
			local jsonParam = {
				homePage = homePage,
				playerID = xyd.Global.playerID .. "",
				type = type,
				useAppLink = useAppLink,
				link = link,
				title = msg,
				desc = des,
				img = img,
				tag = tag
			}

			self.sdkInterface_:CallIOSSDKFunc("fbShare", cjson.encode(jsonParam))
		else
			self.sdkInterface_:FbShare(useAppLink, homePage, msg, link, des, img, tag, "", xyd.Global.playerID .. "", type)
		end

		__TRACE("fbshare", id, des, link, msg, img)
	end
end

function SdkManager:twitterShare(id, desParams, params)
	local cfg = xyd.tables.fbshare

	if cfg:isIDExist(id) then
		params = params or {}

		local des
		local img = params.img or cfg:getImg(id)
		local type = cfg:getType(id)
		local tag = cfg:getTag(id)

		if desParams ~= nil then
			des = __(cfg:getDes(id), unpack(desParams))
		else
			des = __(cfg:getDes(id))
		end

		if UNITY_IOS then
			local jsonParam = {
				type = type,
				desc = des,
				img = img,
				tag = tag
			}

			self.sdkInterface_:CallIOSSDKFunc("twitterShare", cjson.encode(jsonParam))
		else
			self.sdkInterface_:TwitterShare(des, XYDDef.DataPath .. "/" .. img, tag, type)
		end

		__TRACE("twitterShare", id, des, img, tag)
	end
end

function SdkManager:vkShare(id, desParams, params)
	local cfg = xyd.tables.fbshare

	if cfg:isIDExist(id) then
		params = params or {}

		local des
		local link = params.link or cfg:getLink(id)
		local msg = __(cfg:getMsg(id))
		local img = params.img or cfg:getImg(id)
		local type = cfg:getType(id)

		if desParams ~= nil then
			des = __(cfg:getDes(id), unpack(desParams))
		else
			des = __(cfg:getDes(id))
		end

		if UNITY_IOS then
			local jsonParam = {
				type = type,
				link = link,
				title = msg,
				desc = des,
				img = img
			}

			self.sdkInterface_:CallIOSSDKFunc("vkShare", cjson.encode(jsonParam))
		else
			self.sdkInterface_:VKShare(msg, link, des, XYDDef.DataPath .. "/" .. img, type)
		end

		__TRACE("vkShare", id, des, link, msg, img)
	end
end

function SdkManager:insShare(id, desParams, params)
	local cfg = xyd.tables.fbshare

	if cfg:isIDExist(id) then
		params = params or {}

		local img = params.img or cfg:getImg(id)
		local type = cfg:getType(id)

		if UNITY_IOS then
			local jsonParam = {
				type = type,
				img = img
			}

			self.sdkInterface_:CallIOSSDKFunc("insShare", cjson.encode(jsonParam))
		else
			self.sdkInterface_:INSShare(XYDDef.DataPath .. "/" .. img, type)
		end

		__TRACE("insShare", id, img)
	end
end

function SdkManager:popLocalIntentMsg()
	return self.sdkInterface_:PopLocalIntentMsg()
end

function SdkManager:showMafiaLikesWindow()
	if UNITY_IOS then
		self.sdkInterface_:CallIOSSDKFunc("fbLike", "")
	end
end

function SdkManager:quitGame()
	xyd.NotifyManager.get():onAppPause(true)
	self.sdkInterface_:QuitGame()
end

function SdkManager:reportMessage(message)
	self.sdkInterface_:ReportMessage(message or "")
end

function SdkManager:reportMessageWithPingAddress(message, address, port)
	self.sdkInterface_:ReportMessageWithPingAddress(message or "", address, port)
end

function SdkManager:setServerNotification(value)
	self.sdkInterface_:SetServerNotification(value)
end

function SdkManager:afterAutoLogin()
	self.sdkInterface_:AfterAutoLogin()
end

function SdkManager:restartGame()
	self.sdkInterface_:RestartGame()
end

function SdkManager:getLang()
	return XYDUtils.GetGameLangCode()
end

function SdkManager:getTranslationLang()
	return XYDUtils.GetGameLang()
end

function SdkManager:pickupGallery()
	if UNITY_IOS then
		self.sdkInterface_:CallIOSSDKFunc("takeAlbum", "")
	else
		self.sdkInterface_:PickupGallery()
	end
end

function SdkManager:takePhoto()
	if UNITY_IOS then
		self.sdkInterface_:CallIOSSDKFunc("takePhoto", "")
	else
		self.sdkInterface_:TakePhoto()
	end
end

function SdkManager:getImageFromAlbum()
	self.sdkInterface_:GetImageFromAlbum()
end

function SdkManager:clearAllNotify()
	self.sdkInterface_:ClearAllNotify()
end

function SdkManager:doBeforeSwitch(tpStr)
	if UNITY_IOS then
		self.sdkInterface_:CallIOSSDKFunc("doBeforeSwitchUser", tpStr)
	else
		self.sdkInterface_:DoBeforeSwitch(tpStr)
	end
end

function SdkManager:showMafiaHelpWindow(title)
	title = title or ""

	if UNITY_IOS then
		local params = {
			title = title
		}

		self.sdkInterface_:CallIOSSDKFunc("showMafiaHelpWithTitle", cjson.encode(params))
	else
		self.sdkInterface_:OpenHelperActivity(title)
	end
end

function SdkManager:registerNotification()
	if UNITY_IOS then
		self.sdkInterface_:CallIOSSDKFunc("registerNotification", "")
	end
end

function SdkManager:getCountryInfo()
	if UNITY_IOS then
		self.sdkInterface_:CallIOSSDKFunc("getCountryInfo", "")
	end
end

function SdkManager:readSdcardFile(path)
	return self.sdkInterface_:ReadSdcardFile(path)
end

function SdkManager:writeSdcardFile(path, content)
	return self.sdkInterface_:WriteSdcardFile(path, content)
end

function SdkManager:deleteSdcardFile(path)
	return self.sdkInterface_:DeleteSdcardFile(path)
end

function SdkManager:forceFinishComposing()
	return self.sdkInterface_:ForceFinishComposing()
end

function SdkManager:addImgNotify(jsonStr)
	if UNITY_IOS then
		print("addImgNotify", jsonStr)
		self.sdkInterface_:CallIOSSDKFunc("addImgNotify", jsonStr)
	end
end

function SdkManager:setLanguage(lang)
	if UNITY_IOS then
		local params = {
			lang = lang
		}

		self.sdkInterface_:CallIOSSDKFunc("setLanguage", cjson.encode(params))
	else
		self.sdkInterface_:SetLanguage(lang)
	end
end

function SdkManager:SetSDKLanguage()
	self.sdkInterface_:SetSDKLanguage()
end

function SdkManager:logFBEvent(eventName, params)
	if UNITY_ANDROID then
		local key_name, key_type, key_value = {
			"gap",
			"gap"
		}, {
			"gap",
			"gap"
		}, {
			"gap",
			"gap"
		}

		for key, v in pairs(params) do
			table.insert(key_name, key)
			table.insert(key_type, type(v))
			table.insert(key_value, v)
		end

		local jsonStr = cjson.encode({
			key_name = key_name,
			key_type = key_type,
			key_value = key_value
		})

		self.sdkInterface_:FbTracking(eventName, 0, jsonStr)
	elseif UNITY_IOS then
		local jsonStr = cjson.encode({
			eventName = eventName,
			fbParams = params
		})

		self.sdkInterface_:CallIOSSDKFunc("fbTracking", jsonStr)
	end
end

function SdkManager:logAFEvent(eventName, params)
	if UNITY_ANDROID then
		local key_name, key_type, key_value = {
			"gap",
			"gap"
		}, {
			"gap",
			"gap"
		}, {
			"gap",
			"gap"
		}

		for key, v in pairs(params) do
			table.insert(key_name, key)
			table.insert(key_type, type(v))
			table.insert(key_value, v)
		end

		local jsonStr = cjson.encode({
			key_name = key_name,
			key_type = key_type,
			key_value = key_value
		})

		self.sdkInterface_:AfTracking(eventName, jsonStr)
	elseif UNITY_IOS then
		local jsonStr = cjson.encode({
			eventName = eventName,
			afParams = params
		})

		self.sdkInterface_:CallIOSSDKFunc("afTracking", jsonStr)
	end
end

function SdkManager:subscribeCalendarEvents(jsonStr)
	if UNITY_IOS then
		self.sdkInterface_:CallIOSSDKFunc("subscribeCalendarEvents", jsonStr)
	end
end

function SdkManager:addCalendarEvents(jsonStr)
	if UNITY_IOS then
		self.sdkInterface_:CallIOSSDKFunc("addCalendarEvents", jsonStr)
	end
end

function SdkManager:getPingRes(address, inGame)
	self.sdkInterface_:GetPingRes(address, inGame)
end

function SdkManager:upLoadGameLogFile(playerID, logPath)
	self.sdkInterface_:UpLoadGameLogFile(playerID .. "", logPath)
end

function SdkManager:checkPermission(requestCode, params)
	if UNITY_ANDROID then
		self.sdkInterface_:CheckPermission(requestCode, cjson.encode(params))
	end
end

function SdkManager:requestPermission(requestCode, params)
	if UNITY_ANDROID then
		self.sdkInterface_:RequestPermission(requestCode, cjson.encode(params))
	end
end

function SdkManager:openForum(title, url)
	self.sdkInterface_:OpenForum(title, url)
end

function SdkManager:tempFunc(str)
	self.sdkInterface_:TempFunc(str)
end

function SdkManager:trackStart(playerID)
	self.sdkInterface_:TrackStart(playerID)
end

function SdkManager:logEvent(str)
	self.sdkInterface_:LogEvent(str)
end

function SdkManager:showGoogleRewardVideoAd()
	self.sdkInterface_:ShowGoogleRewardVideoAd()
end

function SdkManager:showPayment(giftBagID)
	if XYDUtils.IsTest() then
		xyd.showToast(giftBagID)

		return
	end

	if self.hadOpenPayWindow then
		return
	end

	local key

	self.hadOpenPayWindow = true
	key = xyd.models.selfPlayer:addGlobalTimer(function()
		self.hadOpenPayWindow = false

		xyd.models.selfPlayer:removeGlobalTimer(key)
	end, 1, 1)

	local isOn = xyd.models.backpack:getLev() >= xyd.TP_PAYMENT_LEVEL

	if xyd.Global.isReview == 1 then
		isOn = false
	end

	local giftBagName = xyd.tables.giftBagTextTable:getName(giftBagID)
	local defaultPrice = tostring(xyd.tables.giftBagTable:getCharge(giftBagID))
	local google_price = tostring(xyd.tables.giftBagTextTable:getCharge(giftBagID))
	local google_currency = xyd.tables.giftBagTextTable:getCurrency(giftBagID)
	local currency_amount = xyd.tables.giftBagTable:getTokenAmount(giftBagID)
	local currency_unit = __("GEMS")
	local serverID = xyd.models.selfPlayer:getServerID()
	local channelID = ""
	local extra = ""

	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.ANDROID_1_3_67) >= 0 then
		self.sdkInterface_:checkSpecialOrder(serverID, giftBagID, giftBagName, defaultPrice, google_currency, google_price, isOn, currency_amount, currency_unit, channelID, extra)
		xyd.models.advertiseComplete:showPayment()

		return
	end

	if xyd.Global.useNewPayment then
		self.sdkInterface_:checkSpecialOrder(serverID, giftBagID, giftBagName, defaultPrice, google_currency, google_price, isOn, currency_amount, currency_unit, channelID, extra)
	else
		self.sdkInterface_:ShowPayView(serverID, giftBagID, giftBagName, defaultPrice, google_currency, google_price, isOn, currency_amount, currency_unit, channelID, extra)
	end

	xyd.models.advertiseComplete:showPayment()
end

function SdkManager:openBrowser(url)
	UnityEngine.Application.OpenURL(url)
end

function SdkManager:copyToClipboard(str)
	NGUITools.copyToClipboard(str)
end

function SdkManager:buySubscription(giftbagID)
	local selfPlayerModel = xyd.models.selfPlayer
	local serverID = tostring(selfPlayerModel:getServerID())

	self.sdkInterface_:buySubscribe("", serverID, tostring(giftbagID))
end

function SdkManager:eventTracking(eventName, eventParams)
	eventParams = eventParams or {
		player_id = xyd.models.selfPlayer:getPlayerID()
	}

	self:logAFEvent(eventName, eventParams)
end

function SdkManager:translateFrontend()
	return
end

function SdkManager:checkSpecialOrder(params)
	if params.errorMsg then
		xyd.alertTips(params.errorMsg)
	elseif params.orderSn and params.orderSn ~= "" and params.orderNums and params.orderNums > 0 then
		xyd.openWindow("gamble_tips_window", {
			cancelSelect = true,
			text = __("GIFTBAG_MAIL_TEXT1"),
			labelNeverText = __("GIFTBAG_MAIL_TEXT2", params.orderNums),
			btnNoText_ = __("GIFTBAG_MAIL_TEXT3"),
			helpParams = {
				key = "GIFTBAG_MAIL_HELP"
			},
			callback = function()
				self.sdkInterface_:offerSpecialOrder(params.id, params.orderSn)
			end,
			closeCallback = function()
				local isOn = xyd.models.backpack:getLev() >= xyd.TP_PAYMENT_LEVEL

				if xyd.Global.isReview == 1 then
					isOn = false
				end

				local giftBagName = xyd.tables.giftBagTextTable:getName(params.id)
				local defaultPrice = tostring(xyd.tables.giftBagTable:getCharge(params.id))
				local google_price = tostring(xyd.tables.giftBagTextTable:getCharge(params.id))
				local google_currency = xyd.tables.giftBagTextTable:getCurrency(params.id)
				local currency_amount = xyd.tables.giftBagTable:getTokenAmount(params.id)
				local currency_unit = __("GEMS")
				local serverID = xyd.models.selfPlayer:getServerID()
				local channelID = ""
				local extra = ""

				self.sdkInterface_:ShowPayView(serverID, params.id, giftBagName, defaultPrice, google_currency, google_price, isOn, currency_amount, currency_unit, channelID, extra)
			end
		})
	end
end

function SdkManager:showATTracking()
	if UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.IOS_1_2_49) >= 0 and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.IOS_71_3_113) < 0 then
		self.sdkInterface_:CallIOSSDKFunc("showATTrackingManager", "")
	end
end

function SdkManager:shareTextToOtherApp(type, params)
	if UNITY_IOS then
		local jsonParam = {
			type = type,
			content = params
		}

		self.sdkInterface_:CallIOSSDKFunc("shareTextToOtherApp", cjson.encode(jsonParam))
	elseif UNITY_ANDROID then
		self.sdkInterface_:ShareTextToOtherApp(type, params)
	end
end

function SdkManager:getPrivacyState()
	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.5.653") < 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "71.3.733") < 0 then
		return
	end

	self.sdkInterface_:GetPrivacyState("")
end

function SdkManager:showPrivacyDialogView()
	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.5.653") < 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "71.3.733") < 0 then
		return
	end

	self.sdkInterface_:ShowPrivacyDialogView("")
end

return SdkManager
