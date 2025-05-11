-- chunkname: @../../../Product/Bundles/Android/src/app/components/ActivityEntranceTestHelpItems.lua

local ActivityEntranceTestHelpItems = class("ActivityEntranceTestHelpItems")
local ActivityEntranceTestHelp1 = class("ActivityEntranceTestHelp1", import("app.components.BaseComponent"))
local ActivityEntranceTestHelp2 = class("ActivityEntranceTestHelp2", import("app.components.BaseComponent"))
local ActivityEntranceTestHelp3 = class("ActivityEntranceTestHelp3", import("app.components.BaseComponent"))
local PartnerCard = import("app.components.PartnerCard")

function ActivityEntranceTestHelpItems:ctor()
	self.ActivityEntranceTestHelp1 = ActivityEntranceTestHelp1
	self.ActivityEntranceTestHelp2 = ActivityEntranceTestHelp2
	self.ActivityEntranceTestHelp3 = ActivityEntranceTestHelp3
end

function ActivityEntranceTestHelp1:ctor(parentGo, params)
	ActivityEntranceTestHelp1.super.ctor(self, parentGo)
end

function ActivityEntranceTestHelp1:getPrefabPath()
	return "Prefabs/Components/activity_entrance_test_help1"
end

function ActivityEntranceTestHelp1:initUI()
	self:getUIComponent()
	ActivityEntranceTestHelp1.super.initUI(self)
	self:layout()
end

function ActivityEntranceTestHelp1:getUIComponent()
	self.logo = self.go:ComponentByName("logo", typeof(UISprite))

	for i = 1, 5 do
		self["des" .. i] = self.go:ComponentByName("des" .. i, typeof(UILabel))
	end

	self.title = self.go:ComponentByName("title", typeof(UILabel))
	self.btn_labelDisplay = self.go:ComponentByName("node2/btn/button_label", typeof(UILabel))
	self.card = self.go:NodeByName("node3/card").gameObject

	xyd.setUISpriteAsync(self.logo, nil, "activity_entrance_test_logo_" .. xyd.Global.lang, nil, nil, true)
end

function ActivityEntranceTestHelp1:layout()
	self.title.text = __("ENTRANCE_TEST_HELP_TITLE_1_1")

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ENTRANCE_TEST)

	if activityData:checkHasNextNew() == 2 then
		self.des1.text = __("ENTRANCE_TEST_HELP_DES_1_1")
	elseif activityData:checkHasNew() == 1 then
		self.des1.text = __("ENTRANCE_TEST_HELP_DES_1_1_NONEWGIRL")
	else
		self.des1.text = __("ENTRANCE_TEST_HELP_DES_1_1_NONEWGIRL")
	end

	for i = 2, 5 do
		self["des" .. i].text = __("ENTRANCE_TEST_HELP_DES_1_" .. i)
	end

	self.btn_labelDisplay.text = __("ENTRANCE_TEST_SETTING_PARTNER")

	local tableId = xyd.tables.miscTable:split2num("entrance_test_help_show", "value", "|")[1]

	self.partnerCard = PartnerCard.new(self.card)

	local info = {
		awake = 3,
		tableID = tableId,
		star = xyd.tables.partnerTable:getStar(tableId),
		lev = xyd.tables.partnerTable:getMaxlev(tableId),
		grade = xyd.tables.partnerTable:getMaxGrade(tableId)
	}

	self.partnerCard:setInfo(info)
	self.partnerCard:setDepth(20)
end

function ActivityEntranceTestHelp2:ctor(parentGo, params)
	ActivityEntranceTestHelp2.super.ctor(self, parentGo)
end

function ActivityEntranceTestHelp2:getPrefabPath()
	return "Prefabs/Components/activity_entrance_test_help2"
end

function ActivityEntranceTestHelp2:initUI()
	self:getUIComponent()
	ActivityEntranceTestHelp2.super.initUI(self)
	self:layout()
end

function ActivityEntranceTestHelp2:getUIComponent()
	for i = 1, 2 do
		self["title" .. i] = self.go:ComponentByName("allgroup/title" .. i, typeof(UILabel))
	end

	for i = 1, 3 do
		self["des" .. i] = self.go:ComponentByName("allgroup/des" .. i, typeof(UILabel))
	end

	self.btnFormationUISprite = self.go:ComponentByName("allgroup/node3/btnFormation", typeof(UISprite))
	self.imageFinish = self.go:ComponentByName("allgroup/imageFinish", typeof(UITexture))
	self.btnFormation_labelDisplay = self.go:ComponentByName("allgroup/node3/btnFormation/labelDisplay", typeof(UILabel))
end

function ActivityEntranceTestHelp2:layout()
	for i = 1, 3 do
		self["des" .. i].text = __("ENTRANCE_TEST_HELP_DES_2_" .. i)
	end

	for i = 1, 2 do
		self["title" .. i].text = __("ENTRANCE_TEST_HELP_TITLE_2_" .. i)
	end

	self.btnFormation_labelDisplay.text = __("DEFFORMATION")

	xyd.setUITextureByNameAsync(self.imageFinish, "activity_entrance_test_finish_" .. xyd.Global.lang)
	xyd.setUISpriteAsync(self.btnFormationUISprite, nil, "entrance_test_icon_cy_j")

	if xyd.Global.lang == "de_de" or xyd.Global.lang == "en_en" or xyd.Global.lang == "fr_fr" then
		self["des" .. 3].spacingY = 0
		self["des" .. 3].height = 220
	end
end

function ActivityEntranceTestHelp3:ctor(parentGo, params)
	ActivityEntranceTestHelp3.super.ctor(self, parentGo)
end

function ActivityEntranceTestHelp3:getPrefabPath()
	return "Prefabs/Components/activity_entrance_test_help3"
end

function ActivityEntranceTestHelp3:initUI()
	self:getUIComponent()
	ActivityEntranceTestHelp3.super.initUI(self)
	self:layout()
end

function ActivityEntranceTestHelp3:getUIComponent()
	for i = 1, 3 do
		self["title" .. i] = self.go:ComponentByName("allGroup/title" .. i, typeof(UILabel))
	end

	for i = 1, 4 do
		self["des" .. i] = self.go:ComponentByName("allGroup/des" .. i, typeof(UILabel))
	end

	self.btnFight_labelDisplay = self.go:ComponentByName("allGroup/node1/btnFight/button_label", typeof(UILabel))
	self.btnAward_labelDisplay = self.go:ComponentByName("allGroup/node4/btnAward/labelDisplay", typeof(UILabel))
	self.leftNode = self.go:NodeByName("allGroup/node3/leftNode").gameObject
	self.levelImg = self.leftNode:ComponentByName("levelImg", typeof(UISprite))
	self.scoreText = self.leftNode:ComponentByName("scoreText", typeof(UILabel))
	self.scoreWords = self.leftNode:ComponentByName("scoreWords", typeof(UILabel))
end

function ActivityEntranceTestHelp3:layout()
	for i = 1, 4 do
		self["des" .. i].text = __("ENTRANCE_TEST_HELP_DES_3_" .. i)
	end

	for i = 1, 3 do
		self["title" .. i].text = __("ENTRANCE_TEST_HELP_TITLE_3_" .. i)
	end

	self.btnFight_labelDisplay.text = __("FIGHT2")
	self.scoreText.text = __("SCORE")
	self.btnAward_labelDisplay.text = __("WARMUP_ARENA_TASK_ENTRANCE")
end

return ActivityEntranceTestHelpItems
