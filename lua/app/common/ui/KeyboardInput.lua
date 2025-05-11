-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/KeyboardInput.lua

local KeyboardInput = {}

function KeyboardInput.__newindex(myTable, key, value)
	if key == "value" then
		myTable:Set(value, true)
	else
		rawset(myTable, key, value)
	end
end

function KeyboardInput.__index(myTable, key)
	if key == "value" then
		return myTable.mValue
	else
		return rawget(myTable, key)
	end
end

KeyboardInput.__cname = "KeyboardInput"
KeyboardInput.__ctype = 2

function KeyboardInput.new(...)
	local keyboard = setmetatable({}, KeyboardInput)

	for k, v in pairs(KeyboardInput) do
		if k ~= "__index" and k ~= "__newindex" then
			keyboard[k] = v
		end
	end

	keyboard:ctor(...)

	return keyboard
end

function KeyboardInput:ctor(input)
	self.onChange = {}
	self.onSelect = nil
	self.gameObject = input.gameObject
	self.transform = self.gameObject.transform
	self.label = input.label
	self.label.supportEncoding = true
	self.label.fontStyle = UnityEngine.FontStyle.Normal
	self.mValue = ""

	UnityEngine.Object.Destroy(input)

	UIEventListener.Get(self.gameObject).onSelect = handler(self, self.OnSelectInput)
end

function KeyboardInput:SetTotalNum(totalNum)
	self.totalNum = totalNum
end

function KeyboardInput:OnSelectInput(go, selected)
	if selected then
		local params = {}

		params.num = tonumber(self.mValue)
		params.max = self.totalNum
		params.input = self

		xyd.showSmallKeyboard(self.gameObject, params)
	end

	if self.onSelect then
		self.onSelect(go, selected)
	end
end

function KeyboardInput:Set(value, notify)
	value = value .. ""

	if self.mValue == value then
		return
	end

	if notify == nil then
		notify = true
	end

	self.mValue = value

	self:UpdateLabel()

	if notify then
		self:ExcuteOnChange()
	end
end

function KeyboardInput:ExcuteOnChange()
	for _, func in ipairs(self.onChange) do
		func()
	end
end

function KeyboardInput:UpdateLabel()
	self.label.text = xyd.getDisplayNumber(self.mValue)
end

return KeyboardInput
