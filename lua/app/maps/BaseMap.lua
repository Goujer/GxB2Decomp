-- chunkname: @../../../Product/Bundles/Android/src/app/maps/BaseMap.lua

local BaseMap = class("BaseMap")
local AddChild = NGUITools.AddChild
local Screen = UnityEngine.Screen

function BaseMap:ctor(name, ...)
	self.node_ = nil
	self.mapType_ = nil
	self.name_ = name
	self.isActive_ = false
	self.navigating_ = false
	self.touchLimits_ = {}
	self.mapSprites_ = {}
	self.cachedUAtlas_ = {}

	for _, touch in pairs(xyd.MapTouchType) do
		self.touchLimits_[touch] = {}
	end

	self:registerEvents()
end

function BaseMap:registerEvent(eventName, callback)
	self.eventProxy_:addEventListener(eventName, callback)
end

function BaseMap:registerEvents()
	if not self.eventProxy_ then
		self.eventProxy_ = xyd.EventProxy.new(xyd.EventDispatcher.inner(), self)
	end
end

function BaseMap:unregisterEvents()
	if self.eventProxy_ then
		self.eventProxy_:removeAllEventListeners()

		self.eventProxy_ = nil
	end
end

function BaseMap:mapScroll(event)
	return
end

function BaseMap:mapScrollEnd(event)
	return
end

function BaseMap:mapClick(event)
	return
end

function BaseMap:mapZoom(event)
	return
end

function BaseMap:mapAutoZoom(event)
	return
end

function BaseMap:enterMap(params, callback, enteredCallback)
	return
end

function BaseMap:exitMap(params, callback)
	return
end

function BaseMap:cleanUp()
	return
end

function BaseMap:initialize()
	return
end

function BaseMap:changeActiveState(active)
	self.isActive_ = active
end

function BaseMap:setActive(active)
	self.isActive_ = active
end

function BaseMap:isActive()
	return self.isActive_
end

function BaseMap:getNode()
	return self.node_
end

function BaseMap:clearTouchLimitsByAllTypes()
	for _, touch in pairs(xyd.MapTouchType) do
		self.touchLimits_[touch] = {}
	end
end

function BaseMap:clearTouchLimitsByType(type)
	for _, limit in pairs(self.touchLimits_) do
		limit[type] = false
	end
end

function BaseMap:getUsingData()
	return {}
end

function BaseMap:setTouchLimit(touch, type, value)
	self.touchLimits_[touch][type] = value
end

function BaseMap:isTouchable(touch)
	local limits = self.touchLimits_[touch]

	for _, limit in pairs(limits) do
		if limit then
			return false
		end
	end

	return true
end

function BaseMap:getMapType()
	return self.mapType_
end

function BaseMap:getCameraPosition()
	return xyd.CameraManager.get():getPosition()
end

function BaseMap:getCameraSize()
	return xyd.CameraManager.get():getOrthographicSize()
end

function BaseMap:jumpToPosition(x, y)
	return
end

function BaseMap:getMapSprite(resName)
	if resName or UNITY_EDITOR then
		return self.mapSprites_[resName], self.mapSprites_[resName]
	end
end

function BaseMap:setMapSprite(resName, spriteRGB, spriteAlpha)
	if resName or UNITY_EDITOR then
		self.mapSprites_[resName] = spriteRGB
		self.mapSprites_[resName] = spriteAlpha
	end
end

function BaseMap:loadUAtlas(uAtlas, path)
	if path then
		if self.cachedUAtlas_[path] then
			return
		end

		self.cachedUAtlas_[path] = true
	end

	if self.mapSprites_ then
		for _, sp in pairs(uAtlas:getAllSprites()) do
			self.mapSprites_[sp.name] = sp
		end
	end

	uAtlas:dispose()
end

function BaseMap:unloadMapSprites()
	self.mapSprites_ = {}
	self.cachedUAtlas_ = {}
end

function BaseMap:navigateToPosition(position, params)
	self:cleanAnimations()
	self:setNavigating(true)

	params = params or {}

	local moveType = params.moveType or xyd.MoveType.NORMAL
	local cPos = self:getCameraPosition()

	if moveType ~= xyd.MoveType.FOCUS then
		self:setOldCameraSize(self:getCameraSize())
		self:setOldCameraPosition(Vector2(cPos.x, cPos.y))

		self.oldCameraFocusPostion_ = nil
	else
		self.oldCameraFocusPostion_ = Vector2(cPos.x, cPos.y)
	end

	local actionTime = params.time
	local time = 1

	if moveType == xyd.MoveType.FOCUS then
		self:setOldCameraPosition(Vector2(cPos.x, cPos.y))

		if actionTime and actionTime > 0 then
			time = actionTime
		else
			time = 0.4
		end
	elseif moveType == xyd.MoveType.NORMAL or moveType == xyd.MoveType.JUMP then
		time = 1
	elseif moveType == xyd.MoveType.FOLLOW then
		time = 2
	end

	local scale

	if params.scale then
		scale = params.scale

		xyd.CameraManager.get():setTargetScale(scale)
	end

	local screenPos = params.screenPos
	local targetZoom, targetPosition = self:calculateMoveZoomAndPosition(position, scale, screenPos, moveType)

	self.targetingPos_ = targetPosition
	self.targetingZoom_ = xyd.CameraManager.get():getCameraRate() / scale

	if moveType == xyd.MoveType.NORMAL or moveType == xyd.MoveType.JUMP or moveType == xyd.MoveType.FOLLOW or moveType == xyd.MoveType.JUMP_GUIDE or moveType == xyd.MoveType.JUMP_FORCE_GUIDE then
		self:setTouchLimit(xyd.MapTouchType.SCROLL, xyd.TouchLimitType.SELF, true)
		self:setTouchLimit(xyd.MapTouchType.ZOOM, xyd.TouchLimitType.SELF, true)
		self:setTouchLimit(xyd.MapTouchType.CLICK, xyd.TouchLimitType.SELF, true)
	end

	local cameraMgr = self.Camera

	cameraMgr:cancelAutoScroll()

	local cnode = cameraMgr:getNode()
	local camera = cameraMgr:getCamera()
	local cameraSize = self:getCameraSize()
	local cameraPosition = self:getCameraPosition()

	if not Mathf.Approximately(cameraSize, self.targetingZoom_) or not Mathf.Approximately(cameraPosition.x, targetPosition.x) or not Mathf.Approximately(cameraPosition.y, targetPosition.y) then
		self.sequence_:Append(camera:DOOrthoSize(self.targetingZoom_, time):SetEase(self:getEaseType(params.scaleEaseType))):Insert(0, cnode.transform:DOLocalMove(targetPosition, time):SetEase(self:getEaseType(params.moveEaseType)))
	end

	self.sequence_:SetAutoKill():OnUpdate(function()
		self:updateMapStatus()
	end):OnComplete(function()
		self:cleanAnimations()

		if params.callback then
			params.callback()
		end
	end)
end

function BaseMap:cleanAnimations()
	self:setNavigating(false)
	self:newSequence()
	self:cleanAutoZoomAnimation()
	self:clearTouchLimitsByType(xyd.TouchLimitType.SELF)
end

function BaseMap:isNavigating()
	return self.navigating_
end

function BaseMap:newSequence()
	if not tolua.isnull(self.sequence_) then
		self.sequence_:Kill(false)
	end

	self.sequence_ = DG.Tweening.DOTween.Sequence()
end

function BaseMap:setCameraPosition(pos)
	return
end

function BaseMap:calculateMoveZoomAndPosition(position, scale, screenPos, moveType, isNavBack)
	local targetZoom, targetPosition

	local function correctPosition(tmpx, tmpy, fakeW, fakeH, toSize)
		if tmpx - fakeW < self.normalRect_.x then
			tmpx = self.normalRect_.x + fakeW
		end

		if tmpx + fakeW > self.normalRect_.x + self.normalRect_.width then
			tmpx = self.normalRect_.x + self.normalRect_.width - fakeW
		end

		local topMargine = self:viewportToPixel(xyd.WindowManager.get():getTopMargine(), toSize)
		local bottomMargine = self:viewportToPixel(xyd.WindowManager.get():getBottomMargine(), toSize)

		if tmpy + fakeH > topMargine - self.normalRect_.y then
			tmpy = -fakeH + topMargine - self.normalRect_.y
		end

		if tmpy - fakeH < -self.normalRect_.y - self.normalRect_.height - bottomMargine then
			tmpy = -self.normalRect_.y - self.normalRect_.height + fakeH - bottomMargine
		end

		return Vector3(tmpx, tmpy, 0)
	end

	if moveType == xyd.MoveType.NORMAL then
		if isNavBack then
			targetZoom = scale

			local fakeH, fakeW = targetZoom, targetZoom * Screen.width / Screen.height

			targetPosition = correctPosition(position.x, position.y, fakeW, fakeH, targetZoom)
		else
			targetZoom = self:getCameraSize()

			local fakeH, fakeW = targetZoom, targetZoom * Screen.width / Screen.height

			targetPosition = correctPosition(position.x, position.y, fakeW, fakeH, targetZoom)
		end
	elseif moveType == xyd.MoveType.FOCUS then
		screenPos = screenPos or Vector3.zero
		targetZoom = math.floor(1080 / scale * Screen.height / Screen.width / 2)

		local fakeH, fakeW = targetZoom, targetZoom * Screen.width / Screen.height
		local tmpx, tmpy = fakeW + position.x - 2 * fakeW * screenPos.x / Screen.width, fakeH + position.y - 2 * fakeH * screenPos.y / Screen.height

		targetPosition = correctPosition(tmpx, tmpy, fakeW, fakeH, targetZoom)
	elseif moveType == xyd.MoveType.JUMP then
		if scale then
			targetZoom = math.floor(1080 / scale * Screen.height / Screen.width / 2)
		else
			targetZoom = self:getCameraSize()
		end

		local fakeH, fakeW = targetZoom, targetZoom * Screen.width / Screen.height
		local tmpx, tmpy = fakeW + position.x - 2 * fakeW * 0.5, fakeH + position.y - 2 * fakeH * 0.5

		targetPosition = correctPosition(tmpx, tmpy, fakeW, fakeH, targetZoom)
	end

	return targetZoom, targetPosition
end

function BaseMap:navBack()
	if not self.isActive_ then
		return
	end

	if self.oldCameraSize_ == nil or self.oldCameraPosition_ == nil then
		return
	end

	local position = self.oldCameraFocusPostion_ or self.oldCameraPosition_
	local scale = self.oldCameraSize_
	local screenPos = Vector2(0, 0)
	local moveType = xyd.MoveType.NORMAL
	local isNavBack = true
	local targetZoom, targetPosition = self:calculateMoveZoomAndPosition(position, scale, screenPos, moveType, isNavBack)

	self:clearMoveOldStatus()
	self:cleanAnimations()

	local time = 0.4
	local cameraMgr = self.Camera
	local cnode = cameraMgr:getNode()
	local camera = cameraMgr:getCamera()

	self.sequence_:Append(camera:DOOrthoSize(targetZoom, time):SetEase(DG.Tweening.Ease.Linear)):Insert(0, cnode.transform:DOLocalMove(targetPosition, time):SetEase(DG.Tweening.Ease.Linear)):SetAutoKill():OnUpdate(function()
		self:updateMapStatus()
	end):OnComplete(function()
		self:cleanAnimations()
	end)
end

function BaseMap:clearMoveOldStatus()
	self.oldCameraSize_ = nil
	self.oldCameraPosition_ = nil
	self.oldCameraFocusPostion_ = nil
end

function BaseMap:setNavigating(navigating)
	self.navigating_ = navigating
end

function BaseMap:navigateToGrid(gridPos, scale, moveType, callback, moveEaseType, scaleEaseType)
	if moveEaseType == nil then
		moveEaseType = EaseType.Default
	end

	if scaleEaseType == nil then
		scaleEaseType = EaseType.Default
	end

	local worldPos = xyd.CameraManager.get():gridToWorldPoint(gridPos)

	self:navigateToPosition(worldPos, {
		scale = scale,
		screenPos = Vector2(xyd.getWidth() / 2, xyd.getHeight() / 2),
		moveType = moveType,
		callback = callback,
		moveEaseType = moveEaseType,
		scaleEaseType = scaleEaseType
	})
end

function BaseMap:navigateToGridDuringTime(startPos, gridPos, scale, moveType, callback, time, moveEaseType, scaleEaseType)
	if moveEaseType == nil then
		moveEaseType = EaseType.Default
	end

	if scaleEaseType == nil then
		scaleEaseType = EaseType.Default
	end

	self:setCameraPosition(startPos)

	local worldPos = xyd.CameraManager.get():gridToWorldPoint(gridPos)

	self:navigateToPosition(worldPos, {
		scale = scale,
		screenPos = Vector2(xyd.getWidth() / 2, xyd.getHeight() / 2),
		moveType = moveType,
		callback = callback,
		time = time,
		moveEaseType = moveEaseType,
		scaleEaseType = scaleEaseType
	})
end

function BaseMap:navigateToGridDuringTimeWithoutStartPos(gridPos, scale, moveType, callback, time, moveEaseType, scaleEaseType)
	if moveEaseType == nil then
		moveEaseType = EaseType.Default
	end

	if scaleEaseType == nil then
		scaleEaseType = EaseType.Default
	end

	local worldPos = xyd.CameraManager.get():gridToWorldPoint(gridPos)

	self:navigateToPosition(worldPos, {
		scale = scale,
		screenPos = Vector2(xyd.getWidth() / 2, xyd.getHeight() / 2),
		moveType = moveType,
		callback = callback,
		time = time,
		moveEaseType = moveEaseType,
		scaleEaseType = scaleEaseType
	})
end

function BaseMap:getEaseType(easeNum)
	local easeType = DG.Tweening.Ease.Linear

	if easeNum == EaseType.SineIn then
		easeType = DG.Tweening.Ease.InSine
	elseif easeNum == EaseType.SineOut then
		easeType = DG.Tweening.Ease.OutSine
	elseif easeNum == EaseType.SineInOut then
		easeType = DG.Tweening.Ease.InOutSine
	end

	return easeType
end

return BaseMap
