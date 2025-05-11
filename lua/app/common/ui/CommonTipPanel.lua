-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/CommonTipPanel.lua

local CommonTipPanel = class("CommonTipPanel", import(".BaseTipPanel"))
local TipHeightMin = 32
local TipHeightMax = 500
local TipWidthMax = 560
local TipWidthMin = 150
local LeftArrow = 25
local RightArrow = 25
local TopArrow = 25
local BottomArrow = 25

function CommonTipPanel.get()
	if not CommonTipPanel.INSTANCE then
		CommonTipPanel.INSTANCE = CommonTipPanel.new()
	end

	return CommonTipPanel.INSTANCE
end

function CommonTipPanel:initUI()
	self.prefab_ = "Prefabs/Common/common_tip_panel"

	CommonTipPanel.super.initUI(self)

	self.labelTip_ = self.offset_:ComponentByName("label_tip", typeof(UILabel))
	self.topArrow_ = self.offset_:NodeByName("arrow_top")
	self.bottomArrow_ = self.offset_:NodeByName("arrow_bottom")
	self.leftArrow_ = self.offset_:NodeByName("arrow_left")
	self.rightArrow_ = self.offset_:NodeByName("arrow_right")
end

function CommonTipPanel:setContent(go, params)
	local tip = params.tip
	local alignment = params.alignment

	self.labelTip_.overflowMethod = UILabel.Overflow.ResizeFreely
	self.labelTip_.text = "[b][e5e5e5]" .. tip

	if self.labelTip_.width <= TipWidthMin then
		self.labelTip_.overflowMethod = UILabel.Overflow.ShrinkContent
		self.labelTip_.width = TipWidthMin
	elseif self.labelTip_.width >= TipWidthMax then
		self.labelTip_.overflowMethod = UILabel.Overflow.ResizeHeight
		self.labelTip_.width = TipWidthMax

		self.labelTip_:MakePixelPerfect()

		if self.labelTip_.height >= TipHeightMax then
			self.labelTip_.overflowMethod = UILabel.Overflow.ShrinkContent
			self.labelTip_.height = TipHeightMax
		end
	end

	if alignment then
		self.labelTip_.alignment = alignment
	else
		self.labelTip_.alignment = NGUIText.Alignment.Left
	end

	self.spriteBg_:SetAnchor(self.labelTip_.gameObject, 0, -30, 0, -22, 1, 14, 1, 26)
	self.spriteBg_:ResetAndUpdateAnchors()
end

function CommonTipPanel:setTransform(go, params)
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

	local pivot = params.pivot or xyd.TipPivot.BOTTOM
	local offsetX = params.offsetX or 0
	local offsetY = params.offsetY or 50
	local bgX = params.bgX or 0
	local bgY = params.bgY or 0
	local l, t, r, b, localPos = self:getPositionSize(go, offsetX, offsetY, pivot, bgX, bgY)
	local result, leftRight, deltaX, deltaY = self:checkBorder(go, l, t, r, b)

	if result then
		if deltaX ~= 0 or deltaY ~= 0 then
			bgX = bgX - deltaX
			bgY = bgY - deltaY
			l, t, r, b, localPos = self:getPositionSize(go, offsetX, offsetY, pivot, bgX, bgY)
			self.go_.transform.localPosition = localPos
		else
			self.go_.transform.localPosition = localPos
		end
	else
		local reverse = {
			[xyd.TipPivot.LEFT] = xyd.TipPivot.RIGHT,
			[xyd.TipPivot.RIGHT] = xyd.TipPivot.LEFT,
			[xyd.TipPivot.TOP] = xyd.TipPivot.BOTTOM,
			[xyd.TipPivot.BOTTOM] = xyd.TipPivot.TOP
		}

		pivot = reverse[pivot]

		if pivot == xyd.TipPivot.LEFT or pivot == xyd.TipPivot.RIGHT then
			offsetX = -offsetX
		else
			offsetY = -offsetY
		end

		l, t, r, b, localPos = self:getPositionSize(go, offsetX, offsetY, pivot, bgX, bgY)
		self.go_.transform.localPosition = localPos
	end
end

function CommonTipPanel:getPositionSize(go, offsetX, offsetY, pivot, bgX, bgY)
	local localPos = go.transform.localPosition + Vector3(offsetX, offsetY, 0)
	local worldPos = go.transform.parent:TransformPoint(localPos)
	local container = self.go_.transform.parent
	local arrowPos = container:InverseTransformPoint(worldPos)
	local width, height = self.spriteBg_.width, self.spriteBg_.height

	self.leftArrow_:SetActive(false)
	self.rightArrow_:SetActive(false)
	self.topArrow_:SetActive(false)
	self.bottomArrow_:SetActive(false)

	local left, right, top, bottom, centerX, centerY, targetArrow

	if pivot == xyd.TipPivot.LEFT or pivot == xyd.TipPivot.RIGHT then
		if pivot == xyd.TipPivot.LEFT then
			targetArrow = self.leftArrow_
			left = arrowPos.x
			centerX = left + LeftArrow + width / 2
			right = centerX + width / 2
		else
			targetArrow = self.rightArrow_
			right = arrowPos.x
			centerX = right - RightArrow - width / 2
			left = centerX - width / 2
		end

		centerY = arrowPos.y + bgY
		bottom = centerY - height / 2
		top = bottom + height
	else
		if pivot == xyd.TipPivot.BOTTOM then
			targetArrow = self.bottomArrow_
			bottom = arrowPos.y
			centerY = bottom + BottomArrow + height / 2
			top = centerY + height / 2
		else
			targetArrow = self.topArrow_
			top = arrowPos.y
			centerY = top - TopArrow - height / 2
			bottom = centerY - height / 2
		end

		centerX = arrowPos.x + bgX
		left = centerX - width / 2
		right = left + width
	end

	targetArrow:SetActive(true)

	local centerPos = Vector3(centerX, centerY, 0)
	local deltaPos = centerPos - arrowPos

	self.offset_.transform.localPosition = deltaPos
	targetArrow.localPosition = -deltaPos

	return left, top, right, bottom, arrowPos
end

return CommonTipPanel
