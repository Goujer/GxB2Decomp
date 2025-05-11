-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/CommonSliderAndInput.lua

local CommonSliderAndInput = class("CommonSliderAndInput")
local KeyboardInput = import(".KeyboardInput")

function CommonSliderAndInput:ctor(slider, input, btnPlus, btnMinus)
	self.slider_ = slider
	self.slider_.numberOfSteps = 0
	self.input_ = KeyboardInput.new(input)
	self.sliderBgCollider_ = self.slider_.backgroundWidget:GetComponent(typeof(UnityEngine.BoxCollider))
	self.btnMinus_ = btnMinus
	self.btnPlus_ = btnPlus
	self.selectedNum_ = 0
	self.totalNum_ = 0
	self.startNum_ = 0
	self.callback_ = nil

	self:initUI()

	function self.calcLimitNumFunc_()
		return nil
	end
end

function CommonSliderAndInput:initUI()
	XYDUtils.AddEventDelegate(self.slider_.onChange, handler(self, self.onSliderChange))
	table.insert(self.input_.onChange, handler(self, self.onInputChange))

	self.input_.onSelect = handler(self, self.onInputSelected)

	if self.btnMinus_ then
		UIEventListener.Get(self.btnMinus_.gameObject).onClick = handler(self, self.onClickBtnMinus)
	end

	if self.btnPlus_ then
		UIEventListener.Get(self.btnPlus_.gameObject).onClick = handler(self, self.onClickBtnPlus)
	end
end

function CommonSliderAndInput:setChangeCallback(callback)
	self.callback_ = callback
end

function CommonSliderAndInput:setCalculateLimitNum(func)
	XYDCo.WaitForFrame(1, function()
		if not tolua.isnull(self.slider_) then
			self.calcLimitNumFunc_ = func

			self:onSliderChange()
		end
	end, nil)
end

function CommonSliderAndInput:initNumbers(totalNum, startNum, initNum)
	self.totalNum_ = totalNum or self.totalNum_
	self.startNum_ = startNum or self.startNum_

	self.input_:SetTotalNum(self.totalNum_)

	if self.totalNum_ <= self.startNum_ then
		self.sliderBgCollider_.enabled = false

		if self.startNum_ == 0 or self.totalNum_ == 0 then
			self.slider_:Set(0, true)
		else
			self.slider_:Set(1, true)
		end
	else
		self.sliderBgCollider_.enabled = true

		local num = initNum or self.startNum_

		self.selectedNum_ = num

		self.input_:Set(num, false)
		self.slider_:Set((num - self.startNum_) / (self.totalNum_ - self.startNum_), false)
	end
end

function CommonSliderAndInput:setNum(num, notify)
	self.input_:Set(num, notify)
end

function CommonSliderAndInput:setPercent(percent, notify)
	self.slider_:Set(percent, notify)
end

function CommonSliderAndInput:setStaticSelectedNum(num)
	self.input_:Set(num, false)
	self.slider_:Set(num / self.totalNum_, false)

	self.selectedNum_ = num
end

function CommonSliderAndInput:getSelectedNum()
	return self.selectedNum_
end

function CommonSliderAndInput:onInputSelected(go, isSelected)
	if isSelected then
		return
	end

	local num = tonumber(self.input_.value) or 0

	if self.totalNum_ <= self.startNum_ then
		self.input_:Set(self.totalNum_, false)

		return
	end

	local limitNum = self.calcLimitNumFunc_() or self.totalNum_

	if limitNum < num then
		self.input_:Set(limitNum, false)
	elseif num <= self.startNum_ then
		self.input_:Set(self.startNum_, false)
	end
end

function CommonSliderAndInput:onSliderChange()
	local value = self.slider_.value
	local num
	local deltaNum = self.totalNum_ - self.startNum_

	if deltaNum <= 0 then
		if self.totalNum_ == 0 then
			num = 0
		else
			num = self.totalNum_
		end
	else
		num = math.floor(self.startNum_ + deltaNum * value + 0.5)
		num = math.max(num, self.startNum_)

		local limitNum = self.calcLimitNumFunc_()

		if limitNum then
			num = math.min(num, limitNum)
		end
	end

	self.selectedNum_ = num

	self.input_:Set(num, false)

	local percent

	percent = deltaNum <= 0 and (self.totalNum_ == 0 and 0 or 1) or num <= self.startNum_ and 0 or (num - self.startNum_) / deltaNum

	self.slider_:Set(percent, false)

	if self.callback_ then
		self.callback_()
	end
end

function CommonSliderAndInput:onInputChange()
	local value = self.input_.value
	local num = tonumber(value) or 0
	local limitNum = self.calcLimitNumFunc_()

	if limitNum then
		num = math.min(num, limitNum)
	end

	num = math.min(num, self.totalNum_)
	num = math.max(num, self.startNum_)
	self.selectedNum_ = num

	local deltaNum = self.totalNum_ - self.startNum_
	local percent

	percent = deltaNum <= 0 and (self.totalNum_ == 0 and 0 or 1) or num <= self.startNum_ and 0 or (num - self.startNum_) / deltaNum

	self.slider_:Set(percent, false)

	if self.callback_ then
		self.callback_()
	end
end

function CommonSliderAndInput:onClickBtnPlus()
	local num = tonumber(self.input_.value)

	num = math.min(num + 1, self.totalNum_)

	local limitNum = self.calcLimitNumFunc_()

	if limitNum then
		num = math.min(num, limitNum)
	end

	self.input_:Set(num, true)
end

function CommonSliderAndInput:onClickBtnMinus()
	local num = tonumber(self.input_.value)

	num = math.min(self.totalNum_, math.max(num - 1, self.startNum_))

	self.input_:Set(num, true)
end

function CommonSliderAndInput:getSlider()
	return self.slider_
end

function CommonSliderAndInput:getInput()
	return self.input_
end

function CommonSliderAndInput:getValue()
	return self.slider_.value
end

function CommonSliderAndInput:getBtnPlus()
	return self.btnPlus_
end

function CommonSliderAndInput:getBtnMinus()
	return self.btnMinus_
end

function CommonSliderAndInput:getTotalNum()
	return self.totalNum_
end

return CommonSliderAndInput
