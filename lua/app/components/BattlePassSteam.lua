-- chunkname: @../../../Product/Bundles/Android/src/app/components/BattlePassSteam.lua

local BattlePassSteam = class("BattlePassSteam", import("app.components.BaseComponent"))
local BattlePassSteamItem = class("BattlePassSteamItem", import("app.components.BaseComponent"))
local json = require("cjson")

function BattlePassSteam:ctor(parentGo, parent)
	self.parent_ = parent
	self.parentGo = parentGo

	local activityId = xyd.models.activity:getBattlePassId()

	self.details_ = xyd.models.activity:getActivity(activityId).detail
	self.battlePassAwardTable = xyd.models.activity:getBattlePassTable(xyd.BATTLE_PASS_TABLE.AWARD)

	BattlePassSteam.super.ctor(self, parentGo)
	self:registerEvent()
end

function BattlePassSteam:SetActive(flag)
	local value = xyd.checkCondition(flag, 0, -10000)

	self.go.transform:X(value)
end

function BattlePassSteam:getPrefabPath()
	return "Prefabs/Components/battle_pass_steam"
end

function BattlePassSteam:initUI()
	BattlePassSteam.super.initUI(self)

	local goTrans = self.go.transform
	local w = goTrans:GetComponent(typeof(UIRect))

	w:SetTopAnchor(self.parentGo.gameObject, 1, 0)
	w:SetBottomAnchor(self.parentGo.gameObject, 0, 0)
	w:SetLeftAnchor(self.parentGo.gameObject, 0, 0)
	w:SetRightAnchor(self.parentGo.gameObject, 1, 0)

	self.storyBtn_ = goTrans:ComponentByName("groupBtn/storyBtn", typeof(UISprite))
	self.awardBtn_ = goTrans:ComponentByName("groupBtn/awardBtn", typeof(UISprite))
	self.helpBtn_ = goTrans:ComponentByName("groupBtn/helpBtn", typeof(UISprite))

	local upGroupTrans = goTrans:NodeByName("upGroup").gameObject.transform

	self.topBg_ = upGroupTrans:ComponentByName("e:image", typeof(UISprite))
	self.logoTexture_ = upGroupTrans:ComponentByName("logoNode/logo", typeof(UISprite))
	self.tipDesWords_ = upGroupTrans:ComponentByName("logoNode/tipDesWords", typeof(UILabel))
	self.tipWords_ = upGroupTrans:ComponentByName("logoNode/tipsWord", typeof(UILabel))
	self.contDownLabel_ = upGroupTrans:ComponentByName("logoNode/group/countDown", typeof(UILabel))
	self.overWordsLabel_ = upGroupTrans:ComponentByName("logoNode/group/overWords", typeof(UILabel))
	self.buyBtn_ = upGroupTrans:ComponentByName("buyBtn", typeof(UISprite))
	self.effectLightRoot_ = upGroupTrans:NodeByName("buyBtn/effectRoot").gameObject
	self.buyEffect_ = xyd.Spine.new(self.buyBtn_.gameObject)
	self.buyEffect2_ = xyd.Spine.new(self.effectLightRoot_)
	self.buyBtnSprite_ = upGroupTrans:ComponentByName("buyBtn/e:image", typeof(UISprite))
	self.buyBtnLabel_ = upGroupTrans:ComponentByName("buyBtn/label", typeof(UILabel))

	if xyd.Global.lang == "ja_jp" then
		self.buyBtnLabel_.width = 168
	end

	local midNode = upGroupTrans:NodeByName("midNode").gameObject.transform

	self.levText_ = midNode:ComponentByName("levText", typeof(UILabel))
	self.levDesWords_ = midNode:ComponentByName("levDesWords", typeof(UILabel))
	self.expText_ = midNode:ComponentByName("expText", typeof(UILabel))
	self.addBtn_ = midNode:ComponentByName("addBtn", typeof(UISprite))
	self.levUpBtn_ = midNode:ComponentByName("levUpBtn", typeof(UISprite))
	self.groupArrow_ = midNode:ComponentByName("groupArrow", typeof(UITexture))
	self.progressBar_ = midNode:ComponentByName("progressBar", typeof(UIProgressBar))

	local rankTrans = goTrans:NodeByName("rankGroup").gameObject.transform

	self.coreLabel_ = rankTrans:ComponentByName("titlesGroup/coreLabel", typeof(UILabel))
	self.brassLabel_ = rankTrans:ComponentByName("titlesGroup/brassLabel", typeof(UILabel))
	self.silverLabel_ = rankTrans:ComponentByName("titlesGroup/silverLabel", typeof(UILabel))
	self.bigRewardGroup_ = rankTrans:NodeByName("bigRewardGroup").gameObject
	self.scrollView_ = rankTrans:ComponentByName("scrollView", typeof(UIScrollView))
	self.scrollView_:GetComponent(typeof(UIPanel)).depth = self.parent_.panelDepth_ + 1
	self.panel_ = self.scrollView_.gameObject:GetComponent(typeof(UIPanel))
	self.effectTarget_ = goTrans:ComponentByName("effectGroup/effectTarget", typeof(UITexture))
	self.grid_ = rankTrans:ComponentByName("scrollView/grid", typeof(MultiRowWrapContent))
	self.itemFloat_ = rankTrans:NodeByName("itemFloat/root")
	self.itemRoot_ = rankTrans:NodeByName("scrollView/itemRoot").gameObject

	xyd.setUISpriteAsync(self.logoTexture_, nil, "battle_pass_logo_" .. xyd.Global.lang)

	self.shopType_ = xyd.ShopType.SHOP_BATTLE_PASS

	if xyd.models.activity:getBattlePassId() == xyd.ActivityID.BATTLE_PASS_2 then
		self.shopType_ = xyd.ShopType.SHOP_BATTLE_PASS_2
	end

	if self.shopType_ == xyd.ShopType.SHOP_BATTLE_PASS_2 then
		xyd.setUISpriteAsync(self.topBg_, nil, "battle_pass_top_bg_b")
	else
		xyd.setUISpriteAsync(self.topBg_, nil, "battle_pass_top_bg")
	end
end

function BattlePassSteam:layOutUI()
	self.go:SetActive(true)
	self:layout()
	self:setText()
	self:setEffect()

	self.bigRewardGroup_:GetComponent(typeof(UnityEngine.BoxCollider)).enabled = false

	self:waitForFrame(1, function()
		self.multiWrapStory_ = require("app.common.ui.FixedMultiWrapContent").new(self.scrollView_, self.grid_, self.itemRoot_, BattlePassSteamItem, self)

		self:updateList()
	end)
end

function BattlePassSteam:setEffect()
	if self.arrowEffect ~= nil then
		self.arrowEffect:destroy()
	end

	self.arrowEffect = xyd.Spine.new(self.groupArrow_.gameObject)

	self.arrowEffect:setInfo("fx_ui_bp_upgrade", function()
		self.arrowEffect:setRenderTarget(self.groupArrow_:GetComponent(typeof(UITexture)), 2)
		self.arrowEffect:play("texiao01", 0)
	end)
end

function BattlePassSteam:setText()
	self.coreLabel_.text = __("BATTLE_PASS_LEV")
	self.brassLabel_.text = __("BATTLE_PASS_BRASS_AWARD")

	if xyd.Global.lang == "ja_jp" then
		self.brassLabel_:X(-75)
		self.silverLabel_:X(210)
	end

	self.silverLabel_.text = __("BATTLE_PASS_SILVER_AWARD")
end

function BattlePassSteam:updateExp()
	self.levText_.text = __("LV", xyd.getBpLev())

	local nowExp = xyd.getBpNowExp()

	if not nowExp[2] then
		self.expText_.gameObject:SetActive(false)

		self.progressBar_.value = 1
	else
		self.expText_.text = nowExp[1] .. "/" .. nowExp[2]
		self.progressBar_.value = nowExp[1] / nowExp[2]
	end
end

function BattlePassSteam:onScroller(id, skip)
	if not skip and id % 5 < 3 then
		return
	end

	local calcId = self:getNextBigReward(id)

	if self.currentBigAwardId and self.currentBigAwardId == calcId then
		return
	end

	self.currentBigAwardId = calcId

	if self.currentBigAwardId > self.battlePassAwardTable:getMaxId() then
		self.currentBigAwardId = self.battlePassAwardTable:getMaxId()
	end

	if self.currentBigAwardId < 1 then
		self.currentBigAwardId = 1
	end

	if not self.itemBig_ then
		self.itemBig_ = BattlePassSteamItem.new(self.bigRewardGroup_, self)

		self.itemBig_:setDepth(5)
	end

	local itemData = {
		isBig = true,
		isLast = true,
		id = self.currentBigAwardId,
		isAward = self.details_.awarded[self.currentBigAwardId],
		isPaidAward = self.details_.paid_awarded[self.currentBigAwardId],
		isExtra = self.isExtra_,
		instance = self
	}

	self.itemBig_:update(nil, nil, itemData)
end

function BattlePassSteam:layout()
	self.levDesWords_.text = __("BATTLE_PASS_EXP_CURRENT")
	self.tipWords_.text = __("BATTLE_PASS_SUB_LOGO")
	self.tipDesWords_.text = __("BATTLE_PASS_SEASON_NUMBER")

	if xyd.models.activity:getBattlePassId() == xyd.ActivityID.BATTLE_PASS_2 then
		self.tipDesWords_.text = __("BATTLE_PASS_SEASON_NUMBER_2")
	end

	self.overWordsLabel_.text = __("TEXT_END")

	self:updateBuyBtn()

	local leftTime = xyd.models.mission:getBattlePassLeftTime()
	local params = {
		duration = leftTime
	}

	if not self.countDonwLabel_ then
		self.countDonwLabel_ = import("app.components.CountDown").new(self.contDownLabel_, params)
	else
		self.countDonwLabel_:setInfo(params)
	end

	self:updateExp()
	self.buyEffect_:setInfo("fx_bp_buy", function()
		self.buyEffect_:play("texiao02", 0, 1)
	end)
	self.buyEffect2_:setInfo("fx_bp_buy", function()
		self.buyEffect2_:play("texiao01", 0, 1)
	end)
	self:updateBuyBtn()
end

function BattlePassSteam:updateBuyBtn()
	if self.details_.charges[2].buy_times > 0 or self.details_.charges[3].buy_times > 0 then
		self.buyBtnLabel_.text = __("BATTLE_PASS_PUR_BUTTON_2")
		self.buyBtnLabel_.effectColor = Color.New2(255)

		xyd.setUISpriteAsync(self.buyBtnSprite_, nil, "battle_pass_gift_2")
		xyd.applyGrey(self.buyBtn_)
		xyd.applyGrey(self.buyBtnSprite_)

		if self.effectLightRoot_ then
			self.effectLightRoot_:SetActive(false)
		end

		if self.buyEffect_ then
			self.buyEffect_:setGrey()
		end

		self.buyBtn_:GetComponent(typeof(UnityEngine.BoxCollider)).enabled = false
	elseif self.details_.charges[1].buy_times > 0 then
		self.buyBtnLabel_.text = __("BATTLE_PASS_PUR_BUTTON_2")

		xyd.setUISpriteAsync(self.buyBtnSprite_, nil, "battle_pass_gift_2_png")
	else
		xyd.setUISpriteAsync(self.buyBtnSprite_, nil, "battle_pass_gift_1_png")

		self.buyBtnLabel_.text = __("BATTLE_PASS_PUR_BUTTON_1")
	end
end

function BattlePassSteam:updateList(keepPosition)
	if not self.multiWrapStory_ then
		return
	end

	local itemList = {}
	local ids = self.battlePassAwardTable:getIds()

	self.isExtra_ = self.details_.charges[1].buy_times > 0 or self.details_.charges[2].buy_times > 0 or self.details_.charges[3].buy_times > 0

	for i = 1, #ids do
		local isLast = i >= #ids
		local item = {
			id = ids[i],
			isAward = self.details_.awarded[i],
			isPaidAward = self.details_.paid_awarded[i],
			isExtra = self.isExtra_,
			isLast = isLast,
			instance = self
		}

		table.insert(itemList, item)
	end

	self.multiWrapStory_:setInfos(itemList, {
		keepPosition = keepPosition
	})

	if not keepPosition then
		self.multiWrapStory_:resetScrollView()

		local moveIndex = 1

		for i = 1, #self.details_.awarded do
			local isExtra = self.details_.charges[1].buy_times > 0 or self.details_.charges[2].buy_times > 0 or self.details_.charges[3].buy_times > 0
			local index = self.details_.awarded[i]
			local index2 = self.details_.paid_awarded[i]
			local battlePassAwardTable = xyd.models.activity:getBattlePassTable(xyd.BATTLE_PASS_TABLE.AWARD)
			local award = battlePassAwardTable:getFreeAward(i)

			if award and award[1] and award[1][1] and index == 0 or isExtra and index2 == 0 then
				xyd.models.redMark:setMark(xyd.RedMarkType.BATTLE_PASS, true)

				moveIndex = i

				if i > xyd.getBpLev() then
					moveIndex = moveIndex - 1

					xyd.models.redMark:setMark(xyd.RedMarkType.BATTLE_PASS, false)
				end

				break
			end
		end

		self:waitForFrame(5, function()
			if not self.scrollView_ then
				return
			end

			local sp = self.scrollView_.gameObject:GetComponent(typeof(SpringPanel))
			local initPos = self.scrollView_.transform.localPosition.y
			local dis = initPos + (moveIndex - 1) * 110

			sp.Begin(sp.gameObject, Vector3(0, dis, 0), 8)
			self:onScroller(moveIndex, true)
		end)
	end
end

function BattlePassSteam:registerEvent()
	self.eventProxy_ = self.parent_:getEventProxy()
	UIEventListener.Get(self.buyBtn_.gameObject).onClick = function()
		local showType = "noGift"

		if self.details_.charges[3].buy_times > 0 then
			showType = "buyTop"
		elseif self.details_.charges[1].buy_times > 0 then
			showType = self.details_.charges[2].buy_times > 0 and "buyAll" or "buyOne"
		end

		if showType == "buyTop" or showType == "buyAll" then
			return
		end

		xyd.db.misc:setValue({
			key = "battle_pass_time_flag",
			value = xyd.getServerTime()
		})
		xyd.WindowManager.get():openWindow("battle_pass_buy_window", {
			showType = showType
		})
	end
	UIEventListener.Get(self.awardBtn_.gameObject).onClick = function()
		local isBtnGrey = false

		if self.details_.charges[2].buy_times > 0 or self.details_.charges[3].buy_times > 0 then
			isBtnGrey = true
		end

		local showType = "noGift"

		if self.details_.charges[3].buy_times > 0 then
			showType = "buyTop"
		elseif self.details_.charges[1].buy_times > 0 then
			showType = self.details_.charges[2].buy_times > 0 and "buyAll" or "buyOne"
		end

		xyd.WindowManager.get():openWindow("battle_pass_check_award_window", {
			isBtnGrey = isBtnGrey,
			showType = showType
		})
	end
	UIEventListener.Get(self.addBtn_.gameObject).onClick = function()
		self.parent_.tab:setTabActive(xyd.BattlePassTag.MISSION, true)
	end
	UIEventListener.Get(self.levUpBtn_.gameObject).onClick = function()
		local maxLev = self.battlePassAwardTable:getMaxId()

		if maxLev <= xyd.getBpLev() then
			xyd.showToast(__("BATTLE_PASS_LEV_MAX"))

			return
		end

		xyd.WindowManager.get():openWindow("battle_pass_buy_lev_window", {})
	end
	UIEventListener.Get(self.helpBtn_.gameObject).onClick = function()
		xyd.WindowManager.get():openWindow("help_window", {
			key = "BATTLE_PASS_MAIN_HELP"
		})
	end
	UIEventListener.Get(self.storyBtn_.gameObject).onClick = function()
		local plot_id = xyd.tables.miscTable:getNumber("battle_pass_plot", "value")

		xyd.WindowManager.get():openWindow("story_window", {
			story_type = xyd.StoryType.ACTIVITY,
			story_id = plot_id
		})
	end

	self.eventProxy_:addEventListener(xyd.event.ITEM_CHANGE, handler(self, self.refresh))
	self.eventProxy_:addEventListener(xyd.event.GET_ACTIVITY_AWARD, handler(self, self.getAllAwards))
end

function BattlePassSteam:getAllAwards(event)
	local data = event.data
	local floatItems = {}
	local skins = {}
	local detailsObj = json.decode(data.detail)

	if not detailsObj then
		return
	end

	for _, item_ in ipairs(detailsObj.batch_result) do
		floatItems = xyd.tableConcat(floatItems, item_.items)

		if item_.index == 1 then
			self.details_.awarded[item_.id] = 1
		else
			self.details_.paid_awarded[item_.id] = 1
		end

		for _, item in ipairs(item_.items) do
			if xyd.tables.itemTable:getType(item.item_id) == xyd.ItemType.SKIN then
				table.insert(skins, item.item_id)
			end
		end
	end

	if #skins > 0 then
		xyd.onGetNewPartnersOrSkins({
			destory_res = false,
			skins = skins,
			callback = function()
				xyd.models.itemFloatModel:pushNewItems(floatItems)
			end
		})
	else
		xyd.models.itemFloatModel:pushNewItems(floatItems)
	end

	self:updateList(true)

	local itemData = {
		isBig = true,
		isLast = true,
		id = self.currentBigAwardId,
		isAward = self.details_.awarded[self.currentBigAwardId],
		isPaidAward = self.details_.paid_awarded[self.currentBigAwardId],
		isExtra = self.isExtra_,
		instance = self
	}

	self.itemBig_:update(nil, nil, itemData)
	xyd.models.redMark:setMark(xyd.RedMarkType.BATTLE_PASS, false)
end

function BattlePassSteam:refresh(event)
	local hasExp = false

	for i = 1, #event.data.items do
		local itemId = event.data.items[i].item_id

		if tonumber(itemId) == xyd.ItemID.BP_EXP then
			hasExp = true

			break
		end
	end

	if not hasExp then
		return
	end

	local itemData = {
		isBig = true,
		isLast = true,
		id = self.currentBigAwardId,
		isAward = self.details_.awarded[self.currentBigAwardId],
		isPaidAward = self.details_.paid_awarded[self.currentBigAwardId],
		isExtra = self.isExtra_,
		instance = self
	}

	self.itemBig_:update(nil, nil, itemData)
	self:updateExp()
	self:updateList()
end

function BattlePassSteam:willClose()
	return
end

function BattlePassSteam:getValue(id)
	return self.details_.points[id]
end

function BattlePassSteam:getIsAward(id)
	return self.details_.awarded[id]
end

function BattlePassSteam:getHasExtra()
	return self.details_.ex_buy
end

function BattlePassSteam:getNextBigReward(id)
	local currentId = 1

	if id then
		currentId = tonumber(id)
	end

	while not self.battlePassAwardTable:getIsBigReward(currentId) and currentId < tonumber(self.battlePassAwardTable:getIds()[#self.battlePassAwardTable:getIds()]) do
		currentId = currentId + 1
	end

	if currentId > self.battlePassAwardTable:getMaxId() then
		currentId = self.battlePassAwardTable:getMaxId()
	end

	return currentId
end

function BattlePassSteam:updatePage(flag)
	if flag then
		self:updateExp()
		self:updateList()
		self:updateBuyBtn()

		local itemData = {
			isBig = true,
			isLast = true,
			id = self.currentBigAwardId,
			isAward = self.details_.awarded[self.currentBigAwardId],
			isPaidAward = self.details_.paid_awarded[self.currentBigAwardId],
			isExtra = self.isExtra_,
			instance = self
		}

		if self.itemBig_ then
			self.itemBig_:update(nil, nil, itemData)
		end
	end
end

function BattlePassSteamItem:ctor(parentGo, parent)
	self.parent_ = parent
	self.dragScroll_ = self.parent_.scrollView_
	self.itemIcon_free = nil
	self.heroIcon_free = nil
	self.itemIcon_high = {}
	self.heroIcon_high = nil
	self.itemList = {}
	self.itemsAward_ = {}
	self.itemsPaidAward_ = {}
	self.pos_ = parentGo.name
	self.panel_ = self.parent_.panel_
	self.target_ = self.parent_.effectTarget_
	self.battlePassAwardTable = xyd.models.activity:getBattlePassTable(xyd.BATTLE_PASS_TABLE.AWARD)

	BattlePassSteamItem.super.ctor(self, parentGo)
end

function BattlePassSteamItem.getPrefabPath()
	return "Prefabs/Components/battle_pass_steam_item"
end

function BattlePassSteamItem:setDepth(depth)
	if not depth then
		BattlePassSteamItem.super.setDepth(self, tonumber(self.pos_))
	else
		BattlePassSteamItem.super.setDepth(self, depth)
	end
end

function BattlePassSteamItem:initUI()
	local goTrans = self.go.transform

	self.lvLabel_ = goTrans:ComponentByName("content/levGroup/lvLabel", typeof(UILabel))
	self.normalGroup_ = goTrans:NodeByName("content/normalGroup").gameObject
	self.normalLayout_ = self.normalGroup_:GetComponent(typeof(UILayout))
	self.highGroup_ = goTrans:NodeByName("content/highGroup").gameObject
	self.highLayout_ = self.highGroup_:GetComponent(typeof(UILayout))
	self.splitHighImg_ = goTrans:ComponentByName("splitHighImg", typeof(UISprite))
	self.splitNormalImg_ = goTrans:ComponentByName("splitNormalImg", typeof(UISprite))
	self.bgImg_ = goTrans:ComponentByName("content/levGroup/bgImg", typeof(UISprite))
	UIEventListener.Get(self.normalGroup_).onClick = function()
		self:onTouchNormalAward()
	end
	UIEventListener.Get(self.highGroup_).onClick = function()
		self:onTouchHighAward()
	end

	local drag1 = self.normalGroup_:AddComponent(typeof(UIDragScrollView))

	drag1.scrollView = self.dragScroll_

	local drag2 = self.highGroup_:AddComponent(typeof(UIDragScrollView))

	drag2.scrollView = self.dragScroll_

	xyd.setUISpriteAsync(self.splitNormalImg_, nil, "battle_pass_split_normal")
	xyd.setUISpriteAsync(self.splitHighImg_, nil, "battle_pass_split_high")
	xyd.setUISpriteAsync(self.bgImg_, nil, "battle_pass_num_Bg_png")
end

function BattlePassSteamItem:update(index, realIndex, info)
	if not info then
		self.go:SetActive(false)

		return
	else
		self.go:SetActive(true)

		self.data_ = info
	end

	self:setText(self.data_.id)
	self:setIcon(self.data_.id, self.data_.isAward, self.data_.isPaidAward, self.data_.isExtra, self.data_.isBig, self.data_.isLast)
	self.data_.instance:onScroller(self.data_.id)
end

function BattlePassSteamItem:setText(id)
	self.lvLabel_.text = __("LV", id)
end

function BattlePassSteamItem:onTouchNormalAward()
	if self.data_.isBig and self.data_.id > xyd.getBpLev() then
		return
	end

	if self.data_.isAward == 1 then
		return
	end

	self:onTouchAward(1)
end

function BattlePassSteamItem:onTouchHighAward()
	if self.data_.isBig and self.data_.id > xyd.getBpLev() then
		return
	end

	if self.data_.isPaidAward == 1 or not self.data_.isExtra then
		return
	end

	self:onTouchAward(2)
end

function BattlePassSteamItem:setIcon(id, isAward, isPaidAward, isExtra, isBig, isLast)
	id = tonumber(id)

	if self.lvBefore_ == xyd.getBpLev() and self.isAward == isAward and self.isPaidAward == isPaidAward and self.id_ == id then
		return
	end

	local miscLightIds = xyd.tables.miscTable:split2num("battle_pass_item_light", "value", "|")
	local tempIds = {}

	for i = 1, #miscLightIds do
		tempIds[miscLightIds[i]] = true
	end

	self.lvBefore_ = xyd.getBpLev()
	self.id_ = id
	self.isAward = isAward
	self.isPaidAward = isPaidAward

	if isBig then
		xyd.setUISpriteAsync(self.bgImg_, nil, "battle_pass_num_Bg2_png")
		UIEventListener.Get(self.normalGroup_):removeEvent("onClick", function()
			self:onTouchNormalAward()
		end)
		UIEventListener.Get(self.highGroup_):removeEvent("onClick", function()
			self:onTouchHighAward()
		end)
	elseif id <= xyd.getBpLev() then
		xyd.setUISpriteAsync(self.bgImg_, nil, "battle_pass_tmp3", function()
			self.bgImg_:MakePixelPerfect()
		end)

		self.lvLabel_.color = Color.New2(2741712127)
		self.lvLabel_.effectColor = Color.New2(4294367231)
	else
		xyd.setUISpriteAsync(self.bgImg_, nil, "battle_pass_num_Bg_png", function()
			self.bgImg_:MakePixelPerfect()
		end)

		self.lvLabel_.color = Color.New2(4294237951)
		self.lvLabel_.effectColor = Color.New2(1935093503)
	end

	for i = 1, #self.itemList do
		self.itemList[i]:SetActive(false)
	end

	local freeAwards = self.battlePassAwardTable:getFreeAward(id)
	local paidAwards = self.battlePassAwardTable:getPaidAward(id)

	self.isBig_ = isBig
	self.itemsAward_ = {}
	self.itemsPaidAward_ = {}

	for idx, itemData in ipairs(freeAwards) do
		local itemId = itemData[1]
		local itemNum = itemData[2]
		local params = {
			show_has_num = true,
			itemID = itemId,
			num = itemNum,
			wndType = xyd.ItemTipsWndType.ACTIVITY,
			dragScrollView = self.dragScroll_
		}

		if not self.isBig_ then
			params.panel = self.panel_
		end

		local type_ = xyd.tables.itemTable:getType(itemId)
		local item

		if type_ ~= xyd.ItemType.HERO_DEBRIS and type_ ~= xyd.ItemType.HERO and type_ ~= xyd.ItemType.HERO_RANDOM_DEBRIS and type_ ~= xyd.ItemType.SKIN then
			if not self.itemIcon_free then
				self.itemIcon_free = import("app.components.ItemIcon").new(self.normalGroup_)

				table.insert(self.itemList, self.itemIcon_free)
			end

			item = self.itemIcon_free
		else
			if not self.heroIcon_free then
				self.heroIcon_free = import("app.components.HeroIcon").new(self.normalGroup_)

				table.insert(self.itemList, self.heroIcon_free)
			end

			item = self.heroIcon_free
		end

		item:setInfo(params)
		item:setDepth(1)
		item:setLabelNumScale(1.2)
		item:setScale(0.7)
		item:setLockSource("lock", "battle_pass_item_frame")
		item:setMaskSource("battle_pass_mask")
		item:setLockScale(0.7)
		item:setChoose(isAward == 1)
		item:setMask(id > xyd.getBpLev() or isAward == 1)

		if (id > xyd.getBpLev() or isAward == 1) == true then
			item:setNoClick(false)

			self.normalGroup_:GetComponent(typeof(UnityEngine.BoxCollider)).enabled = false
		else
			item:setNoClick(true)

			self.normalGroup_:GetComponent(typeof(UnityEngine.BoxCollider)).enabled = true
		end

		if not isAward or isAward == 0 then
			table.insert(self.itemsAward_, {
				id = itemId,
				icon = item
			})
		end

		if (not isAward or isAward == 0) and id <= xyd.getBpLev() then
			local effect = "fx_ui_bp_available"

			item:setEffect(true, effect, {
				effectPos = Vector3(3, 6, 0),
				effectScale = Vector3(1.1, 1.1, 1.1),
				target = self.target_
			})
		else
			item:setEffect(false)
		end

		if tempIds[itemId] then
			local effect = "fx_bp_item"

			item:setBackEffect(true, effect, "texiao01", {
				effectPos = Vector3(0, -3, 0),
				scale = Vector3(1.46, 1.46, 1.46)
			})
		else
			item:setBackEffect(false)
		end

		item:SetActive(true)
	end

	self.normalLayout_:Reposition()

	if paidAwards then
		for idx, itemData in ipairs(paidAwards) do
			local itemId = itemData[1]
			local itemNum = itemData[2]
			local type_ = xyd.tables.itemTable:getType(itemId)
			local params = {
				show_has_num = true,
				itemID = itemId,
				num = itemNum,
				wndType = xyd.ItemTipsWndType.ACTIVITY,
				dragScrollView = self.dragScroll_
			}

			if not self.isBig_ then
				params.panel = self.panel_
			end

			local paidItem

			if type_ ~= xyd.ItemType.HERO_DEBRIS and type_ ~= xyd.ItemType.HERO and type_ ~= xyd.ItemType.HERO_RANDOM_DEBRIS and type_ ~= xyd.ItemType.SKIN then
				if not self.itemIcon_high[idx] then
					self.itemIcon_high[idx] = import("app.components.ItemIcon").new(self.highGroup_)

					table.insert(self.itemList, self.itemIcon_high[idx])
				end

				paidItem = self.itemIcon_high[idx]

				paidItem:setInfo(params)
				paidItem:setLabelNumScale(1.2)
				paidItem:setScale(0.7)
				paidItem:setLockSource("lock", "battle_pass_item_frame")
				paidItem:setLockScale(0.7)
				paidItem:setLock(not isExtra)
				paidItem:setChoose(isExtra and isPaidAward == 1)
			else
				if not self.heroIcon_high then
					self.heroIcon_high = import("app.components.HeroIcon").new(self.highGroup_)

					table.insert(self.itemList, self.heroIcon_high)
				end

				paidItem = self.heroIcon_high

				paidItem:setInfo(params)

				paidItem.labelNumScale = 1.2
				paidItem.scale = 0.7

				paidItem:setLockSource("lock", "battle_pass_item_frame")
				paidItem:setLockScale(0.7)

				paidItem.lock = not isExtra
				paidItem.choose = isExtra and isPaidAward == 1
			end

			paidItem:setDepth(1)
			paidItem:setMask(not isExtra or isExtra and isPaidAward == 1 or id > xyd.getBpLev())

			if (not isPaidAward or isPaidAward == 0) and isExtra then
				table.insert(self.itemsPaidAward_, {
					id = itemId,
					icon = paidItem
				})
			end

			if id > xyd.getBpLev() or isPaidAward == 1 or not self.data_.isExtra then
				paidItem:setNoClick(false)

				self.highGroup_:GetComponent(typeof(UnityEngine.BoxCollider)).enabled = false
			else
				paidItem:setNoClick(true)

				self.highGroup_:GetComponent(typeof(UnityEngine.BoxCollider)).enabled = true
			end

			if (not isPaidAward or isPaidAward == 0) and id <= xyd.getBpLev() then
				local effect = "fx_ui_bp_available"

				paidItem:setEffect(true, effect, {
					effectPos = Vector3(3, 6, 0),
					effectScale = Vector3(1.1, 1.1, 1.1),
					target = self.target_
				})
			else
				paidItem:setEffect(false)
			end

			if tempIds[itemId] then
				local effect = "fx_bp_item"

				paidItem:setBackEffect(true, effect, "texiao01", {
					effectPos = Vector3(0, -3, 0),
					scale = Vector3(1.46, 1.46, 1.46)
				})
			else
				paidItem:setBackEffect(false)
			end

			paidItem:SetActive(true)
		end
	end

	self.highLayout_:Reposition()

	if isLast then
		self.splitHighImg_:SetActive(false)
		self.splitNormalImg_:SetActive(false)
	else
		self.splitHighImg_:SetActive(true)
		self.splitNormalImg_:SetActive(true)
	end
end

function BattlePassSteamItem:setProgress()
	return
end

function BattlePassSteamItem:onTouchAward(indexValue)
	if self.data_.id > xyd.getBpLev() then
		return
	end

	local param = {
		batches = {}
	}
	local ids = self.battlePassAwardTable:getIds()

	for i = 1, #ids do
		if ids[i] <= xyd.getBpLev() then
			if indexValue == 1 then
				if xyd.models.activity:getBattlePassData().detail.awarded[i] == 0 and self.battlePassAwardTable:getFreeAward(ids[i])[1] then
					table.insert(param.batches, {
						id = ids[i],
						index = indexValue
					})
				end
			elseif xyd.models.activity:getBattlePassData().detail.paid_awarded[i] == 0 and self.battlePassAwardTable:getPaidAward(ids[i])[1] then
				table.insert(param.batches, {
					id = ids[i],
					index = indexValue
				})
			end
		end
	end

	local param2 = require("cjson").encode(param)
	local msg = messages_pb.get_activity_award_req()

	msg.activity_id = xyd.models.activity:getBattlePassId()
	msg.params = param2

	xyd.Backend.get():request(xyd.mid.GET_ACTIVITY_AWARD, msg)
end

function BattlePassSteamItem:onResponse(event)
	self.eventProxyInner_:removeAllEventListeners()

	local data = event.data
	local detail = require("cjson").decode(data.detail)

	if not detail or tostring(detail) == "" then
		return
	end

	local floatItems = detail.items

	if tonumber(detail.index) == 1 then
		self.data_.isAward = 1
		self.normalGroup_:GetComponent(typeof(UnityEngine.BoxCollider)).enabled = false

		for _, itemIcon in ipairs(self.itemsAward_) do
			itemIcon.icon:setChoose(true)
			itemIcon.icon:setEffectState(false)
			itemIcon.icon:setNoClick(false)
			itemIcon.icon:setMask(true)
		end
	else
		self.data_.isPaidAward = 1
		self.highGroup_:GetComponent(typeof(UnityEngine.BoxCollider)).enabled = false

		for _, itemIcon in ipairs(self.itemsPaidAward_) do
			local type_ = xyd.tables.itemTable:getType(itemIcon.id)

			if type_ ~= xyd.ItemType.HERO_DEBRIS and type_ ~= xyd.ItemType.HERO and type_ ~= xyd.ItemType.HERO_RANDOM_DEBRIS and type_ ~= xyd.ItemType.SKIN then
				itemIcon.icon:setChoose(true)
				itemIcon.icon:setEffectState(false)
				itemIcon.icon:setNoClick(false)
				itemIcon.icon:setMask(true)
			else
				itemIcon.choose = true

				itemIcon.icon:setNoClick(false)
				itemIcon.icon:setMask(true)
				itemIcon.icon:setEffectState(false)
			end
		end
	end

	xyd.models.itemFloatModel:pushNewItems(floatItems)

	if self.data_.id == 40 then
		self.data_.instance.onScroller(self.data_.id, true)
	end
end

return BattlePassSteam
