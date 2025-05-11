-- chunkname: @../../../Product/Bundles/Android/src/app/components/HouseShopTapItem.lua

local HouseShopTapItem = class("HouseShopTapItem")

function HouseShopTapItem:ctor(go)
	self.go = go

	self:registerEvent()
end

function HouseShopTapItem:setIndex(index)
	self.btnIndex_ = index
end

function HouseShopTapItem:setInfo(info)
	self.data = info
	self.page_ = info.page
	self.type_ = info.type
	self.wnd_ = info.wnd

	self:layout()
end

function HouseShopTapItem:getGameObject()
	return self.go
end

function HouseShopTapItem:registerEvent()
	UIEventListener.Get(self.go).onClick = handler(self, self.onTouch)
end

function HouseShopTapItem:onTouch()
	self.wnd_:onBtnTouch2(self.page_, self.btnIndex_)
end

function HouseShopTapItem:getPage()
	return self.page_
end

function HouseShopTapItem:setBtn(flag)
	if flag then
		self.go:GetComponent(typeof(UIButton)):SetEnabled(false)

		local label = self.go:ComponentByName("button_label", typeof(UILabel))

		if xyd.Global.lang == "de_de" or xyd.Global.lang == "en_en" or xyd.Global.lang == "fr_fr" then
			label.fontSize = 20
		end

		label.color = Color.New2(4294967295)
		label.effectStyle = UILabel.Effect.Outline
		label.effectColor = Color.New2(1012112383)
	else
		self.go:GetComponent(typeof(UIButton)):SetEnabled(true)

		local label = self.go:ComponentByName("button_label", typeof(UILabel))

		if xyd.Global.lang == "de_de" or xyd.Global.lang == "en_en" or xyd.Global.lang == "fr_fr" then
			label.fontSize = 20
		end

		label.color = Color.New2(960513791)
		label.effectStyle = UILabel.Effect.None
	end
end

function HouseShopTapItem:layout()
	self.go:ComponentByName("button_label", typeof(UILabel)).text = __("HOUSE_ITEM_TYPE_" .. tostring(self.type_))
end

return HouseShopTapItem
