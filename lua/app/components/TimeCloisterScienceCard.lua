-- chunkname: @../../../Product/Bundles/Android/src/app/components/TimeCloisterScienceCard.lua

local TimeCloisterScienceCard = class("TimeCloisterScienceCard", import("app.components.BaseComponent"))

function TimeCloisterScienceCard:ctor(parentGo, params)
	TimeCloisterScienceCard.super.ctor(self, parentGo)
end

function TimeCloisterScienceCard:getPrefabPath()
	return "Prefabs/Components/time_cloister_science_card"
end

function TimeCloisterScienceCard:initUI()
	self:getUIComponent()
	TimeCloisterScienceCard.super.initUI(self)
	self:registerEvent()
	self:layout()
end

function TimeCloisterScienceCard:getUIComponent()
	self.bg = self.go:ComponentByName("bg", typeof(UISprite))
	self.icon = self.go:ComponentByName("icon", typeof(UISprite))
	self.nameBg = self.go:ComponentByName("nameBg", typeof(UISprite))
	self.nameLabel = self.go:ComponentByName("nameLabel", typeof(UILabel))
	self.levLabel = self.go:ComponentByName("levLabel", typeof(UILabel))
	self.timesLabel = self.go:ComponentByName("timesLabel", typeof(UILabel))
	self.scoreLabel = self.go:ComponentByName("scoreLabel", typeof(UILabel))
	self.imgMask = self.go:ComponentByName("imgMask", typeof(UISprite))
	self.imgChoose = self.go:ComponentByName("imgChoose", typeof(UISprite))
end

function TimeCloisterScienceCard:layout()
	return
end

function TimeCloisterScienceCard:registerEvent()
	UIEventListener.Get(self.go.gameObject).onClick = handler(self, function()
		if self.callBack then
			self.callBack(self.index)
		else
			xyd.WindowManager.get():openWindow("time_cloister_crystal_detail_window", {
				index = self.index
			})
		end
	end)
end

function TimeCloisterScienceCard:setInfo(info)
	self.index = info.index

	local info = xyd.models.timeCloisterModel:getThreeCrystalCards(self.index)

	self.id = info.card
	self.buyTimes = info.buy_times

	if info.callBack then
		self.callBack = info.callBack
	end

	if xyd.Global.lang == "fr_fr" then
		self.levLabel.text = "NIV." .. xyd.tables.timeCloisterCrystalCardTable:getLevel(self.id)
	else
		self.levLabel.text = "LV." .. xyd.tables.timeCloisterCrystalCardTable:getLevel(self.id)
	end

	self.nameLabel.text = xyd.tables.timeCloisterCrystalCardTextTable:getName(self.id)

	local cardNum = xyd.tables.timeCloisterCrystalCardTable:getCardNum(self.id)

	if cardNum and cardNum > 0 then
		self.timesLabel.text = "(" .. self.buyTimes .. "/" .. cardNum .. ")"
	else
		self.timesLabel.text = "(" .. __("MAX") .. ")"
	end

	self.scoreLabel.text = tostring(xyd.tables.timeCloisterCrystalCardTable:getPoint(self.id))

	xyd.setUISpriteAsync(self.icon, nil, xyd.tables.timeCloisterCrystalCardTable:getImg(self.id), function()
		self.icon.gameObject:SetLocalScale(0.65, 0.65, 0.65)
	end, nil, true)
end

function TimeCloisterScienceCard:AddUIDragScrollView()
	if not self.go:GetComponent(typeof(UIDragScrollView)) then
		self.go:AddComponent(typeof(UIDragScrollView))
	end
end

function TimeCloisterScienceCard:setChoose(state)
	self.imgMask.gameObject:SetActive(state)
	self.imgChoose.gameObject:SetActive(state)
end

function TimeCloisterScienceCard:setCallback(callBack)
	self.callBack = callBack
end

return TimeCloisterScienceCard
