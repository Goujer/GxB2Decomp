-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/BaseController.lua

local BaseController = class("BaseController")

function BaseController:ctor(...)
	self.eventProxy_ = xyd.EventProxy.new(xyd.EventDispatcher.inner(), self)
	self.eventProxyOut_ = xyd.EventProxy.new(xyd.EventDispatcher.outer(), self)
end

function BaseController:onRegister()
	return
end

function BaseController:registerEvent(eventName, callback)
	self.eventProxy_:addEventListener(eventName, callback)
end

function BaseController:registerEventOut(eventName, callback)
	self.eventProxyOut_:addEventListener(eventName, callback)
end

function BaseController:reset()
	if self.eventProxy_ then
		self.eventProxy_:removeAllEventListeners()
	end

	if self.eventProxyOut_ then
		self.eventProxyOut_:removeAllEventListeners()
	end
end

return BaseController
