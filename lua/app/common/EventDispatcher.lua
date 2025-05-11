-- chunkname: @../../../Product/Bundles/Android/src/app/common/EventDispatcher.lua

local EventDispatcher = class("EventDispatcher")

function EventDispatcher.outer()
	if EventDispatcher.INSTANCE == nil then
		EventDispatcher.INSTANCE = EventDispatcher.new()
	end

	return EventDispatcher.INSTANCE
end

function EventDispatcher.inner()
	if EventDispatcher.INNER_INSTANCE == nil then
		EventDispatcher.INNER_INSTANCE = EventDispatcher.new()
	end

	return EventDispatcher.INNER_INSTANCE
end

function EventDispatcher.loader()
	if EventDispatcher.LOADER_INSTANCE == nil then
		EventDispatcher.LOADER_INSTANCE = EventDispatcher.new()
	end

	return EventDispatcher.LOADER_INSTANCE
end

function EventDispatcher:ctor()
	self.listeners_ = {}
	self.nextListenerHandleIndex_ = 0
	self.listenersIDs_ = {}
end

function EventDispatcher:addEventListener(eventName, listener, tag)
	assert(type(eventName) == "string" and eventName ~= "", "EventDispatcher:addEventListener() - invalid eventName")

	eventName = string.upper(eventName)

	if self.listeners_[eventName] == nil then
		self.listeners_[eventName] = {}
	end

	if self.listenersIDs_[eventName] == nil then
		self.listenersIDs_[eventName] = {}
	end

	local ttag = type(tag)

	if ttag == "table" or ttag == "userdata" then
		listener = handler(tag, listener)
		tag = ""
	end

	self.nextListenerHandleIndex_ = self.nextListenerHandleIndex_ + 1

	local handle = self.nextListenerHandleIndex_

	tag = tag or ""
	self.listeners_[eventName][handle] = {
		listener,
		tag
	}

	table.insert(self.listenersIDs_[eventName], handle)

	if #self.listenersIDs_[eventName] > 1 then
		self:sortListeners(self.listenersIDs_[eventName])
	end

	return handle
end

function EventDispatcher:dispatchEvent(event)
	event.name = string.upper(tostring(event.name))

	local eventName = event.name

	if self.listeners_[eventName] == nil then
		return
	end

	event.stop_ = false

	function event:stop()
		self.stop_ = true
	end

	local ids = self.listenersIDs_[eventName] or {}
	local len = #ids
	local new_ids = {}

	for i = 1, len do
		table.insert(new_ids, ids[i])
	end

	for i = 1, len do
		local id = new_ids[i]
		local listener = self.listeners_[eventName][id]

		if listener then
			event.tag = listener[2]

			if listener[1] then
				listener[1](event)
			else
				__TRACE("no this func", eventName)
			end

			if event.stop_ then
				break
			end
		end
	end
end

function EventDispatcher:removeEventListener(handleToRemove)
	for eventName, listenersForEvent in pairs(self.listeners_) do
		local ids = self.listenersIDs_[eventName] or {}

		for handle, _ in pairs(listenersForEvent) do
			if handle == handleToRemove then
				listenersForEvent[handle] = nil

				table.removebyvalue(ids, handle)
			end
		end
	end
end

function EventDispatcher:removeEventListenersByTag(tagToRemove)
	for eventName, listenersForEvent in pairs(self.listeners_) do
		local ids = self.listenersIDs_[eventName] or {}

		for handle, listener in pairs(listenersForEvent) do
			if listener[2] == tagToRemove then
				listenersForEvent[handle] = nil

				table.removebyvalue(ids, handle)
			end
		end
	end
end

function EventDispatcher:removeEventListenersByEvent(eventName)
	self.listeners_[string.upper(eventName)] = nil
	self.listenersIDs_[string.upper(eventName)] = nil
end

function EventDispatcher:removeAllEventListeners()
	self.listeners_ = {}
	self.listenersIDs_ = {}
end

function EventDispatcher:hasEventListener(eventName)
	eventName = string.upper(tostring(eventName))

	local t = self.listeners_[eventName]

	for _, __ in pairs(t) do
		return true
	end

	return false
end

function EventDispatcher:dumpAllEventListeners()
	print("---- EventDispatcher:dumpAllEventListeners() ----")

	for name, listeners in pairs(self.listeners_) do
		printf("-- event: %s", name)

		for handle, listener in pairs(listeners) do
			printf("--     listener: %s, handle: %s", tostring(listener[1]), tostring(handle))
		end
	end
end

function EventDispatcher:sortListeners(list)
	table.sort(list)
end

return EventDispatcher
