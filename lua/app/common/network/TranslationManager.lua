-- chunkname: @../../../Product/Bundles/Android/src/app/common/network/TranslationManager.lua

local TranslationManager = class("TranslationManager")
local MAX_CONNECTIONS = 10

function TranslationManager:ctor()
	self.eventCount_ = 0
	self.waitQueue_ = {}
	self.translateContent_ = {}
end

function TranslationManager.get()
	if TranslationManager.INSTANCE == nil then
		TranslationManager.INSTANCE = TranslationManager.new()
	end

	return TranslationManager.INSTANCE
end

function TranslationManager:translate(msgID, msg, callback)
	self.eventCount_ = self.eventCount_ + 1

	if self.eventCount_ > MAX_CONNECTIONS then
		table.insert(self.waitQueue_, {
			msgID,
			msg
		})

		return
	end

	local params = {
		game_id = 115,
		time = os.time(),
		sid = xyd.Global.sid,
		msgID = msgID,
		text = msg,
		target = self:getLang()
	}
	local url = self:getUrl()

	local function func(response, success)
		self:onTranslated(response, success, msgID, callback)
	end

	xyd.Backend.get():webRequest(url, params, func, 5, true)
	__TRACE("translate=================", msgID, msg)
end

function TranslationManager:onTranslated(response, success, msgID, callback)
	if XYDUtils.IsTest() then
		-- block empty
	end

	local params = response.data or {}

	params.error = response.error

	if not success then
		params.error = response.error or -1
	end

	if not success then
		local str = response.error_description

		if not str or str == "" then
			str = "translate fail"
		end

		xyd.alert(xyd.AlertType.TIPS, str)
	else
		if params.error ~= 0 then
			xyd.alert(xyd.AlertType.TIPS, response.error_description)
		end

		callback(params)
	end

	print("TranslationManager:onTranslated--------------", success, msgID, params.transl)

	self.eventCount_ = self.eventCount_ - 1

	local nextWork = self.waitQueue_[1]

	if nextWork ~= nil and self.eventCount_ < MAX_CONNECTIONS then
		table.remove(self.waitQueue_, 1)
		self:translate(unpack(nextWork))
	end
end

function TranslationManager:getUrl()
	if self.url_ == nil then
		self.url_ = xyd.getHomeAPIUrl("translate_frontend")
	end

	return self.url_
end

function TranslationManager:getLang()
	if self.lang_ == nil then
		local lang = xyd.SdkManager.get():getTranslationLang()
		local arrs = string.split(lang, "_")

		if #arrs == 2 then
			if arrs[1] == "zh" then
				self.lang_ = arrs[1] .. "-" .. string.upper(arrs[2])
			elseif arrs[1] == "in" then
				self.lang_ = "id"
			else
				self.lang_ = arrs[1]
			end
		else
			if lang == "in" then
				lang = "id"
			end

			self.lang_ = lang
		end

		if arrs[1] == "zh" and self.lang_ ~= "zh-CN" then
			self.lang_ = "zh-TW"
		end
	end

	return self.lang_
end

return TranslationManager
