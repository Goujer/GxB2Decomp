-- chunkname: @../../../Product/Bundles/Android/src/app/components/ActivitySportsHelpItems.lua

local ActivitySportsHelpItems = class("ActivitySportsHelpItems")
local ActivitySportsHelp1 = class("ActivitySportsHelp1", import("app.components.BaseComponent"))
local ActivitySportsHelp2 = class("ActivitySportsHelp2", import("app.components.BaseComponent"))
local ActivitySportsHelp3 = class("ActivitySportsHelp3", import("app.components.BaseComponent"))

function ActivitySportsHelpItems:ctor()
	self.ActivitySportsHelp1 = ActivitySportsHelp1
	self.ActivitySportsHelp2 = ActivitySportsHelp2
	self.ActivitySportsHelp3 = ActivitySportsHelp3
end

function ActivitySportsHelp1:ctor(parentGo, params)
	ActivitySportsHelp1.super.ctor(self, parentGo)
end

function ActivitySportsHelp1:getPrefabPath()
	return "Prefabs/Components/sports_item_help1"
end

function ActivitySportsHelp1:initUI()
	self:getUIComponent()
	ActivitySportsHelp1.super.initUI(self)
	self:layout()
end

function ActivitySportsHelp1:getUIComponent()
	self.trans = self.go
	self.labelTitle = self.trans:ComponentByName("labelTitle", typeof(UILabel))
	self.allImg = self.trans:ComponentByName("allImg", typeof(UITexture))
	self.label1 = self.allImg:ComponentByName("label1", typeof(UILabel))
	self.label2 = self.allImg:ComponentByName("label2", typeof(UILabel))
	self.label3 = self.allImg:ComponentByName("label3", typeof(UILabel))
end

function ActivitySportsHelp1:layout()
	self.labelTitle.text = __("ACTIVITY_SPORTS_HELP_DES_1")
	self.label1.text = __("ACTIVITY_SPORTS_HELP_DES_3")
	self.label2.text = __("ACTIVITY_SPORTS_HELP_DES_4")
	self.label3.text = __("ACTIVITY_SPORTS_HELP_DES_5")

	xyd.setUITextureByNameAsync(self.allImg, "sports_help_1_1_" .. xyd.Global.lang, true)
end

function ActivitySportsHelp2:ctor(parentGo, params)
	ActivitySportsHelp2.super.ctor(self, parentGo)
end

function ActivitySportsHelp2:getPrefabPath()
	return "Prefabs/Components/sports_item_help2"
end

function ActivitySportsHelp2:initUI()
	self:getUIComponent()
	ActivitySportsHelp2.super.initUI(self)
	self:layout()
end

function ActivitySportsHelp2:getUIComponent()
	self.trans = self.go
	self.group1 = self.trans:NodeByName("group1").gameObject
	self.icon1 = self.group1:ComponentByName("icon1", typeof(UITexture))
	self.name1 = self.icon1:ComponentByName("name1", typeof(UILabel))
	self.label1 = self.group1:ComponentByName("label1", typeof(UILabel))
	self.labelBg1 = self.group1:ComponentByName("labelBg1", typeof(UISprite))
	self.group2 = self.trans:NodeByName("group2").gameObject
	self.icon2 = self.group2:ComponentByName("icon2", typeof(UITexture))
	self.name2 = self.icon2:ComponentByName("name2", typeof(UILabel))
	self.label2 = self.group2:ComponentByName("label2", typeof(UILabel))
	self.labelBg2 = self.group2:ComponentByName("labelBg2", typeof(UISprite))
	self.group3 = self.trans:NodeByName("group3").gameObject
	self.icon3 = self.group3:ComponentByName("icon3", typeof(UITexture))
	self.name3 = self.icon3:ComponentByName("name3", typeof(UILabel))
	self.label3 = self.group3:ComponentByName("label3", typeof(UILabel))
	self.labelBg3 = self.group3:ComponentByName("labelBg3", typeof(UISprite))
	self.group4 = self.trans:NodeByName("group4").gameObject
	self.icon4 = self.group4:ComponentByName("icon4", typeof(UITexture))
	self.name4 = self.icon4:ComponentByName("name4", typeof(UILabel))
	self.label4 = self.group4:ComponentByName("label4", typeof(UILabel))
	self.labelBg4 = self.group4:ComponentByName("labelBg4", typeof(UISprite))
end

function ActivitySportsHelp2:layout()
	self.name1.text = __("ACTIVITY_SPORTS_LABEL_5")
	self.name2.text = __("ACTIVITY_SPORTS_LABEL_1")
	self.name3.text = __("ACTIVITY_SPORTS_LABEL_4")
	self.name4.text = __("ACTIVITY_SPORTS_LABEL_3")
	self.label1.text = __("ACTIVITY_SPORTS_HELP_DES_6")
	self.label2.text = __("ACTIVITY_SPORTS_HELP_DES_7")
	self.label3.text = __("ACTIVITY_SPORTS_HELP_DES_8")
	self.label4.text = __("ACTIVITY_SPORTS_HELP_DES_9")

	if xyd.Global.lang ~= "zh_tw" then
		self.label1:GetComponent(typeof(UIWidget)).width = 220

		self.label1:X(-99)

		self.label2:GetComponent(typeof(UIWidget)).width = 238

		self.label2:X(-107)

		self.label3:GetComponent(typeof(UIWidget)).width = 303

		self.label3:X(-136)

		self.label4:GetComponent(typeof(UIWidget)).width = 274

		self.label4:X(-123)
	end

	if xyd.Global.lang == "fr_fr" or xyd.Global.lang == "de_de" then
		self.label3:Y(-120)
		self.label4:Y(-107)
	end

	if xyd.Global.lang == "fr_fr" then
		self.label2:GetComponent(typeof(UIWidget)).width = 246

		self.label2:X(-111)
	end

	if xyd.Global.lang == "de_de" then
		self.label2:GetComponent(typeof(UIWidget)).width = 269

		self.label2:X(-121)
	end

	if xyd.Global.lang == "ja_jp" then
		self.label2:GetComponent(typeof(UIWidget)).width = 255

		self.label2:X(-97)
	end
end

function ActivitySportsHelp3:ctor(parentGo, params)
	ActivitySportsHelp3.super.ctor(self, parentGo)
end

function ActivitySportsHelp3:getPrefabPath()
	return "Prefabs/Components/sports_item_help3"
end

function ActivitySportsHelp3:initUI()
	self:getUIComponent()
	ActivitySportsHelp3.super.initUI(self)
	self:layout()
end

function ActivitySportsHelp3:getUIComponent()
	self.trans = self.go
	self.group1 = self.trans:NodeByName("group1").gameObject
	self.icon1 = self.group1:ComponentByName("icon1", typeof(UITexture))
	self.label1 = self.group1:ComponentByName("label1", typeof(UILabel))
	self.labelBg1 = self.group1:ComponentByName("labelBg1", typeof(UISprite))
	self.group2 = self.trans:NodeByName("group2").gameObject
	self.icon2 = self.group2:ComponentByName("icon2", typeof(UITexture))
	self.label2 = self.group2:ComponentByName("label2", typeof(UILabel))
	self.labelBg2 = self.group2:ComponentByName("labelBg2", typeof(UISprite))
	self.group3 = self.trans:NodeByName("group3").gameObject
	self.icon3 = self.group3:ComponentByName("icon3", typeof(UITexture))
	self.label3 = self.group3:ComponentByName("label3", typeof(UILabel))
	self.name3 = self.group3:ComponentByName("name3", typeof(UILabel))
end

function ActivitySportsHelp3:layout()
	self.label1.text = __("ACTIVITY_SPORTS_HELP_DES_12")
	self.label2.text = __("ACTIVITY_SPORTS_HELP_DES_13")
	self.label3.text = __("ACTIVITY_SPORTS_HELP_DES_10")
	self.name3.text = __("ACTIVITY_SPORTS_HELP_DES_11")

	xyd.setUITextureByNameAsync(self.icon1, "sports_help_3_2_" .. xyd.Global.lang, true)

	if xyd.Global.lang == "zh_tw" or xyd.Global.lang == "ja_jp" or xyd.Global.lang == "ko_kr" then
		self.label3:Y(79.4)
	else
		self.label3:Y(119.3)
	end

	if xyd.Global.lang ~= "zh_tw" then
		self.label1:GetComponent(typeof(UIWidget)).width = 262

		self.label1:X(-133)
		self.icon1:X(281)

		self.label2:GetComponent(typeof(UIWidget)).width = 224

		self.label2:X(-87)

		self.label3:GetComponent(typeof(UIWidget)).width = 387
	end

	if xyd.Global.lang == "fr_fr" then
		self.label1:GetComponent(typeof(UIWidget)).width = 326

		self.label1:X(-156)
		self.icon1:X(295.3)

		self.label2:GetComponent(typeof(UIWidget)).width = 308

		self.label2:X(-125)
	end

	if xyd.Global.lang == "de_de" then
		self.label2:GetComponent(typeof(UIWidget)).width = 299

		self.label2:X(-117)
		self.icon2:X(-285)
	end

	if xyd.Global.lang == "ja_jp" then
		self.label2:GetComponent(typeof(UIWidget)).width = 243

		self.label2:X(-91)
	end
end

return ActivitySportsHelpItems
