-- chunkname: @../../../Product/Bundles/Android/src/app/maps/CameraManager.lua

local CameraManager = class("CameraManager")
local Screen = UnityEngine.Screen
local Rect = UnityEngine.Rect
local TransparencySortMode = UnityEngine.TransparencySortMode
local Input = UnityEngine.Input
local OP_NONE = 0
local OP_DOWN = 1
local OP_MOVE = 2
local OP_UP = 3
local OP_CANCEL = 4
local DEFAULT_MAX_SPEED = 2000
local DEFAULT_SLIDE_TIME = 1.5
local DEFAULT_LONG_PRESS_DELAY = 0.35

function CameraManager.get()
	if CameraManager.INSTANCE == nil then
		CameraManager.INSTANCE = CameraManager.new()
	end

	return CameraManager.INSTANCE
end

function CameraManager:ctor()
	self.node_ = XYDUtils.FindGameObject("CameraManager")
	self.cameraNode_ = self.node_:NodeByName("Main Camera").gameObject
	self.camera_ = self.cameraNode_:GetComponent("Camera")

	local go = XYDUtils.CreateGameObject("AudioSources")

	go.transform.parent = self.node_.transform
	self.audioListener_ = self.node_:AddComponent(typeof(UnityEngine.AudioListener))
	self.audioListener_.enabled = false
end

function CameraManager:playShakeAnimation()
	if not tolua.isnull(self.camera_) then
		self.camera_.transform:DOShakePosition(0.1, 20, 20, 45, false):OnComplete(function()
			local transform = self.camera_.transform

			transform.localPosition = Vector3(0, 0, transform.localPosition.z)
		end)
	end
end

function CameraManager:playShakeAnimation2(duration, strength, vibrato, randomness, snapping)
	if not tolua.isnull(self.camera_) then
		return self.camera_.transform:DOShakePosition(duration, strength, vibrato, randomness, snapping):OnComplete(function()
			local transform = self.camera_.transform

			transform.localPosition = Vector3(0, 0, transform.localPosition.z)
		end)
	end
end

function CameraManager:setMaxSpeedPerSecond(val)
	self.maxSpeedPerSecond_ = val
end

function CameraManager:setSlideTime(val)
	self.slideTime_ = val
end

function CameraManager:setEnabled(val)
	if self.isEnabled_ == val then
		return
	end

	self.isEnabled_ = val

	if val then
		UpdateBeat:Add(self.updateMapHandle, self)
	else
		UpdateBeat:Remove(self.updateMapHandle, self)
	end
end

function CameraManager:getPosition()
	return self.node_.transform.position
end

function CameraManager:setPosition(position)
	self.node_.transform.position = position
end

function CameraManager:getLocalEulerAngles()
	return self.node_.transform.localEulerAngles
end

function CameraManager:setLocalEulerAngles(angles)
	self.node_.transform.localEulerAngles = angles
end

function CameraManager:getCameraDistance()
	return -self.camera_.transform.localPosition.z
end

function CameraManager:setCameraDistance(distance)
	local localPosition = self.camera_.transform.localPosition

	localPosition.z = -distance
	self.camera_.transform.localPosition = localPosition
end

function CameraManager:getOrthographicSize()
	return self.camera_.orthographicSize
end

function CameraManager:setOrthographicSize(size)
	xyd.EventDispatcher.inner():dispatchEvent({
		name = xyd.event.ON_CAMERASIZE_CHANGE
	})

	self.camera_.orthographicSize = size
end

function CameraManager:setTargetScale(scale)
	self.targetScale = scale
end

function CameraManager:getTargetScale()
	if self.targetScale then
		return self.targetScale
	else
		local cameraSize = self:getOrthographicSize()
		local Rate = self:getCameraRate()

		return Rate / cameraSize
	end
end

function CameraManager:getCameraRate()
	local sHeight, sWidth = Screen.height, Screen.width
	local rate = xyd.STANDARD_WIDTH * sHeight / sWidth / 2

	return rate
end

function CameraManager:setOrthographic(p)
	self.camera_.orthographic = p
	self.camera_.transparencySortMode = TransparencySortMode.Orthographic
end

function CameraManager:setFieldOfView(fieldOfView)
	self.camera_.fieldOfView = fieldOfView
end

function CameraManager:setAngle(angle)
	self.node_.transform.localEulerAngles = Vector3(-angle, 0, 0)
end

function CameraManager:setRotation(rotation)
	self.camera_.transform.localEulerAngles = Vector3(0, 0, rotation)
end

function CameraManager:screenToWorldPoint(position)
	return self.camera_:ScreenToWorldPoint(position)
end

function CameraManager:gridToWorldPoint(position)
	local x = (position.x - position.y) * xyd.GRID_WIDTH_HALF + xyd.MAP_WIDTH / 2
	local y = (position.x + position.y) * xyd.GRID_HEIGHT_HALF

	return Vector2(x, -y)
end

function CameraManager:screenToGridPoint(position)
	local worldPos = self.camera_:ScreenToWorldPoint(position)

	return self:worldToGridPoint(worldPos)
end

function CameraManager:worldToGridPoint(position)
	local ux = position.x
	local uy = -position.y
	local xmy = (ux - xyd.MAP_WIDTH / 2) / xyd.GRID_WIDTH
	local xay = uy / xyd.GRID_HEIGHT
	local gridX = xmy + xay
	local gridY = xay - xmy

	return Vector2(math.floor(gridX), math.floor(gridY))
end

function CameraManager:worldToGridPointFloat(position)
	local ux = position.x
	local uy = -position.y
	local xmy = (ux - xyd.MAP_WIDTH / 2) / xyd.GRID_WIDTH
	local xay = uy / xyd.GRID_HEIGHT
	local gridX = xmy + xay
	local gridY = xay - xmy

	return Vector2(gridX, gridY)
end

function CameraManager:worldToScreenPoint(position)
	return self.camera_:WorldToScreenPoint(position)
end

function CameraManager:screenPointToRay(position)
	return self.camera_:ScreenPointToRay(position)
end

function CameraManager:getPlanePosition(pos)
	local temp

	if pos.z == nil then
		temp = Vector3(pos.x, pos.y, 0)
	else
		temp = pos
	end

	local ray = self:screenPointToRay(temp)
	local bol, distance = self.plane_:Raycast(ray)

	if bol then
		return ray:GetPoint(distance)
	end

	return Vector3.zero
end

function CameraManager:getPlaneDelta(pos1, pos2)
	return self:getPlanePosition(pos2) - self:getPlanePosition(pos1)
end

function CameraManager:getVertexPos()
	local centerPos = self:getPosition()
	local size = self:getOrthographicSize()
	local Screen = UnityEngine.Screen
	local screenW = Screen.width
	local screenH = Screen.height
	local rate = screenH / screenW
	local widthSize = size / rate
	local leftX = centerPos.x - widthSize
	local rightX = centerPos.x + widthSize
	local topY = centerPos.y + size
	local bottomY = centerPos.y - size

	return leftX, rightX, topY, bottomY
end

function CameraManager:getVertexPosWithOffset(offset)
	local lx, rx, ty, by = self:getVertexPos()

	lx = lx - offset
	rx = rx + offset
	by = by - offset
	ty = ty + offset

	return lx, rx, ty, by
end

function CameraManager:updateMapHandle()
	if not self.isEnabled_ then
		return
	end

	if tolua.isnull(self.camera_) then
		return
	end

	if UNITY_EDITOR or UNITY_STANDALONE then
		self:updateDesktop()
	else
		self:updateMobile()
	end
end

function CameraManager:beginLongPressDelay()
	XYDCo.WaitForTime(DEFAULT_LONG_PRESS_DELAY, function()
		self:beginLongPress()
	end, "LongPressDelay")
end

function CameraManager:cancelLongPressDelay()
	XYDCo.StopWait("LongPressDelay")
end

function CameraManager:beginLongPress()
	local params = {
		position = self.touchBeginPosition
	}
	local data = {
		name = xyd.event.HANDLE_LONG_PRESS_BEGIN,
		params = params
	}

	xyd.EventDispatcher:inner():dispatchEvent(data)
end

function CameraManager:cancelLongPress()
	xyd.EventDispatcher:inner():dispatchEvent({
		name = xyd.event.HANDLE_LONG_PRESS_END
	})
end

function CameraManager:updateDesktop()
	local isOverUI = XYDUtils.IsMouseOverUI()
	local currentPosition
	local phase = OP_NONE

	if Input.GetMouseButtonDown(0) then
		currentPosition = Input.mousePosition
		self.touchBeginPosition = currentPosition
		phase = OP_DOWN
	elseif Input.GetMouseButton(0) then
		currentPosition = Input.mousePosition
		phase = OP_MOVE
	elseif Input.GetMouseButtonUp(0) then
		currentPosition = Input.mousePosition
		phase = OP_UP
	end

	local num = -Input.GetAxis("Mouse ScrollWheel")

	if not Mathf.Approximately(num, 0) and isOverUI then
		local worldPos = xyd.mouseWorldPos(currentPosition or Input.mousePosition)

		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.HANDLE_MAP_ZOOM,
			params = {
				double_touch = true,
				delta = 1 + num,
				centerPos = worldPos
			}
		})
	end
end

function CameraManager:updateMobile()
	local isOverUI = XYDUtils.IsFingerOverUI()
	local currPos, currPos2
	local phase = OP_NONE
	local touchCount = Input.touchCount

	if touchCount == 1 then
		local touch = Input.GetTouch(0)

		currPos = touch.position

		if touch.phase == TouchPhase.Began then
			phase = OP_DOWN
			self.touchBeginPosition = currPos
		elseif touch.phase == TouchPhase.Moved or touch.phase == TouchPhase.Stationary then
			phase = OP_MOVE
		elseif touch.phase == TouchPhase.Ended or touch.phase == TouchPhase.Canceled then
			phase = OP_UP
		end

		if self.previousMagnitude_ then
			xyd.EventDispatcher.inner():dispatchEvent({
				name = xyd.event.HANDLE_MAP_ZOOM,
				params = {
					double_touch = false
				}
			})
		end

		self.previousMagnitude_ = nil
	elseif touchCount == 2 then
		local touch = Input.GetTouch(0)
		local touch2 = Input.GetTouch(1)

		currPos = touch.position
		currPos2 = touch2.position

		local centerPos = (currPos + currPos2) / 2
		local magnitude = (currPos2 - currPos).magnitude

		if isOverUI then
			local worldPos = xyd.mouseWorldPos(centerPos)
			local params = {
				double_touch = true,
				centerPos = worldPos
			}

			if self.previousMagnitude_ then
				params.delta = magnitude / self.previousMagnitude_
			else
				params.delta = 1
			end

			xyd.EventDispatcher.inner():dispatchEvent({
				name = xyd.event.HANDLE_MAP_ZOOM,
				params = params
			})
		end

		self.previousMagnitude_ = magnitude
	else
		if self.previousMagnitude_ then
			xyd.EventDispatcher.inner():dispatchEvent({
				name = xyd.event.HANDLE_MAP_ZOOM,
				params = {
					double_touch = false
				}
			})
		end

		self.previousMagnitude_ = nil
	end
end

function CameraManager:processScroll(isOverUI, phase, currPos, currPos2)
	if currPos and not self.touchArea_:Contains(currPos) or currPos2 and not self.touchArea_:Contains(currPos2) then
		phase = OP_CANCEL
	end

	if self.uiTouched_ == true and isOverUI == true and phase == OP_UP then
		self.uiTouched_ = false

		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.HANDLE_UI_CLICK,
			params = {
				position = currPos
			}
		})

		return
	end

	if phase == OP_DOWN then
		if isOverUI == false then
			self.mapTouched_ = true
			self.previousPosition_ = currPos
			self.acc = nil
			self.mapDragging_ = false
			self.autoScroll_ = false

			xyd.EventDispatcher.inner():dispatchEvent({
				name = xyd.event.HANDLE_MAP_PRESS
			})
			self:beginLongPressDelay()
		else
			self.uiTouched_ = true
		end
	elseif currPos then
		local delta = currPos

		if self.previousPosition_ then
			delta = currPos - self.previousPosition_
		end

		if phase ~= OP_MOVE or delta.magnitude > self.clickDelta_ then
			self:cancelLongPressDelay()
			self:cancelLongPress()
		end
	end

	if currPos2 then
		local centerPos = (currPos + currPos2) / 2

		currPos = centerPos

		if not self.multiTouch_ then
			self.multiTouch_ = true
			self.previousPosition_ = currPos
		end
	elseif not currPos2 and self.multiTouch_ then
		self.multiTouch_ = false

		if currPos then
			self.previousPosition_ = currPos
		end
	end

	if self.mapTouched_ then
		if phase == OP_MOVE then
			if not self.previousPosition_ then
				self.previousPosition_ = currPos
			end

			local pixelDelta = currPos - self.previousPosition_

			if self.mapDragging_ or pixelDelta.magnitude > self.clickDelta_ then
				self.mapDragging_ = true
				self.momentnum_ = self:getPlaneDelta(self.previousPosition_, currPos)

				xyd.EventDispatcher.inner():dispatchEvent({
					name = xyd.event.HANDLE_MAP_SCROLL,
					params = {
						momentnum = self.momentnum_
					}
				})

				self.previousPosition_ = currPos
			end
		elseif phase == OP_UP then
			self.acc = nil

			if self.mapDragging_ then
				self.autoScroll_ = true

				xyd.EventDispatcher.inner():dispatchEvent({
					name = xyd.event.HANDLE_MAP_SCROLL_END
				})
			else
				xyd.EventDispatcher.inner():dispatchEvent({
					name = xyd.event.HANDLE_MAP_CLICK,
					params = {
						position = currPos
					}
				})
			end

			self.mapDragging_ = false
			self.mapTouched_ = false
		elseif phase == OP_CANCEL then
			self.acc = nil

			if self.mapDragging_ then
				xyd.EventDispatcher.inner():dispatchEvent({
					name = xyd.event.HANDLE_MAP_SCROLL_END
				})
			end

			self.mapDragging_ = false
			self.mapTouched_ = false
		end
	elseif self.uiTouched_ then
		self:mapAutoScroll()

		if phase == OP_UP then
			self.uiTouched_ = false
		end
	elseif phase == OP_NONE then
		self:mapAutoScroll()
	end

	self.lastOverUI_ = isOverUI
end

function CameraManager:mapAutoScroll()
	if self.autoScroll_ then
		if self.acc == nil then
			if self.momentnum_.magnitude > self.maxSpeedPerSecond_ * Time.deltaTime then
				self.momentnum_ = self.momentnum_:Normalize() * self.maxSpeedPerSecond_ * Time.deltaTime
			end

			self.acc = self.momentnum_:Normalize() * math.max(self.momentnum_.magnitude / self.slideTime_ * Time.deltaTime, 200 * Time.deltaTime * Time.deltaTime)
		end

		self.momentnum_ = self.momentnum_ - self.acc

		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.HANDLE_MAP_SCROLL,
			params = {
				auto = true,
				momentnum = self.momentnum_,
				acc = self.acc
			}
		})

		if self.momentnum_.magnitude <= self.acc.magnitude then
			self.autoScroll_ = false

			xyd.EventDispatcher.inner():dispatchEvent({
				name = xyd.event.HANDLE_MAP_SCROLL_END,
				params = {
					auto = true
				}
			})
		end
	end

	if self.zoomed_ then
		xyd.EventDispatcher.inner():dispatchEvent({
			name = xyd.event.HANDLE_MAP_AUTO_ZOOM
		})

		self.zoomed_ = false
	end
end

function CameraManager:cancelAutoScroll()
	self.autoScroll_ = false
end

function CameraManager:isPointInCamera(point, offset, offset2)
	offset = offset or 0

	local lx, rx, ty, by = self:getVertexPosWithOffset(offset)
	local x = point.x
	local y = point.y

	if x > lx - offset and x < rx + offset and y > by - (offset2 or offset) and y < ty + (offset2 or offset) then
		return true
	end

	return false
end

function CameraManager:getNode()
	return self.node_
end

function CameraManager:getCamera()
	return self.camera_
end

function CameraManager:cleanUp()
	self:setEnabled(false)

	if not tolua.isnull(self.node_) then
		self.node_:SetActive(false)
		UnityEngine.Object.Destroy(self.node_)

		self.node_ = nil
	end

	self.cameraNode_ = nil
	self.camera_ = nil
end

return CameraManager
