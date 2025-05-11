-- chunkname: @../../../Product/Bundles/Android/src/app/components/AttrTipsItem.lua

local AttrTipsItem = class("AttrTipsItem", import(".BaseComponent"))

function AttrTipsItem:ctor(parentGo)
	AttrTipsItem.super.ctor(self, parentGo)
end

function AttrTipsItem:getPrefabPath()
	return "Prefabs/Components/attr_tips"
end

function AttrTipsItem:initUI()
	AttrTipsItem.super.initUI(self)

	self.attrKey = self.go:ComponentByName("groupTips_/labelGroup/attrKey", typeof(UILabel))
	self.attrValue = self.go:ComponentByName("groupTips_/labelGroup/attrValue", typeof(UILabel))
end

function AttrTipsItem:setInfo(key, value)
	self.attrKey.text = __(string.upper(key))

	local bt = xyd.tables.dBuffTable
	local valueFix = value

	if bt:isShowPercent(key) then
		valueFix = math.floor(0.5 + value * 10000 / tonumber(xyd.checkCondition(bt:getFactor(key) > 0, bt:getFactor(key), 1))) / 100
		valueFix = tostring(valueFix) .. "%"
	end

	if value < 0 then
		self.attrKey.color = Color.New2(2751463679)
		self.attrValue.color = Color.New2(2751463679)
		self.attrValue.text = valueFix
	else
		self.attrKey.color = Color.New2(915996927)
		self.attrValue.color = Color.New2(915996927)
		self.attrValue.text = "+" .. tostring(valueFix)
	end
end

function AttrTipsItem:setString(str, value)
	self.attrKey.text = str

	if value < 0 then
		self.attrKey.color = Color.New2(2751463679)
		self.attrValue.color = Color.New2(2751463679)
		self.attrValue.text = value
	else
		self.attrKey.color = Color.New2(915996927)
		self.attrValue.color = Color.New2(915996927)
		self.attrValue.text = "+" .. value
	end
end

return AttrTipsItem
