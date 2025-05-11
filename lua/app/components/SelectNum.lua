-- chunkname: @../../../Product/Bundles/Android/src/app/components/SelectNum.lua

local SelectNum = class("SelectNum", import(".BaseComponent"))

function SelectNum:ctor(parentGo, state)
	self.state = state

	SelectNum.super.ctor(self, parentGo)

	self.curNum_ = 0
	self.isFirstChange = true

	self:getUIComponent()
	self:registerEvent()

	if xyd.isIosTest() then
		self:iosTestChangeUI1()
	end
end

function SelectNum:getPrefabPath()
	return "Prefabs/Components/select_num_" .. self.state
end

function SelectNum:setInfo(params)
	self.delForceZero = params.delForceZero
	self.maxNum = params.maxNum
	self.ShowMaxNumOfSplitMode = params.ShowMaxNumOfSplitMode
	self.maxCanBuyNum = params.maxCanBuyNum
	self.feetNum = params.feetNum
	self.splitMode = params.splitMode

	if self.splitMode then
		self.go:NodeByName("splitMode").gameObject:SetActive(true)

		self.inputLabel = self.go:ComponentByName("splitMode/inputLabel", typeof(UILabel))
		self.maxLabel = self.go:ComponentByName("splitMode/labelMax", typeof(UILabel))
		self.maxLabel.text = self.ShowMaxNumOfSplitMode
	end

	if self.maxNum and self.maxCanBuyNum then
		self.actualMaxNum = math.min(self.maxNum, self.maxCanBuyNum)

		if self.actualMaxNum <= 0 then
			self.actualMaxNum = 1
		end
	end

	if params.curNum then
		self.curNum_ = params.curNum
	else
		self.curNum_ = self.actualMaxNum or params.maxNum
	end

	self.minNum = params.minNum or 0

	self.inputLabel:SetActive(true)
	self.promptLabel:SetActive(false)

	if self.state == "friend" then
		self.promptLabel:SetActive(true)
		self.inputLabel:SetActive(false)
	end

	self.inputLabel.text = self.curNum_
	self.callback = params.callback
	self.addCallback = params.addCallback
	self.maxLength = params.maxLength
	self.delCallback = params.delCallback
	self.maxCallback = params.maxCallback
	self.minCallback = params.minCallback
	self.touchCallback = params.touchCallback
	self.sureCallback = params.sureCallback
	self.isTouchMaxCallback = params.isTouchMaxCallback

	if self.callback and not params.notCallback then
		self.callback(self.curNum_)
	end

	self.noKeyBord = params.noKeyBord
end

function SelectNum:getUIComponent()
	self.numberKeyBoard = self.go:NodeByName("number_keyboard").gameObject
	self.selectBG = self.go:ComponentByName("selectBG", typeof(UISprite))
	self.inputLabel = self.go:ComponentByName("inputLabel", typeof(UILabel))
	self.promptLabel = self.go:ComponentByName("promptLabel", typeof(UILabel))
	self.btnAdd = self.go:ComponentByName("btnAdd", typeof(UISprite))
	self.btnSub = self.go:ComponentByName("btnSub", typeof(UISprite))
	self.numBtns = {}

	for i = 0, 9 do
		self.numBtns[i] = self.go:ComponentByName("number_keyboard/btn" .. i .. "_", typeof(UISprite))
	end

	self.btnC = self.go:ComponentByName("number_keyboard/btnC_", typeof(UISprite))
	self.btnOK = self.go:ComponentByName("number_keyboard/btnOK_", typeof(UISprite))

	self.numberKeyBoard:SetActive(false)
	self.inputLabel:SetActive(false)

	if self.state == "minmax" or self.state == "explore" or self.state == "lafuli" then
		self.btnMin = self.go:ComponentByName("btnMin", typeof(UISprite))
		self.btnMax = self.go:ComponentByName("btnMax", typeof(UISprite))
		self.selectBG2 = self.go:NodeByName("selectBG2").gameObject
	end

	if self.state == "friend" then
		self.promptLabel:SetActive(true)
	end

	self.closeBg = self.go:ComponentByName("number_keyboard/closeBg", typeof(UIWidget))
end

function SelectNum:registerEvent()
	for i = 0, 9 do
		local btn = self.numBtns[i].gameObject

		xyd.setDarkenBtnBehavior(btn, self, function()
			self:onNum(i)
		end)
	end

	xyd.setDarkenBtnBehavior(self.btnC.gameObject, self, self.onClear)
	xyd.setDarkenBtnBehavior(self.btnOK.gameObject, self, self.onSure)
	xyd.setDarkenBtnBehavior(self.btnAdd.gameObject, self, self.addTouch)
	xyd.setDarkenBtnBehavior(self.btnSub.gameObject, self, self.delTouch)

	if self.state == "minmax" or self.state == "explore" or self.state == "lafuli" then
		xyd.setDarkenBtnBehavior(self.btnMax.gameObject, self, self.maxTouch)
		xyd.setDarkenBtnBehavior(self.btnMin.gameObject, self, self.minTouch)

		UIEventListener.Get(self.selectBG2).onClick = handler(self, self.textInputTouch)
	end

	UIEventListener.Get(self.selectBG.gameObject).onClick = handler(self, self.textInputTouch)
	UIEventListener.Get(self.closeBg.gameObject).onClick = handler(self, self.onSure)
end

function SelectNum:minTouch()
	self.curNum_ = 1

	if self.delForceZero then
		self.curNum_ = 0
	end

	self.inputLabel:SetActive(true)
	self.promptLabel:SetActive(false)
	self:changeCurNum()

	if self.minCallback ~= nil then
		self.minCallback()
	end
end

function SelectNum:maxTouch()
	if self.maxNum then
		local callFlag = true
		local maxNum = self.actualMaxNum or self.maxNum

		if self.actualMaxNum and self.actualMaxNum < self.maxNum or maxNum >= self.curNum_ + 1 then
			callFlag = false
		end

		self.curNum_ = maxNum

		self.inputLabel:SetActive(true)
		self.promptLabel:SetActive(false)

		if self.isTouchMaxCallback then
			self.isTouchMaxCallback()
		end

		self:changeCurNum()

		if self.maxCallback ~= nil and callFlag then
			self.maxCallback()
		end
	end
end

function SelectNum:delTouch()
	self:updateCurNum()

	local feetNum = self.feetNum or 1

	if feetNum < self.curNum_ or feetNum >= self.curNum_ and self.delForceZero then
		self.curNum_ = xyd.checkCondition(self.curNum_ - feetNum < self.minNum, self.minNum, self.curNum_ - feetNum)

		self.inputLabel:SetActive(true)
		self.promptLabel:SetActive(false)
		self:changeCurNum()

		if self.delCallback ~= nil then
			self.delCallback()
		end

		self.isFirstChange = false
	end
end

function SelectNum:addTouch()
	self:updateCurNum()

	local feetNum = self.feetNum or 1

	if self.maxNum ~= nil and self.curNum_ >= self.maxNum and self.maxCallback then
		self.maxCallback()
	end

	if self.maxNum == nil or self.curNum_ < self.maxNum then
		if self.actualMaxNum and self.curNum_ >= self.actualMaxNum then
			return
		elseif self.actualMaxNum then
			self.curNum_ = xyd.checkCondition(self.curNum_ + feetNum > self.actualMaxNum, self.actualMaxNum, self.curNum_ + feetNum)
		elseif self.maxNum then
			self.curNum_ = xyd.checkCondition(self.curNum_ + feetNum > self.maxNum, self.maxNum, self.curNum_ + feetNum)
		else
			self.curNum_ = self.curNum_ + feetNum
		end

		self.inputLabel:SetActive(true)
		self.promptLabel:SetActive(false)
		self:changeCurNum()

		self.isFirstChange = false
	end

	if self.addCallback ~= nil then
		self.addCallback()
	end
end

function SelectNum:updateCurNum()
	if self.inputLabel.gameObject.activeSelf then
		self.curNum_ = tonumber(self.inputLabel.text)
	else
		self.curNum_ = tonumber(self.promptLabel.text)
	end
end

function SelectNum:textInputTouch()
	if self.noKeyBord then
		return
	end

	self.numberKeyBoard:SetActive(true)

	local text = self.inputLabel.text
	local num = tonumber(text) or 0

	if self.actualMaxNum and num > self.actualMaxNum then
		self.inputLabel.text = tostring(self.actualMaxNum)
		self.curNum_ = self.actualMaxNum
	elseif self.maxNum and num > self.maxNum then
		self.inputLabel.text = tostring(self.maxNum)
		self.curNum_ = self.maxNum
	else
		self.curNum_ = num
	end

	if self.touchCallback then
		self.touchCallback()
	end

	self:changeCurNum()
end

function SelectNum:changeCurNum()
	self.inputLabel.text = tostring(self.curNum_)

	if self.inputLabel.text == "0" and not self.delForceZero then
		self.inputLabel.text = "1"
	end

	if self.state == "friend" and not (tonumber(self.curNum_) > 0) then
		self.inputLabel:SetActive(false)
		self.promptLabel:SetActive(true)
	end

	if self.callback then
		self.callback(self.curNum_)
	end
end

function SelectNum:onNum(i)
	if self.maxNum == 0 then
		if self.maxCallback then
			self:maxCallback()
		end

		return
	end

	self.inputLabel:SetActive(true)
	self.promptLabel:SetActive(false)

	if self.inputLabel.text == "0" then
		self.inputLabel.text = ""
	end

	local tmpText

	if self.isFirstChange == false then
		tmpText = tostring(self.inputLabel.text) .. i
	else
		if tonumber(i) == 0 then
			tmpText = tostring(self.inputLabel.text) .. i
		else
			tmpText = tostring(i)
		end

		self.isFirstChange = false
	end

	if self.maxLength and tmpText ~= nil and #tmpText > self.maxLength then
		return
	end

	if self.actualMaxNum then
		if tonumber(tmpText) <= self.actualMaxNum then
			self.inputLabel.text = tmpText
		else
			self.inputLabel.text = self.actualMaxNum
		end
	elseif self.maxNum == nil or tonumber(tmpText) <= self.maxNum then
		self.inputLabel.text = tmpText
	elseif self.maxNum < tonumber(tmpText) then
		self.inputLabel.text = tostring(self.maxNum)

		if self.maxCallback then
			self.maxCallback()
		end
	elseif self.minNum > tonumber(tmpText) then
		self.inputLabel:SetActive(false)
		self.promptLabel:SetActive(true)
	end

	if self.callback then
		self.callback(tonumber(self.inputLabel.text))
	end

	if self.addCallback then
		self.addCallback()
	end
end

function SelectNum:onClear()
	if self.minNum then
		self.inputLabel.text = tostring(self.minNum)
	else
		self.inputLabel.text = "1"
	end

	if not self.clearNotCallback and self.callback then
		local default = tonumber(self.inputLabel.text) or tonumber(self.promptLabel.text) or 0

		self.callback(default)
	end

	self.isFirstChange = true
end

function SelectNum:onSure()
	self.numberKeyBoard:SetActive(false)

	if self.sureCallback then
		self.sureCallback()
	end
end

function SelectNum:setKeyboardPos(x, y)
	self.numberKeyBoard:SetLocalPosition(x, y, 0)
end

function SelectNum:setKeyboardScale(x, y)
	self.numberKeyBoard:SetLocalScale(x, y, 1)
end

function SelectNum:setFontSize(inputSize, promptSize)
	if inputSize then
		self.inputLabel.fontSize = inputSize
	end

	if promptSize then
		self.promptLabel.fontSize = promptSize
	end
end

function SelectNum:setInputLabel(params)
	xyd.setLabel(self.inputLabel, params)
end

function SelectNum:setPrompt(text)
	self.promptLabel.text = tostring(text)
end

function SelectNum:setMaxNum(value, cost)
	self.maxNum = value

	if cost then
		local totalCoin = self.backpack_:getItemNumByID(cost[1])

		self.maxCanBuyNum = math.floor(totalCoin / cost[2])
		self.actualMaxNum = math.min(self.maxNum, self.maxCanBuyNum)
	end
end

function SelectNum:setSelectBG(flag)
	self.selectBG:SetActive(flag)
end

function SelectNum:setSelectBG2(flag)
	if self.selectBG2 then
		self.selectBG2:SetActive(flag)
	end
end

function SelectNum:setFirstChange(flag)
	self.isFirstChange = flag
end

function SelectNum:setCurNum(value)
	self.curNum_ = value
	self.inputLabel.text = tostring(self.curNum_)
end

function SelectNum:setSelectBGSize(width, height)
	if width then
		self.selectBG.width = width
	end

	if height then
		self.selectBG.height = height
	end
end

function SelectNum:setBtnPos(x)
	self:waitForFrame(1, function()
		self.btnAdd:X(x)
		self.btnSub:X(-x)
	end)
end

function SelectNum:setMaxAndMinBtnPos(x)
	if not self.btnMax or not self.btnMin then
		return
	end

	self:waitForFrame(1, function()
		self.btnMax:X(x)
		self.btnMin:X(-x)
	end)
end

function SelectNum:setBtnScale(scale)
	self.btnAdd.transform.localScale = Vector3(scale, scale, scale)
	self.btnSub.transform.localScale = Vector3(scale, scale, scale)
end

function SelectNum:showPasteBtn(callback)
	if self.state ~= "friend" then
		return
	end

	self.btnPaste = self.go:NodeByName("btnPaste").gameObject

	self.btnPaste:SetActive(true)

	UIEventListener.Get(self.btnPaste).onClick = function()
		callback(NGUITools.clipboard)
	end
end

function SelectNum:iosTestChangeUI1()
	xyd.setUISprite(self.selectBG, nil, "9gongge25_ios_test")

	if self.selectBG2 then
		xyd.setUISprite(self.selectBG2, nil, "9gongge25_ios_test")
	end

	xyd.setUISprite(self.btnAdd:GetComponent(typeof(UISprite)), nil, "hc_add_ios_test")
	xyd.setUISprite(self.btnSub:GetComponent(typeof(UISprite)), nil, "hc_sub_ios_test")

	if self.btnMin then
		xyd.setUISprite(self.btnMin, nil, "btn_min_ios_test")
		xyd.setUISprite(self.btnMax, nil, "btn_max_ios_test")
	end

	for i = 0, 9 do
		xyd.setUISprite(self.numBtns[i]:GetComponent(typeof(UISprite)), nil, "white_btn_65_65_ios_test")
	end

	xyd.setUISprite(self.btnOK:GetComponent(typeof(UISprite)), nil, "blue_btn_65_65_ios_test")
	xyd.setUISprite(self.btnC:GetComponent(typeof(UISprite)), nil, "white_btn_65_65_ios_test")
end

function SelectNum:SetNilAnchor()
	self.btnAdd:GetComponent(typeof(UIWidget)):SetAnchor(nil, 0, 0, 0, 0, 0, 0, 0, 0)
	self.btnSub:GetComponent(typeof(UIWidget)):SetAnchor(nil, 0, 0, 0, 0, 0, 0, 0, 0)
	self.btnMax:GetComponent(typeof(UIWidget)):SetAnchor(nil, 0, 0, 0, 0, 0, 0, 0, 0)
	self.btnMin:GetComponent(typeof(UIWidget)):SetAnchor(nil, 0, 0, 0, 0, 0, 0, 0, 0)
end

function SelectNum:setSelectBGSprite(name)
	xyd.setUISpriteAsync(self.selectBG, nil, name)
end

return SelectNum
