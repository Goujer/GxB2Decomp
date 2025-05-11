-- chunkname: @../../../Product/Bundles/Android/src/app/maps/SceneMap.lua

MAP_STATE = {
	STATE_CHANGING_DRESS = 2,
	STATE_NORMAL = 1,
	STATE_CLICK_MODE = -1,
	STATE_CHANGING_BUILDING = 3
}

local SceneMap = class("SceneMap", import(".BaseMap"))
local AddChild = NGUITools.AddChild
local Object = UnityEngine.Object
local Destroy = Object.Destroy
local SpriteRenderer = UnityEngine.SpriteRenderer
local Material = UnityEngine.Material
local Screen = UnityEngine.Screen
local Rect = UnityEngine.Rect
local GameObject = UnityEngine.GameObject
local MAP_MAX_SPEED = 2500
local MAP_SLIDE_TIME = 1

function SceneMap:ctor(...)
	SceneMap.super.ctor(self, ...)

	self._state = MAP_STATE.STATE_NORMAL
	self.normalRect_ = Rect(1124, 1132, 4096, 2048)
	self.sceneName_ = "SceneMap"
	self.MAX_ZORDER = 999
end

function SceneMap:enterMap(params, enterCallback)
	if self.isActive_ then
		return false
	end

	self:setActive(true)

	self.enterCallback_ = enterCallback

	self:initialize()
	self:initInternal()
	self:loadMapSprites()

	return true
end

function SceneMap:initialize()
	SceneMap.super.initialize(self)
	xyd.CameraManager.get():setEnabled(true)
	xyd.CameraManager.get():setMaxSpeedPerSecond(MAP_MAX_SPEED)
	xyd.CameraManager.get():setSlideTime(MAP_SLIDE_TIME)
	self:restoreCameraPosition()

	if not SceneUtils.HasLoadedScene(self.sceneName_) then
		SceneUtils.CreateScene(self.sceneName_)
	end

	self.node_ = GameObject(self.sceneName_ .. "_root")

	SceneUtils.MoveGameObjectToScene(self.node_, self.sceneName_)

	self.node_.layer = LayerMask.NameToLayer(xyd.Layers.SCENE)
	self.mapSpriteRenderers_ = {}
	self.mapSprites_ = {}
	self.cachedUAtlas_ = {}
	self.autoZoomAnimation_ = nil
end

function SceneMap:initViewSize()
	local sHeight, sWidth = Screen.height, Screen.width
	local rate = xyd.STANDARD_WIDTH * sHeight / sWidth / 2

	self.normalSize_ = math.floor(rate / xyd.CAMERA_NORMAL_SCALE)
	self.minSize_ = math.floor(rate / xyd.CAMERA_MIN_SCALE)
	self.minNormalSize_ = math.floor(rate / xyd.CAMERA_MIN_NORMAL_SCALE)
	self.maxSize_ = math.floor(rate / xyd.CAMERA_MAX_SCALE)
	self.maxNormalSize_ = math.floor(rate / xyd.CAMERA_MAX_NORMAL_SCALE)
end

function SceneMap:initInternal()
	return
end

function SceneMap:loadMapSprites()
	return
end

function SceneMap:onLoadMapSprites()
	return
end

function SceneMap:getEnterMapPos()
	return Vector3.zero
end

function SceneMap:restoreCameraPosition()
	xyd.CameraManager.get():setAngle(0)
	xyd.CameraManager.get():setOrthographic(true)
	xyd.CameraManager.get():setOrthographicSize(1)

	local mapPos = self:getEnterMapPos()

	self:setCameraPosition(mapPos)
end

function SceneMap:setCameraPosition(mapPos)
	local cameraPosition = self:calculateCameraPosition(mapPos)

	xyd.CameraManager.get():setPosition(cameraPosition)
	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.MAP_UPDATE_POSITION
	})
end

function SceneMap:callEnterCallback()
	if self.enterCallback_ then
		self.enterCallback_(self)

		self.enterCallback_ = nil
	end
end

function SceneMap:callExitCallback()
	if self.exitCallback_ then
		self.exitCallback_(self)

		self.exitCallback_ = nil
	end
end

function SceneMap:exitMap(params, callback)
	if not self.isActive_ then
		return
	end

	self:setActive(false)

	self.exitCallback_ = callback

	xyd.CameraManager.get():setEnabled(false)
	SceneMap.super.unregisterEvents(self)
	self:cleanUp()
end

function SceneMap:mapScroll(event)
	if not self.isActive_ or self.navigating_ then
		return false
	end

	if not self:isTouchable(xyd.MapTouchType.SCROLL) then
		return false
	end

	local params = event.params
	local delta = params.momentnum
	local cPosition = self:getCameraPosition()

	self:setCameraPosition(cPosition - delta)

	return true
end

function SceneMap:mapScrollEnd(event)
	if not self:isTouchable(xyd.MapTouchType.SCROLL) then
		xyd.CameraManager.get():cancelAutoScroll()

		return
	end
end

function SceneMap:mapZoom(event)
	if not self.isActive_ or self.navigating_ then
		return false
	end

	if not self:isTouchable(xyd.MapTouchType.ZOOM) then
		return false
	end

	local params = event.params
	local delta = params.delta

	self:cleanAnimations()

	local cameraSize = Mathf.Clamp(self:getCameraSize() * delta, self.minSize_, self.maxSize_)

	self:setZoom(cameraSize)

	return true
end

function SceneMap:mapClick(event)
	if not self.isActive_ then
		return false
	end

	if not self:isTouchable(xyd.MapTouchType.CLICK) then
		return false
	end

	if xyd.isOverUI() then
		return false
	end

	return true
end

function SceneMap:setZoom(cameraSize)
	xyd.CameraManager.get():setOrthographicSize(cameraSize)
	self:setCameraPosition(self:getCameraPosition())
end

function SceneMap:calculateCameraPosition(position)
	local v = position
	local rect = self.normalRect_
	local halfHeight = self:getCameraSize()
	local halfWidth = halfHeight * Screen.width / Screen.height
	local topMargine = xyd.WindowManager.get():getTopMargine()
	local bottomMargine = xyd.WindowManager.get():getBottomMargine()

	v.x = Mathf.Clamp(v.x, rect.x + halfWidth, rect.x + rect.width - halfWidth)
	v.y = Mathf.Clamp(v.y, -rect.y - rect.height + halfHeight - self:viewportToPixel(bottomMargine), -rect.y - halfHeight + self:viewportToPixel(topMargine))

	return v
end

function SceneMap:viewportToPixel(f, toSize)
	local size = toSize or self:getCameraSize()

	return f * 2 * size / xyd.WindowManager.get():getActiveHeight()
end

function SceneMap:cleanAnimations()
	SceneMap.super.cleanAnimations(self)
	self:cleanAutoZoomAnimation()
	self:clearTouchLimitsByType(xyd.TouchLimitType.SELF)
end

function SceneMap:cleanAutoZoomAnimation()
	if self.autoZoomAnimation_ ~= nil then
		coroutine.stop(self.autoZoomAnimation_)

		self.autoZoomAnimation_ = nil
	end
end

function SceneMap:mapAutoZoom(event)
	if not self.isActive_ or self.navigating_ then
		return
	end

	if not self:isTouchable(xyd.MapTouchType.ZOOM) then
		return
	end

	local function autoZoomAnimation()
		local currentZoomSpeed = 0
		local time = 0.3
		local targetZoom
		local needZoom = false
		local minZoom = self.minNormalSize_
		local maxZoom = self.maxNormalSize_
		local cameraSize = self:getCameraSize()

		if cameraSize < self.minNormalSize_ then
			needZoom = true
			targetZoom = minZoom
		elseif cameraSize > self.maxNormalSize_ then
			needZoom = true
			targetZoom = maxZoom
		end

		if not needZoom then
			self:cleanAutoZoomAnimation()

			return
		end

		while self.isActive_ and not Mathf.Approximately(cameraSize, targetZoom) do
			cameraSize, currentZoomSpeed = XYDUtils.SmoothDamp1(cameraSize, targetZoom, currentZoomSpeed, time)

			self:setZoom(cameraSize)

			time = time + Time.deltaTime

			coroutine.step()
		end

		self:cleanAutoZoomAnimation()
	end

	self:cleanAnimations()

	self.autoZoomAnimation_ = coroutine.start(autoZoomAnimation)

	return true
end

function SceneMap:jumpToPosition(x, y)
	local vec3 = Vector3(x, y, 0)

	self:setCameraPosition(vec3)
end

return SceneMap
