-- chunkname: @../../../Product/Bundles/Android/src/app/common/PopupManager.lua

local PopupManager = class("PopupManager")

function PopupManager.get()
	if not PopupManager.INSTANCE then
		PopupManager.INSTANCE = PopupManager.new()
	end

	return PopupManager.INSTANCE
end

function PopupManager:ctor()
	self.popupList_ = {}

	self:registerEvents()
end

function PopupManager:registerEvents()
	self.eventProxy_ = xyd.EventProxy.new(xyd.EventDispatcher.inner(), self)

	self.eventProxy_:addEventListener(xyd.event.WINDOW_WILL_CLOSE, handler(self, self.onWindowWillClose))
end

function PopupManager:addWindow(window, params, priority)
	if self:canPopup() then
		self:setShowing(true, window)
		xyd.WindowManager.get():openWindow(window, params)
	else
		if self:hasWindow(window) then
			__TRACE("this window is in list:", window)

			return
		end

		local popupData = {}

		popupData.window = window
		popupData.params = params
		popupData.priority = priority or 0

		self:insertInTable(popupData)
	end
end

function PopupManager:insertInTable(data)
	self.popupList_[#self.popupList_ + 1] = data

	table.sort(self.popupList_, function(data1, data2)
		return data1.priority < data2.priority
	end)
end

function PopupManager:doPopupData()
	local length = #self.popupList_

	if length <= 0 then
		return
	end

	if self:canPopup() then
		local data = self.popupList_[length]

		self.popupList_[length] = nil

		if data.window then
			self:setShowing(true, data.window)
			xyd.WindowManager.get():openWindow(data.window, data.params)
		end
	end
end

function PopupManager:onWindowWillClose(event)
	local windowName = event.params.windowName

	if self.showingName_ then
		if self.showingName_ == windowName then
			self:setShowing(false)
			self:doPopupData()
		else
			local window = xyd.WindowManager.get():getWindow(self.showingName_)

			if not window then
				self:setShowing(false)
				self:doPopupData()
			end
		end
	elseif not self.isShowing_ then
		self:doPopupData()
	end
end

function PopupManager:hasWindow(window)
	for _, data in pairs(self.popupList_) do
		if data.window == window then
			return true
		end
	end

	return false
end

function PopupManager:setBattleFlag(flag)
	self.battleFlag_ = flag

	if not flag then
		-- block empty
	end
end

function PopupManager:canPopup()
	if self.battleFlag_ then
		return false
	end

	local targetMapType = xyd.MainController.get():getTargetMapType()
	local mapType = targetMapType or xyd.getMapType()

	if mapType == xyd.MapType.WAR or mapType == xyd.MapType.BATTLE then
		return false
	end

	if self:isWindowOpening() then
		return false
	end

	if self.isShowing_ then
		return false
	end

	return true
end

function PopupManager:setShowing(value, windowName)
	self.isShowing_ = value
	self.showingName_ = windowName
end

function PopupManager:getShowing()
	return self.isShowing_, self.showingName_
end

function PopupManager:isWindowOpening()
	local layers = {
		[xyd.WindowLayerType.FULL_SCREEN_UI] = true,
		[xyd.WindowLayerType.FLOATING_UI] = true
	}
	local windows = xyd.WindowManager.get():getWindowsOnLayers(layers)

	return #windows > 0
end

function PopupManager:printList()
	__TRACE(string.format("number:%s showingWindow:%s showing:%s", #self.popupList_, self.showingName_, self.isShowing_))

	for _, data in ipairs(self.popupList_) do
		if data.window then
			__TRACE("window-------", data.window)
		end
	end
end

return PopupManager
