-- chunkname: @../../../Product/Bundles/Android/src/app/common/EventProxy.lua

local EventProxy = class("EventProxy")

function EventProxy:ctor(eventDispatcher, view, cleanEventName)
	self.eventDispatcher_ = eventDispatcher
	self.handles_ = {}

	local cleanEventName = cleanEventName or "exit"
end

function EventProxy:addEventListener(eventName, listener, data)
	local handle = self.eventDispatcher_:addEventListener(eventName, listener, data)

	self.handles_[#self.handles_ + 1] = {
		eventName,
		handle
	}

	return self, handle
end

function EventProxy:removeEventListenerByName(eventName)
	for index, handle in pairs(self.handles_) do
		if handle[1] == eventName then
			self.eventDispatcher_:removeEventListener(handle[2])
			table.remove(self.handles_, index)

			break
		end
	end
end

function EventProxy:removeEventListener(eventHandle)
	self.eventDispatcher_:removeEventListener(eventHandle)

	for index, handle in pairs(self.handles_) do
		if handle[2] == eventHandle then
			table.remove(self.handles_, index)

			break
		end
	end

	return self
end

function EventProxy:getEventHandle(eventName)
	for key, handle in pairs(self.handles_) do
		if handle[1] == eventName then
			return handle[2]
		end
	end
end

function EventProxy:removeAllEventListeners()
	for _, handle in pairs(self.handles_) do
		self.eventDispatcher_:removeEventListener(handle[2])
	end

	self.handles_ = {}

	return self
end

function EventProxy:removeAllEventListenersByName(eventName)
	for key, handle in pairs(self.handles_) do
		if handle[1] == eventName then
			self.eventDispatcher_:removeEventListener(handle[2])

			self.handles_[key] = nil
		end
	end

	return self
end

return EventProxy
