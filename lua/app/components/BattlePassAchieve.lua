-- chunkname: @../../../Product/Bundles/Android/src/app/components/BattlePassAchieve.lua

local BattlePassAchieve = class("BattlePassAchieve", import("app.components.BaseComponent"))
local AchievementItem = require("app.windows.AchievementWindow").AchievementItem
local BattlePassAchievementItem = class("BattlePassAchievementItem", AchievementItem)
local AchievementModel = xyd.models.achievement

function BattlePassAchieve:ctor(parentGo, parent)
	self.parent_ = parent
	self.firstIn_ = true
	self.interval = {
		end__ = 0,
		start = 0
	}
	self.parentGo = parentGo
	self.shopItemList_ = {}
	self.gridList_ = {}
	self.activityID_ = xyd.models.activity:getBattlePassId()
	self.activityData_ = xyd.models.activity:getActivity(self.activityID_)

	BattlePassAchieve.super.ctor(self, parentGo)
end

function BattlePassAchieve:getPrefabPath()
	return "Prefabs/Components/battle_pass_achieve_new"
end

function BattlePassAchieve:initUI()
	local goTrans = self.go.transform
	local w = goTrans:GetComponent(typeof(UIRect))

	w:SetTopAnchor(self.parentGo.gameObject, 1, 0)
	w:SetBottomAnchor(self.parentGo.gameObject, 0, 0)
	w:SetLeftAnchor(self.parentGo.gameObject, 0, 0)
	w:SetRightAnchor(self.parentGo.gameObject, 1, 0)

	self.logoImg_ = goTrans:ComponentByName("groupTop/logo", typeof(UISprite))
	self.labelDesc_ = goTrans:ComponentByName("groupTop/scrollView/labelTips", typeof(UILabel))
	self.groupNone_ = goTrans:NodeByName("groupContent/groupNone").gameObject
	self.scrollView_ = goTrans:ComponentByName("groupContent/scrollView", typeof(UIScrollView))
	self.scrollView_:GetComponent(typeof(UIPanel)).depth = self.parent_.panelDepth_ + 6
	goTrans:ComponentByName("groupTop/scrollView", typeof(UIPanel)).depth = self.parent_.panelDepth_ + 7
	self.maskPanel_ = goTrans:ComponentByName("groupContent/maskPanel", typeof(UIPanel))
	self.maskPanel_.depth = self.parent_.panelDepth_ + 8
	self.grid_ = goTrans:ComponentByName("groupContent/scrollView/grid", typeof(MultiRowWrapContent))
	self.achievementItem_ = goTrans:NodeByName("BattlePassAchievementItem").gameObject

	self.achievementItem_:SetActive(false)

	self.itemFloat_ = goTrans:NodeByName("itemFlot/root")
end

function BattlePassAchieve:layout()
	self:registerEvent()

	self.interval.start = xyd.getServerTime()

	xyd.setUISpriteAsync(self.logoImg_, nil, "battle_pass_logo_new_" .. xyd.Global.lang, nil, nil, true)

	self.labelDesc_.text = __("BP_ACHIEVEMENT_DES")

	if xyd.Global.lang == "de_de" then
		self.labelDesc_.alignment = NGUIText.Alignment.Left
		self.labelDesc_.width = 240
		self.labelDesc_.fontSize = 18

		self.labelDesc_:X(180)
	end

	AchievementModel:getData()

	self.multiWrap_ = require("app.common.ui.FixedMultiWrapContent").new(self.scrollView_, self.grid_, self.achievementItem_, BattlePassAchievementItem, self)
end

function BattlePassAchieve:registerEvent()
	self.eventProxyInner_:addEventListener(xyd.event.GET_ACHIEVEMENT_LIST, handler(self, self.onUpdataWindow))
	self.eventProxyInner_:addEventListener(xyd.event.SUMMON, handler(self, self.onBindSummon))
	self.eventProxyInner_:addEventListener(xyd.event.ACHIEVEMENT_GET_AWARD, handler(self, self.onGetAward))
end

function BattlePassAchieve:willClose()
	return
end

function BattlePassAchieve:SetActive(flag)
	local value = xyd.checkCondition(flag, 0, -10000)

	self.go.transform:X(value)
end

function BattlePassAchieve:onUpdataWindow()
	self.groupNone_:SetActive(false)
	self:initMissions()

	if self.interval.start ~= 0 then
		self.interval.end__ = xyd.getServerTime()
		self.interval = {
			end__ = 0,
			start = 0
		}
	end
end

function BattlePassAchieve:initMissions()
	local achievements = AchievementModel:getAchievementList()

	if self.firstIn_ then
		self.firstIn_ = false

		self.multiWrap_:setInfos(achievements, {})
		self.multiWrap_:resetScrollView()
	else
		self.multiWrap_:setInfos(achievements, {
			keepPosition = true
		})
	end
end

function BattlePassAchieve:onBindSummon(event)
	local items = event.data.summon_result.items
	local partners = event.data.summon_result.partners
	local params = {}
	local flag = false
	local itemID_ = 0
	local callback
	local hasFive = false

	local function checkMore(itemID)
		if itemID_ ~= 0 and itemID_ ~= itemID then
			flag = true
		else
			itemID_ = itemID
		end
	end

	if #items > 0 then
		for idx, info in ipairs(items) do
			table.insert(params, info)
			checkMore(info.item_id)
		end
	end

	local new5stars = {}
	local res_partners = {}

	if #partners > 0 then
		new5stars = xyd.isHasNew5Stars(event, self.collectionBefore_)

		for idx, partner in ipairs(partners) do
			table.insert(params, {
				item_num = 1,
				item_id = partner.table_id
			})
			table.insert(res_partners, partner.table_id)
			checkMore(partner.table_id)

			if not hasFive then
				local star = xyd.tables.partnerTable:getStar(partner.table_id)

				if star >= 5 then
					hasFive = true
				end
			end
		end
	end

	if hasFive then
		function callback()
			xyd.EventDispatcher.loader():dispatchEvent({
				name = xyd.event.HIGH_PRAISE,
				params = {}
			})
		end
	end

	local function effectCallBack()
		xyd.WindowManager.get():closeWindow("summon_res_window")

		self.collectionBefore_ = xyd.models.slot:getCollectionCopy()

		if flag then
			xyd.WindowManager.get():openWindow("alert_heros_window", {
				data = params,
				callback = callback
			})
		else
			xyd.alertItems(params, callback, __("SUMMON"))
		end
	end

	if #new5stars > 0 then
		xyd.WindowManager.get():openWindow("summon_effect_res_window", {
			partners = {
				new5stars[1].table_id
			},
			callback = effectCallBack
		})
	else
		effectCallBack()
	end
end

function BattlePassAchieve:onGetAward(event)
	local data = event.params.data

	if data and data.achieve_type == xyd.ACHIEVEMENT_TYPE.BINDING_ACCOUNT then
		self:onUpdataWindow()

		local achieveID = data.old_id
		local awards = xyd.tables.achievementTable:getAward(achieveID)

		self.collectionBefore_ = xyd.models.slot:getCollectionCopy()

		xyd.models.summon:summonPartner(xyd.tables.itemTable:getSummonID(awards[1][1]), 1)
	else
		self:showReward(event.params)
		self:onUpdataWindow()
	end
end

function BattlePassAchieve:showReward(event)
	if event.data and tostring(event.data) ~= nil then
		local achieveID = event.data.old_id
		local awrads = xyd.tables.achievementTable:getAward(achieveID)
		local items = {}

		for _, info in ipairs(awrads) do
			local item = {
				item_id = info[1],
				item_num = info[2]
			}

			table.insert(items, item)
		end

		local parentGo = self.itemFloat_.gameObject

		xyd.models.itemFloatModel:pushNewItems(items)
	end
end

function BattlePassAchieve:updatePage(flag)
	if flag then
		-- block empty
	end
end

return BattlePassAchieve
