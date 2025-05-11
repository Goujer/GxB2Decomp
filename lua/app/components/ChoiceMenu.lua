-- chunkname: @../../../Product/Bundles/Android/src/app/components/ChoiceMenu.lua

local ChoiceMenu = class("ChoiceMenu", import(".BaseIcon"))
local ChoiceItem = class("ChoiceItem", import("app.components.CopyComponent"))

function ChoiceMenu:ctor(parentGO)
	self.itemArr = {}
	self.all_y = 0

	ChoiceMenu.super.ctor(self, parentGO)
end

function ChoiceMenu:initUI()
	ChoiceMenu.super.initUI(self)

	self.go_widget = self.go:GetComponent(typeof(UIWidget))
	self.choice_item = self.go:NodeByName("choice_item").gameObject
end

function ChoiceMenu:getPrefabPath()
	return "Prefabs/Components/choice_menu"
end

function ChoiceMenu:update(list)
	for i in pairs(list) do
		if self.itemArr[i] then
			self.itemArr:SetActive(true)
			self.itemArr:updateData(list[i], i)
		else
			local tmp = NGUITools.AddChild(self.go.gameObject, self.choice_item.gameObject)
			local item = ChoiceItem.new(tmp, list[i], i)

			table.insert(self.itemArr, item)
		end
	end

	if #self.itemArr > #list then
		for i = #list + 1, #self.itemArr do
			self.itemArr[i]:SetActive(false)
		end
	end

	self:updatePosition()
end

function ChoiceMenu:updateOne(index, data)
	if self.itemArr[index] then
		self.itemArr[index]:SetActive(true)
		self.itemArr[index]:updateData(data, index)
		self:updatePosition()
	end
end

function ChoiceMenu:updatePosition()
	local all_y = 0

	for i in pairs(self.itemArr) do
		if self.itemArr[i]:getActiveSelf() then
			self.itemArr[i]:Y(-all_y)

			all_y = all_y + self.itemArr[i]:getHeight()
		end
	end

	self.all_y = all_y
	self.go_widget.height = self.all_y
end

function ChoiceMenu:getHeight()
	return self.all_y
end

function ChoiceItem:ctor(goItem, itemdata, index)
	self.goItem_ = goItem

	local transGo = goItem.transform

	self.bg = transGo:GetComponent(typeof(UISprite))
	self.choiceLabel = transGo:ComponentByName("choiceLabel", typeof(UILabel))

	self:updateData(itemdata, index)

	UIEventListener.Get(self.bg.gameObject).onClick = handler(self, self.onClick)
	UIEventListener.Get(self.bg.gameObject).onPress = function(go, isPressed)
		if isPressed then
			if self.data.choiceImg then
				xyd.setUISpriteAsync(self.bg, nil, self.data.choiceImg, nil, nil)
			end
		elseif self.data.img then
			xyd.setUISpriteAsync(self.bg, nil, self.data.img, nil, nil)
		end
	end
end

function ChoiceItem:updateData(data, index)
	self.index = index

	if data.img then
		xyd.setUISpriteAsync(self.bg, nil, data.img, nil, nil)
	end

	if data.width then
		self.bg.width = data.width
		self.choiceLabel.width = self.bg.width - 21
	end

	if data.height then
		self.bg.height = data.height
		self.choiceLabel.height = self.bg.height
	end

	if data.labelSize then
		self.choiceLabel.fontSize = data.labelSize
	end

	self.choiceLabel.text = data.value
	self.data = data
end

function ChoiceItem:onClick()
	if self.data and self.data.clickCallBack then
		self.data.clickCallBack(self.data, self.index)
	end
end

function ChoiceItem:SetActive(bool)
	self.goItem_:SetActive(bool)
end

function ChoiceItem:getActiveSelf()
	return self.goItem_.activeSelf
end

function ChoiceItem:Y(int_y)
	self.goItem_:Y(int_y)
end

function ChoiceItem:getHeight()
	return self.bg.height
end

return ChoiceMenu
