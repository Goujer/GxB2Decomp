-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/CommonTabBar.lua

local CommonTabBar = class("CommonTabBar")
local Color = Color
local UILabel = UILabel
local UIToggle = UIToggle
local typeof = typeof
local XYDUtils = XYDUtils
local labelStates = {
	chosen = {
		color = Color.New2(4294967295),
		effectColor = Color.New2(473916927)
	},
	unchosen = {
		color = Color.New2(960513791),
		effectColor = Color.New2(4294967295)
	}
}

CommonTabBar.labelStates = labelStates

function CommonTabBar:ctor(parent, nums, callback, activityType, colorParams)
	self.parent = parent
	self.nums = nums
	self.currentIndex = 0
	self.callback = callback
	self.activityType = activityType
	self.colorParams = colorParams
	self.group_ = xyd.Global.getCommonBarNum() or 1

	xyd.Global.setCommonBarNum(self.group_ + 1)
	self:initTabs()
end

function CommonTabBar:initTabs()
	self.tabs = {}

	for i = 1, self.nums do
		local tab = self.parent:NodeByName("tab_" .. i).gameObject
		local label = tab:ComponentByName("label", typeof(UILabel))
		local redMark

		if tab:NodeByName("redMark") ~= nil then
			redMark = tab:NodeByName("redMark").gameObject
		end

		label.color = labelStates.unchosen.color
		label.effectColor = labelStates.unchosen.effectColor

		local unchosenImg = tab:NodeByName("unchosen")

		unchosenImg = unchosenImg and tab:ComponentByName("unchosen", typeof(UISprite))

		self:changeTextColor(label, "unchosen")

		local chosenImg = tab:NodeByName("chosen")

		chosenImg = chosenImg and tab:ComponentByName("chosen", typeof(UISprite))

		local toggle = self.parent:ComponentByName("tab_" .. i, typeof(UIToggle))

		self.tabs[i] = {
			tab = tab,
			label = label,
			toggle = toggle,
			redMark = redMark,
			unchosenImg = unchosenImg,
			chosenImg = chosenImg
		}

		if tonumber(self.group_) then
			toggle.group = tonumber(self.group_)
		end

		XYDUtils.AddEventDelegate(toggle.onChange, function()
			if toggle.value == true then
				self:onValueChange(i)
			end
		end)
		self:initTabsLayout(tab, i)
	end
end

function CommonTabBar:initTabsLayout(tab, i)
	if self.activityType ~= nil then
		local allWidth = self.parent:GetComponent(typeof(UIWidget)).width
		local countNum = 2
		local extraAddWidth = 0

		if self.activityType == xyd.EventType.COOL then
			if i == 2 then
				tab:SetActive(true)

				extraAddWidth = 0
			end

			countNum = 3

			tab:SetLocalPosition(allWidth / 3 * (i - 2), 0, 0)
		elseif self.activityType == xyd.EventType.LIMIT then
			if i == 2 then
				tab:SetActive(false)
			end

			countNum = 2
			extraAddWidth = 3
		end

		tab:GetComponent(typeof(UIWidget)).width = allWidth / countNum
		tab:ComponentByName("chosen", typeof(UIWidget)).width = allWidth / countNum + extraAddWidth
		tab:ComponentByName("unchosen", typeof(UIWidget)).width = allWidth / countNum + extraAddWidth
	end
end

function CommonTabBar:initCustomTabs(btns, values)
	self.tabs = {}
	self.values = values
	self.nums = #btns

	for i = 1, self.nums do
		local tab = btns[i]
		local label = tab:ComponentByName("label", typeof(UILabel))

		self:changeTextColor(label, "unchosen")

		local toggle = tab:GetComponent(typeof(UIToggle))

		self.tabs[i] = {
			tab = tab,
			label = label,
			toggle = toggle
		}

		XYDUtils.AddEventDelegate(toggle.onChange, function()
			if toggle.value == true then
				self:onValueChange(i)
			end
		end)
	end
end

function CommonTabBar:changeTextColor(label, selectStr)
	if self.colorParams ~= nil then
		label.color = self.colorParams[selectStr].color

		if self.colorParams[selectStr].effectColor then
			label.effectStyle = UILabel.Effect.Outline8
			label.effectColor = self.colorParams[selectStr].effectColor
		else
			label.effectStyle = UILabel.Effect.None
		end
	else
		label.color = labelStates[selectStr].color

		if labelStates[selectStr].effectColor then
			label.effectStyle = UILabel.Effect.Outline8
			label.effectColor = labelStates[selectStr].effectColor
		else
			label.effectStyle = UILabel.Effect.None
		end
	end
end

function CommonTabBar:setBrforeChangeFuc(func)
	self.beforeChangeFunction = func
end

function CommonTabBar:setCanCancelChoose(func)
	self.cancelChooseFunction = func
end

function CommonTabBar:cancelBefroChange(index, currentIndex)
	if self.beforeChangeFunction then
		if self.beforeChangeFunction(index, currentIndex) then
			return true
		end
	else
		return false
	end
end

function CommonTabBar:onValueChange(index)
	if self.currentIndex == index then
		if self.cancelChooseFunction then
			self:clearChoose()
			self.cancelChooseFunction()
		end

		return
	end

	if self:cancelBefroChange(index, self.currentIndex) then
		return
	end

	for i = 1, self.nums do
		if not tolua.isnull(self.tabs[i].unchosenImg) then
			if i ~= index then
				self.tabs[i].unchosenImg.gameObject:SetActive(true)
			else
				self.tabs[i].unchosenImg.gameObject:SetActive(false)
			end
		end
	end

	if self.currentIndex ~= 0 then
		local oldTab = self.tabs[self.currentIndex]
		local label = oldTab.label

		self:changeTextColor(label, "unchosen")
	end

	local tab = self.tabs[index]
	local label = tab.label

	self:changeTextColor(label, "chosen")

	if self.callback then
		local val = index

		if self.values then
			val = self.values[index]
		end

		self.callback(val)
	end

	self.currentIndex = index
end

function CommonTabBar:setTabEnable(index, enabled)
	local tab = self.tabs[index]

	if tab == nil then
		return
	end

	local toggle = tab.toggle

	toggle.enabled = enabled
end

function CommonTabBar:setTexts(texts)
	for i, tabs in ipairs(self.tabs) do
		tabs.label.text = texts[i] or ""
	end
end

function CommonTabBar:setTabActive(index, state, notify)
	notify = notify or true

	local tab = self.tabs[index]

	if tab == nil then
		return
	end

	tab.toggle:Set(state, notify)
end

function CommonTabBar:onClickBtn(index)
	if self.currentIndex ~= 0 then
		local oldTab = self.tabs[self.currentIndex]
		local label = oldTab.label

		self:changeTextColor(label, "unchosen")
	end

	local tab = self.tabs[index]
	local label = tab.label

	self:changeTextColor(label, "chosen")

	local toggle = self.parent:ComponentByName("tab_" .. index, typeof(UIToggle))

	toggle:SetInstantly(true)

	self.currentIndex = index
end

function CommonTabBar:getRedMark(index)
	local tab = self.tabs[index]

	if tab == nil then
		print("tab == nil")

		return
	end

	return tab.redMark
end

function CommonTabBar:setBtnState(index)
	for i = 1, #self.tabs do
		local tab = self.tabs[i]
		local label = tab.label

		if i == index then
			self:changeTextColor(label, "chosen")
			tab.unchosenImg.gameObject:SetActive(false)
		else
			self:changeTextColor(label, "unchosen")
			tab.unchosenImg.gameObject:SetActive(true)
		end
	end

	self.currentIndex = index
end

function CommonTabBar:clearChoose()
	for i = 1, #self.tabs do
		local tab = self.tabs[i]
		local label = tab.label

		self:changeTextColor(label, "unchosen")
		tab.unchosenImg.gameObject:SetActive(true)

		tab.chosenImg.alpha = 0.01

		if i == self.currentIndex then
			local toggle = tab.toggle

			toggle:Set(false)
		end
	end

	self.currentIndex = 0
end

return CommonTabBar
