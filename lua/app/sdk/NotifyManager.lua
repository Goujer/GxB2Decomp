-- chunkname: @../../../Product/Bundles/Android/src/app/sdk/NotifyManager.lua

local NotifyManager = class("NotifyManager")
local PlayerPrefs = UnityEngine.PlayerPrefs
local cjson = require("cjson")
local NotifyNode = class("NotifyNode")

function NotifyNode:ctor()
	self.title_ = __("NAME_OF_GAME")
	self.id_ = 0
	self.message_ = ""
	self.time_ = 0
	self.deepLinkID_ = 0
end

function NotifyManager:ctor()
	self.notifyInterface_ = nil
	self.isInit_ = false
	self.notifyNodes_ = {}
	self.sortedNotify_ = {}
end

function NotifyManager.get()
	if NotifyManager.INSTANCE == nil then
		NotifyManager.INSTANCE = NotifyManager.new()
	end

	return NotifyManager.INSTANCE
end

function NotifyManager:init()
	if self.isInit_ then
		return
	end

	self.isInit_ = true
	self.notifyInterface_ = XYDNotification.Instance
	self.notifyInterface_.onAppPause = handler(self, self.onAppPause)
end

return NotifyManager
