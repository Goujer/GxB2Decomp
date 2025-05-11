-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/BaseTipPanel.lua

local BaseTipPanel = class("BaseTipPanel")
local DefaultOffsetY = 10

function BaseTipPanel:ctor()
	self:initUI()
end

function BaseTipPanel:registerEvents()
	if not self.eventProxy_ then
		self.eventProxy_ = xyd.EventProxy.new(xyd.EventDispatcher.inner(), self)
	end

	self.eventProxy_:addEventListener(xyd.event.WINDOW_WILL_CLOSE, handler(self, self.windowWillClose))
	self.eventProxy_:addEventListener(xyd.event.HANDLE_UI_CLICK, handler(self, self.onUIClick))
	self.eventProxy_:addEventListener(xyd.event.CLOSE_COMMON_TIP, handler(self, self.close))
	self.eventProxy_:addEventListener(xyd.event.ON_CLICK_BACKSPACE, handler(self, self.closeQuickly))
end

function BaseTipPanel:initUI()
	local prefab = xyd.AssetsLoader.get():loadPrefab(self.prefab_ or "")

	self.node_ = xyd.WindowManager.get():getNgui()
	self.go_ = NGUITools.AddChild(self.node_, prefab)
	self.panel_ = self.go_:GetComponent(typeof(UIPanel))
	self.offset_ = self.go_:ComponentByName("offset", typeof(UIWidget))
	self.spriteBg_ = self.offset_:ComponentByName("sprite_bg", typeof(UISprite))

	self.go_:SetActive(false)
	self.go_:AddComponent(typeof(AnimatedAlpha))

	self.animation_ = self.go_:AddComponent(typeof(UnityEngine.Animation))

	local animeClip1 = xyd.AssetsLoader.get():loadAnimClip("Animations/Windows/Common/tip_show")
	local animeClip2 = xyd.AssetsLoader.get():loadAnimClip("Animations/Windows/Common/tip_hide")

	self.animation_:AddClip(animeClip1, animeClip1.name)
	self.animation_:AddClip(animeClip2, animeClip2.name)

	self.animation_.enabled = false
	self.animEvent_ = self.go_:AddComponent(typeof(LuaAnimationEvent))
	self.animEvent_.callback = handler(self, self.onAnimEvent)

	self:registerEvents()
end

function BaseTipPanel:addTip(go, params)
	if tolua.isnull(self.go_) then
		self:initUI()
	end

	UIEventListener.Get(go).onPress = function(go, isPressed)
		if not tolua.isnull(go) then
			if self.animation_.isPlaying then
				self.playingPress_ = true

				return
			end

			if isPressed then
				self.isDraging_ = false

				if self.go_.activeSelf then
					self:closeQuickly()
				end
			elseif not self.isDraging_ then
				if not self.playingPress_ then
					self:show(go, params)
				else
					self.playingPress_ = false
				end
			end
		end
	end
	UIEventListener.Get(go).onDragStart = function(go)
		self.isDraging_ = true
	end
end

function BaseTipPanel:show(go, params)
	self.go_:SetActive(true)

	self.go_.transform.localScale = Vector3.one * 0.01
	self.animation_.enabled = true

	self.animation_:Play("tip_show")
	self:setContent(go, params)
	self:setTransform(go, params)
end

function BaseTipPanel:setTransform(go, params)
	NGUITools.SetLayer(self.go_, go.layer)

	local scrollView = go:GetComponentInParent(typeof(UIScrollView))

	if scrollView then
		local panel = scrollView:GetComponent(typeof(UIPanel))

		self.panel_.depth = panel.depth + 10
		self.go_.transform.parent = scrollView.transform.parent

		if not scrollView.onDragMoving then
			self.dragScrollView_ = scrollView
			self.dragScrollView_.onDragMoving = handler(self, self.onScrollDrag)
		end
	else
		local panel = go:GetComponentInParent(typeof(UIPanel))

		self.panel_.depth = panel.depth + 10
		self.go_.transform.parent = panel.transform
	end

	self.panel_.depth = math.max(self.panel_.depth, xyd.WindowLayerDepth.NAVIGATION_UI + 1)

	local offsetX = params.offsetX or 0
	local offsetY = params.offsetY or 0
	local l, t, r, b, localPos = self:getPositionSize(go, offsetX, offsetY)
	local result, leftRight, deltaX, deltaY = self:checkBorder(go, l, t, r, b)

	if result then
		if deltaX ~= 0 or deltaY ~= 0 then
			offsetX = offsetX - deltaX
			offsetY = offsetY - deltaY
			l, t, r, b, localPos = self:getPositionSize(go, offsetX, offsetY)
			self.go_.transform.localPosition = localPos
		else
			self.go_.transform.localPosition = localPos
		end
	else
		if leftRight then
			offsetX = -offsetX
		else
			offsetY = -offsetY
		end

		l, t, r, b, localPos = self:getPositionSize(go, offsetX, offsetY)
		result, leftRight, deltaX, deltaY = self:checkBorder(go, l, t, r, b)

		if deltaX ~= 0 or deltaY ~= 0 then
			offsetX = offsetX - deltaX
			offsetY = offsetY - deltaY
			l, t, r, b, localPos = self:getPositionSize(go, offsetX, offsetY)
		end

		self.go_.transform.localPosition = localPos
	end
end

function BaseTipPanel:getPositionSize(go, offsetX, offsetY)
	local localPos = go.transform.localPosition + Vector3(offsetX, offsetY, 0)
	local worldPos = go.transform.parent:TransformPoint(localPos)
	local container = self.go_.transform.parent
	local localPos2 = container:InverseTransformPoint(worldPos)
	local width, height = self.spriteBg_.width, self.spriteBg_.height
	local left = localPos2.x - width / 2
	local top = localPos2.y + height / 2
	local right = localPos2.x + width / 2
	local bottom = localPos2.y - height / 2

	return left, top, right, bottom, localPos2
end

function BaseTipPanel:getPositionSize2(go, offsetX, offsetY)
	local width, height = self.spriteBg_.width, self.spriteBg_.height

	if offsetY >= 0 then
		offsetY = offsetY + height / 2 + DefaultOffsetY
	else
		offsetY = offsetY - height / 2 - DefaultOffsetY
	end

	local localPos = go.transform.localPosition + Vector3(offsetX, offsetY, 0)
	local worldPos = go.transform.parent:TransformPoint(localPos)
	local container = self.go_.transform.parent
	local nodePos = container:InverseTransformPoint(self.node_.transform.position)
	local localPos2 = container:InverseTransformPoint(worldPos)

	localPos2.x = nodePos.x

	local left = localPos2.x - width / 2
	local top = localPos2.y + height / 2
	local right = localPos2.x + width / 2
	local bottom = localPos2.y - height / 2

	return left, top, right, bottom, localPos2
end

function BaseTipPanel:checkBorder(go, left, top, right, bottom)
	local container = self.go_.transform.parent
	local nodePos = container:InverseTransformPoint(self.node_.transform.position)
	local goPos = container:InverseTransformPoint(go.transform.position)
	local fixW, fixH = xyd.getFixedSize()
	local halfW = fixW / 2
	local halfH = fixH / 2
	local result = true
	local deltaX, deltaY = 0, 0
	local windowLeft = nodePos.x - halfW + 10
	local windowRight = nodePos.x + halfW - 10
	local windowTop = nodePos.y + halfH - 120
	local windowBottom = nodePos.y - halfH + 260
	local leftRight = false

	if right < goPos.x then
		leftRight = true

		if left < windowLeft then
			result = false
		end
	elseif left > goPos.x then
		leftRight = true

		if windowRight < right then
			result = false
		end
	elseif bottom > goPos.y then
		if windowTop < top then
			result = false
		end
	elseif top < goPos.y and bottom < windowBottom then
		result = false
	end

	if result then
		if windowRight < right then
			deltaX = right - windowRight
		elseif left < windowLeft then
			deltaX = left - windowLeft
		end

		if windowTop < top then
			deltaY = top - windowTop
		elseif bottom < windowBottom then
			deltaY = bottom - windowBottom
		end
	end

	return result, leftRight, deltaX, deltaY
end

function BaseTipPanel:setContent(go, params)
	return
end

function BaseTipPanel:close()
	if tolua.isnull(self.node_) or not self.go_.activeSelf then
		return
	end

	self.animation_:Play("tip_hide")

	self.go_.transform.parent = self.node_.transform

	self:clearDragScrollView()
end

function BaseTipPanel:closeQuickly()
	if tolua.isnull(self.node_) or not self.go_.activeSelf then
		return
	end

	self.go_:SetActive(false)

	self.animation_.enabled = false
	self.go_.transform.parent = self.node_.transform

	self:clearDragScrollView()
end

function BaseTipPanel:clearDragScrollView()
	if self.dragScrollView_ then
		self.dragScrollView_.onDragMoving = nil
		self.dragScrollView_ = nil
		self.initScrollPos_ = nil
	end
end

function BaseTipPanel:onScrollDrag()
	if not self.dragScrollView_ then
		return
	end

	local currPos = self.dragScrollView_.transform.localPosition

	if not self.initScrollPos_ then
		self.initScrollPos_ = currPos

		return
	end

	local deltaPos = currPos - self.initScrollPos_

	if math.abs(deltaPos.x) >= 20 or math.abs(deltaPos.y) >= 20 then
		self:close()
	end
end

function BaseTipPanel:onUIClick()
	if self.playingPress_ then
		return
	end

	self:close()
end

function BaseTipPanel:onAnimEvent(name)
	if name == "over" then
		self.go_:SetActive(false)
	end
end

function BaseTipPanel:windowWillClose(event)
	if not self.go_.activeSelf then
		return
	end

	local params = event.params
	local windowName = params.windowName
	local layerType = xyd.tables.window:getLayerType(windowName)

	if layerType ~= xyd.WindowLayerType.MSG_UI then
		self:closeQuickly()
	end
end

return BaseTipPanel
