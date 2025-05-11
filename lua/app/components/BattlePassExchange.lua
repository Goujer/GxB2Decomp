-- chunkname: @../../../Product/Bundles/Android/src/app/components/BattlePassExchange.lua

local BattlePassExchange = class("BattlePassExchange", import("app.components.BaseComponent"))
local BattlePassExchangeItem = class("BattlePassExchangeItem", import("app.components.BaseComponent"))
local CommonTabBar = import("app.common.ui.CommonTabBar")

function BattlePassExchange:ctor(parentGo, parent)
	self.parentGo = parentGo
	self.parent_ = parent
	self.labelIndex_ = self.parent_.labelIndex_ or 2
	self.shopItemList_ = {}
	self.waitForTimeKeys_ = {}
	self.gridList_ = {}
	self.shopTable = xyd.models.activity:getBattlePassTable(xyd.BATTLE_PASS_TABLE.SHOP)
	self.activityID_ = xyd.models.activity:getBattlePassId()
	self.activityData_ = xyd.models.activity:getActivity(self.activityID_)
	self.cur_select_ = 2
	self.shopModel_ = xyd.models.shop

	BattlePassExchange.super.ctor(self, parentGo)
end

function BattlePassExchange:getPrefabPath()
	return "Prefabs/Components/battle_pass_exchange_new"
end

function BattlePassExchange:initUI()
	local goTrans = self.go
	local w = goTrans:GetComponent(typeof(UIRect))

	w:SetTopAnchor(self.parentGo.gameObject, 1, 0)
	w:SetBottomAnchor(self.parentGo.gameObject, 0, 0)
	w:SetLeftAnchor(self.parentGo.gameObject, 0, 0)
	w:SetRightAnchor(self.parentGo.gameObject, 1, 0)

	self.navGroup_ = goTrans:NodeByName("groupNav/tagsNode").gameObject
	self.helpBtn_ = goTrans:NodeByName("groupTop/helpBtn").gameObject
	self.bgImg_ = goTrans:ComponentByName("groupTop/e:image", typeof(UISprite))
	self.textImg_ = goTrans:ComponentByName("groupTop/textImg", typeof(UISprite))
	self.costImg_ = goTrans:ComponentByName("groupDetail/groupCost/costImg", typeof(UISprite))
	self.coinText_ = goTrans:ComponentByName("groupDetail/groupCost/coinText", typeof(UILabel))
	self.scrollView_ = goTrans:ComponentByName("groupDetail/scrollView", typeof(UIScrollView))
	self.grid1_ = goTrans:ComponentByName("groupDetail/scrollView/grid", typeof(UIGrid))
	self.grid2_ = goTrans:ComponentByName("groupDetail/scrollView/grid2", typeof(UIGrid))
	self.summonPart_ = goTrans:NodeByName("groupDetail/summonPart").gameObject
	self.effectNode_ = self.summonPart_:NodeByName("effectNode").gameObject
	self.checkBtn_ = self.summonPart_:NodeByName("checkBtn").gameObject
	self.summonBtn_ = self.summonPart_:NodeByName("summonBtn").gameObject
	self.costLabel_ = self.summonPart_:ComponentByName("summonBtn/costLabel", typeof(UILabel))
	self.maskPanel_ = goTrans:ComponentByName("groupDetail/maskPanel", typeof(UIPanel))
	self.maskPanel_.depth = self.parent_.panelDepth_ + 10
	self.itemFloat_ = goTrans:NodeByName("itemFlot/root")
	self.gridList_[1] = self.grid1_
	self.gridList_[2] = self.grid2_
	self.scrollView_:GetComponent(typeof(UIPanel)).depth = self.parent_.panelDepth_ + 3
end

function BattlePassExchange:layout()
	self:registerEvent()

	self.shopType_ = xyd.ShopType.SHOP_BATTLE_PASS

	if xyd.models.activity:getBattlePassId() == xyd.ActivityID.BATTLE_PASS_2 then
		self.shopType_ = xyd.ShopType.SHOP_BATTLE_PASS_2
	end

	self.shopInfo_ = self.shopModel_:getShopInfo(self.shopType_)

	if self.shopInfo_ then
		self:updateLayout()
	else
		self.shopModel_:refreshShopInfo(self.shopType_)
	end

	self:initNav()
	self:updateIconCount()
end

function BattlePassExchange:initEffect()
	if not self.flowerEffect_ then
		self.flowerEffect_ = xyd.Spine.new(self.effectNode_)

		self.flowerEffect_:setInfo("fx_bp_flower", function()
			self.flowerEffect_:setRenderTarget(self.summonBtn_:GetComponent(typeof(UIWidget)), -1)
			self.flowerEffect_:play("idle", 0, 1)
		end)
	end
end

function BattlePassExchange:registerEvent()
	self.eventProxyInner_:addEventListener(xyd.event.GET_SHOP_INFO, handler(self, self.onGetShopInfo))
	self.eventProxyInner_:addEventListener(xyd.event.ITEM_CHANGE, handler(self, self.updateIconCount))
	self.eventProxyInner_:addEventListener(xyd.event.BATTLE_PASS_LOTTERY, handler(self, self.onLottery))

	local key = "BP_SHOP_HELP"

	UIEventListener.Get(self.helpBtn_).onClick = function()
		xyd.WindowManager.get():openWindow("help_window", {
			key = key
		})
	end

	if self.summonBtn_ then
		UIEventListener.Get(self.summonBtn_).onClick = handler(self, self.onClickSummon)
		UIEventListener.Get(self.checkBtn_).onClick = handler(self, self.onClickCheck)
	end
end

function BattlePassExchange:onGetShopInfo()
	self:updateLayout()
	self:updateIconCount()
end

function BattlePassExchange:initNav()
	local unchosen = {
		color = Color.New2(4042322175)
	}
	local chosen = {
		color = Color.New2(1698770943)
	}
	local tableLabels = xyd.split(__("BP_SHOP_TAGS"), "|")
	local colorParams = {
		chosen = chosen,
		unchosen = unchosen
	}
	local tebNum = 3

	self.tab_ = CommonTabBar.new(self.navGroup_, tebNum, function(index)
		xyd.SoundManager.get():playSound(xyd.SoundID.BUTTON)

		if self.cur_select_ == index then
			return
		end

		self.cur_select_ = index

		self:updateLayout()
		self:updateIconCount()
	end, nil, colorParams, true, 4)

	self.tab_:setTexts(tableLabels)
	self.tab_:setTabActive(self.labelIndex_, true)
end

function BattlePassExchange:updateIconCount()
	if self.cur_select_ ~= 3 then
		local list = xyd.tables.shopConfigTable:getEconomyShow(self.shopType_)
		local id = list[self.cur_select_]
		local iconName = xyd.tables.itemTable:getIcon(id)

		if iconName then
			xyd.setUISpriteAsync(self.costImg_, nil, iconName)

			self.coinText_.text = tostring(xyd.models.backpack:getItemNumByID(id))
		end
	else
		local cost = xyd.tables.miscTable:split2num("bp_lottery_cost", "value", "#")
		local iconName = xyd.tables.itemTable:getIcon(cost[1])

		self.costLabel_.text = cost[2]

		if iconName then
			xyd.setUISpriteAsync(self.costImg_, nil, iconName)

			self.coinText_.text = tostring(xyd.models.backpack:getItemNumByID(cost[1]))
		end
	end
end

function BattlePassExchange:SetActive(flag)
	local value = xyd.checkCondition(flag, 0, -10000)

	self.go.transform:X(value)
end

function BattlePassExchange:willClose()
	return
end

function BattlePassExchange:updateLayout()
	if self.cur_select_ ~= 3 then
		if self.summonPart_ then
			self.summonPart_:SetActive(false)
		end

		self.shopInfo_ = self.shopModel_:getShopInfo(self.shopType_)

		if not self.shopInfo_ then
			return
		end

		local items = self.shopInfo_.items

		for idx, grid in ipairs(self.gridList_) do
			grid.gameObject:SetActive(idx == self.cur_select_)
		end

		local oldItemNum = xyd.models.backpack:getItemNumByID(120)
		local newItems = {}

		for idx, itemData in ipairs(items) do
			local params = {
				item = itemData.item,
				cost = itemData.cost,
				buy_times = itemData.buy_times,
				index = idx,
				parent = self
			}

			if params.item and params.item[1] == 222 and tonumber(self.shopTable:getType(params.index)) == self.cur_select_ then
				if oldItemNum and oldItemNum > 0 then
					table.insert(newItems, 1, params)
				end
			else
				table.insert(newItems, params)
			end
		end

		items = newItems

		for idx, itemData in ipairs(items) do
			local params = {
				item = itemData.item,
				cost = itemData.cost,
				buy_times = itemData.buy_times,
				index = itemData.index or idx,
				parent = self
			}

			if tonumber(self.shopTable:getType(params.index)) == self.cur_select_ then
				if not self.shopItemList_[tonumber(params.index)] then
					local shopItem = BattlePassExchangeItem.new(self.gridList_[self.cur_select_].gameObject, self)

					shopItem:setInfo(params)

					self.shopItemList_[tonumber(params.index)] = shopItem
				else
					self.shopItemList_[tonumber(params.index)]:setInfo(params)
				end
			end
		end

		XYDCo.WaitForFrame(1, function()
			self.gridList_[self.cur_select_]:Reposition()
			self.scrollView_:ResetPosition()
		end, nil)
		xyd.setUISpriteAsync(self.bgImg_, nil, "bp_exchange_top_bg")
		xyd.setUISpriteAsync(self.textImg_, nil, "bp_exchange_shop_" .. xyd.Global.lang)
	else
		self.summonPart_:SetActive(true)

		for idx, grid in ipairs(self.gridList_) do
			grid.gameObject:SetActive(idx == self.cur_select_)
		end

		if self.effectNode_ then
			self:initEffect()
		end
	end
end

function BattlePassExchange:updatePage(flag)
	if flag then
		-- block empty
	end
end

function BattlePassExchange:onClickSummon()
	if self.isSummoning_ then
		return
	end

	local cost = xyd.tables.miscTable:split2num("bp_lottery_cost", "value", "#")

	if cost[2] > xyd.models.backpack:getItemNumByID(cost[1]) then
		xyd.alertTips(__("SWEETY_HOUSE_NEED_MORE", xyd.tables.itemTable:getName(cost[1])))

		return
	end

	local function callback(num)
		self.isSummoning_ = true

		self.flowerEffect_:play("petal", 1, 1, function()
			local msg = messages_pb.battle_pass_lottery_req()

			msg.activity_id = self.activityID_
			msg.num = num

			xyd.Backend.get():request(xyd.mid.BATTLE_PASS_LOTTERY, msg)

			self.isSummoning_ = false

			self.flowerEffect_:play("idle", 0, 1)
		end)
	end

	xyd.WindowManager.get():openWindow("activity_easter_egg_gacha_window", {
		item_cost_num = 50,
		label_desc = "BP_LOTTERY_NUM",
		parent = self,
		label_title = xyd.split(__("BP_SHOP_TAGS"), "|")[3],
		item_cost_type = cost[1],
		callback = function(num)
			local useNum = tonumber(num)
			local checkTips = xyd.db.misc:getValue("battle_exchange_time_stamp")

			if tonumber(checkTips) and xyd.isSameDay(tonumber(checkTips), xyd.getServerTime()) then
				callback(num)
			else
				xyd.WindowManager.get():openWindow("gamble_tips_window", {
					type = "battle_exchange",
					callback = function()
						callback(num)
					end,
					text = __("BP_LOTTERY_CONFIRM", num * cost[2])
				})
			end
		end
	})
end

function BattlePassExchange:onLottery(event)
	local data = event.data
	local timesAdd = data.lottery_times

	self.activityData_.detail.lottery_times = self.activityData_.detail.lottery_times + timesAdd

	local item = data.item

	xyd.alertItems(item)
end

function BattlePassExchange:onClickCheck()
	local dropBoxId = xyd.tables.miscTable:getVal("bp_lottery_dropbox")

	xyd.WindowManager.get():openWindow("drop_probability_window", {
		box_id = tonumber(dropBoxId)
	})
end

function BattlePassExchangeItem:ctor(parentGo, parent)
	self.parent_ = parent
	self.shopType_ = xyd.ShopType.SHOP_BATTLE_PASS

	if xyd.models.activity:getBattlePassId() == xyd.ActivityID.BATTLE_PASS_2 then
		self.shopType_ = xyd.ShopType.SHOP_BATTLE_PASS_2
	end

	self.shopTable = xyd.models.activity:getBattlePassTable(xyd.BATTLE_PASS_TABLE.SHOP)

	BattlePassExchangeItem.super.ctor(self, parentGo)
end

function BattlePassExchangeItem:initUI()
	local goTrans = self.go.transform
	local itembg = goTrans:ComponentByName("itembg", typeof(UISprite))
	local drag = itembg:AddComponent(typeof(UIDragScrollView))

	drag.scrollView = self.parent_.scrollView_
	self.itemRoot_ = goTrans:NodeByName("item").gameObject
	self.itemMask_ = goTrans:NodeByName("item/mask").gameObject
	self.limitText_ = goTrans:ComponentByName("limitText", typeof(UILabel))
	self.costText_ = goTrans:ComponentByName("costText", typeof(UILabel))
	self.nameText_ = goTrans:ComponentByName("nameText", typeof(UILabel))
	self.costImg_ = goTrans:ComponentByName("costImg", typeof(UISprite))
	self.timeGroup = goTrans:NodeByName("timeGroup").gameObject
	self.timeLabel = goTrans:ComponentByName("timeGroup/timeLabel", typeof(UILabel))
	self.timeTipWords = goTrans:ComponentByName("timeGroup/timeTipWords", typeof(UILabel))

	xyd.setUISpriteAsync(itembg, nil, "bp_shop_item_bg")

	UIEventListener.Get(itembg.gameObject).onClick = function()
		local get_data = self.info_.item
		local data = self.info_.cost
		local params = {
			needTips = true,
			limitKey = "ACTIVITY_WORLD_BOSS_LIMIT",
			buyType = get_data[1],
			buyNum = get_data[2],
			costType = data[1],
			costNum = data[2],
			purchaseCallback = function(evt, num)
				if xyd.models.backpack:getItemNumByID(data[1]) < data[2] then
					xyd.showToast(__("NOT_ENOUGH", xyd.tables.itemTextTable:getName(data[1])))

					return
				end

				if self.shopTable:getBuyTimes(self.info_.index) - self.info_.buy_times <= 0 then
					return
				end

				self.info_.buy_times = self.info_.buy_times + num

				self:updateLayout()
				xyd.models.shop:buyShopItem(self.shopType_, self.info_.index, num)

				local parentGo = self.parent_.itemFloat_.gameObject

				xyd.models.itemFloatModel:pushNewItems({
					{
						item_id = tonumber(get_data[1]),
						item_num = get_data[2] * num
					}
				})
				xyd.WindowManager.get():closeWindow("limit_purchase_item_window")
			end,
			titleWords = __("ITEM_BUY_WINDOW", xyd.tables.itemTable:getName(get_data[1])),
			limitNum = self.shopTable:getBuyTimes(self.info_.index) - self.info_.buy_times,
			notEnoughWords = __("NOT_ENOUGH", xyd.tables.itemTextTable:getName(data[1])),
			eventType = xyd.event.BOSS_BUY,
			tipsCallback = function()
				xyd.showToast(__("NOT_ENOUGH", xyd.tables.itemTextTable:getName(data[1])))
			end
		}
		local data = self.info_.cost

		if xyd.models.backpack:getItemNumByID(data[1]) < data[2] then
			xyd.showToast(__("NOT_ENOUGH", xyd.tables.itemTextTable:getName(data[1])))

			return
		elseif self.shopTable:getBuyTimes(self.info_.index) - self.info_.buy_times <= 0 then
			xyd.showToast(__("ACTIVITY_WORLD_BOSS_LIMIT"))

			return
		else
			xyd.WindowManager.get():openWindow("limit_purchase_item_window", params)
		end
	end
	self.timeTipWords.text = __("BP_SHOP_OFFSHELF")

	local CountDown = import("app.components.CountDown")

	self.countTime = CountDown.new(self.timeLabel)
end

function BattlePassExchangeItem:getPrefabPath()
	return "Prefabs/Components/battle_pass_exchange_item_new"
end

function BattlePassExchangeItem:setInfo(params)
	if not params then
		self.go:SetActive(false)
	end

	self.go:SetActive(true)

	self.info_ = params

	if not self.info_.buy_times then
		self.info_.buy_times = 0
	end

	self:updateLayout()
end

function BattlePassExchangeItem:updateLayout()
	local limit = self.shopTable:getBuyTimes(self.info_.index)

	self.limitText_.text = __("BP_SHOP_LIMIT", self.info_.buy_times, limit)
	self.nameText_.text = xyd.tables.itemTable:getName(self.info_.item[1])

	xyd.setUISpriteAsync(self.costImg_, nil, xyd.tables.itemTable:getIcon(self.info_.cost[1]))

	self.costText_.text = self.info_.cost[2]

	local itemIconSpecil

	if not self.itemIcon_ then
		self.itemIcon_ = xyd.getItemIcon({
			itemID = self.info_.item[1],
			num = self.info_.item[2],
			dragScrollView = self.parent_.scrollView_,
			itemIconSpecil = itemIconSpecil,
			uiRoot = self.itemRoot_
		})
	else
		NGUITools.Destroy(self.itemIcon_:getGameObject())

		self.itemIcon_ = xyd.getItemIcon({
			itemID = self.info_.item[1],
			num = self.info_.item[2],
			dragScrollView = self.parent_.scrollView_,
			itemIconSpecil = itemIconSpecil,
			uiRoot = self.itemRoot_
		})
	end

	local endTime = self.shopTable:getShelf(self.info_.index)

	if endTime and endTime > 0 then
		local leftTime = endTime - xyd.getServerTime() + 1

		if leftTime <= 0 then
			self.timeGroup:SetActive(false)
			self.go:SetActive(false)
		else
			self.go:SetActive(true)
			self.timeGroup:SetActive(true)
			self.countTime:setCountDownTime(endTime - xyd.getServerTime() + 1)
		end

		if xyd.Global.lang == "de_de" then
			self.timeGroup:X(-15)

			self.timeLabel.fontSize = 16
			self.timeTipWords.fontSize = 16
		end
	else
		self.timeGroup:SetActive(false)
	end
end

return BattlePassExchange
