-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/CommonKeyboardPanel.lua

local CommonKeyboardPanel = class("CommonKeyboardPanel")
local tostring = tostring
local tonumber = tonumber
local MaxNum = 99999999

function CommonKeyboardPanel.get()
	if not CommonKeyboardPanel.INSTANCE then
		CommonKeyboardPanel.INSTANCE = CommonKeyboardPanel.new()
	end

	return CommonKeyboardPanel.INSTANCE
end

function CommonKeyboardPanel:ctor()
	self:initUI()
end

function CommonKeyboardPanel:initUI()
	local prefab = xyd.AssetsLoader.get():loadPrefab("Prefabs/Windows/common_keyboard")

	self.node_ = xyd.WindowManager.get():getNgui()

	local go = NGUITools.AddChild(self.node_, prefab)

	self.go_ = go

	local goMask = go:NodeByName("widget_mask").gameObject

	UIEventListener.Get(goMask).onClick = handler(self, self.closeSelf)
	self.panel_ = go:GetComponent(typeof(UIPanel))
	self.panel_.depth = xyd.WindowLayerDepth.MSG_UI

	local offset = go:NodeByName("offset")

	self.offset_ = offset

	local spriteBg = offset:ComponentByName("sprite_bg", typeof(UISprite))

	self.height_ = spriteBg.height
	self.width_ = spriteBg.width
	self.labelNumber_ = offset:ComponentByName("input_num/label_num", typeof(UILabel))
	self.number_ = 0
	self.string_ = "0"
	self.spriteAll_ = offset:ComponentByName("input_num/sprite_all", typeof(UISprite))

	local gridNums = offset:ComponentByName("grid_nums", typeof(UIGrid))
	local button = offset:NodeByName("button").gameObject

	for i = 1, 9 do
		local goBtn

		if i < 9 then
			goBtn = NGUITools.AddChild(gridNums.gameObject, button)
		else
			button.transform.parent = gridNums.transform
			goBtn = button
		end

		local uiBtn = goBtn:GetComponent(typeof(UIButton))

		uiBtn:SetText(tostring(i))

		UIEventListener.Get(goBtn).onClick = function()
			self:onClickNumber(i)
		end
	end

	gridNums:Reposition()

	local button0 = offset:ComponentByName("button_0", typeof(UIButton))

	button0:SetText("0")

	UIEventListener.Get(button0.gameObject).onClick = function()
		self:onClickNumber(0)
	end

	local buttonBack = offset:NodeByName("button_back").gameObject

	UIEventListener.Get(buttonBack).onClick = handler(self, self.onClickBack)

	local buttonCheck = offset:NodeByName("button_check").gameObject

	UIEventListener.Get(buttonCheck).onClick = handler(self, self.onClickCheck)
	self.eventProxy_ = xyd.EventProxy.new(xyd.EventDispatcher.inner(), self)

	self.eventProxy_:addEventListener(xyd.event.ON_CLICK_BACKSPACE, handler(self, self.closeSelf))
	self.go_:SetActive(false)
end

function CommonKeyboardPanel:onClickNumber(number)
	self:checkInit()

	self.string_ = self.string_ .. tostring(number)

	local num = tonumber(self.string_)

	if num > self.max_ then
		num = self.max_
		self.string_ = tostring(num)
	end

	self.number_ = num
	self.labelNumber_.text = xyd.getDisplayNumber(self.number_)
end

function CommonKeyboardPanel:onClickBack()
	self:checkInit()

	if #self.string_ > 1 then
		self.string_ = string.sub(self.string_, 1, -2)
		self.number_ = tonumber(self.string_)
		self.labelNumber_.text = xyd.getDisplayNumber(self.number_)
	else
		self.string_ = "0"
		self.number_ = 0
		self.labelNumber_.text = "0"
	end
end

function CommonKeyboardPanel:checkInit()
	if self.init_ then
		self.spriteAll_.gameObject:SetActive(false)

		self.string_ = "0"
		self.number_ = 0
		self.labelNumber_.text = "0"
		self.init_ = false
	end
end

function CommonKeyboardPanel:onClickCheck()
	if not self.checkCallback or self.checkCallback(self.number_) then
		if self.input_ then
			self.input_:Set(self.number_, true)
			self.input_:OnSelectInput(self.input_.gameObject, false)
		end

		self:closeSelf()
	end
end

function CommonKeyboardPanel:show(go, params)
	self.go_:SetActive(true)

	if params.max then
		self.max_ = math.min(params.max, MaxNum)
	else
		self.max_ = MaxNum
	end

	local curr = params.num

	self.input_ = params.input
	self.callback_ = params.callback

	self:initNumber(curr)

	local offsetX, offsetY
	local halfW = self.width_ / 2
	local halfH = self.height_ / 2

	if params.offset then
		offsetX = params.offset.x
		offsetY = params.offset.y
	else
		local localPos = self.go_.transform:InverseTransformPoint(go.transform.position)

		if localPos.y < 0 then
			offsetY = localPos.y + halfH + 40
		else
			offsetY = localPos.y - halfH - 40
		end
	end

	local pos = Vector3(187, offsetY, 0)

	self.offset_.transform.localPosition = pos

	local min = Vector2(pos.x - self.width_ / 2, pos.y - self.height_ / 2)
	local max = Vector2(pos.x + self.width_ / 2, pos.y + self.height_ / 2)
	local constrain = self.panel_:CalculateConstrainOffset(min, max)

	self.offset_.localPosition = self.offset_.localPosition + constrain
	self.checkCallback = params.checkCallback

	if UNITY_EDITOR then
		self:startUpdating()
	end
end

function CommonKeyboardPanel:initNumber(number)
	self.string_ = tostring(number)
	self.labelNumber_.overflowMethod = UILabel.Overflow.ResizeFreely
	self.labelNumber_.text = xyd.getDisplayNumber(number)

	self.labelNumber_:ProcessText(false, true)

	self.number_ = number
	self.spriteAll_.width = self.labelNumber_.width

	self.spriteAll_.gameObject:SetActive(true)

	self.labelNumber_.overflowMethod = UILabel.Overflow.ClampContent
	self.labelNumber_.width = 324
	self.init_ = true
end

function CommonKeyboardPanel:closeSelf()
	if tolua.isnull(self.node_) then
		return
	end

	self.go_:SetActive(false)

	if UNITY_EDITOR then
		self:stopUpdating()
	end
end

function CommonKeyboardPanel:dispose()
	if self.eventProxy_ then
		self.eventProxy_:removeAllEventListeners()

		self.eventProxy_ = nil
	end

	self.go_:SetActive(false)
	UnityEngine.Object.Destroy(self.go_)

	self.go_ = nil
end

function CommonKeyboardPanel:startUpdating()
	if not self.isUpdatingInput_ then
		self.isUpdatingInput_ = true

		UpdateBeat:Add(self.updatingInput, self)
	end
end

function CommonKeyboardPanel:stopUpdating()
	if self.isUpdatingInput_ then
		self.isUpdatingInput_ = false

		UpdateBeat:Remove(self.updatingInput, self)
	end
end

function CommonKeyboardPanel:setCheckCallBack(callback)
	self.checkCallback = callback
end

function CommonKeyboardPanel:updatingInput()
	if not self.isUpdatingInput_ then
		return
	end

	local Input = UnityEngine.Input
	local KeyCode = UnityEngine.KeyCode

	if Input.GetKeyDown(KeyCode.Keypad0) then
		self:onClickNumber(0)
	elseif Input.GetKeyDown(KeyCode.Keypad1) then
		self:onClickNumber(1)
	elseif Input.GetKeyDown(KeyCode.Keypad2) then
		self:onClickNumber(2)
	elseif Input.GetKeyDown(KeyCode.Keypad3) then
		self:onClickNumber(3)
	elseif Input.GetKeyDown(KeyCode.Keypad4) then
		self:onClickNumber(4)
	elseif Input.GetKeyDown(KeyCode.Keypad5) then
		self:onClickNumber(5)
	elseif Input.GetKeyDown(KeyCode.Keypad6) then
		self:onClickNumber(6)
	elseif Input.GetKeyDown(KeyCode.Keypad7) then
		self:onClickNumber(7)
	elseif Input.GetKeyDown(KeyCode.Keypad8) then
		self:onClickNumber(8)
	elseif Input.GetKeyDown(KeyCode.Keypad9) then
		self:onClickNumber(9)
	elseif Input.GetKeyDown(KeyCode.Backspace) then
		self:onClickBack()
	elseif Input.GetKeyDown(KeyCode.KeypadEnter) or Input.GetKeyDown(KeyCode.Return) then
		self:onClickCheck()
	end
end

return CommonKeyboardPanel
