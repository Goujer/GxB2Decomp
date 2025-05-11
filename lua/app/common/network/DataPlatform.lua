-- chunkname: @../../../Product/Bundles/Android/src/app/common/network/DataPlatform.lua

local Backend = import("app/common/network/Backend")
local DataPlatform = class("DataPlatform")

function DataPlatform:ctor()
	self.isSavedGameChecked = false
end

function DataPlatform.get()
	if DataPlatform.INSTANCE == nil then
		DataPlatform.INSTANCE = DataPlatform.new()
	end

	return DataPlatform.INSTANCE
end

function DataPlatform:retrieveToken(complete)
	local url = xyd.LoadingController.get():backendURL()
	local params = {
		os_id = 1,
		mid = xyd.mid.RETRIEVE_TOKEN,
		sid = xyd.Global.sid,
		login_token = xyd.Global.token,
		platform_id = xyd.Global.platformID,
		lang = XYDUtils.GetGameLangCode(),
		server_id = xyd.Global.serverID or 0,
		is_anonymous = xyd.Global.isAnonymous_,
		time_zone = xyd.getTimeZone(),
		cdkey = xyd.Global.cdkey_
	}

	if UNITY_IOS then
		params.os_id = 2
	elseif UNITY_ANDROID then
		params.os_id = 1
	end

	local function onTokenInfo(response, success)
		local payload = response.payload

		if payload == nil then
			if complete ~= nil then
				complete(false, payload)
			end

			return
		end

		local errorCode = payload.error_code

		if errorCode ~= nil then
			if complete ~= nil then
				complete(false, payload)
			end

			return
		end

		if success then
			xyd.LoadingController.get():onLoginToken(payload)

			if complete ~= nil then
				complete(true, payload)
			end
		elseif complete ~= nil then
			complete(false, payload)
		end
	end

	xyd.Backend.get():webRequest(url, params, onTokenInfo)
end

return DataPlatform
