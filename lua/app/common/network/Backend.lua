-- chunkname: @../../../Product/Bundles/Android/src/app/common/network/Backend.lua

local Backend = class("Backend")
local json = require("cjson")
local Application = UnityEngine.Application
local PlayerPrefs = UnityEngine.PlayerPrefs
local Destroy = UnityEngine.Object.Destroy
local SOCKET_HEARTBEAT_TIME = 300
local WEB_HEARTBEAT_TIME = 30
local GC_GAP = 20000

function Backend.get()
	if Backend.INSTANCE == nil then
		Backend.INSTANCE = Backend.new()
	end

	return Backend.INSTANCE
end

function Backend:ctor()
	self:setupMidMappings()

	self.isReconnecting = false
	self.lastCloseTime = 0
	self.sendSeq_ = 0
	self.lastSeq_ = 0
	self.isSocketClosed_ = false
	self.onceTrrigers_ = {}
	self.msgSizeCount_ = 0

	xyd.EventDispatcher.outer():addEventListener(xyd.event.RECONNECT, handler(self, self.onReconnectRes))

	if xyd.Global.systemMemorySize <= 1024 then
		GC_GAP = 20000
	else
		GC_GAP = 20000 * Mathf.Clamp(Mathf.Round(xyd.Global.systemMemorySize / 1024), 1, 5)
	end
end

function Backend:setParams(host, port, logUrl)
	self.host = host
	self.port = port
	self.logUrl = logUrl
end

function Backend:getHost()
	return self.host or ""
end

function Backend:setLoginConnectTimeOutCallback(callback)
	self.loginConnectTimeOutCallback = callback
end

function Backend:setLoginConnectCloseCallback(callback)
	self.loginConnectCloseCallback = callback
end

function Backend:connect()
	if self.socket_ ~= nil then
		if not tolua.isnull(self.socket_) then
			self.socket_:Dispose()
		end

		self.socket_ = nil
	end

	self.socket_ = SocketConnection.Create()
	self.socket_.OnSocketDisconnected = handler(self, self.onSocketClose_)
	self.socket_.OnSocketMessage = handler(self, self.onSocketMessage_)
	self.socket_.OnConnectTimedout = handler(self, self.onConnectAbnormal_)
	self.socket_.OnSendTimedout = handler(self, self.onSocketClose_)
	self.socket_.OnSocketError = handler(self, self.onSocketClose_)

	if self.isReconnecting then
		self.socket_.OnSocketConnected = handler(self, self.onReconnected_)
	else
		self.socket_.OnSocketConnected = handler(self, self.onSocketOpen_)
	end

	if self.host ~= nil and self.port ~= nil then
		self.socket_:Connect(self.host, self.port)
	end
end

function Backend:request(mid, params)
	if self.socket_ == nil then
		return
	end

	local msg = params and params:SerializeToString() or ""

	self.sendSeq_ = self.socket_:NextSequence()

	self.socket_:Send(mid, msg)
	__TRACE("message send:\n" .. "mid:0x" .. string.format("%04x", mid) .. "\n" .. tostring(params))
	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.REQUEST_INFO,
		data = {
			mid = mid,
			msg = params
		}
	})
end

function Backend:webRequest(url, params, callback, timeout, noPayload)
	local function complete(response, success)
		if callback ~= nil then
			callback(response or {}, success)
		end
	end

	if params == nil then
		params = {}
	end

	params.res_v = xyd.res_version
	params.app_v = Application.version

	local payload = json.encode(params)
	local request = HttpRequest.Request(url, "POST")

	if noPayload then
		for filed, value in pairs(params) do
			request:AddField(filed, "" .. value)
		end
	else
		request:AddField("payload", payload)
	end

	__TRACE(string.format("Request web %s, post data %s", url, payload))
	request:SetTimeout(timeout or 13)
	request:AddCallback(function(response)
		if not response.IsSuccess then
			local state = response.ReqState

			__TRACE(state)
			complete({}, false)

			return
		end

		local code = response.StatusCode
		local text = response.DataAsText

		__TRACE(string.format("Received from web code(%d) -- %s", code, text))

		if code ~= 200 and code ~= 400 then
			complete(nil, false)

			return
		end

		complete(json.decode(text), true)
	end)
	request:Send()
end

function Backend:webRequestWithLoadSprite(url, params, callback, uiwidget, depth, offsetX, offsetY, scale, anchorParent, timeout, noPayload)
	local mask

	local function complete(response, success)
		ResCache.RemoveLoadingSprite(uiwidget)

		if not tolua.isnull(mask) then
			Destroy(mask)
		end

		if callback ~= nil then
			callback(response or {}, success)
		end
	end

	local payload = json.encode(params or {})
	local request = HttpRequest.Request(url, "POST")

	if noPayload then
		for filed, value in pairs(params) do
			request:AddField(filed, "" .. value)
		end
	else
		request:AddField("payload", payload)
	end

	__TRACE(string.format("Request web %s, post data %s", url, payload))
	ResCache.AddLoadingSprite(uiwidget, depth or 0, offsetX or 0, offsetY or 0, scale or 1)

	if anchorParent then
		mask = NGUITools.AddChild(uiwidget.gameObject, "webRequestMask")

		local sprite = mask:AddComponent(typeof(UISprite))

		sprite.autoResizeBoxCollider = true

		if xyd.Global.isIphoneXAspect() then
			sprite:SetAnchor(anchorParent, 0, 0, 0, 0, 1, 0, 1, 0)
		else
			sprite:SetAnchor(anchorParent, 0, -5, 0, -5, 1, 5, 1, 5)
		end

		xyd.setUISprite(sprite, xyd.MappingData.bg_black, "bg_black")

		sprite.alpha = 0.01

		mask:AddComponent(typeof(UnityEngine.BoxCollider))

		sprite.depth = uiwidget.depth + 200
	end

	request:SetTimeout(timeout or 13)
	request:AddCallback(function(response)
		if not response.IsSuccess then
			local state = response.ReqState

			__TRACE(state)
			complete({}, false)

			return
		end

		local code = response.StatusCode
		local text = response.DataAsText

		__TRACE(string.format("Received from web code(%d) -- %s", code, text))

		if code ~= 200 and code ~= 400 then
			complete(nil, false)

			return
		end

		complete(json.decode(text), true)
	end)
	request:Send()
end

function Backend:webEvent(url, params, eventName, timeout, frontendParams)
	local function func(response, success)
		local params = response or {}

		params.frontendParams = frontendParams

		if not success then
			params.error = params.error or -1
		end

		xyd.EventDispatcher.outer():dispatchEvent({
			name = eventName,
			params = params
		})
		xyd.EventDispatcher.inner():dispatchEvent({
			name = eventName,
			params = params
		})
	end

	self:webRequest(url, params, func, nil, nil, nil, timeout or 5, true)
end

function Backend:errorLog(logType, info, callback)
	if not self.logUrl or self.logUrl == "" then
		return
	end

	local function complete(success)
		if callback ~= nil then
			callback(success)
		end
	end

	local function onWebResponse(response)
		if not response.IsSuccess then
			local state = response.ReqState

			dump(state)
			complete(false)

			return
		end

		local code = response.StatusCode
		local text = response.DataAsText

		dump(string.format("Received from web code(%d) -- %s", code, text))

		if code ~= 200 then
			complete(false)

			return
		end

		complete(true)
	end

	if logType == 0 then
		local payload = info
		local request = HttpRequest.Request(self.logUrl, "POST", 2)

		request:AddField("payload", payload)
		dump(string.format("Request web %s, post data %s", self.logUrl, payload))
		request:SetTimeout(30)
		request:AddCallback(onWebResponse)
		request:Send()
	elseif logType == 1 then
		local request = HttpRequest.Request(self.logUrl, "POST")

		request:AddField("res_v", xyd.res_version or "")
		request:AddField("app_v", Application.version)
		request:AddField("token", xyd.Global.token)
		request:AddBinaryData("crash", FileUtils.ReadFileBytesInData("Crashes/" .. info.fileName), info.fileName, "multipart/form-data")
		request:SetTimeout(300)
		request:AddCallback(onWebResponse)
		request:Send()
	elseif logType == 2 then
		local request = HttpRequest.Request(self.logUrl, "POST")

		request:AddField("res_v", xyd.res_version or "")
		request:AddField("app_v", Application.version)
		request:AddField("player_id", tostring(xyd.Global.playerID) or "")
		request:AddField("token", xyd.Global.token)
		request:AddBinaryData("log", FileUtils.ReadShareFileBytesInData("Logs/" .. info.fileName), info.fileName, "multipart/form-data")
		request:SetTimeout(300)
		request:AddCallback(onWebResponse)
		request:Send()
	end
end

function Backend:setupMidMappings()
	self.mid2EventNames_ = {}
	self.mid2ProtoResponses_ = {}

	for key, mid in pairs(xyd.mid) do
		mid = tostring(mid)
		self.mid2EventNames_[mid] = xyd.event[key]

		if not self.mid2ProtoResponses_[mid] then
			local lowerKey = string.lower(key)
			local method = messages_pb[lowerKey .. "_res"]

			if method then
				self.mid2ProtoResponses_[mid] = method()
			end

			if mid == tostring(61440) then
				self.mid2ProtoResponses_[mid] = messages_pb[lowerKey]()
			end
		end
	end
end

function Backend:onSocketOpen_(socket)
	if self.socket_ == socket then
		self.isReconnecting = false

		xyd.EventDispatcher.outer():dispatchEvent({
			name = xyd.event.BACKEND_CONNECTED
		})
	end
end

function Backend:onReconnected_(socket)
	if self.socket_ == socket then
		__TRACE("Backend:onReconnected")

		self.isReconnecting = false

		if not xyd.Global.isHasBeenBanServer then
			self:checkReconnect()
		end
	end
end

function Backend:checkReconnect()
	local msg = messages_pb.reconnect_req()

	msg.player_id = xyd.Global.playerID
	msg.token = xyd.Global.token
	msg.next_seq = self.lastSeq_ + 1

	self:request(xyd.mid.RECONNECT, msg, "RECONNECT")
end

function Backend:onReconnectRes(event)
	local msg = event.data
	local isSuccess = msg.isSuccess

	__TRACE("Backend:onReconnectRes:", isSuccess)

	if not isSuccess then
		self.isReconnecting = true

		self.socket_:Disconnect()
	else
		self.isSocketClosed_ = false

		xyd.EventDispatcher.outer():dispatchEvent({
			name = xyd.event.ON_SOCKET_RECONNECT,
			params = {}
		})
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.ON_SOCKET_RECONNECT,
			params = {}
		})
	end
end

function Backend:onTime()
	__TRACE("Backend:onTime")
end

function Backend:heartBeat()
	local msg = messages_pb.heart_beat_sync_req()

	msg.player_id = xyd.Global.playerID

	self:request(xyd.mid.HEART_BEAT_SYNC, msg)
end

function Backend:webHeartBeat()
	if self.hbTimer_ ~= nil then
		return
	end

	self.hbTimer_ = Timer.New(handler(self, self.onHeartBeatTime), WEB_HEARTBEAT_TIME, -1, false)

	self.hbTimer_:Start()
end

function Backend:onHeartBeatTime()
	print("onHeartBeatTime")
	print(xyd.Global.sid)
	print(xyd.Global.token)

	if xyd.Global.sid == "" then
		xyd.SdkManager.get():login()
	elseif xyd.Global.token == "" then
		xyd.DataPlatform.get():retrieveToken(function(success)
			if success then
				print("reconnect success")

				xyd.LogPoster.get().enabled = true
			end
		end)
	end
end

function Backend:onSocketClose_(socket)
	if self.socket_ == socket then
		__TRACE("Backend:onSocketClose_")

		if self.loginConnectCloseCallback ~= nil then
			self.loginConnectCloseCallback()
		else
			xyd.EventDispatcher.outer():removeEventListenersByEvent(xyd.event.BACKEND_CONNECTED)

			if self.timer_ ~= nil then
				self.timer_:Stop()
			end

			if self.isReconnecting then
				__TRACE("Reconnect failed, relogin")

				self.isReconnecting = false

				xyd.alertConfirm(__("CONNECT_EXCEPTION"), function(yes)
					if yes then
						xyd.MainController.get():restartGame()
					end
				end, __("RETRY"))
			else
				local currentTime = os.time()

				if currentTime - self.lastCloseTime < 5 then
					__TRACE("Start relogin")
					xyd.alertConfirm(__("CONNECT_EXCEPTION"), function(yes)
						if yes then
							xyd.MainController.get():restartGame()
						end
					end, __("RETRY"))
				else
					self.isReconnecting = true

					self:connect()
				end

				self.lastCloseTime = currentTime
			end

			self.isSocketClosed_ = true
		end
	end
end

function Backend:isSocketClosed()
	return self.isSocketClosed_
end

function Backend:close()
	if self.socket_ ~= nil then
		if not tolua.isnull(self.socket_) then
			self.socket_:Dispose()
		end

		self.socket_ = nil
	end
end

function Backend:onConnectAbnormal_(socket)
	if self.socket_ == socket and self.loginConnectTimeOutCallback ~= nil then
		self.loginConnectTimeOutCallback()
	end
end

function Backend:onSendTimeout_(socket)
	if self.socket_ == socket then
		-- block empty
	end
end

function Backend:registerOnceTrriger(eventName, listener)
	self.onceTrrigers_[eventName] = listener
end

function Backend:onSocketMessage_(socket, mid, message)
	if self.socket_ == socket then
		if UNITY_EDITOR then
			if not self.backKey then
				self.backKey = 1
			end

			if xyd.Global.isLoginInfoReceived and xyd.IS_TEST_WAIT_SERVER then
				XYDCo.WaitForTime(1, function()
					self:onSocketMessage2_(socket, mid, message)
					print("消息延迟1s回来===")
				end, "back_delay" .. self.backKey)

				self.backKey = self.backKey + 1
			else
				print("消息无延迟回来")
				self:onSocketMessage2_(socket, mid, message)
			end
		else
			self:onSocketMessage2_(socket, mid, message)
		end
	end
end

function Backend:onSocketMessage2_(socket, mid, message)
	mid = tostring(mid)

	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.RESULT_INFO,
		data = {
			mid = mid
		}
	})

	local msg = self.mid2ProtoResponses_[mid]

	if not msg then
		__TRACE(string.format("warning!!! received mid: 0x%04x but can not map response", mid))

		return
	end

	local seq = string.byte(message, 1) + string.byte(message, 2) * 256 + string.byte(message, 3) * 65536 + string.byte(message, 4) * 16777216

	if seq ~= 0 then
		self.lastSeq_ = seq
	end

	self.msgSizeCount_ = self.msgSizeCount_ + #message

	local pbmsg = string.sub(message, 5, -1)

	msg:ParseFromString(pbmsg)
	__TRACE("message recieved:\n" .. "mid:0x" .. string.format("%04x", mid) .. "\n" .. tostring(msg))

	local eventName = self.mid2EventNames_[mid]

	if self.onceTrrigers_[eventName] then
		self.onceTrrigers_[eventName]({
			name = eventName,
			params = msg
		})

		self.onceTrrigers_[eventName] = nil
	else
		xyd.EventDispatcher.outer():dispatchEvent({
			name = eventName,
			data = msg
		})
		xyd.EventDispatcher.inner():dispatchEvent({
			name = eventName,
			data = msg
		})
	end

	if self.msgSizeCount_ > GC_GAP then
		if mid == xyd.mid.GET_UNDOWNLOAD_MAIL_LIST then
			msg = nil
			self.mid2ProtoResponses_[mid] = messages_pb.mail_list()
		end

		self.msgSizeCount_ = 0

		LuaManager.Instance:LuaGC()
		jit.flush()
	end
end

function Backend:postLog(params, callback)
	local url = xyd.LoadingController.get():backendURL()

	params.mid = xyd.mid.LOG
	params.token = xyd.Global.token

	xyd.Backend.get():webRequest(url, params, callback)
end

function Backend:getServerInfo(callback)
	local params = {
		mid = 23,
		uid = xyd.Global.uid,
		platform_id = xyd.Global.platformId_
	}
	local url = xyd.LoadingController.get():backendURL()

	xyd.Backend.get():webRequest(url, params, callback)
end

return Backend
