-- chunkname: @../../../Product/Bundles/Android/src/app/components/MainWindowRightUpCon.lua

local MainWindowRightUpCon = class("MainWindowRightUpCon", import("app.components.CopyComponent"))
local selfPlayer = xyd.models.selfPlayer
local CountDown = import("app.components.CountDown")
local MainMap = xyd.getMapInstanceByType(xyd.GameMapType.MAIN)
local MainTopRightBtn = class("MainTopRightBtn")

function MainTopRightBtn:ctor(goItem, id)
	self.trans = {
		label = {
			"FRIEND",
			"BP_TITLE",
			"QUIZ",
			"PET",
			"TRAVEL_TITLE",
			"STARRY_ALTAR",
			"GROWTH_DIARY"
		},
		img = {
			"right_friend_icon_v3",
			"right_battlepass_icon_v4",
			"right_quiz_icon_v3",
			"left_pet_icon",
			"right_explore_icon",
			"right_starry_altar_icon",
			"growth_diary_icon"
		},
		funcId = {
			xyd.FunctionID.FRIEND,
			xyd.FunctionID.MISSION,
			xyd.FunctionID.QUIZ,
			xyd.FunctionID.PET,
			xyd.FunctionID.EXPLORE,
			xyd.FunctionID.STARRY_ALTAR,
			xyd.FunctionID.GROWTH_DIARY
		}
	}
	self.id = id
	self.goItem_ = goItem
	self.name_ = self.trans.label[id]

	local transGo = goItem.transform

	self.transGo_sprite = transGo:GetComponent(typeof(UISprite))
	self.transGo_UIWidget = transGo:GetComponent(typeof(UIWidget))
	self.trBtnImg_ = transGo:ComponentByName("tr_btn_img", typeof(UISprite))
	self.trBtnLabel_ = transGo:ComponentByName("tr_btn_label", typeof(UILabel))
	self.btnAlertImg_ = transGo:ComponentByName("red_point", typeof(UISprite))
	self.upIcon = transGo:NodeByName("upIcon").gameObject

	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.ANDROID_1_5_138) >= 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.IOS_71_3_204) >= 0 or UNITY_EDITOR then
		self.soundComponent = transGo:GetComponent(typeof(UIPlaySound))
	end

	self.trBtnImg_:SetActive(false)

	local imgName = self.trans.img[id]

	if xyd.isH5() then
		imgName = "left_btn_bg_v3"

		xyd.setUISprite(self.trBtnImg_, nil, self.trans.img[id] .. "_h5", function()
			self.trBtnImg_:MakePixelPerfect()
		end)
		self.trBtnImg_:SetActive(true)

		self.transGo_UIWidget.width = 80
		self.transGo_UIWidget.height = 83
	end

	xyd.setUISprite(self.transGo_sprite, nil, imgName)

	self.trBtnLabel_.text = __(self.trans.label[id])

	self.btnAlertImg_.gameObject:SetActive(false)
	self:updateSound()
	self:updateState()
end

function MainTopRightBtn:updateState()
	local openFuncsIndex = xyd.models.functionOpen:getOpenFuncIndex()

	if self.trans.funcId[self.id] == 0 or openFuncsIndex[tostring(self.trans.funcId[self.id])] then
		self.goItem_:SetActive(true)
	else
		self.goItem_:SetActive(false)
	end

	if self.trans.funcId[self.id] == xyd.FunctionID.GROWTH_DIARY and xyd.models.growthDiary:checkFinish() then
		self.goItem_:SetActive(false)
	end

	self:checkGalaxy()

	if self.id == 4 then
		self:updateUpIcon()
	end

	if self.id == 3 then
		self.goItem_:SetActive(false)
	end
end

function MainTopRightBtn:updateSound()
	if self.trans.funcId[self.id] == xyd.FunctionID.QUIZ and self.soundComponent then
		self.soundComponent.tableId = 2122
	end
end

function MainTopRightBtn:checkGalaxy()
	if self.id == 6 then
		local openFuncsIndex = xyd.models.functionOpen:getOpenFuncIndex()
		local starryOpen = xyd.checkFunctionOpen(xyd.FunctionID.STARRY_ALTAR, true)
		local galaxyOpen = xyd.checkFunctionOpen(xyd.FunctionID.GALAXY_TRIP, true)

		galaxyOpen = galaxyOpen and xyd.models.galaxyTrip:getLeftTime() > 0

		if starryOpen and galaxyOpen then
			self.trBtnLabel_.text = __("GALAXY_TRIP_TEXT01")

			xyd.setUISprite(self.trBtnImg_, nil, "activity_galaxy_trip_mission_icon_xxzl_yd")
			self.goItem_:SetActive(true)
		elseif not galaxyOpen and starryOpen then
			self.trBtnLabel_.text = __(self.trans.label[self.id])

			local imgName = self.trans.img[self.id]

			xyd.setUISprite(self.trBtnImg_, nil, imgName)
			self.goItem_:SetActive(true)
		else
			self.goItem_:SetActive(false)
		end
	end
end

function MainTopRightBtn:updateUpIcon()
	if self.id == 3 then
		if xyd.models.activity:isResidentReturnAddTime() then
			self.upIcon:SetActive(xyd.models.activity:isResidentReturnAddTime())

			local return_multiple = xyd.tables.activityReturn2AddTable:getMultiple(xyd.ActivityResidentReturnAddType.DAILY_QUIZ)

			xyd.setUISpriteAsync(self.upIcon.gameObject:GetComponent(typeof(UISprite)), nil, "common_tips_up_" .. return_multiple, nil, nil, nil)
		else
			self.upIcon:SetActive(xyd.getReturnBackIsDoubleTime() or xyd.getIsQuizDoubleDrop())
			xyd.setUISpriteAsync(self.upIcon.gameObject:GetComponent(typeof(UISprite)), nil, "common_tips_up_2", nil, nil, nil)
		end

		if xyd.isH5() then
			self.upIcon:X(30)
			self.upIcon:Y(-3)
		end
	end
end

function MainTopRightBtn:levChange()
	local id = self.id

	if id == 3 then
		return
	end

	if (self.trans.funcId[id] == 0 or xyd.checkFunctionOpen(self.trans.funcId[id], true)) and (xyd.Global.isReview ~= 1 or self.id ~= 2) then
		self.goItem_:SetActive(true)
	else
		self.goItem_:SetActive(false)
	end

	if self.trans.funcId[id] == xyd.FunctionID.GROWTH_DIARY and xyd.models.growthDiary:checkFinish() then
		self.goItem_:SetActive(false)
	end
end

function MainTopRightBtn:getGameObject()
	return self.goItem_
end

function MainTopRightBtn:setUISprite(spriteName)
	if xyd.isH5() then
		xyd.setUISprite(self.trBtnImg_, nil, spriteName .. "_h5")
		self.trBtnImg_:MakePixelPerfect()

		return
	end

	xyd.setUISprite(self.transGo_sprite, nil, spriteName)
end

function MainTopRightBtn:setLabel(label)
	self.trBtnLabel_.text = label
end

function MainTopRightBtn:getName()
	return self.name_
end

function MainTopRightBtn:getRedPoint()
	return self.btnAlertImg_
end

local MainTopRightNewBtn = class("MainTopRightNewBtn")

function MainTopRightNewBtn:ctor(goItem)
	self.goItem_ = goItem

	local transGo = goItem.transform

	self.transGo_sprite = transGo:GetComponent(typeof(UISprite))
	self.transGo_UIWidget = transGo:GetComponent(typeof(UIWidget))
	self.trBtnImg_ = transGo:ComponentByName("tr_btn_img", typeof(UISprite))
	self.trBtnLabel_ = transGo:ComponentByName("tr_btn_label", typeof(UILabel))
	self.btnAlertImg_ = transGo:ComponentByName("red_point", typeof(UISprite))
	self.upIcon = transGo:NodeByName("upIcon").gameObject

	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.ANDROID_1_5_138) >= 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, xyd.IOS_71_3_204) >= 0 or UNITY_EDITOR then
		self.soundComponent = transGo:GetComponent(typeof(UIPlaySound))
	end
end

function MainTopRightNewBtn:updateUpIcon()
	return
end

function MainTopRightNewBtn:levChange()
	return
end

function MainTopRightNewBtn:getGameObject()
	return self.goItem_.gameObject
end

function MainTopRightNewBtn:getRedPoint()
	return self.btnAlertImg_
end

function MainTopRightNewBtn:updateParams(params)
	if params.clickCallBack then
		UIEventListener.Get(self.goItem_.gameObject).onClick = handler(self, function()
			params.clickCallBack()
		end)
	end

	if params.label then
		self.trBtnLabel_.text = params.label
	end

	if params.img then
		xyd.setUISpriteAsync(self.trBtnImg_, nil, params.img, nil, nil, true)
	end
end

function MainWindowRightUpCon:ctor(goItem, data, parent, topRightBtn)
	self.data = data
	self.parent = parent
	self.trBtnList_ = {}
	self.topRightBtn = topRightBtn

	MainWindowRightUpCon.super.ctor(self, goItem)
end

function MainWindowRightUpCon:initUI()
	self:getUIComponent()
	MainWindowRightUpCon.super.initUI(self)
	self:register()
	self:initTopBtnGroup()
	self:showProperTopBtn()
	self:initRedMark()
end

function MainWindowRightUpCon:getUIComponent()
	self.transTopR = self.go.gameObject
	self.transTopR_uiRect = self.transTopR:GetComponent(typeof(UIRect))
end

function MainWindowRightUpCon:register()
	self:registerEvent(xyd.event.FUNCTION_OPEN, handler(self, self.showProperTopBtn))
end

function MainWindowRightUpCon:initRedMark()
	xyd.models.redMark:setMarkImg(xyd.RedMarkType.FRIEND, self.trBtnList_[1]:getRedPoint())
	xyd.models.redMark:setMarkImg(xyd.RedMarkType.PET, self.trBtnList_[4]:getRedPoint())
	xyd.models.redMark:setMarkImg(xyd.RedMarkType.GROWTH_DIARY, self.trBtnList_[7]:getRedPoint())
	xyd.models.redMark:setJointMarkImg({
		xyd.RedMarkType.GALAXY_TRIP,
		xyd.RedMarkType.GALAXY_TRIP_MAP_CAN_GET_POINT
	}, self.trBtnList_[6]:getRedPoint())

	local data = xyd.models.activity:getBattlePassData()

	if data then
		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.BATTLE_PASS,
			xyd.RedMarkType.ACHIEVEMENT,
			xyd.RedMarkType.MISSION,
			xyd.RedMarkType.BATTLE_PASS_MISSION1,
			xyd.RedMarkType.BATTLE_PASS_MISSION2,
			xyd.RedMarkType.BATTLE_PASS_MISSION3
		}, self.btnMission_:getRedPoint())
		data:getRedMarkState()
	else
		xyd.models.redMark:setMarkImg(xyd.RedMarkType.MISSION, self.btnMission_:getRedPoint())
	end

	xyd.models.redMark:setJointMarkImg({
		xyd.RedMarkType.EXPLORE_OUPUT_AWARD,
		xyd.RedMarkType.EXPLORE_ADVENTURE_BOX_CAN_OPEN
	}, self.btnExplore_:getRedPoint())

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.YEARS_SUMMARY)

	if activityData then
		activityData:checkReadState()
	end
end

function MainWindowRightUpCon:iosTestChangeUI()
	for i = 1, 5 do
		local item = self.trBtnList_[i]

		xyd.setUISprite(item.transGo_sprite, nil, item.trans.img[item.id] .. "_ios_test")
	end
end

function MainWindowRightUpCon:showProperTopBtn()
	for i = 1, #self.trBtnList_ do
		if self.trBtnList_[i] then
			self.trBtnList_[i]:levChange()
		end
	end

	self:updateNewBtns()

	if xyd.isH5() then
		self.transTopR_uiRect:SetLeftAnchor(self.transTop, 1, -88)
		self.transTopR_uiRect:SetRightAnchor(self.transTop, 1, -16)
	end

	self.transTopR:GetComponent(typeof(UIGrid)):Reposition()
end

function MainWindowRightUpCon:checkTrBtn(type)
	if self.trBtnList_ then
		for i = 1, #self.trBtnList_ do
			if self.trBtnList_[i].id == 7 and xyd.models.growthDiary:checkFinish() then
				self.trBtnList_[i].goItem_:SetActive(false)
			elseif self.trBtnList_[i].id == 6 then
				self.trBtnList_[i]:checkGalaxy()
			end
		end

		self:updateNewBtns(type)
		self.transTopR:GetComponent(typeof(UIGrid)):Reposition()
	end
end

function MainWindowRightUpCon:updateUpIcon()
	for i in pairs(self.trBtnList_) do
		self.trBtnList_[i]:updateUpIcon()
	end
end

function MainWindowRightUpCon:initTopBtnGroup()
	local callbackList = {
		function()
			MainMap:stopSound()
			xyd.WindowManager.get():openWindow("friend_window")
		end,
		function()
			if not xyd.checkFunctionOpen(xyd.FunctionID.MISSION) then
				return
			end

			if xyd.models.activity:getActivity(xyd.ActivityID.BATTLE_PASS) or xyd.models.activity:getActivity(xyd.ActivityID.BATTLE_PASS_2) then
				xyd.WindowManager.get():openWindow("battle_pass_window", {})
			else
				xyd.WindowManager.get():openWindow("daily_mission_window")
			end

			MainMap:stopSound()
		end,
		function()
			MainMap:stopSound()
			xyd.db.misc:setValue({
				key = "daily_quize_redmark",
				value = xyd.getServerTime()
			})
			xyd.models.redMark:setMark(xyd.RedMarkType.DAILY_QUIZ, false)

			if xyd.models.dailyQuiz:isAllMaxLev() then
				xyd.WindowManager.get():openWindow("daily_quiz2_window")
			else
				xyd.WindowManager.get():openWindow("daily_quiz2_window")
			end
		end,
		function()
			MainMap:stopSound()

			if xyd.models.petTraining:isTrainOpen() then
				xyd.WindowManager.get():openWindow("pet_start_window")
			else
				xyd.WindowManager.get():openWindow("pet_window")
			end
		end,
		function()
			MainMap:stopSound()

			if xyd.models.exploreModel:getTrainRoomsInfo() then
				xyd.WindowManager.get():openWindow("explore_window")
			end
		end,
		function()
			if not xyd.checkFunctionOpen(xyd.FunctionID.STARRY_ALTAR) then
				return
			end

			local galaxyOpen = xyd.checkFunctionOpen(xyd.FunctionID.GALAXY_TRIP, true)

			if galaxyOpen then
				xyd.WindowManager.get():openWindow("galaxy_start_window")
			else
				xyd.WindowManager.get():openWindow("starry_altar_window")
			end

			MainMap:stopSound()
		end,
		function()
			if not xyd.checkFunctionOpen(xyd.FunctionID.GROWTH_DIARY) then
				return
			end

			xyd.WindowManager.get():openWindow("growth_dairy_window")
			MainMap:stopSound()
		end
	}

	for i = 1, 7 do
		local go = NGUITools.AddChild(self.transTopR.gameObject, self.topRightBtn.gameObject)

		go:SetActive(true)

		go.name = "tr_btn_" .. i

		local btn = MainTopRightBtn.new(go, i)

		table.insert(self.trBtnList_, btn)

		UIEventListener.Get(go).onClick = callbackList[i]
	end

	self.func2Btn = {
		[xyd.FunctionID.MISSION] = self.trBtnList_[2],
		[xyd.FunctionID.QUIZ] = self.trBtnList_[3],
		[xyd.FunctionID.PET] = self.trBtnList_[4]
	}
	self.btnMission_ = self.trBtnList_[2]
	self.btnExplore_ = self.trBtnList_[5]
	self.btnQuiz_ = self.trBtnList_[3]

	self:updateNewBtns()
	self:showProperTopBtn()
end

function MainWindowRightUpCon:updateNewBtns(type)
	if type == nil then
		for i = 1, 7 do
			self.trBtnList_[i]:updateState()
		end
	elseif type == xyd.MainRightBtnType.egShowBtn then
		-- block empty
	end
end

function MainWindowRightUpCon:updateEgShowFun()
	if not self.egShowBtn then
		local go = NGUITools.AddChild(self.transTopR.gameObject, self.topRightBtn.gameObject)

		go:SetActive(true)

		self.egShowBtn = MainTopRightNewBtn.new(go)

		table.insert(self.trBtnList_, self.egShowBtn)
		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.EG_SHOW_BTN1,
			xyd.RedMarkType.EG_SHOW_BTN2
		}, self.egShowBtn:getRedPoint())
	end

	local params = {
		img = "right_battlepass_icon_v4_h5",
		label = __("EG_LABEL"),
		clickCallBack = function()
			print("click new eg btn!")
		end
	}

	self.egShowBtn:updateParams(params)

	if xyd.checkFunctionOpen(xyd.FunctionID.EG_SHOW_BTN, true) then
		self.egShowBtn:getGameObject():SetActive(true)
	else
		self.egShowBtn:getGameObject():SetActive(false)
	end
end

return MainWindowRightUpCon
