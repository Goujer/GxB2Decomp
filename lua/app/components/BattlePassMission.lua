-- chunkname: @../../../Product/Bundles/Android/src/app/components/BattlePassMission.lua

local BattlePassMission = class("BattlePassMission", import("app.components.BaseComponent"))
local DailyMissionItem = require("app.windows.DailyMissionWindow").DailyMissionItem
local BattlePassMissionItem = class("BattlePassMissionItem", DailyMissionItem)
local CommonTabBar = import("app.common.ui.CommonTabBar")
local json = require("cjson")

function BattlePassMission:ctor(parentGo, params)
	self.parentGo = parentGo
	self.parent_ = params.parent
	self.cur_select_ = params.labelIndex
	self.isBack_ = params.isBack
	self.missionList_ = {
		{},
		{},
		{}
	}
	self.missionItemList_ = {}
	self.allDoneMission_ = {}
	self.model_ = xyd.models.mission
	self.activityID_ = xyd.models.activity:getBattlePassId()
	self.activityData_ = xyd.models.activity:getActivity(self.activityID_)

	BattlePassMission.super.ctor(self, parentGo)
	self:layout()
end

function BattlePassMission:getPrefabPath()
	return "Prefabs/Components/battle_pass_mission_new"
end

function BattlePassMission:initUI()
	BattlePassMission.super.initUI(self)

	local goTrans = self.go.transform
	local w = goTrans:GetComponent(typeof(UIRect))

	w:SetTopAnchor(self.parentGo.gameObject, 1, 0)
	w:SetBottomAnchor(self.parentGo.gameObject, 0, 0)
	w:SetLeftAnchor(self.parentGo.gameObject, 0, 0)
	w:SetRightAnchor(self.parentGo.gameObject, 1, 0)

	self.logoTexture_ = goTrans:ComponentByName("topNode/logoNode/logo", typeof(UISprite))
	self.maskPanel_ = goTrans:ComponentByName("groupDetail/maskPanel", typeof(UIPanel))
	self.maskPanel_.depth = self.parent_.panelDepth_ + 9
	self.groupTime_ = goTrans:NodeByName("topNode/logoNode/group")
	self.countDownLabel0_ = goTrans:ComponentByName("topNode/logoNode/group/countDown", typeof(UILabel))
	self.overWordsLabel_ = goTrans:ComponentByName("topNode/logoNode/group/overWords", typeof(UILabel))
	self.labelTips_ = goTrans:ComponentByName("topNode/scrollTips/labelTips", typeof(UILabel))

	local midNode = goTrans:NodeByName("midNode").gameObject.transform

	self.levText_ = midNode:ComponentByName("levText", typeof(UILabel))
	self.levText01_ = midNode:ComponentByName("levText01", typeof(UILabel))
	self.levDesWords_ = midNode:ComponentByName("levDesWords", typeof(UILabel))
	self.expText_ = midNode:ComponentByName("expText", typeof(UILabel))
	self.progressBar_ = midNode:ComponentByName("progressBar", typeof(UIProgressBar))
	self.nav_ = goTrans:NodeByName("groupNav/nav").gameObject

	local detailTrans = goTrans:NodeByName("groupDetail").gameObject.transform

	self.timeNode_ = detailTrans:NodeByName("timeNode").gameObject
	self.timeLayout_ = detailTrans:ComponentByName("timeNode/e:image", typeof(UILayout))
	self.labelRefresh_ = detailTrans:ComponentByName("timeNode/e:image/labelRefresh", typeof(UILabel))
	self.countDownLabel_ = detailTrans:ComponentByName("timeNode/e:image/countDown", typeof(UILabel))
	self.scrollView_ = detailTrans:ComponentByName("scrollView", typeof(UIScrollView))
	self.scrollView2_ = detailTrans:ComponentByName("scrollView2", typeof(UIScrollView))
	goTrans:ComponentByName("topNode/scrollTips", typeof(UIPanel)).depth = self.parent_.panelDepth_ + 3
	self.scrollView_:GetComponent(typeof(UIPanel)).depth = self.parent_.panelDepth_ + 4
	self.scrollView2_:GetComponent(typeof(UIPanel)).depth = self.parent_.panelDepth_ + 5
	self.missionItem_ = detailTrans:NodeByName("missionItem").gameObject
	self.gridDaily_ = detailTrans:ComponentByName("scrollView2/gridDaily", typeof(UILayout))
	self.allDoneRoot_ = detailTrans:NodeByName("missionItemAllDone").gameObject
	self.gridWeek_ = detailTrans:ComponentByName("scrollView/gridWeek", typeof(UIGrid))
	self.gridOther_ = detailTrans:ComponentByName("scrollView/gridOther", typeof(UIGrid))
	self.itemFloat_ = goTrans:NodeByName("itemFloat/root")
	self.gridList_ = {
		self.gridDaily_,
		self.gridWeek_,
		self.gridOther_
	}

	if xyd.Global.lang == "de_de" then
		self.groupTime_:X(30)
	elseif xyd.Global.lang == "fr_fr" then
		self.groupTime_:X(65)
	end
end

function BattlePassMission:SetActive(flag)
	local value = xyd.checkCondition(flag, 0, -10000)

	self.go.transform:X(value)
end

function BattlePassMission:onRegister()
	self.eventProxyInner_:addEventListener(xyd.event.GET_MISSION_LIST, handler(self, self.onUpdateWindow))
	self.eventProxyInner_:addEventListener(xyd.event.GET_MISSION_AWARD, handler(self, self.onMissionAward))
	self.eventProxyInner_:addEventListener(xyd.event.GET_MISSION_AWARDS, handler(self, self.onMissionAwards))
	self.eventProxyInner_:addEventListener(xyd.event.ITEM_CHANGE, handler(self, self.refresh))
	self.eventProxyInner_:addEventListener(xyd.event.MIDAS_BUY_2, handler(self, self.reqData))
end

function BattlePassMission:reqData(event)
	xyd.models.mission:getData()
end

function BattlePassMission:layout()
	self.model_:getData()

	self.labelRefresh_.text = __("REFRESH_TIME") .. " :"
	self.timer_ = self:getTimer(handler(self, self.updateCountDown), 1, -1)

	self.timer_:Start()

	if xyd.Global.lang == "fr_fr" then
		self.levText01_.text = "Niv."
	else
		self.levText01_.text = "Lv."
	end

	self:waitForFrame(1, function()
		self.timeLayout_:Reposition()
	end)
	self:initNav()

	self.levDesWords_.text = __("BP_EXP_CURRENT")
	self.labelTips_.text = __("BP_MISSION_DES")
	self.overWordsLabel_.text = __("TEXT_END")

	self:updateExp()

	local params = {}
	local leftTime = self.model_:getBattlePassLeftTime()

	params.duration = leftTime

	if not self.countDown0_ then
		self.countDown0_ = import("app.components.CountDown").new(self.countDownLabel0_, params)
	else
		self.countDown0_:setInfo(params)
	end

	xyd.setUISpriteAsync(self.logoTexture_, nil, "battle_pass_logo_new_" .. xyd.Global.lang, nil, nil, true)
end

function BattlePassMission:initNav()
	if not self.tab_ then
		local unchosen = {
			color = Color.New2(4042322175)
		}
		local chosen = {
			color = Color.New2(1698770943)
		}
		local colorParams = {
			chosen = chosen,
			unchosen = unchosen
		}

		self.tab_ = CommonTabBar.new(self.nav_, 3, function(index)
			if self.hasInit_ then
				xyd.SoundManager.get():playSound(xyd.SoundID.TAB)
			end

			self:onTouchMission(index)

			self.hasInit_ = true
		end, nil, colorParams, true, 3)

		local tableLabels = xyd.split(__("BP_MISSION_TAGS"), "|")

		self.tab_:setTexts(tableLabels)

		for i = 1, 3 do
			local redIcon = self.nav_:ComponentByName("tab_" .. i .. "/redPoint", typeof(UISprite))

			if redIcon then
				if i == 1 then
					xyd.models.redMark:setMarkImg(xyd.RedMarkType.BATTLE_PASS_MISSION1, redIcon.gameObject)
				elseif i == 2 then
					xyd.models.redMark:setMarkImg(xyd.RedMarkType.BATTLE_PASS_MISSION2, redIcon.gameObject)
				else
					xyd.models.redMark:setMarkImg(xyd.RedMarkType.BATTLE_PASS_MISSION3, redIcon.gameObject)
				end
			end
		end
	end
end

function BattlePassMission:willClose()
	return
end

function BattlePassMission:updatePage()
	return
end

function BattlePassMission:onMissionAwards(event)
	local result = event.data.result

	for _, data in ipairs(result) do
		local mission_id = data.mission_id

		self:onMissionAward({
			data = {
				mission_id = mission_id
			}
		})
	end
end

function BattlePassMission:onMissionAward(event)
	local missions = self.model_:getMissionList()
	local mission_id = event.data.mission_id
	local index = -1
	local awardItem

	if xyd.tables.battlePassMissionTable:getType(mission_id) ~= self.cur_select_ then
		return
	end

	if #self.missionList_[self.cur_select_] <= 0 and #self.allDoneMission_ <= 0 then
		return
	end

	local itemIndex = 1

	for idx, missionData in ipairs(missions) do
		if xyd.tables.battlePassMissionTable:getType(missionData.mission_id) == self.cur_select_ then
			local missionItem = self.missionItemList_[missionData.mission_id]

			if missionItem then
				local m_info = missionItem:getMissionInfo()

				if tonumber(m_info.mission_id) == tonumber(mission_id) then
					awardItem = missionItem
				end
			end

			if tonumber(missionData.mission_id) == tonumber(mission_id) then
				index = tonumber(idx)

				break
			else
				itemIndex = itemIndex + 1
			end
		end
	end

	if awardItem and index >= 1 then
		awardItem:showAward(event)
		awardItem:playDisappear(function()
			local itemRoot = NGUITools.AddChild(self.gridList_[self.cur_select_].gameObject, self.missionItem_)
			local missionItemNew = BattlePassMissionItem.new(itemRoot)

			missionItemNew:setInfo(missions[index], "normal", self)

			local index = xyd.arrayIndexOf(self.missionList_[self.cur_select_], mission_id)

			table.remove(self.missionList_[self.cur_select_], index)
			missionItemNew:playAppear(function()
				self.gridList_[self.cur_select_]:Reposition()
			end)
			self.gridList_[self.cur_select_]:Reposition()
			self.nowScroll_:ResetPosition()
		end)
	elseif self.model_:showFinalMission() and #self.allDoneMission_ > 0 and self.cur_select_ == xyd.MissionType.TODAY then
		local item = self.allDoneMission_[1]

		item:setInfo(self.model_:getFinalMissionInfo(), "special", self)
		item:showAward(event)
	end
end

function BattlePassMission:onUpdateWindow()
	self.endTime = self.model_:getEndTime()

	self:updateCountDown()

	if not self.firstOver then
		self.firstOver = true

		if xyd.models.redMark:getRedState(xyd.RedMarkType.BATTLE_PASS_MISSION1) then
			self.tab_:setTabActive(1, true)

			return
		elseif xyd.models.redMark:getRedState(xyd.RedMarkType.BATTLE_PASS_MISSION2) then
			self.tab_:setTabActive(2, true)

			return
		elseif xyd.models.redMark:getRedState(xyd.RedMarkType.BATTLE_PASS_MISSION3) then
			self.tab_:setTabActive(3, true)

			return
		else
			self.tab_:setTabActive(1, true)
		end

		self:initMissions()
	else
		self:initMissions()
	end
end

function BattlePassMission:onTouchMission(index)
	if self.cur_select_ ~= index then
		self.cur_select_ = index

		for i = 1, 3 do
			self.gridList_[i].gameObject:SetActive(i == index)
		end

		self:initMissions()
		self:updateCountDown()
	end
end

function BattlePassMission:updateCountDown()
	if self.endTime then
		if self.cur_select_ == xyd.MissionType.TODAY then
			self.countDownLabel_.text = xyd.secondsToString(self.endTime - xyd.getServerTime())
		else
			self.countDownLabel_.text = xyd.secondsToString(self.model_:getWeeklyEndTime() - xyd.getServerTime())
		end
	end

	if not self.hasRepotision_ then
		self.timeLayout_:Reposition()

		self.hasRepotision_ = true
	end
end

function BattlePassMission:initMissions()
	if self.model_:showFinalMission() and self.cur_select_ == xyd.MissionType.TODAY then
		local finalItem

		if not self.allDoneMission_[1] then
			self.allDoneRoot_:SetActive(true)

			finalItem = BattlePassMissionItem.new(self.allDoneRoot_)
			self.allDoneMission_[1] = finalItem
		else
			finalItem = self.allDoneMission_[1]
		end

		finalItem:setInfo(self.model_:getFinalMissionInfo(), "special", self)
		self.allDoneRoot_.transform:SetLocalScale(1, 1, 1)

		local miniMonthCard = xyd.models.activity:getActivity(xyd.ActivityID.MONTH_CARD)
		local endTime = miniMonthCard.detail_.charges[2].end_time or 0

		if miniMonthCard.detail_.charges[1] and miniMonthCard.detail_.charges[1].end_time then
			endTime = miniMonthCard.detail_.charges[1].end_time
		end

		local days = math.floor((endTime - xyd:getServerTime() + xyd:getServerTime() % 86400) / 86400)

		if days > 0 then
			self.allDoneRoot_:NodeByName("doubleMark").gameObject:SetActive(true)
		else
			self.allDoneRoot_:NodeByName("doubleMark").gameObject:SetActive(false)
		end
	else
		self.allDoneRoot_.transform:SetLocalScale(1, 0, 1)
	end

	local nowScroll

	if self.cur_select_ == xyd.MissionType.TODAY then
		nowScroll = self.scrollView2_

		self.scrollView_:SetActive(false)
	else
		nowScroll = self.scrollView_

		self.scrollView2_:SetActive(false)
	end

	self.nowScroll_ = nowScroll

	self.nowScroll_:SetActive(true)

	local missions = self.model_:getMissionList()

	for idx, missionData in ipairs(missions) do
		if xyd.tables.battlePassMissionTable:getType(missionData.mission_id) == self.cur_select_ then
			local item

			if not self.missionItemList_[missionData.mission_id] then
				local itemRoot = NGUITools.AddChild(self.gridList_[self.cur_select_].gameObject, self.missionItem_)

				item = BattlePassMissionItem.new(itemRoot, self)
				self.missionItemList_[missionData.mission_id] = item

				table.insert(self.missionList_[self.cur_select_], missionData.mission_id)
			else
				item = self.missionItemList_[missionData.mission_id]
			end

			if item then
				item:setInfo(missionData, "normal", self)
			end

			self.gridList_[self.cur_select_]:Reposition()

			if idx == #missions or idx == 1 then
				self.gridList_[self.cur_select_]:Reposition()
				nowScroll:ResetPosition()
			end
		end
	end

	self:waitForFrame(1, function()
		nowScroll:ResetPosition()
	end)

	if self.cur_select_ == xyd.MissionType.EXTRA then
		self.timeNode_:SetActive(false)
	else
		self.timeNode_:SetActive(true)
	end
end

function BattlePassMission:updateExp()
	self.levText_.text = __(xyd.getBpLev())

	if not xyd.getBpNowExp()[2] then
		self.expText_.gameObject:SetActive(false)

		self.progressBar_.value = 1
	else
		self.expText_.text = xyd.getBpNowExp()[1] .. "/" .. xyd.getBpNowExp()[2]
		self.progressBar_.value = xyd.getBpNowExp()[1] / xyd.getBpNowExp()[2]
	end
end

function BattlePassMission:refresh(event)
	local hasExp = false

	for i = 1, #event.data.items do
		local itemId = event.data.items[i].item_id

		if itemId == xyd.ItemID.BP_EXP then
			hasExp = true

			break
		end

		if itemId == xyd.tables.miscTable:split2Cost("daily_mission_award", "value", "|#")[2][1] then
			xyd.models.itemFloatModel:pushNewItems({
				event.data.items[i]
			})
		end
	end

	if not hasExp then
		return
	end

	self:updateExp()
end

function BattlePassMission:showItemFloat(params)
	xyd.models.itemFloatModel:pushNewItems(params)
end

function BattlePassMission:dispose()
	BattlePassMission.super.dispose(self)

	if self.timer_ then
		self.timer_:Stop()

		self.timer_ = nil
	end

	if self.countDown0_ then
		self.countDown0_:stopTimeCount()

		self.countDown0_ = nil
	end
end

function BattlePassMission:reqAward(mission_id)
	local missions = self.model_:getMissionList()
	local reqMissionList = {}

	for idx, missionData in ipairs(missions) do
		if xyd.tables.battlePassMissionTable:getType(missionData.mission_id) == self.cur_select_ and missionData.is_completed == 1 and missionData.is_awarded ~= 1 then
			table.insert(reqMissionList, missionData.mission_id)
		end
	end

	if mission_id and xyd.arrayIndexOf(reqMissionList, mission_id) < 0 then
		table.insert(reqMissionList, mission_id)
	end

	xyd.models.mission:reqAwardList(reqMissionList)
end

function BattlePassMissionItem:ctor(go, parent)
	self.iconItem_ = {}
	self.parent_ = parent

	BattlePassMissionItem.super.ctor(self, go)
end

function BattlePassMissionItem:initUI()
	self.go_ = self.go

	local itemTrans = self.go.transform

	self.baseWi_ = itemTrans:GetComponent(typeof(UIWidget))
	self.progressBar_ = itemTrans:ComponentByName("progressPart", typeof(UIProgressBar))
	self.progressDesc_ = itemTrans:ComponentByName("progressPart/labelDesc", typeof(UILabel))
	self.btnGo_ = itemTrans:ComponentByName("btnGo", typeof(UISprite))
	self.btnGoLabel_ = itemTrans:ComponentByName("btnGo/label", typeof(UILabel))
	self.btnAward_ = itemTrans:ComponentByName("btnAward", typeof(UISprite))
	self.btnAwardLabel_ = itemTrans:ComponentByName("btnAward/label", typeof(UILabel))
	self.btnAwardMask_ = itemTrans:ComponentByName("btnAward/btnMask", typeof(UISprite))
	self.missionDesc_ = itemTrans:ComponentByName("missionDesc", typeof(UILabel))
	self.baseBg_ = itemTrans:ComponentByName("imgBg", typeof(UISprite))
	self.iconRoot_ = itemTrans:ComponentByName("itemRoot", typeof(UIGrid))
	self.awardImg_ = itemTrans:ComponentByName("imgAward", typeof(UISprite))

	xyd.setUISpriteAsync(self.awardImg_, nil, "mission_awarded_" .. tostring(xyd.Global.lang), nil, nil)
end

function BattlePassMissionItem:onClickGo()
	local table = xyd.models.mission:getNowMissionTable()
	local funId = table:getFuncId(self.missionInfo_.mission_id)

	if funId ~= 0 and not xyd.checkFunctionOpen(funId) then
		return
	end

	local goWin = tostring(table:getGoWindow(self.missionInfo_.mission_id))
	local params = table:getGoParams(self.missionInfo_.mission_id)
	local missionType = xyd.tables.battlePassMissionTable:getType(self.missionInfo_.mission_id)
	local lastWin = "battle_pass_window"

	params.lastWindowParams = {
		isBack = true,
		tag = xyd.BattlePassTag.MISSION,
		labelIndex = missionType
	}

	if goWin == lastWin then
		lastWin = ""
	end

	params.lastWindow = lastWin

	xyd.WindowManager.get():closeWindow(lastWin, function()
		xyd.WindowManager.get():openWindow(goWin, params)
	end)
end

function BattlePassMissionItem:onClickAward()
	if self.currentState_ ~= "special" then
		self.parent_:reqAward()
	else
		self.parent_:reqAward(self.missionInfo_.mission_id)
	end
end

function BattlePassMissionItem:showAward(event)
	local miniMonthCard = xyd.models.activity:getActivity(xyd.ActivityID.MONTH_CARD)
	local endTime = miniMonthCard.detail_.charges[2].end_time or 0

	if miniMonthCard.detail_.charges[1] and miniMonthCard.detail_.charges[1].end_time then
		endTime = miniMonthCard.detail_.charges[1].end_time
	end

	local days = math.floor((endTime - xyd:getServerTime() + xyd:getServerTime() % 86400) / 86400)

	for _, info in ipairs(self.itemInfo_) do
		local params = {}

		if tonumber(info.id) == 2 and event.data.mission_id == xyd.models.mission:getFinalMissionInfo().mission_id then
			if days > 0 then
				params = {
					{
						hideText = true,
						item_id = tonumber(info.id),
						item_num = tonumber(info.num) * 2
					}
				}
			else
				params = {
					{
						hideText = true,
						item_id = tonumber(info.id),
						item_num = tonumber(info.num)
					}
				}
			end
		else
			params = {
				{
					hideText = true,
					item_id = tonumber(info.id),
					item_num = tonumber(info.num)
				}
			}
		end

		xyd.models.itemFloatModel:pushNewItems(params)
	end
end

function BattlePassMissionItem:setInfo(missionInfo, state, parent)
	self.parent_ = parent
	self.missionInfo_ = missionInfo
	self.currentState_ = state

	local mt = xyd.models.mission:getNowMissionTable()

	self.missionDesc_.text = mt:getDesc(missionInfo.mission_id)
	self.completeValuemt_ = mt:getCompleteValue(missionInfo.mission_id, xyd.models.activity:getBattlePassId())
	self.progressBar_.value = missionInfo.value / self.completeValuemt_
	self.progressDesc_.text = missionInfo.value .. "/" .. self.completeValuemt_

	local itemInfo = mt:getAward(missionInfo.mission_id, xyd.models.activity:getBattlePassId())

	self.iconRoot_.gameObject:SetActive(false)

	local itemIconSpecil

	self.itemInfo_ = {}

	for i = 1, 2 do
		local itemNum = itemInfo[i * 2]

		if itemNum then
			local num = itemInfo[i * 2]
			local itemId = itemInfo[i * 2 - 1]

			if itemId == 117 then
				itemId = 223
			end

			if i == 1 then
				num = num + missionInfo.extra
			end

			if not self.iconItem_[i] then
				self.iconItem_[i] = xyd.getItemIcon({
					labelNumScale = 1,
					hideText = true,
					uiRoot = self.iconRoot_.gameObject,
					itemID = itemId,
					num = num,
					scale = Vector3(0.7, 0.7, 0.7),
					dragScrollView = self.parent_.nowScroll_,
					itemIconSpecil = itemIconSpecil
				})
			else
				UnityEngine.Object.Destroy(self.iconItem_[i]:getGameObject())

				self.iconItem_[i] = xyd.getItemIcon({
					labelNumScale = 1,
					hideText = true,
					uiRoot = self.iconRoot_.gameObject,
					itemID = itemId,
					num = num,
					scale = Vector3(0.7, 0.7, 0.7),
					dragScrollView = self.parent_.nowScroll_,
					itemIconSpecil = itemIconSpecil
				})
			end

			table.insert(self.itemInfo_, {
				id = itemId,
				num = num
			})
		end
	end

	local key = xyd.getTimeKey()

	self:waitForFrame(1, function()
		self.iconRoot_:Reposition()
		self.iconRoot_.gameObject:SetActive(true)
	end, key)

	self.btnGoLabel_.text = __("GO")
	self.btnAwardLabel_.text = __("GET2")

	if missionInfo.is_completed == 1 then
		self.btnGo_.gameObject:SetActive(false)
		self.btnAward_.gameObject:SetActive(true)

		self.btnAwardLabel_.color = Color.New2(4278124287)
		self.btnAwardLabel_.effectColor = Color.New2(1012112383)
	else
		self.btnGo_.gameObject:SetActive(true)
		self.btnAward_.gameObject:SetActive(false)

		self.btnAwardLabel_.color = Color.New2(1012112383)
		self.btnAwardLabel_.effectColor = Color.New2(4294967295)

		if state == "special" then
			xyd.setTouchEnable(self.btnAward_.gameObject, false)
			self.btnAward_.gameObject:SetActive(true)
			self.btnGo_.gameObject:SetActive(false)
		else
			xyd.setTouchEnable(self.btnAward_.gameObject, true)
		end
	end

	if state == "special" then
		-- block empty
	else
		self.baseBg_:SetActive(true)

		local dragScrollView = self.baseBg_:GetComponent(typeof(UIDragScrollView))

		dragScrollView = dragScrollView or self.baseBg_:AddComponent(typeof(UIDragScrollView))
		dragScrollView.scrollView = self.parent_.nowScroll_
	end

	if missionInfo.is_awarded == 1 then
		self.awardImg_:SetActive(true)
		self.btnAward_.gameObject:SetActive(false)
		self.btnGo_.gameObject:SetActive(false)
	else
		self.awardImg_:SetActive(false)
	end

	UIEventListener.Get(self.btnGo_.gameObject).onClick = handler(self, self.onClickGo)
	UIEventListener.Get(self.btnAward_.gameObject).onClick = handler(self, self.onClickAward)
end

return BattlePassMission
