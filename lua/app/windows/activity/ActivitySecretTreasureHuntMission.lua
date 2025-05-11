-- chunkname: @../../../Product/Bundles/Android/src/app/windows/activity/ActivitySecretTreasureHuntMission.lua

local MissionType = {
	DAILY = 1,
	WEEKLY = 2
}
local ActivityContent = import(".ActivityContent")
local ActivitySecretTreasureHuntMission = class("ActivitySecretTreasureHuntMission", ActivityContent)
local CommonTabBar = require("app.common.ui.CommonTabBar")
local CountDown = import("app.components.CountDown")
local ActivitySecretTreasureHuntMissionItem = class("ActivitySecretTreasureHuntMissionItem", import("app.components.CopyComponent"))

function ActivitySecretTreasureHuntMission:ctor(parentGO, params)
	ActivityContent.ctor(self, parentGO, params)
end

function ActivitySecretTreasureHuntMission:initUI()
	self.missionTable = xyd.tables.activitySecretTreasureHuntMissionTable
	self.missionTextTable = xyd.tables.activitySecretTreasureHuntMissionTextTable
	self.curMissionType = MissionType.DAILY
	self.itemArr = {}
	self.isTimeWeekOver = false

	self:getUIComponent()
	ActivitySecretTreasureHuntMission.super.initUI(self)
	self:initTextAndImage()
	self:initCountDownAndRound()
	self:initEffect()
	self:initNav()
	self:registerEvent(xyd.event.GET_ACTIVITY_INFO_BY_ID, handler(self, self.onActivityByID))
	self:registerEvent(xyd.event.WINDOW_WILL_CLOSE, handler(self, self.onRefresh))
	xyd.models.activity:reqActivityByID(self.id)
end

function ActivitySecretTreasureHuntMission:resizeToParent()
	ActivitySecretTreasureHuntMission.super.resizeToParent(self)
	self:resizePosY(self.logoImg, -37, -93)
	self:resizePosY(self.contentGroup, -562.5, -663.5)
end

function ActivitySecretTreasureHuntMission:getUIComponent()
	local go = self.go

	self.mission_item = go:NodeByName("mission_item").gameObject
	self.logoImg = go:ComponentByName("logoImg", typeof(UISprite))
	self.contentGroup = go:NodeByName("contentGroup").gameObject
	self.nav = self.contentGroup:ComponentByName("nav", typeof(UIWidget))
	self.timeTextLabel = self.contentGroup:ComponentByName("e:Group/timeTextLabel", typeof(UILabel))
	self.timeLabel1 = self.contentGroup:ComponentByName("e:Group/timeLabel1", typeof(UILabel))
	self.timeLabel2 = self.contentGroup:ComponentByName("e:Group/timeLabel2", typeof(UILabel))
	self.task = self.contentGroup:NodeByName("task").gameObject
	self.task_UIScrollView = self.contentGroup:ComponentByName("task", typeof(UIScrollView))
	self.task_UIPanel = self.contentGroup:ComponentByName("task", typeof(UIPanel))
	self.missionGroup = self.contentGroup:NodeByName("task/missionGroup").gameObject
	self.missionGroup_UILayout = self.contentGroup:ComponentByName("task/missionGroup", typeof(UILayout))
end

function ActivitySecretTreasureHuntMission:onActivityByID(event)
	local id = event.data.act_info.activity_id

	if id ~= self.id then
		return
	end

	local data = xyd.models.activity:getActivity(self.id)

	data:setData(event.data.act_info)
	self:initMissionGroup()
end

function ActivitySecretTreasureHuntMission:getPrefabPath()
	return "Prefabs/Windows/activity/activity_secret_treasure_hunt_mission"
end

function ActivitySecretTreasureHuntMission:onRefresh(event)
	if event.params.windowName == "item_tips_window" then
		return
	end

	xyd.models.activity:reqActivityByID(self.id)
end

function ActivitySecretTreasureHuntMission:initNav()
	local index = 2
	local labelText = {}
	local labelStates = {
		chosen = {
			color = Color.New2(4294967295),
			effectColor = Color.New2(2168922623)
		},
		unchosen = {
			color = Color.New2(1916803583),
			effectColor = Color.New2(4293907711)
		}
	}

	self.tab = CommonTabBar.new(self.nav.gameObject, index, function(index)
		self:updateNav(index)
	end, nil, labelStates)

	table.insert(labelText, __("ACTIVITY_ICE_SECRET_MISSION_DAILY"))
	table.insert(labelText, __("ACTIVITY_ICE_SECRET_MISSION_WEEKLY"))
	self.tab:setTexts(labelText)
end

function ActivitySecretTreasureHuntMission:updateNav(i)
	if self.curMissionType == i then
		return
	end

	self.curMissionType = i

	self:initCountDownAndRound()
	self:initMissionGroup()
end

function ActivitySecretTreasureHuntMission:initTextAndImage()
	xyd.setUISpriteAsync(self.logoImg, nil, "activity_secret_treasure_hunt_mission_text_" .. xyd.Global.lang, nil, nil, true)
end

function ActivitySecretTreasureHuntMission:initCountDownAndRound()
	local startTime = self.activityData:startTime()
	local passedTotalTime = xyd.getServerTime() - startTime

	self.round = math.ceil(passedTotalTime / xyd.TimePeriod.WEEK_TIME)

	if self.curMissionType == MissionType.WEEKLY then
		if self.round < 2 then
			self.timeLabel1:SetActive(false)
			self.timeLabel2:SetActive(true)

			self.timeTextLabel.text = __("ACTIVITY_ICE_SECRET_MISSION_CD")

			self.timeTextLabel:SetActive(true)
			self.timeTextLabel:X(-52)

			self.timeTextLabel.width = 155
		else
			self.timeLabel1:SetActive(false)
			self.timeLabel2:SetActive(false)

			self.timeTextLabel.text = __("ACTIVITY_ICE_SECRET_MISSION_TIP")

			self.timeTextLabel:SetActive(true)
			self.timeTextLabel:X(0)

			self.timeTextLabel.width = 300
		end
	end

	if self.curMissionType == MissionType.DAILY then
		local dayEndtime = self.activityData:getEndTime() - xyd.getServerTime()

		if dayEndtime > 0 and dayEndtime > xyd.TimePeriod.DAY_TIME then
			self.timeLabel1:SetActive(true)
			self.timeLabel2:SetActive(false)

			self.timeTextLabel.text = __("ACTIVITY_ICE_SECRET_MISSION_CD")

			self.timeTextLabel:SetActive(true)
			self.timeTextLabel:X(-52)

			self.timeTextLabel.width = 155
		else
			self.timeLabel1:SetActive(false)
			self.timeLabel2:SetActive(false)

			self.timeTextLabel.text = __("ACTIVITY_ICE_SECRET_MISSION_TIP")

			self.timeTextLabel:SetActive(true)
			self.timeTextLabel:X(0)

			self.timeTextLabel.width = 300
		end
	end

	if self.activityData:getEndTime() > xyd.getServerTime() then
		xyd.models.activity:updateRedMarkCount(xyd.ActivityID.ACTIVITY_SECRET_TREASURE_HUNT_MISSION, function()
			xyd.db.misc:setValue({
				key = "secret_treasure_hunt_mission_view_time",
				value = xyd.getServerTime()
			})
		end)

		local dayRound = math.ceil(passedTotalTime / xyd.TimePeriod.DAY_TIME)
		local countdownTime = dayRound * xyd.TimePeriod.DAY_TIME - passedTotalTime

		if self.countdown_daily then
			self.countdown_daily:dispose()
		end

		self.countdown_daily = CountDown.new(self.timeLabel1, {
			duration = countdownTime,
			callback = handler(self, self.timeOverDaily)
		})

		local countdownTimeWeek = self.round * xyd.TimePeriod.WEEK_TIME - passedTotalTime

		if self.countdown_Week then
			self.countdown_Week:dispose()
		end

		self.countdown_Week = CountDown.new(self.timeLabel2, {
			duration = countdownTimeWeek,
			callback = handler(self, self.timeOverWeek)
		})
	end
end

function ActivitySecretTreasureHuntMission:timeOverDaily()
	xyd.models.activity:reqActivityByID(self.id)
	self:initCountDownAndRound()
end

function ActivitySecretTreasureHuntMission:timeOverWeek()
	self.isTimeWeekOver = true
end

function ActivitySecretTreasureHuntMission:initEffect()
	return
end

function ActivitySecretTreasureHuntMission:initMissionGroup()
	xyd.changeScrollViewMove(self.task, false, Vector3(0, 86, 0), Vector2(0, 0))

	local mission = self.missionTable:getIds()
	local paramsNow = {}

	for i = 1, #mission do
		if self.missionTable:getType(i) == self.curMissionType - 1 then
			local id = self.missionTable:getActivityID(i)

			if xyd.models.activity:isOpen(id) then
				local params = {
					id = i,
					desc = self.missionTextTable:getDescription(i),
					award = self.missionTable:getAward(i),
					completeNum = self.missionTable:getCompleteNum(i),
					value = self.activityData.detail.values[i]
				}

				table.insert(paramsNow, params)
			end
		end
	end

	for i in pairs(paramsNow) do
		if self.itemArr[i] == nil then
			local tmp = NGUITools.AddChild(self.missionGroup.gameObject, self.mission_item.gameObject)
			local item = ActivitySecretTreasureHuntMissionItem.new(tmp, paramsNow[i])

			xyd.setDragScrollView(item.goItem_, self.task_UIScrollView)
			table.insert(self.itemArr, item)
		else
			self.itemArr[i]:getGo():SetActive(true)
			self.itemArr[i]:updateParams(paramsNow[i])
		end
	end

	if #self.itemArr > #paramsNow then
		for i = #paramsNow + 1, #self.itemArr do
			self.itemArr[i]:getGo():SetActive(false)
		end
	end

	self.missionGroup_UILayout:Reposition()
	xyd.changeScrollViewMove(self.task, true)
	self:waitForTime(0.01, function()
		self.task_UIScrollView:ResetPosition()
	end)
end

function ActivitySecretTreasureHuntMission:switchMissionTypeRegister()
	local ____TS_switch21 = self.curMissionType

	if ____TS_switch21 == MissionType.DAILY then
		-- block empty
	else
		if ____TS_switch21 == MissionType.WEEKLY then
			goto label_19_0
		end

		goto label_19_1
	end

	self.taskGroup2:once(egret.TouchEvent.TOUCH_TAP, self.switchMissionType, self)

	if false then
		::label_19_0::

		self.taskGroup1:once(egret.TouchEvent.TOUCH_TAP, self.switchMissionType, self)
	end

	::label_19_1::
end

function ActivitySecretTreasureHuntMission:switchMissionType()
	local ____TS_switch23 = self.curMissionType

	if ____TS_switch23 == MissionType.DAILY then
		-- block empty
	else
		if ____TS_switch23 == MissionType.WEEKLY then
			goto label_20_0
		end

		goto label_20_1
	end

	self.curMissionType = MissionType.WEEKLY

	if false then
		::label_20_0::

		self.curMissionType = MissionType.DAILY
	end

	::label_20_1::

	self:initCountDownAndRound()
	self:initMissionGroup()
end

function ActivitySecretTreasureHuntMission:countDown2Zero()
	egret:setTimeout(function()
		ActivityModel:get():reqActivityByID(self.id)
		self.eventProxy_:addEventListener(xyd.event.ACTIVITY_INFO_BY_ID, function()
			self:initCountDownAndRound()
			self:initEffect()
			self:initMissionGroup()
		end, self)
	end, self, 2000)
end

function ActivitySecretTreasureHuntMissionItem:ctor(goItem, params)
	self.goItem_ = goItem

	local transGo = goItem.transform

	self.id = params.id
	self.completeNum = params.completeNum
	self.value = params.value
	self.item = params.award
	self.descLabel = transGo:ComponentByName("descLabel", typeof(UILabel))
	self.progressBar = transGo:ComponentByName("progressBar", typeof(UIProgressBar))
	self.progressDesc = transGo:ComponentByName("progressBar/progressLabel", typeof(UILabel))
	self.itemGroup = transGo:NodeByName("itemGroup").gameObject

	if xyd.Global.lang == "zh_tw" or xyd.Global.lang == "ja_jp" then
		self.descLabel.overflowHeight = 30
	end

	self.descLabel.text = params.desc

	self:createChildren()
end

function ActivitySecretTreasureHuntMissionItem:getGo()
	return self.goItem_
end

function ActivitySecretTreasureHuntMissionItem:createChildren()
	self:initIcon()
	self:initProgress()

	UIEventListener.Get(self.goItem_).onClick = handler(self, function()
		local getWayId = xyd.tables.activitySecretTreasureHuntMissionTable:getGetway(self.id)

		if getWayId > 0 then
			xyd.goWay(getWayId)
		end
	end)
end

function ActivitySecretTreasureHuntMissionItem:initIcon()
	if not self.itemIcon then
		self.itemIcon = xyd.getItemIcon({
			isAddUIDragScrollView = true,
			itemID = self.item.itemId,
			num = self.item.itemNum,
			uiRoot = self.itemGroup.gameObject,
			scale = Vector3(0.5925925925925926, 0.5925925925925926, 1)
		})
	else
		self.itemIcon:setInfo({
			isAddUIDragScrollView = true,
			itemID = self.item.itemId,
			num = self.item.itemNum,
			scale = Vector3(0.5925925925925926, 0.5925925925925926, 1)
		})
	end
end

function ActivitySecretTreasureHuntMissionItem:initProgress()
	if self.value > self.completeNum then
		self.value = self.completeNum
	end

	self.progressBar.value = math.min(self.value, self.completeNum) / self.completeNum
	self.progressDesc.text = self.value .. " / " .. self.completeNum
end

function ActivitySecretTreasureHuntMissionItem:updateParams(params)
	self.id = params.id
	self.descLabel.text = params.desc
	self.completeNum = params.completeNum
	self.value = params.value
	self.item = params.award

	self:createChildren()
end

return ActivitySecretTreasureHuntMission
