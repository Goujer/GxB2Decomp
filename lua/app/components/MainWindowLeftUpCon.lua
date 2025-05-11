-- chunkname: @../../../Product/Bundles/Android/src/app/components/MainWindowLeftUpCon.lua

local MainWindowLeftUpCon = class("MainWindowLeftUpCon", import("app.components.CopyComponent"))
local selfPlayer = xyd.models.selfPlayer
local CountDown = import("app.components.CountDown")
local MainMap = xyd.getMapInstanceByType(xyd.GameMapType.MAIN)
local MaskActEffectPanel
local BTN_TYPE = {
	PUSH = 1
}
local MainGeneralLeftTopBtn = class("MainGeneralLeftTopBtn", import("app.components.CopyComponent"))

function MainGeneralLeftTopBtn:ctor(goItem, params)
	self.params = params

	MainGeneralLeftTopBtn.super.ctor(self, goItem)
end

function MainGeneralLeftTopBtn:initUI()
	local params = self.params

	self.redpoint = self.go:NodeByName("red_point").gameObject
	self.icon = self.go:ComponentByName("icon", typeof(UISprite))
	self.label = self.go:ComponentByName("label", typeof(UILabel))
	self.effect_behind = self.go:ComponentByName("effect_behind", typeof(UITexture))
	self.effect_up = self.go:ComponentByName("effect_up", typeof(UITexture))
	self.newMark = self.go:NodeByName("new_mark").gameObject

	if xyd.isH5() then
		if params and params.iconName then
			local index = xyd.Sprites2Atlas.table_map[params.iconName .. "_h5"]

			if not index then
				-- block empty
			else
				params.iconName = params.iconName .. "_h5"
			end
		end

		self.redpoint:SetLocalPosition(33, 39, 0)
		self.newMark:SetLocalPosition(33, 39, 0)

		if params then
			params.effectColor = Color.New2(2387223039)
		end

		if params then
			params.color = Color.New2(4227377407)
		end

		if self.behind_effect == nil then
			self.behind_effect = xyd.Spine.new(self.effect_behind.gameObject)

			self.behind_effect:setInfo("fx_act_behind", function()
				self.behind_effect:setRenderPanel(MaskActEffectPanel)
				self.behind_effect:play("texiao01", 0)
				self.behind_effect:SetLocalScale(0.9, 0.9, 0.9)
			end)
		end

		if self.up_effect == nil then
			self.up_effect = xyd.Spine.new(self.effect_up.gameObject)

			self.up_effect:setInfo("fx_act_icon_2", function()
				self.up_effect:setRenderPanel(MaskActEffectPanel)
				self.up_effect:play("texiao01", 0)
			end)
		end
	end

	if params and params.iconName then
		xyd.setUISpriteAsync(self.icon, nil, params.iconName, function()
			self.icon:MakePixelPerfect()
		end, true)
	end

	if params and params.btnClickFun then
		UIEventListener.Get(self.icon.gameObject).onClick = function()
			MainMap:stopSound()
			print("11111111111")
			xyd.SoundManager:get():playSound(xyd.SoundID.BUTTON)
			params.btnClickFun()
		end
	end

	if params and params.btnName then
		self.label.text = params.btnName
	end

	if params.effectColor then
		self.label.effectColor = params.effectColor
	end

	if params.color then
		self.label.color = params.color
	end

	if params.width then
		self.label.width = params.width
	end

	if params.btnType then
		self.btnType = params.btnType
	end
end

function MainGeneralLeftTopBtn:getRedPoint()
	return self.redpoint
end

function MainGeneralLeftTopBtn:getGo()
	return self.go.gameObject
end

function MainGeneralLeftTopBtn:SetActive(visible)
	return self.go:SetActive(visible)
end

function MainGeneralLeftTopBtn:updateRedMark()
	return
end

function MainGeneralLeftTopBtn:getCountDown()
	return self.countDown_
end

function MainGeneralLeftTopBtn:getNewMark()
	return self.newMark
end

function MainGeneralLeftTopBtn:setReserverImg()
	local tmp = NGUITools.AddChild(self.go.gameObject, self.redpoint.gameObject)

	return tmp
end

function MainGeneralLeftTopBtn:setCountDownInfo(info)
	if not info.callback then
		function info.callback()
			self:setLabelName()
		end
	end

	if not self.countDown_ then
		self.countDown_ = CountDown.new(self.label, info)
	else
		self.countDown_:setInfo(info)
	end
end

function MainGeneralLeftTopBtn:setLabelName(name)
	if name then
		self.label.text = name
	elseif self.params and self.params.btnName then
		self.label.text = self.params.btnName
	end
end

function MainGeneralLeftTopBtn:updateSpineClipArea()
	if not self.lastMoveEffectNum then
		self.lastMoveEffectNum = 0.01
	end

	self.lastMoveEffectNum = -1 * self.lastMoveEffectNum

	if self.up_effect and self.up_effect:getGameObject() then
		self.up_effect:getGameObject():X(self.up_effect:getGameObject().transform.localPosition.x + self.lastMoveEffectNum)
	end

	if self.behind_effect and self.behind_effect:getGameObject() then
		self.behind_effect:getGameObject():X(self.behind_effect:getGameObject().transform.localPosition.x + self.lastMoveEffectNum)
	end
end

function MainGeneralLeftTopBtn:getBtnType()
	return self.btnType
end

function MainWindowLeftUpCon:ctor(goItem, data, parent)
	MainWindowLeftUpCon.super.ctor(self, goItem)

	self.data = data
	self.parent = parent
end

function MainWindowLeftUpCon:initUI()
	self:getUIComponent()
	MainWindowLeftUpCon.super.initUI(self)
	self:register()

	self.extraActBtnArr = {}
	self.isInitShowMaskActAll = true

	xyd.addGlobalTimer(function()
		self:updateMaskActArrowRedPoint()
	end, 60, 999)
	self:maskActArrowMove()
end

function MainWindowLeftUpCon:getUIComponent()
	self.transTopL = self.go.gameObject
	self.general_button = self.transTopL:NodeByName("general_button").gameObject
	self.staticActPanel = self.transTopL:NodeByName("staticActPanel").gameObject
	self.maskActPanel = self.transTopL:NodeByName("maskActPanel").gameObject
	self.maskActPanelUIPanel = self.transTopL:ComponentByName("maskActPanel", typeof(UIPanel))
	self.maskActArrowCon = self.transTopL:NodeByName("maskActArrowCon").gameObject
	self.maskActArrow = self.maskActArrowCon:NodeByName("maskActArrow").gameObject
	self.maskActArrowRedPoint = self.maskActArrow:NodeByName("maskActArrowRedPoint").gameObject
	MaskActEffectPanel = self.maskActPanelUIPanel
end

function MainWindowLeftUpCon:register()
	self:registerEvent(xyd.event.GET_ROOKIE_MISSION_LIST, handler(self, self.updateNewbieCamp))
	self:registerEvent(xyd.event.GET_ROOKIE_MISSION_AWARD, handler(self, self.updateNewbieCamp))
	self:registerEvent(xyd.event.LEV_CHANGE, handler(self, self.updateQuestionnaireRedPoint))
	self:registerEvent(xyd.event.ANSWER_QUESTIONNAIRE, handler(self, self.updateQuestionnaire))

	UIEventListener.Get(self.maskActArrowCon.gameObject).onClick = handler(self, self.onTouchMaskActArrow)
end

function MainWindowLeftUpCon:onTouchMaskActArrow()
	if self.isMaskActTween then
		return
	end

	if self.maskPanelTween then
		self.maskPanelTween:Kill(false)

		self.maskPanelTween = nil
	end

	local nowX = self.maskActPanelUIPanel:GetViewSize().x - self.extraActMinWidth / 2

	self.maskPanelTween = self:getSequence()
	self.isExtraActArrowShowMax = not self.isExtraActArrowShowMax
	self.isMaskActTween = true

	if self.isExtraActArrowShowMax then
		self.isTweenToUpdateRedPoint = true
		self.isInitShowMaskActAll = true

		local function setter(value)
			local widthNum = nowX + (self.extraActMaxWidth - nowX) * value

			self:setMaskPanelWidth(widthNum)
		end

		self.maskPanelTween:Append(DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter), 0, 1, 0.4))
		self.maskPanelTween:OnComplete(function()
			self.isMaskActTween = false

			self:updateMaskActArrowRedPoint()
			self.maskActArrow.gameObject:SetLocalScale(-1, 1, 1)
		end)
	else
		self.isInitShowMaskActAll = false

		local function setter(value)
			local widthNum = nowX - (nowX - self.extraActMinWidth / 2) * value

			self:setMaskPanelWidth(widthNum)
		end

		self.maskPanelTween:Append(DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter), 0, 1, 0.4))
		self.maskPanelTween:OnComplete(function()
			self.isMaskActTween = false

			self:updateMaskActArrowRedPoint()
			self.maskActArrow.gameObject:SetLocalScale(1, 1, 1)
		end)
	end
end

function MainWindowLeftUpCon:maskActArrowMove()
	if self.sequence1_ then
		self.sequence1_:Kill(false)

		self.sequence1_ = nil
	end

	if self.sequence2_ then
		self.sequence2_:Kill(false)

		self.sequence2_ = nil
	end

	self.maskActArrow.gameObject:X(-5)

	function self.playAni2_()
		if not self.sequence2_ then
			self.sequence2_ = self:getSequence()

			self.sequence2_:Insert(0, self.maskActArrow.transform:DOLocalMove(Vector3(5, 0, 0), 1, false))
			self.sequence2_:Insert(1, self.maskActArrow.transform:DOLocalMove(Vector3(-5, 0, 0), 1, false))
			self.sequence2_:AppendCallback(function()
				self.playAni1_()
			end)
			self.sequence2_:SetAutoKill(false)
		else
			self.sequence2_:Restart()
		end
	end

	function self.playAni1_()
		if not self.sequence1_ then
			self.sequence1_ = self:getSequence()

			self.sequence1_:Insert(0, self.maskActArrow.transform:DOLocalMove(Vector3(5, 0, 0), 1, false))
			self.sequence1_:Insert(1, self.maskActArrow.transform:DOLocalMove(Vector3(-5, 0, 0), 1, false))
			self.sequence1_:AppendCallback(function()
				self.playAni2_()
			end)
			self.sequence1_:SetAutoKill(false)
		else
			self.sequence1_:Restart()
		end
	end

	self.playAni1_()
end

function MainWindowLeftUpCon:setMaskPanelWidth(width)
	self.maskActPanelUIPanel:SetRightAnchor(self.transTopL.gameObject, 0, width)

	local x = self.maskActPanelUIPanel:GetViewSize().x - 43

	if x > self.extraActMaxWidth - 43 then
		if self.isTweenToUpdateRedPoint then
			self.isTweenToUpdateRedPoint = false

			self.maskActArrow.gameObject:SetLocalScale(-1, 1, 1)
			self:updateMaskActArrowRedPoint()
		end

		self.maskActArrowCon:X(self.extraActMaxWidth - 43 + 20)
	else
		self.maskActArrowCon:X(x + 20)
	end

	for i in pairs(self.extraActBtnArr) do
		if self.extraActBtnArr[i]:getGo().gameObject.activeSelf then
			self.extraActBtnArr[i]:updateSpineClipArea()
		end
	end
end

function MainWindowLeftUpCon:updateMaskActArrowRedPoint()
	local showRed = false

	if not self.isMaskActTween and not self.isInitShowMaskActAll then
		local posNum = 1

		for i in pairs(self.extraActBtnArr) do
			if self.extraActBtnArr[i]:getGo().gameObject.activeSelf then
				if posNum > 4 and self.extraActBtnArr[i]:getRedPoint().gameObject.activeSelf then
					showRed = true

					break
				end

				posNum = posNum + 1
			end
		end
	end

	self.maskActArrowRedPoint.gameObject:SetActive(showRed)
end

function MainWindowLeftUpCon:getExtraActBtnArr()
	return self.extraActBtnArr
end

function MainWindowLeftUpCon:CheckExtraActBtn(btnType)
	if btnType == nil then
		btnType = xyd.MAIN_LEFT_TOP_BTN_TYPE.All
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ONLYUPDATE then
		btnType = nil
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.OLD_VERSION_BTN then
		self:initOldVersionThreeBtn()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.PUSH then
		self:updatePushGroup()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_YEAR_FUND then
		self:initActivityYearFund()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.QUESTION then
		self:initQuestionnaire()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.YEARSACT then
		self:initYearsActivity()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.NEWBEE_GACHA_POOL then
		self:initNewBeeGacha()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_NEWBEE_FUND then
		self:initNewBeeFund()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_NEWBEE_FUND3 then
		self:initNewBeeFund3()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.NEWFIRSTRECHARGE then
		self:initNewFirstRechargeActivity()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.CHRISTMASSALE then
		self:initChristmasSaleActivity()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ARTIFACT_SHOP_WARM_UP then
		self:initArtifactShopWarmUp()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SPROUTS then
		self:initActivitySprouts()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SMASH_EGG then
		self:initActivitySmashEgg()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.REDEEM_CODE then
		self:initActivityRedeemCode()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_FAIR_ARENA then
		self:initFairArena()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_TIME_SERIES then
		self:initActivityTimeSeries()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SPACE_EXPLORE then
		self:initActivitySpaceExplore()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_RESIDENT_RETURN then
		self:initActivityResidentReturn()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ENTRANCE_TEST then
		self:initEntranceTest()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_WINE then
		self:initActivityWine()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_POPULARITY_VOTE then
		self:initActivityPopularity()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_POPULARITY_VOTE_SURVEY then
		self:initActivityPopularitySurvey()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_BEACH_SUMMER then
		self:initBeachIslandEntrance()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_ANGLE_TEA_PARTY then
		self:initActivityAngleTeaParty()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SPORTS then
		self:initActivitySports()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_HALLOWEEN then
		self:initActivityHalloween()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SECRET_TREASURE_HUNT then
		self:initActivitySecretTreasureHunt()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_GROWTH_PLAN then
		self:initActivityGrowthPlan()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ARCTIC_EXPEDITION then
		self:initArcticExpedition()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SANTA_VISIT then
		self:initActivitySantaVisit()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ICE_SECRET then
		self:initActivityIceSecret()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_FIREWORK then
		self:initActivityFireWork()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_LAFULI then
		self:initActivityLafuli()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_CLOCK then
		self:initActivityClock()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_RECHARGE_LOTTERY then
		self:initRechangeLottery()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_LIMIT_CULTIVATE then
		self:initLimitCultivate()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SIMULATION_GACHA then
		self:initSimulationGacha()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_EASTER2022 then
		self:initActivityEaster2022()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.NEW_PARTNER_WARMUP then
		self:initNewPartnerWarmup()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.NEW_PARTNER_WARMUP_ACTIVITIES then
		self:initNewPartnerWarmupActivities()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_CHILDREN_TASK then
		self:initChildrenTask()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SPFARM then
		self:initActivitySpfarm()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_4BIRTHDAY_PARTY then
		self:initActivity4BirthdayParty()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SAND then
		self:initActivitySand()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_GOLDFISH then
		self:initGoldfish()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_DRAGONBOAT2022 then
		self:initDragonboat2022()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_REPAIR_CONSOLE then
		self:initRepairConsole()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.GUILD_NEW_WAR then
		self:initGuildNewWar()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_2LOVE then
		self:init2Love()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_HW2022 then
		self:initHw2022()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_BLIND_BOX then
		self:initBlindBox()
	end

	if btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.All or btnType == xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_NEW_GROWTH_PLAN then
		self:initActivityNewGrowthPlan()
	end

	self.extraActMinWidth = 126

	local posCount_Y = -126

	if xyd.isH5() then
		posCount_Y = -117
	end

	local posNum = 1

	for i in pairs(self.extraActBtnArr) do
		if self.extraActBtnArr[i]:getGo().gameObject.activeSelf == true then
			local btnType = self.extraActBtnArr[i]:getBtnType()

			if posNum <= 4 then
				if self.extraActBtnArr[i]:getGo().transform.parent ~= self.staticActPanel.gameObject.transform then
					self.extraActBtnArr[i]:getGo().transform:SetParent(self.staticActPanel.gameObject.transform)
				end
			elseif posNum >= 5 and self.extraActBtnArr[i]:getGo().transform.parent ~= self.maskActPanel.gameObject.transform then
				self.extraActBtnArr[i]:getGo().transform:SetParent(self.maskActPanel.gameObject.transform)
			end

			local x = 0 + math.floor((posNum - 1) / 4) * self.extraActMinWidth
			local y = (posNum - 1) % 4 * posCount_Y

			self.extraActBtnArr[i]:getGo():SetLocalPosition(x, y, 0)

			posNum = posNum + 1
		end
	end

	if posNum > 5 then
		self.maskActArrowCon.gameObject:SetActive(true)
	else
		self.maskActArrowCon.gameObject:SetActive(false)
	end

	self.extraActMaxWidth = math.ceil((posNum - 1) / 4) * self.extraActMinWidth - self.extraActMinWidth / 2 + 43

	if self.isInitShowMaskActAll then
		self.isExtraActArrowShowMax = true

		self:setMaskPanelWidth(self.extraActMaxWidth)
	end

	if self.isFirstInitTempPos then
		self.largeTempPos = self.largeBtnConScroller.transform.localPosition.x
		self.isFirstInitTempPos = false
	end
end

function MainWindowLeftUpCon:updateNewbieCamp()
	local list = xyd.models.activity:getActivityListByType(xyd.EventType.NEWBIE)
	local isShow = true

	if #list == 0 then
		isShow = false
	end

	self.newbieBtn_:SetActive(isShow)
	self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ONLYUPDATE)
end

function MainWindowLeftUpCon:initOldVersionThreeBtn()
	if self.coolBtn_ == nil then
		local tmp = NGUITools.AddChild(self.staticActPanel.gameObject, self.general_button.gameObject)

		self.coolBtn_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "act_bg_img_v3",
			btnClickFun = function()
				xyd.models.activity:removeLimitGiftParams()
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.EventType.COOL
				})
			end,
			btnName = __("ACTIVITY_WINDOW"),
			effectColor = Color.New2(2522332159),
			color = Color.New2(4294967295)
		})

		table.insert(self.extraActBtnArr, self.coolBtn_)
		xyd.models.redMark:setMarkImg(xyd.RedMarkType.COOL_EVENT, self.coolBtn_:getRedPoint())
		xyd.models.redMark:setMarkImg(xyd.RedMarkType.MAIN_WINDOW_ACTIVITY_NEW, self.coolBtn_:getNewMark())

		if xyd.models.redMark:getRedState(xyd.RedMarkType.LIMIT_DISCOUNT_MONTHLY_GIFTBAG) or xyd.models.redMark:getRedState(xyd.RedMarkType.LIMIT_DISCOUNT_WEEKLY_GIFTBAG) or xyd.models.redMark:getRedState(xyd.RedMarkType.LIMIT_DISCOUNT_MONTH_CARD) or xyd.models.redMark:getRedState(xyd.RedMarkType.LIMIT_DISCOUNT_PRIVILEGE_CARD) or xyd.models.redMark:getRedState(xyd.RedMarkType.LIMIT_DISCOUNT_DAILY_GIFGBAG) or xyd.models.redMark:getRedState(xyd.RedMarkType.LIMIT_DISCOUNT_MONTHLY_GIFTBAG02) or xyd.models.redMark:getRedState(xyd.RedMarkType.LIMIT_DISCOUNT_WEEKLY_GIFTBAG02) or xyd.models.redMark:getRedState(xyd.RedMarkType.LIMIT_DISCOUNT_DAILY_GIFGBAG02) then
			self.discountIcon = self.coolBtn_:setReserverImg():GetComponent(typeof(UISprite))
			self.discountLabel = self.discountIcon:ComponentByName("label", typeof(UILabel))

			xyd.setUISpriteAsync(self.discountIcon, nil, "push_activity_end_icon", nil, nil, true)
			self.discountIcon:SetLocalPosition(56, 43, 0)

			self.discountIcon.gameObject:GetComponent(typeof(UIWidget)).depth = 15
			self.discountLabel.text = __("SALE_MAIN_TITLE")

			self.discountLabel:SetActive(true)
		end

		self.newMarkEffect = xyd.Spine.new(self.coolBtn_:getNewMark():NodeByName("model").gameObject)

		self.newMarkEffect:setInfo("fx_ui_txsaoguang", function()
			self.newMarkEffect:SetLocalPosition(0, 5, 0)
			self.newMarkEffect:SetLocalScale(0.6, 0.2, 1)
			self.newMarkEffect:play("texiao01", 0, 1)
		end)
		xyd.models.activity:updateMainWindowNew()
	end

	if self.limitBtn_ == nil then
		local tmp = NGUITools.AddChild(self.staticActPanel.gameObject, self.general_button.gameObject)

		self.limitBtn_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "act_bg_img_2_v3",
			btnClickFun = function()
				local type = 2

				if type == 2 then
					xyd.models.activity:removeLimitGiftParams()
					xyd.openActivityWindow({
						activity_type = xyd.EventType.LIMIT
					})
				else
					xyd.WindowManager.get():openWindow("bind_account_entry_window")
				end
			end,
			btnName = __("LIMIT_ACTIVITY"),
			effectColor = Color.New2(3649971455),
			color = Color.New2(4294967295)
		})

		table.insert(self.extraActBtnArr, self.limitBtn_)
		xyd.models.redMark:setMarkImg(xyd.RedMarkType.LIMIT_EVENT, self.limitBtn_:getRedPoint())
	end

	if self.newbieBtn_ == nil then
		local tmp = NGUITools.AddChild(self.staticActPanel.gameObject, self.general_button.gameObject)

		self.newbieBtn_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "newbie_guide_icon",
			btnClickFun = function()
				MainMap:stopSound()
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.EventType.NEWBIE
				})
			end,
			btnName = __("BEGINNER_QUEST_TITLE"),
			effectColor = Color.New2(1234449919),
			color = Color.New2(4294967295)
		})

		table.insert(self.extraActBtnArr, self.newbieBtn_)
		xyd.models.redMark:setMarkImg(xyd.RedMarkType.NEWBIE_GUIDE, self.newbieBtn_:getRedPoint())
		self:updateNewbieCamp()
	end
end

function MainWindowLeftUpCon:updatePushGroup()
	local time = xyd.models.activity:getLeastPushTime()
	local pushVisible = false

	__TRACE("----------------------------================")
	print(time)

	if time > 0 then
		if self.pushGiftBagBtn_ == nil then
			local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

			self.pushGiftBagBtn_ = MainGeneralLeftTopBtn.new(tmp, {
				iconName = "act_bg_img_4_v3",
				btnClickFun = function()
					xyd.models.activity:removeLimitGiftParams()
					xyd.WindowManager.get():openWindow("activity_window", {
						activity_type = xyd.EventType.PUSH
					})
				end,
				effectColor = Color.New2(477613055),
				color = Color.New2(4227377407),
				btnType = BTN_TYPE.PUSH
			})

			local isSearchIndex = false

			for i in pairs(self.extraActBtnArr) do
				if self.extraActBtnArr[i] == self.parent.largeBigCon then
					table.insert(self.extraActBtnArr, i, self.pushGiftBagBtn_)

					isSearchIndex = true

					break
				end
			end

			if isSearchIndex == false then
				table.insert(self.extraActBtnArr, self.pushGiftBagBtn_)
			end

			self.pushEndIcon = self.pushGiftBagBtn_:setReserverImg():GetComponent(typeof(UISprite))

			xyd.setUISpriteAsync(self.pushEndIcon, nil, "push_activity_end_icon_" .. xyd.Global.lang, function()
				self.pushEndIcon:MakePixelPerfect()
			end)
			self.pushEndIcon:SetLocalPosition(56, 43, 0)

			self.pushEndIcon.gameObject:GetComponent(typeof(UIWidget)).depth = 15
		end

		local timeInfo = {
			duration = time,
			callback = function()
				self:waitForTime(1, function()
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.PUSH)
				end)
			end,
			doOnTime = function()
				if self.pushGiftBagBtn_ and self.pushGiftBagBtn_:getCountDown().duration < 3600 and self.pushEndIcon then
					self.pushEndIcon:SetActive(true)
				end
			end
		}

		self.pushGiftBagBtn_:setCountDownInfo(timeInfo)

		if time < 3600 then
			self.pushEndIcon:SetActive(true)
		else
			self.pushEndIcon:SetActive(false)
		end

		pushVisible = true
	else
		pushVisible = false
	end

	if self.pushGiftBagBtn_ then
		self.pushGiftBagBtn_:SetActive(pushVisible)
	end
end

function MainWindowLeftUpCon:initYearsActivity()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.TIME_LIMIT_CALL)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.TIME_LIMIT_CALL)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.groupLiubeiAction_ then
			self.groupLiubeiAction_:SetActive(false)
		end

		return
	end

	if self.groupLiubeiAction_ == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.groupLiubeiAction_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_time_limit_call_mainwindow_icon_png",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.TIME_LIMIT_CALL)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ONLYUPDATE)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.TIME_LIMIT_CALL),
					onlyShowList = testParams
				})
			end,
			btnName = __("LIMIT_TIME_CALL")
		})

		table.insert(self.extraActBtnArr, self.groupLiubeiAction_)

		local timeLimitCallPoint

		if self.groupLiubeiAction_ then
			timeLimitCallPoint = self.groupLiubeiAction_:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.TIME_LIMIT_CALL,
			xyd.RedMarkType.TIME_LIMIT_BOSS,
			xyd.RedMarkType.TIME_LIMIT_AWARD,
			xyd.RedMarkType.ENCONTER_STORY
		}, timeLimitCallPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		timeLimitCallPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initBeachIslandEntrance()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ACTIVITY_BEACH_SUMMER)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_BEACH_SUMMER)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.groupBeachIsland_ then
			self.groupBeachIsland_:SetActive(false)
		end

		return
	end

	if self.groupBeachIsland_ == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.groupBeachIsland_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_beach_island_entrer_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_BEACH_SUMMER)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ONLYUPDATE)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.ACTIVITY_BEACH_SUMMER),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_BEACH_ISLAND_MAIN_WINDOW")
		})

		table.insert(self.extraActBtnArr, self.groupBeachIsland_)

		local timeLimitCallPoint

		if self.groupBeachIsland_ then
			timeLimitCallPoint = self.groupBeachIsland_:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_BEACH_SUMMER,
			xyd.RedMarkType.ACTIVITY_BEACH_PUZZLE,
			xyd.RedMarkType.ACTIVITY_BEACH_SHOP
		}, timeLimitCallPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		timeLimitCallPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initArcticExpedition()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ARCTIC_EXPEDITION)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ARCTIC_EXPEDITION)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.groupArcticExpedition_ then
			self.groupArcticExpedition_:SetActive(false)
		end

		return
	end

	if self.groupArcticExpedition_ == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.groupArcticExpedition_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "arctic_expedition_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ARCTIC_EXPEDITION)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ARCTIC_EXPEDITION)

					return
				end

				xyd.WindowManager.get():openWindow("arctic_expedition_main_window")
			end,
			btnName = __("ARCTIC_EXPEDITION_TEXT_20")
		})

		table.insert(self.extraActBtnArr, self.groupArcticExpedition_)

		local timeLimitCallPoint

		if self.groupArcticExpedition_ then
			timeLimitCallPoint = self.groupArcticExpedition_:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ARCTIC_EXPEDITION
		}, timeLimitCallPoint)
	end
end

function MainWindowLeftUpCon:initActivityAngleTeaParty()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ACTIVITY_ANGLE_TEA_PARTY)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_ANGLE_TEA_PARTY)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.angleTeaParty_ then
			self.angleTeaParty_:SetActive(false)
		end

		return
	end

	if self.angleTeaParty_ == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.angleTeaParty_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "icon_angle_tea_party_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_ANGLE_TEA_PARTY)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_ANGLE_TEA_PARTY)

					return
				end

				xyd.WindowManager.get():openWindow("activity_angle_tea_party_window")
			end,
			btnName = __("ACTIVITY_TEA_TITLE2")
		})

		table.insert(self.extraActBtnArr, self.angleTeaParty_)

		local timeLimitCallPoint

		if self.angleTeaParty_ then
			timeLimitCallPoint = self.angleTeaParty_:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_ANGLE_TEA_PARTY
		}, timeLimitCallPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		timeLimitCallPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initNewBeeGacha()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.NEWBEE_10GACHA)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.NEWBEE_10GACHA)

	if not activityData or not activityData:isOpen() then
		local activityData2 = xyd.models.activity:getActivity(xyd.ActivityID.NEWBEE_GACHA_POOL)

		if not activityData2 or activityData2:getEndTime() < xyd.getServerTime() or not activityData2:isOpen() then
			if self.groupNewBeeAction_ then
				self.groupNewBeeAction_:SetActive(false)
			end

			return
		elseif not self.groupNewBeeAction_ then
			local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

			self.groupNewBeeAction_ = MainGeneralLeftTopBtn.new(tmp, {
				iconName = "newbee_enter_icon",
				btnClickFun = function()
					local activityData = xyd.models.activity:getActivity(xyd.ActivityID.NEWBEE_GACHA_POOL)

					if not activityData then
						xyd.alertTips(__("ACTIVITY_END_YET"))
						self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.NEWBEE_GACHA_POOL)

						return
					end

					xyd.WindowManager.get():openWindow("activity_window", {
						activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.NEWBEE_GACHA_POOL),
						onlyShowList = testParams
					})
				end,
				btnName = __("LARGE_ACTIVITY_NEWBEE_TEXT")
			})

			table.insert(self.extraActBtnArr, self.groupNewBeeAction_)

			local NewbeeGachaPoolRedPoint

			if self.groupNewBeeAction_ then
				NewbeeGachaPoolRedPoint = self.groupNewBeeAction_:getRedPoint()
			end

			xyd.models.redMark:setJointMarkImg({
				xyd.RedMarkType.NEWBEE_10GACHA,
				xyd.RedMarkType.NEWBEE_GACHA_POOL
			}, NewbeeGachaPoolRedPoint)

			local showRedPoint = false

			for i, otherId in pairs(testParams) do
				local otherData = xyd.models.activity:getActivity(otherId)

				if otherData and otherData:getRedMarkState() == true then
					showRedPoint = true

					break
				end
			end

			NewbeeGachaPoolRedPoint:SetActive(showRedPoint)
		end
	elseif not self.groupNewBeeAction_ then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.groupNewBeeAction_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "newbee_enter_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.NEWBEE_10GACHA)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.NEWBEE_GACHA_POOL)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.NEWBEE_10GACHA),
					onlyShowList = testParams
				})
			end,
			btnName = __("LARGE_ACTIVITY_NEWBEE_TEXT")
		})

		table.insert(self.extraActBtnArr, self.groupNewBeeAction_)

		local NewbeeGachaPoolRedPoint

		if self.groupNewBeeAction_ then
			NewbeeGachaPoolRedPoint = self.groupNewBeeAction_:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.NEWBEE_10GACHA,
			xyd.RedMarkType.NEWBEE_GACHA_POOL
		}, NewbeeGachaPoolRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		NewbeeGachaPoolRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initNewBeeFund()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND)

	if not activityData or not activityData:isOpen() then
		if self.groupNewBeeFund_ then
			self.groupNewBeeFund_:SetActive(false)
		end

		return
	end

	if not self.groupNewBeeFund_ then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.groupNewBeeFund_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_newbee_fund_popup_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_NEWBEE_FUND)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.ACTIVITY_NEWBEE_FUND),
					select = xyd.ActivityID.ACTIVITY_NEWBEE_FUND
				})
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_NEWBEE_FUND)
		})

		table.insert(self.extraActBtnArr, self.groupNewBeeFund_)

		local redPoint

		if self.groupNewBeeFund_ then
			redPoint = self.groupNewBeeFund_:getRedPoint()
		end

		xyd.models.redMark:setMarkImg(xyd.RedMarkType.ACTIVITY_NEWBEE_FUND, redPoint)

		local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND)
		local showRedPoint = xyd.checkCondition(activityData, activityData:getRedMarkState(), false)

		redPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initNewBeeFund3()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND3)

	if not activityData or not activityData:isOpen() then
		if self.groupNewBeeFund3_ then
			self.groupNewBeeFund3_:SetActive(false)
		end

		return
	end

	if not self.groupNewBeeFund3_ then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.groupNewBeeFund3_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_newbee_fund_popup_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND3)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_NEWBEE_FUND3)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.ACTIVITY_NEWBEE_FUND3),
					select = xyd.ActivityID.ACTIVITY_NEWBEE_FUND3
				})
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_NEWBEE_FUND3)
		})

		table.insert(self.extraActBtnArr, self.groupNewBeeFund3_)

		local redPoint

		if self.groupNewBeeFund3_ then
			redPoint = self.groupNewBeeFund3_:getRedPoint()
		end

		xyd.models.redMark:setMarkImg(xyd.RedMarkType.ACTIVITY_NEWBEE_FUND3, redPoint)

		local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEWBEE_FUND3)
		local showRedPoint = xyd.checkCondition(activityData, activityData:getRedMarkState(), false)

		redPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initNewFirstRechargeActivity()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.NEW_FIRST_RECHARGE)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.NEW_FIRST_RECHARGE)

	if not activityData or not activityData:isOpen() then
		if self.newFirstRecharge then
			self.newFirstRecharge:SetActive(false)
		end

		return
	end

	if activityData and activityData:getLoginDay() <= 7 then
		local flag = activityData.detail.is_awarded[3] == 1

		if flag then
			if self.newFirstRecharge then
				self.newFirstRecharge:SetActive(false)
			end
		elseif self.newFirstRecharge then
			self.newFirstRecharge:SetActive(true)
		else
			local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

			self.newFirstRecharge = MainGeneralLeftTopBtn.new(tmp, {
				iconName = "main_new_first_recharge",
				btnClickFun = function()
					xyd.WindowManager.get():openWindow("new_first_recharge_pop_up_window")
				end,
				btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.NEW_FIRST_RECHARGE)
			})

			table.insert(self.extraActBtnArr, self.newFirstRecharge)

			local redPoint

			if self.newFirstRecharge then
				redPoint = self.newFirstRecharge:getRedPoint()
			end

			xyd.models.redMark:setMarkImg(xyd.RedMarkType.NEW_FIRST_RECHARGE, redPoint)
			redPoint:SetActive(activityData:getRedMarkState())
		end
	elseif self.newFirstRecharge then
		self.newFirstRecharge:SetActive(false)
	end
end

function MainWindowLeftUpCon:initChristmasSaleActivity()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_CHRISTMAS_SALE)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.christmasSale then
			self.christmasSale:SetActive(false)
		end

		return
	end

	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ACTIVITY_CHRISTMAS_SALE)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	if self.christmasSale then
		self.christmasSale:SetActive(true)
	else
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.christmasSale = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_christmas_main_icon",
			btnClickFun = function()
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.ACTIVITY_CHRISTMAS_SALE),
					onlyShowList = testParams
				})
			end,
			btnName = __("LARGE_ACTIVITY_CHRISTMAS_TEXT")
		})

		table.insert(self.extraActBtnArr, self.christmasSale)

		local redPoint

		if self.christmasSale then
			redPoint = self.christmasSale:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_CHRISTMAS_SALE,
			xyd.RedMarkType.ACTIVITY_CHRISTMAS_GIFTBAG,
			xyd.RedMarkType.ACTIVITY_TURING_MISSION2
		}, redPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		redPoint:SetActive(showRedPoint)

		if xyd.Global.lang == "ja_jp" then
			self.christmasSale.label.width = 140
		end
	end
end

function MainWindowLeftUpCon:initArtifactShopWarmUp()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ARTIFACT_SHOP_WARM_UP)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.artifactShopWarmUp then
			self.artifactShopWarmUp:SetActive(false)
		end

		return
	end

	if self.artifactShopWarmUp then
		self.artifactShopWarmUp:SetActive(true)

		local redPoint = self.artifactShopWarmUp:getRedPoint()
		local showRedPoint = activityData:getRedMarkState()

		redPoint:SetActive(showRedPoint)

		if activityData.detail.active_time <= 0 then
			if self.artifactShopWarmUp.timeCountDown then
				self.artifactShopWarmUp.timeCountDown:setInfo({
					duration = activityData:getEndTime() - xyd.getServerTime()
				})
			end

			if activityData:getEndTime() - xyd.getServerTime() < 86400 and self.artifactShopWarmUp.endSprite then
				self.artifactShopWarmUp.endSprite:SetActive(true)
			end
		else
			if self.artifactShopWarmUp.timeLabel then
				self.artifactShopWarmUp.timeLabel:SetActive(false)
			end

			if self.artifactShopWarmUp.endSprite then
				self.artifactShopWarmUp.endSprite:SetActive(false)
			end

			self.artifactShopWarmUp.label.text = __("ACTIVITY_MISSION_POINT_TEXT01")

			self.artifactShopWarmUp.label:Y(-37)
		end
	else
		local gameObject = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.artifactShopWarmUp = MainGeneralLeftTopBtn.new(gameObject, {
			iconName = "artifact_shop_warm_up",
			btnClickFun = function()
				xyd.WindowManager.get():openWindow("artifact_shop_warm_up_window")
			end,
			btnName = __("ACTIVITY_MISSION_POINT_TEXT01"),
			color = Color.New2(4227377407),
			effectColor = Color.New2(2387223039)
		})

		table.insert(self.extraActBtnArr, self.artifactShopWarmUp)

		local redPoint

		if self.artifactShopWarmUp then
			redPoint = self.artifactShopWarmUp:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ARTIFACT_SHOP_WARM_UP
		}, redPoint)

		local showRedPoint = activityData:getRedMarkState()

		redPoint:SetActive(showRedPoint)

		if activityData.detail.active_time == 0 then
			self.artifactShopWarmUp.label.text = __("ACTIVITY_MISSION_POINT_TEXT14")

			local timeLabelGo = NGUITools.AddChild(gameObject, self.artifactShopWarmUp.label.gameObject)
			local timeLabel = timeLabelGo:GetComponent(typeof(UILabel))

			timeLabel.fontSize = 16
			timeLabel.color = Color.New2(2986279167)
			timeLabel.effectColor = Color.New2(959734783)

			timeLabel:Y(-60)

			local timeCountDown = CountDown.new(timeLabel, {
				duration = activityData:getEndTime() - xyd.getServerTime()
			})
			local endSpriteGo = NGUITools.AddChild(gameObject, self.artifactShopWarmUp.redpoint)
			local endSprite = endSpriteGo:GetComponent(typeof(UISprite))

			xyd.setUISpriteAsync(endSprite, nil, "push_activity_end_icon_" .. xyd.Global.lang, nil, nil, true)

			endSprite.depth = 11

			endSprite:SetLocalPosition(60, 40, 0)
			endSprite:SetActive(false)

			if activityData:getEndTime() - xyd.getServerTime() < 86400 then
				endSprite:SetActive(true)
			end

			self.artifactShopWarmUp.timeLabel = timeLabel
			self.artifactShopWarmUp.timeCountDown = timeCountDown
			self.artifactShopWarmUp.endSprite = endSprite

			if xyd.Global.lang == "ja_jp" then
				self.artifactShopWarmUp.label.width = 120

				self.artifactShopWarmUp.label:Y(-28)
				self.artifactShopWarmUp.timeLabel:Y(-60)
			end
		end
	end
end

function MainWindowLeftUpCon:initActivitySprouts()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.SPROUTS)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.SPROUTS)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activitySprouts then
			self.activitySprouts:SetActive(false)
		end

		return
	end

	if not self.activitySprouts then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activitySprouts = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_sprouts_main_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.SPROUTS)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SPROUTS)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.SPROUTS),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_SPROUTS_CALL")
		})

		table.insert(self.extraActBtnArr, self.activitySprouts)

		local activitySproutsRedPoint

		if self.activitySprouts then
			activitySproutsRedPoint = self.activitySprouts:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_SPROUTS,
			xyd.RedMarkType.TIME_LIMIT_BOSS
		}, activitySproutsRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activitySproutsRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivitySmashEgg()
	local activityID = xyd.ActivityID.ACTIVITY_SMASH_EGG
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityEaster then
			self.activityEaster:SetActive(false)
		end

		return
	end

	if not self.activityEaster then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityEaster = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_drift_bottle_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SMASH_EGG)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_LIMITED_TASK)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("LARGE_ACTIVITY_EGG_TEXT")
		})

		table.insert(self.extraActBtnArr, self.activityEaster)

		local activityEasterRedPoint

		if self.activityEaster then
			activityEasterRedPoint = self.activityEaster:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_SMASH_EGG
		}, activityEasterRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityEasterRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityRedeemCode()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.REDEEM_CODE)

	if not activityData or activityData:getUpdateTime() < xyd.getServerTime() or activityData:isHide() or not activityData:isOpen() then
		if self.activityRedeemCode then
			self.activityRedeemCode:SetActive(false)
		end

		return
	end

	if not self.activityRedeemCode then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityRedeemCode = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_redeem_code_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.REDEEM_CODE)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.REDEEM_CODE)

					return
				end

				xyd.WindowManager.get():openWindow("activity_redeem_code_window")
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.REDEEM_CODE)
		})

		table.insert(self.extraActBtnArr, self.activityRedeemCode)

		local timeLabelGo = NGUITools.AddChild(tmp, self.activityRedeemCode.label.gameObject)
		local timeLabel = timeLabelGo:GetComponent(typeof(UILabel))

		timeLabel.fontSize = 16
		timeLabel.color = Color.New2(2986279167)
		timeLabel.effectColor = Color.New2(959734783)

		timeLabel:Y(-60)

		if xyd.Global.lang == "fr_fr" or xyd.Global.lang == "en_en" then
			timeLabel:Y(-70)
		end

		local timeCountDown = CountDown.new(timeLabel, {
			duration = activityData:getUpdateTime() - xyd.getServerTime()
		})

		self.activityRedeemCode.timeLabel = timeLabel
		self.activityRedeemCode.timeCountDown = timeCountDown

		local redPoint

		if self.activityRedeemCode then
			redPoint = self.activityRedeemCode:getRedPoint()

			xyd.models.redMark:setMarkImg(xyd.RedMarkType.ACTIVITY_REDEEM_CODE, redPoint)
			xyd.models.redMark:setMark(xyd.RedMarkType.ACTIVITY_REDEEM_CODE, false)
		end
	end
end

function MainWindowLeftUpCon:initFairArena()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_FAIR_ARENA)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityFairArena then
			self.activityFairArena:SetActive(false)
		end

		return
	end

	if not self.activityFairArena then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityFairArena = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_fair_arena_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_FAIR_ARENA)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_FAIR_ARENA)

					return
				end

				if not activityData.detail.explore_type or activityData.detail.explore_type == 0 then
					xyd.WindowManager.get():openWindow("fair_arena_entry_window", {
						needReqData = true
					})
				else
					xyd.WindowManager.get():openWindow("fair_arena_explore_window", {
						needReqData = true
					})
				end
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_FAIR_ARENA)
		})

		table.insert(self.extraActBtnArr, self.activityFairArena)

		local activityFairArenaRedPoint

		if self.activityFairArena then
			activityFairArenaRedPoint = self.activityFairArena:getRedPoint()
		end

		xyd.models.redMark:setMarkImg(xyd.RedMarkType.FAIR_ARENA, activityFairArenaRedPoint)
		activityFairArenaRedPoint:SetActive(activityData:getRedMarkState())
		xyd.models.fairArena:updateTimeHoe()
	end
end

function MainWindowLeftUpCon:initActivityTimeSeries()
	local activityID = xyd.ActivityID.ACTIVITY_TIME_GAMBLE
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityTimeSeries then
			self.activityTimeSeries:SetActive(false)
		end

		return
	end

	if not self.activityTimeSeries then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityTimeSeries = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_time_gamble",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_TIME_SERIES)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = xyd.tables.activityTextTable:getTitle(206)
		})

		table.insert(self.extraActBtnArr, self.activityTimeSeries)

		local activityTimeSeriesRedPoint

		if self.activityTimeSeries then
			activityTimeSeriesRedPoint = self.activityTimeSeries:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_TIME_GAMBLE,
			xyd.RedMarkType.ACTIVITY_TIME_MISSION,
			xyd.RedMarkType.ACTIVITY_TIME_PARTNER
		}, activityTimeSeriesRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityTimeSeriesRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivitySpaceExplore()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activitySpaceExploreBtn then
			self.activitySpaceExploreBtn:SetActive(false)
		end

		return
	end

	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	if not self.activitySpaceExploreBtn then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activitySpaceExploreBtn = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_space_explore_enter",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

				if not activityData or activityData:getEndTime() <= xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SPACE_EXPLORE)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE),
					onlyShowList = testParams
				})
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)
		})

		table.insert(self.extraActBtnArr, self.activitySpaceExploreBtn)

		local activitySpaceExploreRedPoint

		if self.activitySpaceExploreBtn then
			activitySpaceExploreRedPoint = self.activitySpaceExploreBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_SPACE_EXPLORE_SUPPLY,
			xyd.RedMarkType.ACTIVITY_SPACE_EXPLORE_MISSION,
			xyd.RedMarkType.ACTIVITY_SPACE_EXPLORE_TEAM
		}, activitySpaceExploreRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activitySpaceExploreRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initEntranceTest()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ENTRANCE_TEST)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.entranceTestBtn then
			self.entranceTestBtn:SetActive(false)
		end

		return
	end

	if not self.entranceTestBtn then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.entranceTestBtn = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_entrance_test_icon_rk",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ENTRANCE_TEST)

				if not activityData or activityData:getEndTime() <= xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ENTRANCE_TEST)

					return
				end

				xyd.WindowManager.get():openWindow("activity_entrance_test_window")
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ENTRANCE_TEST)
		})

		table.insert(self.extraActBtnArr, self.entranceTestBtn)

		local entranceTestBtnRed

		if self.entranceTestBtn then
			entranceTestBtnRed = self.entranceTestBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ENTRANCE_TEST,
			xyd.RedMarkType.ENTRANCE_TEST_TASK
		}, entranceTestBtnRed)
		entranceTestBtnRed:SetActive(activityData:getRedMarkState())
	end
end

function MainWindowLeftUpCon:initActivityResidentReturn()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_RESIDENT_RETURN)

	if not activityData or not xyd.models.activity:isResidentReturnTimeIn() or not activityData:isOpen() then
		if self.activityResidentReturnBtn then
			self.activityResidentReturnBtn:SetActive(false)
		end

		return
	end

	if not self.activityResidentReturnBtn then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityResidentReturnBtn = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "icon_resident_return_h5",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_RESIDENT_RETURN)

				if not activityData or not xyd.models.activity:isResidentReturnTimeIn() then
					xyd.alertTips(__("ACTIVITY_END_YET"))

					if activityData then
						activityData:setRedMarkState()
					end

					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_RESIDENT_RETURN)

					return
				end

				xyd.WindowManager.get():openWindow("activity_resident_return_main_window")
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_RESIDENT_RETURN)
		})

		table.insert(self.extraActBtnArr, self.activityResidentReturnBtn)

		local activityResidentReturnPoint

		if self.activityResidentReturnBtn then
			activityResidentReturnPoint = self.activityResidentReturnBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_RESIDENT_RETURN_RED_0,
			xyd.RedMarkType.ACTIVITY_RESIDENT_RETURN_RED_1,
			xyd.RedMarkType.ACTIVITY_RESIDENT_RETURN_RED_2,
			xyd.RedMarkType.ACTIVITY_RESIDENT_RETURN_RED_3,
			xyd.RedMarkType.ACTIVITY_RESIDENT_RETURN_RED_4,
			xyd.RedMarkType.ACTIVITY_RESIDENT_RETURN_RED_5
		}, activityResidentReturnPoint)

		if activityData then
			activityData:setRedMarkState()
		end
	end
end

function MainWindowLeftUpCon:initActivityWine()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_WINE)

	if not activityData or activityData:getEndTime() <= xyd.getServerTime() or not activityData:isOpen() then
		if self.activityWineBtn then
			self.activityWineBtn:SetActive(false)
		end

		return
	end

	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ACTIVITY_WINE)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	if not self.activityWineBtn then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityWineBtn = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_wine_main",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_WINE)

				if not activityData or activityData:getEndTime() <= xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_WINE)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.ACTIVITY_WINE),
					onlyShowList = testParams
				})
			end,
			btnName = __("ANNIVERSARY_ENTRY_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activityWineBtn)

		local activityWinePoint

		if self.activityWineBtn then
			activityWinePoint = self.activityWineBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_WINE,
			xyd.RedMarkType.ACTIVITY_TREASURE,
			xyd.RedMarkType.BLACK_CARD,
			xyd.RedMarkType.ACTIVITY_3BIRTHDAY_VIP,
			xyd.RedMarkType.ANNIVERSARY_GIFTBAG3_1,
			xyd.RedMarkType.ANNIVERSARY_GIFTBAG3_2,
			xyd.RedMarkType.TURING_MISSION
		}, activityWinePoint)

		if testParams then
			for i in pairs(testParams) do
				local data = xyd.models.activity:getActivity(testParams[i])

				if data and data:getRedMarkState() then
					activityWinePoint:SetActive(true)

					return
				end
			end

			activityWinePoint:SetActive(false)
		end
	end
end

function MainWindowLeftUpCon:initActivityPopularity()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_POPULARITY_VOTE)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityPopularityVoteBtn then
			self.activityPopularityVoteBtn:SetActive(false)
		end

		return
	end

	if not self.activityPopularityVoteBtn then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityPopularityVoteBtn = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_popularity_vote_entrance",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_POPULARITY_VOTE)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_POPULARITY_VOTE)

					return
				end

				xyd.WindowManager.get():openWindow("activity_popularity_vote_window")
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_POPULARITY_VOTE)
		})

		table.insert(self.extraActBtnArr, self.activityPopularityVoteBtn)

		local activityPopularityVotePoint

		if self.activityPopularityVoteBtn then
			activityPopularityVotePoint = self.activityPopularityVoteBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_POPULARITY_VOTE_AWARD
		}, activityPopularityVotePoint)
		activityData:getRedMarkState()
	end
end

function MainWindowLeftUpCon:initActivityPopularitySurvey()
	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_POPULARITY_VOTE_SURVEY)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityPopularityVoteSurveyBtn then
			self.activityPopularityVoteSurveyBtn:SetActive(false)
		end

		return
	end

	if not self.activityPopularityVoteSurveyBtn then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityPopularityVoteSurveyBtn = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_popularity_vote_survey_icon",
			btnClickFun = function()
				xyd.WindowManager.get():openWindow("activity_popularity_vote_survey_entrance_window")
			end,
			btnName = __("ACTIVITY_POPULARITY_VOTE_SURVEYTEXT10")
		})

		table.insert(self.extraActBtnArr, self.activityPopularityVoteSurveyBtn)

		local activityPopularityVoteSurveyPoint

		if self.activityPopularityVoteSurveyBtn then
			activityPopularityVoteSurveyPoint = self.activityPopularityVoteSurveyBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_POPULARITY_VOTE_SURVEY
		}, activityPopularityVoteSurveyPoint)
		activityData:getRedMarkState()
	end
end

function MainWindowLeftUpCon:updateQuestionnaireRedPoint()
	local infos = xyd.models.selfPlayer:getQuestionnaireInfo()

	if not infos then
		return
	end

	local cur_questionnaire_type = xyd.tables.miscTable:getNumber("new_questionnaire_type", "value")
	local data

	for i = 1, #infos do
		if infos[i].questionnaire_type == cur_questionnaire_type then
			data = infos[i]

			break
		end
	end

	if not data then
		return
	end

	local limit_lev = xyd.tables.miscTable:getNumber("new_questionnaire_level_limit", "value")
	local cur_lev = xyd.models.backpack:getLev()
	local st_time = xyd.tables.miscTable:getNumber("new_questionnaire_begin_time", "value")
	local ed_time = xyd.tables.miscTable:getNumber("new_questionnaire_end_time", "value")
	local cur_time = xyd.getServerTime()

	xyd.models.redMark:setMark(xyd.RedMarkType.QUESTIONNAIRE, limit_lev <= cur_lev and not data.is_finished and st_time <= cur_time and cur_time <= ed_time)
end

function MainWindowLeftUpCon:initQuestionnaire()
	local SelfPlayer = xyd.models.selfPlayer
	local onlineInfo = SelfPlayer:getOnlineInfo()

	if onlineInfo and onlineInfo.id > 0 then
		return
	end

	local first = false
	local cur_questionnaire_type = 1

	cur_questionnaire_type = self:getQuestionnaireNeedShowType()

	if self.groupQuestionnaire_ == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		tmp.name = "question_btn"
		self.groupQuestionnaire_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "icon_questionnaire",
			btnClickFun = function()
				local list
				local infosL = xyd.models.selfPlayer:getQuestionnaireInfo()

				if infosL then
					for i = 1, #infosL do
						if infosL[i].questionnaire_type == cur_questionnaire_type and infosL[i].is_finished ~= nil and infosL[i].is_finished == 1 then
							self.groupQuestionnaire_:SetActive(false)

							return
						end
					end
				end

				for i = 1, #infosL do
					if infosL[i].questionnaire_type == cur_questionnaire_type then
						list = infosL[i]

						break
					end
				end

				if not list then
					return
				end

				print("cur_questionnaire_type:", cur_questionnaire_type)

				local id = list.current_id
				local is_first = xyd.tables.questionnaireTable:isFirst(id)

				if is_first and is_first > 0 then
					xyd.WindowManager.get():openWindow("questionnaire_start_window", {
						id = id
					})
				else
					xyd.WindowManager.get():openWindow("questionnaire_window", list)
				end
			end,
			btnName = __("QUESTIONNAIRE")
		})

		table.insert(self.extraActBtnArr, self.groupQuestionnaire_)

		first = true
	end

	if not SelfPlayer:getQuestionnaireInfo() then
		self.groupQuestionnaire_:SetActive(false)
	else
		self.groupQuestionnaire_:SetActive(true)
	end

	local infos = xyd.models.selfPlayer:getQuestionnaireInfo()

	if infos then
		for i = 1, #infos do
			if infos[i].questionnaire_type == cur_questionnaire_type and infos[i].is_finished ~= nil and infos[i].is_finished == 1 then
				self.groupQuestionnaire_:SetActive(false)

				break
			end
		end

		local newbeeQuestionnaireArr = xyd.tables.miscTable:split2num("newbee_questionnaire_new_type", "value", "|")

		if newbeeQuestionnaireArr and #newbeeQuestionnaireArr > 0 then
			for i in pairs(newbeeQuestionnaireArr) do
				for k = 1, #infos do
					if infos[k].questionnaire_type == newbeeQuestionnaireArr[i] and infos[k].is_finished ~= nil and infos[k].is_finished == 1 then
						self.groupQuestionnaire_:SetActive(false)

						break
					end
				end
			end
		end
	end
end

function MainWindowLeftUpCon:getQuestionnaireNeedShowType()
	local cur_questionnaire_type = 1
	local newbeeQuestionnaireArr = xyd.tables.miscTable:split2num("newbee_questionnaire_new_type", "value", "|")

	if newbeeQuestionnaireArr and #newbeeQuestionnaireArr > 0 then
		for i = #newbeeQuestionnaireArr, 1, -1 do
			local isSearch = false

			if xyd.tables.questionnaireTable:getIsHaveQuestionnaireWithType(newbeeQuestionnaireArr[i]) then
				local infos = xyd.models.selfPlayer:getQuestionnaireInfo()

				if infos then
					for j = 1, #infos do
						if infos[j].questionnaire_type == newbeeQuestionnaireArr[i] then
							cur_questionnaire_type = newbeeQuestionnaireArr[i]
							isSearch = true

							break
						end
					end
				end
			end

			if isSearch then
				break
			end
		end
	end

	return cur_questionnaire_type
end

function MainWindowLeftUpCon:updateQuestionnaire(event)
	local data = event.data
	local type = data.questionnaire_type

	if type ~= self:getQuestionnaireNeedShowType() then
		return
	end

	if data.is_finished and data.is_finished == 1 and self.groupQuestionnaire_ then
		self.groupQuestionnaire_:SetActive(false)
		self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.QUESTION)
	end
end

function MainWindowLeftUpCon:initActivitySports()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.SPORTS)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.SPORTS)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.mainActivitySportsBtn then
			self.mainActivitySportsBtn:SetActive(false)
		end

		return
	end

	if self.mainActivitySportsBtn == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.mainActivitySportsBtn = MainGeneralLeftTopBtn.new(tmp, {
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.SPORTS)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.SPORTS)

					return
				end

				xyd.WindowManager.get():openWindow("activity_sports_window")
			end,
			iconName = xyd.tables.activityTable:getIcon(xyd.ActivityID.SPORTS),
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.SPORTS)
		})

		table.insert(self.extraActBtnArr, self.mainActivitySportsBtn)

		local mainActivitySportsBtnPoint

		if self.mainActivitySportsBtn then
			mainActivitySportsBtnPoint = self.mainActivitySportsBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.SPORTS
		}, mainActivitySportsBtnPoint)

		local showRedPoint = xyd.models.activity:getActivity(xyd.ActivityID.SPORTS):getRedMarkState()

		mainActivitySportsBtnPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityHalloween()
	local activityID = xyd.ActivityID.ACTIVITY_HALLOWEEN
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityHalloween then
			self.activityHalloween:SetActive(false)
		end

		return
	end

	if not self.activityHalloween then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityHalloween = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_halloween_main_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_HALLOWEEN)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_HALLOWEEN)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_TRICKORTREAT_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activityHalloween)

		local activityHalloweenRedPoint

		if self.activityHalloween then
			activityHalloweenRedPoint = self.activityHalloween:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_HALLOWEEN,
			xyd.RedMarkType.ACTIVITY_HALLOWEEN_GIFTBAG,
			xyd.RedMarkType.ACTIVITY_HALLOWEEN_MISSION
		}, activityHalloweenRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityHalloweenRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivitySecretTreasureHunt()
	local activityID = xyd.ActivityID.ACTIVITY_SECRET_TREASURE_HUNT
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activitySecretTreasureHunt then
			self.activitySecretTreasureHunt:SetActive(false)
		end

		return
	end

	if not self.activitySecretTreasureHunt then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activitySecretTreasureHunt = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_secrettreasure",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SECRET_TREASURE_HUNT)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_SECRET_TREASURE_HUNT)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_SECTRETTREASURE_TEXT21")
		})

		table.insert(self.extraActBtnArr, self.activitySecretTreasureHunt)

		local activitySecretTreasureHuntRedPoint

		if self.activitySecretTreasureHunt then
			activitySecretTreasureHuntRedPoint = self.activitySecretTreasureHunt:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_SECRET_TREASURE_HUNT,
			xyd.RedMarkType.ACTIVITY_SECRET_TREASURE_HUNT_GIFTBAG,
			xyd.RedMarkType.ACTIVITY_SECRET_TREASURE_HUNT_MISSION
		}, activitySecretTreasureHuntRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activitySecretTreasureHuntRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityGrowthPlan()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ACTIVITY_GROWTH_PLAN)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_GROWTH_PLAN)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.growth_plan_ then
			self.growth_plan_:SetActive(false)
		end

		return
	end

	if self.growth_plan_ == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.growth_plan_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_growth_plan_icon_rk",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_GROWTH_PLAN)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_GROWTH_PLAN)

					return
				end

				xyd.WindowManager.get():openWindow("activity_growth_plan_window")
			end,
			btnName = __("ACTIVITY_GROWTH_PLAN_TEXT16")
		})

		table.insert(self.extraActBtnArr, self.growth_plan_)

		local timeLimitCallPoint

		if self.growth_plan_ then
			timeLimitCallPoint = self.growth_plan_:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_GROWTH_PLAN
		}, timeLimitCallPoint)
		timeLimitCallPoint:SetActive(activityData:getRedMarkState())
	end
end

function MainWindowLeftUpCon:initActivitySantaVisit()
	local activityID = xyd.ActivityID.ACTIVITY_SANTA_VISIT
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activitySantaVisit then
			self.activitySantaVisit:SetActive(false)
		end

		return
	end

	if not self.activitySantaVisit then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activitySantaVisit = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_christmas_exchange_main_icon_rk",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SANTA_VISIT)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_SANTA_VISIT)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_SOCKS_OUT_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activitySantaVisit)

		local activitySantaVisitRedPoint

		if self.activitySantaVisit then
			activitySantaVisitRedPoint = self.activitySantaVisit:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_SANTA_VISIT,
			xyd.RedMarkType.ACTIVITY_CHRISTMAS_EXCHANGE,
			xyd.RedMarkType.ACTIVITY_TURING_MISSION3
		}, activitySantaVisitRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activitySantaVisitRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityYearFund()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ACTIVITY_YEAR_FUND)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_YEAR_FUND)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.mainActivityYearFundBtn then
			self.mainActivityYearFundBtn:SetActive(false)
		end

		return
	end

	if self.mainActivityYearFundBtn == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.mainActivityYearFundBtn = MainGeneralLeftTopBtn.new(tmp, {
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_YEAR_FUND)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_YEAR_FUND)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.ACTIVITY_YEAR_FUND),
					onlyShowList = testParams
				})
			end,
			iconName = xyd.tables.activityTable:getIcon(xyd.ActivityID.ACTIVITY_YEAR_FUND),
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_YEAR_FUND)
		})

		table.insert(self.extraActBtnArr, self.mainActivityYearFundBtn)

		local mainActivityYearFundBtnPoint

		if self.mainActivityYearFundBtn then
			mainActivityYearFundBtnPoint = self.mainActivityYearFundBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_YEAR_FUND
		}, mainActivityYearFundBtnPoint)

		local showRedPoint = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_YEAR_FUND):getRedMarkState()

		mainActivityYearFundBtnPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityIceSecret()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ICE_SECRET)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ICE_SECRET)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.mainActivityIceSecretBtn then
			self.mainActivityIceSecretBtn:SetActive(false)
		end

		return
	end

	if self.mainActivityIceSecretBtn == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.mainActivityIceSecretBtn = MainGeneralLeftTopBtn.new(tmp, {
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ICE_SECRET)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ICE_SECRET)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.ICE_SECRET),
					onlyShowList = testParams
				})
			end,
			iconName = xyd.tables.activityTable:getIcon(xyd.ActivityID.ICE_SECRET),
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ICE_SECRET)
		})

		table.insert(self.extraActBtnArr, self.mainActivityIceSecretBtn)

		local mainActivityIceSecretBtnPoint

		if self.mainActivityIceSecretBtn then
			mainActivityIceSecretBtnPoint = self.mainActivityIceSecretBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ICE_SECRET,
			xyd.RedMarkType.ACTIVITY_ICE_SECRET_GIFTBAG,
			xyd.RedMarkType.ACTIVITY_ICE_SECRET_MISSION,
			xyd.RedMarkType.ICE_SECRET_BOSS_CHALLENGE
		}, mainActivityIceSecretBtnPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		mainActivityIceSecretBtnPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityFireWork()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ACTIVITY_FIREWORK)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_FIREWORK)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.mainActivityFireWorkBtn then
			self.mainActivityFireWorkBtn:SetActive(false)
		end

		return
	end

	if self.mainActivityFireWorkBtn == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.mainActivityFireWorkBtn = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_firework_main_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_FIREWORK)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_FIREWORK)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(xyd.ActivityID.ACTIVITY_FIREWORK),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_FIREWORK")
		})

		table.insert(self.extraActBtnArr, self.mainActivityFireWorkBtn)

		local mainActivityFireWorkBtnPoint

		if self.mainActivityFireWorkBtn then
			mainActivityFireWorkBtnPoint = self.mainActivityFireWorkBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_FIREWORK,
			xyd.RedMarkType.NEWYEAR_WELFARE,
			xyd.RedMarkType.BLACK_CARD
		}, mainActivityFireWorkBtnPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		mainActivityFireWorkBtnPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivitySpringFestival()
	local activityID = xyd.ActivityID.THANKSGIVING_GIFTBAG
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activitySpringFestival then
			self.activitySpringFestival:SetActive(false)
		end

		return
	end

	if not self.activitySpringFestival then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activitySpringFestival = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_spring_festival_main_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SPRING_FESTIVAL)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.THANKSGIVING_GIFTBAG)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("NEW_YEAR_GIFTBAG_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activitySpringFestival)

		local activitySpringFestivalRedPoint

		if self.activitySpringFestival then
			activitySpringFestivalRedPoint = self.activitySpringFestival:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.THANKSGIVING_GIFTBAG
		}, activitySpringFestivalRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activitySpringFestivalRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityLafuli()
	local activityID = xyd.ActivityID.ACTIVITY_LAFULI_CASTLE
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityLafuli then
			self.activityLafuli:SetActive(false)
		end

		return
	end

	if not self.activityLafuli then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityLafuli = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_lafuli_castle_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_LAFULI)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_LAFULI_CASTLE)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_LAFULI_CASTLE),
			width = xyd.Global.lang == "ko_kr" and 80 or nil
		})

		table.insert(self.extraActBtnArr, self.activityLafuli)

		local activityLafuliRedPoint

		if self.activityLafuli then
			activityLafuliRedPoint = self.activityLafuli:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_LAFULI_CASTLE,
			xyd.RedMarkType.ACTIVITY_LAFULI_GIFTBAG
		}, activityLafuliRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityLafuliRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityClock()
	local activityID = xyd.ActivityID.ACTIVITY_CLOCK
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityClock then
			self.activityClock:SetActive(false)
		end

		return
	end

	if not self.activityClock then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityClock = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_clock_icon_rk",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_CLOCK)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_CLOCK)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_CLOCK_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activityClock)

		local activityClockRedPoint

		if self.activityClock then
			activityClockRedPoint = self.activityClock:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_CLOCK
		}, activityClockRedPoint)

		local showRedPoint = false

		if testParams then
			for i, otherId in pairs(testParams) do
				local otherData = xyd.models.activity:getActivity(otherId)

				if otherData and otherData:getRedMarkState() == true then
					showRedPoint = true

					break
				end
			end
		end

		activityClockRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initRechangeLottery()
	local activityID = xyd.ActivityID.ACTIVITY_RECHARGE_LOTTERY
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityRechargeLottery then
			self.activityRechargeLottery:SetActive(false)
		end

		return
	end

	if not self.activityRechargeLottery then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityRechargeLottery = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_recharge_lottery",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_RECHARGE_LOTTERY)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_RECHARGE_LOTTERY)
				xyd.WindowManager.get():openWindow("activity_recharge_lottery_window")
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_RECHARGE_LOTTERY)
		})

		table.insert(self.extraActBtnArr, self.activityRechargeLottery)

		local activityRechargeLotteryRedPoint

		if self.activityRechargeLottery then
			activityRechargeLotteryRedPoint = self.activityRechargeLottery:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_RECHARGE_LOTTERY
		}, activityRechargeLotteryRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityRechargeLotteryRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initLimitCultivate()
	local activityID = xyd.ActivityID.ACTIVITY_LIMIT_CULTIVATE
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData.detail.start_time > xyd.getServerTime() or not activityData:isOpen() then
		if self.activityLimitCultivate then
			self.activityLimitCultivate:SetActive(false)
		end

		return
	end

	if not self.activityLimitCultivate then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityLimitCultivate = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_5week_png",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_LIMIT_CULTIVATE)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_LIMIT_CULTIVATE)
				xyd.WindowManager.get():openWindow("activity_limit_cultivate_window")
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_LIMIT_CULTIVATE)
		})

		table.insert(self.extraActBtnArr, self.activityLimitCultivate)

		local activityLimitCultivateRedPoint

		if self.activityLimitCultivate then
			activityLimitCultivateRedPoint = self.activityLimitCultivate:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_LIMIT_CULTIVATE
		}, activityLimitCultivateRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityLimitCultivateRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initSimulationGacha()
	local activityID = xyd.ActivityID.ACTIVITY_SIMULATION_GACHA
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getUpdateTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activitySimulationGacha then
			self.activitySimulationGacha:SetActive(false)
		end

		return
	end

	if not self.activitySimulationGacha then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activitySimulationGacha = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_simulation_gacha_main_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SIMULATION_GACHA)

					return
				end

				xyd.models.activity:reqActivityByID(activityID)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_SIMULATION_GACHA_TEXT33")
		})

		table.insert(self.extraActBtnArr, self.activitySimulationGacha)

		local activitySimulationGachaRedPoint

		if self.activitySimulationGacha then
			activitySimulationGachaRedPoint = self.activitySimulationGacha:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_SIMULATION_GACHA
		}, activitySimulationGachaRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activitySimulationGachaRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityEaster2022()
	local activityID = xyd.ActivityID.ACTIVITY_EASTER2022
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityEaster2022 then
			self.activityEaster2022:SetActive(false)
		end

		return
	end

	if not self.activityEaster2022 then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityEaster2022 = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_easter2022_icon_rk",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_EASTER2022)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_EASTER2022)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_EASTER2022_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activityEaster2022)

		local activityEaster2022RedPoint

		if self.activityEaster2022 then
			activityEaster2022RedPoint = self.activityEaster2022:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_EASTER2022
		}, activityEaster2022RedPoint)

		local showRedPoint = false

		if testParams then
			for i, otherId in pairs(testParams) do
				local otherData = xyd.models.activity:getActivity(otherId)

				if otherData and otherData:getRedMarkState() == true then
					showRedPoint = true

					break
				end
			end
		end

		activityEaster2022RedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initNewPartnerWarmup()
	local activityID = xyd.ActivityID.NEW_PARTNER_WARMUP
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.newPartnerWarmup then
			self.newPartnerWarmup:SetActive(false)
		end

		return
	end

	if not self.newPartnerWarmup then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.newPartnerWarmup = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "new_partner_warmup_main_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.NEW_PARTNER_WARMUP)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.NEW_PARTNER_WARMUP)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("STAR_ALTAR_TITLE")
		})

		table.insert(self.extraActBtnArr, self.newPartnerWarmup)

		local newPartnerWarmupRedPoint

		if self.newPartnerWarmup then
			newPartnerWarmupRedPoint = self.newPartnerWarmup:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.NEW_PARTNER_WARMUP
		}, newPartnerWarmupRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		newPartnerWarmupRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initNewPartnerWarmupActivities()
	local activityID = xyd.ActivityID.ACTIVITY_STAR_ALTAR_MISSION
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.newPartnerWarmupActivities then
			self.newPartnerWarmupActivities:SetActive(false)
		end

		return
	end

	if not self.newPartnerWarmupActivities then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.newPartnerWarmupActivities = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "new_partner_warmup_main_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.NEW_PARTNER_WARMUP_ACTIVITIES)

					return
				end

				xyd.models.activity:reqActivityByID(activityID)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("STAR_ALTAR_TITLE")
		})

		table.insert(self.extraActBtnArr, self.newPartnerWarmupActivities)

		local newPartnerWarmupActivitiesRedPoint

		if self.newPartnerWarmupActivities then
			newPartnerWarmupActivitiesRedPoint = self.newPartnerWarmupActivities:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.NEW_PARTNER_WARMUP_ACTIVITIES
		}, newPartnerWarmupActivitiesRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		newPartnerWarmupActivitiesRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initChildrenTask()
	local activityID = xyd.ActivityID.ACTIVITY_CHILDREN_TASK
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.childrenTask then
			self.childrenTask:SetActive(false)
		end

		return
	end

	if not self.childrenTask then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.childrenTask = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_children_rk_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_CHILDREN_TASK)

					return
				end

				xyd.models.activity:reqActivityByID(activityID)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_CHILDREN_TITLE")
		})

		table.insert(self.extraActBtnArr, self.childrenTask)

		local childrenTaskPoint

		if self.childrenTask then
			childrenTaskPoint = self.childrenTask:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_CHILDREN_TASK
		}, childrenTaskPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		childrenTaskPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivitySpfarm()
	local activityID = xyd.ActivityID.ACTIVITY_SPFARM
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activitySpfarmBtn then
			self.activitySpfarmBtn:SetActive(false)
		end

		return
	end

	if not self.activitySpfarmBtn then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activitySpfarmBtn = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_spfarm_rk2",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SPFARM)

					return
				end

				xyd.models.activity:reqActivityByID(activityID)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_SPFARM_TEXT104")
		})

		table.insert(self.extraActBtnArr, self.activitySpfarmBtn)

		local activitySpfarmBtnRedPoint

		if self.activitySpfarmBtn then
			activitySpfarmBtnRedPoint = self.activitySpfarmBtn:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_SPFARM,
			xyd.RedMarkType.ACTIVITY_SPFARM_SUPPLY,
			xyd.RedMarkType.ACTIVITY_SPFARM_MISSION
		}, activitySpfarmBtnRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activitySpfarmBtnRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivity4BirthdayParty()
	local activityID = xyd.ActivityID.ACTIVITY_4BIRTHDAY_PARTY
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activity4BirthdayParty then
			self.activity4BirthdayParty:SetActive(false)
		end

		return
	end

	if not self.activity4BirthdayParty then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activity4BirthdayParty = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_4birthday_rk",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_4BIRTHDAY_PARTY)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_4BIRTHDAY_PARTY)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_4BIRTHDAY_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activity4BirthdayParty)

		local activity4BirthdayPartyRedPoint

		if self.activity4BirthdayParty then
			activity4BirthdayPartyRedPoint = self.activity4BirthdayParty:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_4BIRTHDAY_PARTY,
			xyd.RedMarkType.ACTIVITY_4BIRTHDAY_MISSION,
			xyd.RedMarkType.ACTIVITY_4ANNIVERSARY_SIGN,
			xyd.RedMarkType.ACTIVITY_4BIRTHDAY_MUSIC
		}, activity4BirthdayPartyRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activity4BirthdayPartyRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivitySand()
	local activityID = xyd.ActivityID.ACTIVITY_SAND_SEARCH
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activitySand then
			self.activitySand:SetActive(false)
		end

		return
	end

	if not self.activitySand then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activitySand = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_sand_main_icon",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_SAND_SEARCH)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_SAND_SEARCH)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_SAND_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activitySand)

		local activitySandRedPoint

		if self.activitySand then
			activitySandRedPoint = self.activitySand:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_SAND_SEARCH
		}, activitySandRedPoint)
		dump(activityData.detail, "======detail-====")
		activityData:getRedMarkState()

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activitySandRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initGoldfish()
	local activityID = xyd.ActivityID.ACTIVITY_GOLDFISH
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityGoldfish then
			self.activityGoldfish:SetActive(false)
		end

		return
	end

	if not self.activityGoldfish then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityGoldfish = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_goldfish_rk",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_GOLDFISH)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_GOLDFISH)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_GOLDFISH_RK")
		})

		table.insert(self.extraActBtnArr, self.activityGoldfish)

		local activityGoldfishPoint

		if self.activityGoldfish then
			activityGoldfishPoint = self.activityGoldfish:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_SAND_SEARCH
		}, activityGoldfishPoint)
		activityData:getRedMarkState()

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityGoldfishPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initDragonboat2022()
	local activityID = xyd.ActivityID.ACTIVITY_DRAGONBOAT2022
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityDragonboat2022 then
			self.activityDragonboat2022:SetActive(false)
		end

		return
	end

	if not self.activityDragonboat2022 then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityDragonboat2022 = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_midautumn2022",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_DRAGONBOAT2022)

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.ACTIVITY_DRAGONBOAT2022)
				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_DRAGONBOAT2022)
		})

		table.insert(self.extraActBtnArr, self.activityDragonboat2022)

		local activityDragonboat2022RedPoint

		if self.activityDragonboat2022 then
			activityDragonboat2022RedPoint = self.activityDragonboat2022:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_DRAGONBOAT2022,
			xyd.RedMarkType.ACTIVITY_GOLDFISH_AWARDS
		}, activityDragonboat2022RedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityDragonboat2022RedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initRepairConsole()
	local activityID = xyd.ActivityID.ACTIVITY_REPAIR_CONSOLE
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityRepairConsole then
			self.activityRepairConsole:SetActive(false)
		end

		return
	end

	if not self.activityRepairConsole then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityRepairConsole = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_repair_console_rk",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_REPAIR_CONSOLE)

					return
				end

				xyd.WindowManager.get():openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})

				if xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_REPAIR_MISSION) then
					xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_REPAIR_MISSION):setFirstTimeEnter(true)
				end
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_REPAIR_CONSOLE)
		})

		table.insert(self.extraActBtnArr, self.activityRepairConsole)

		local activityRepairConsoleRedPoint

		if self.activityRepairConsole then
			activityRepairConsoleRedPoint = self.activityRepairConsole:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_REPAIR_CONSOLE,
			xyd.RedMarkType.ACTIVITY_REPAIR_GIFTBAG
		}, activityRepairConsoleRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityRepairConsoleRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initGuildNewWar()
	local activityID = xyd.ActivityID.GUILD_NEW_WAR
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.guildNewWar then
			self.guildNewWar:SetActive(false)
		end

		return
	end

	if not self.guildNewWar then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.guildNewWar = MainGeneralLeftTopBtn.new(tmp, {
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.GUILD_NEW_WAR)

					return
				end

				xyd.db.misc:setValue({
					key = "guild_new_war_last_click_period",
					value = activityData:getCurPeriod()
				})
				activityData:getRedMarkState()

				if xyd.models.guild.guildID <= 0 then
					xyd.alertTips(__("GUILD_NEW_WAR_TIPS05"))

					return
				end

				xyd.models.activity:reqActivityByID(xyd.ActivityID.GUILD_NEW_WAR)
				activityData:reqBaseInfo(function()
					local activityData = xyd.models.activity:getActivity(xyd.ActivityID.GUILD_NEW_WAR)
					local oldIsSignIn = activityData:getBaseInfo().is_signed
					local matchID = activityData:getBaseInfo().match_id

					activityData:checkNeedAndCanSignIn(function(need, can)
						local isRestTime = false
						local curPeriod = activityData:getCurPeriod()

						if curPeriod == xyd.GuildNewWarPeroid.BEGIN_RELAX or curPeriod == xyd.GuildNewWarPeroid.END_RELAX or curPeriod == xyd.GuildNewWarPeroid.NORMAL_RELAX then
							isRestTime = true
						end

						if curPeriod == xyd.GuildNewWarPeroid.ATTACHING1 then
							xyd.alertTips(__("GUILD_NEW_WAR_TIPS01"))

							return
						elseif curPeriod == xyd.GuildNewWarPeroid.CALCULATION or curPeriod == xyd.GuildNewWarPeroid.ATTACHING2 then
							xyd.alertTips(__("GUILD_NEW_WAR_TIPS02"))

							return
						end

						local function checkResultCallback()
							activityData:reqGuildLogList(function()
								if activityData:getGuildLogList() and activityData:getGuildLogList().list and activityData:getGuildLogList().list[1] then
									local latestResult = activityData:getGuildLogList().list[1]

									if not xyd.db.misc:getValue("guild_new_war_vs_result_" .. latestResult.time) then
										xyd.WindowManager:get():openWindow("guild_new_war_season_result_window", {
											season = activityData:getCurSeason(),
											vsIndex = #activityData:getGuildLogList().list,
											isWin = latestResult.self_info.score >= latestResult.e_info.score,
											selfRank = activityData:getBaseInfo().self_info.last_rank,
											selfPoint = activityData:getBaseInfo().self_info.last_score,
											guildPoint = latestResult.self_info.score
										})
										xyd.db.misc:setValue({
											value = 1,
											key = "guild_new_war_vs_result_" .. latestResult.time
										})
									end
								end
							end)
						end

						local function rankBack(data)
							xyd.WindowManager.get():openWindow("guild_new_war_main_rank_window", {
								state = xyd.GuildNewWarMainRankType.RANK_RECORD,
								guildInfo = data
							})
							checkResultCallback()
						end

						if not need then
							if isRestTime then
								activityData:reqGuildRankList(rankBack)
							elseif not matchID or matchID <= 0 then
								activityData:reqGuildRankList(rankBack)
							else
								xyd.WindowManager.get():openWindow("guild_new_war_vs_total_window")
								checkResultCallback()
							end
						elseif not can then
							xyd.alertTips(__("GUILD_NEW_WAR_TIPS06"))
						elseif isRestTime then
							activityData:reqGuildRankList(rankBack)
						elseif curPeriod == xyd.GuildNewWarPeroid.READY1 or curPeriod == xyd.GuildNewWarPeroid.READY2 then
							activityData:reqGuildRankList(rankBack)
						else
							activityData:reqGuildRankList(rankBack)
						end
					end)
				end)
			end,
			iconName = xyd.tables.activityTable:getIcon(xyd.ActivityID.GUILD_NEW_WAR),
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.GUILD_NEW_WAR)
		})

		table.insert(self.extraActBtnArr, self.guildNewWar)

		local guildNewWarRedPoint

		if self.guildNewWar then
			guildNewWarRedPoint = self.guildNewWar:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.GUILD_NEW_WAR
		}, guildNewWarRedPoint)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		guildNewWarRedPoint:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:init2Love()
	local activityID = xyd.ActivityID.ACTIVITY_2LOVE
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	dump(activityID)

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activity2Love then
			self.activity2Love:SetActive(false)
		end

		return
	end

	if not self.activity2Love then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activity2Love = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_2love",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))

					return
				end

				xyd.WindowManager.get():openWindow("activity_2love_window")
			end,
			btnName = xyd.tables.activityTextTable:getTitle(xyd.ActivityID.ACTIVITY_2LOVE)
		})

		table.insert(self.extraActBtnArr, self.activity2Love)

		local activity2LoveRedPoint

		if self.activity2Love then
			activity2LoveRedPoint = self.activity2Love:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_2LOVE
		}, activity2LoveRedPoint)
		activity2LoveRedPoint:SetActive(activityData:getRedMarkState())
	end
end

function MainWindowLeftUpCon:initHw2022()
	local activityID = xyd.ActivityID.ACTIVITY_HW2022
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityHw2022 then
			self.activityHw2022:SetActive(false)
		end

		return
	end

	if not self.activityHw2022 then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityHw2022 = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_halloween2022",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))

					return
				end

				xyd.openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})
			end,
			btnName = __("ACTIVITY_HALLOWEEN2022_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activityHw2022)

		local activityHw2022Red

		if self.activityHw2022 then
			activityHw2022Red = self.activityHw2022:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_HW2022,
			xyd.RedMarkType.ACTIVITY_HW2022_SHOP,
			xyd.RedMarkType.ACTIVITY_HW2022_SUPPLY,
			xyd.RedMarkType.TURING_MISSION,
			xyd.RedMarkType.ACTIVITY_HALLOWEEN_GIFTBAG
		}, activityHw2022Red)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityHw2022Red:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initBlindBox()
	local activityID = xyd.ActivityID.ACTIVITY_BLIND_BOX
	local params = xyd.tables.activityTable:getWindowParams(activityID)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(activityID)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.activityBlindBox then
			self.activityBlindBox:SetActive(false)
		end

		return
	end

	if not self.activityBlindBox then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.activityBlindBox = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_blind_box_dl",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(activityID)

				if not activityData then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_BLIND_BOX)

					return
				end

				xyd.openWindow("activity_window", {
					activity_type = xyd.tables.activityTable:getType(activityID),
					onlyShowList = testParams
				})

				if xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_BLIND_BOX_MISSION) then
					xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_BLIND_BOX_MISSION):setFirstTimeEnter(true)
				end
			end,
			btnName = __("ACTIVITY_BLIND_BOX_TITLE")
		})

		table.insert(self.extraActBtnArr, self.activityBlindBox)

		local activityBlindBoxRed

		if self.activityBlindBox then
			activityBlindBoxRed = self.activityBlindBox:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_BLIND_BOX,
			xyd.RedMarkType.ACTIVITY_BLIND_BOX_BATTLE_PASS
		}, activityBlindBoxRed)

		local showRedPoint = false

		for i, otherId in pairs(testParams) do
			local otherData = xyd.models.activity:getActivity(otherId)

			if otherData and otherData:getRedMarkState() == true then
				showRedPoint = true

				break
			end
		end

		activityBlindBoxRed:SetActive(showRedPoint)
	end
end

function MainWindowLeftUpCon:initActivityNewGrowthPlan()
	local params = xyd.tables.activityTable:getWindowParams(xyd.ActivityID.ACTIVITY_NEW_GROWTH_PLAN)
	local testParams

	if params ~= nil then
		testParams = params.activity_ids
	end

	local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEW_GROWTH_PLAN)

	if not activityData or activityData:getEndTime() < xyd.getServerTime() or not activityData:isOpen() then
		if self.new_growth_plan_ then
			self.new_growth_plan_:SetActive(false)
		end

		return
	end

	if self.new_growth_plan_ == nil then
		local tmp = NGUITools.AddChild(self.maskActPanel.gameObject, self.general_button.gameObject)

		self.new_growth_plan_ = MainGeneralLeftTopBtn.new(tmp, {
			iconName = "activity_new_growth_plan_icon_rk",
			btnClickFun = function()
				local activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_NEW_GROWTH_PLAN)

				if not activityData or activityData:getEndTime() < xyd.getServerTime() then
					xyd.alertTips(__("ACTIVITY_END_YET"))
					self:CheckExtraActBtn(xyd.MAIN_LEFT_TOP_BTN_TYPE.ACTIVITY_NEW_GROWTH_PLAN)

					return
				end

				xyd.WindowManager.get():openWindow("activity_growth_plan_window", {
					ActivityID = xyd.ActivityID.ACTIVITY_NEW_GROWTH_PLAN
				})
			end,
			btnName = __("ACTIVITY_NEW_GROWTH_PLAN_TEXT16")
		})

		table.insert(self.extraActBtnArr, self.new_growth_plan_)

		local timeLimitCallPoint

		if self.new_growth_plan_ then
			timeLimitCallPoint = self.new_growth_plan_:getRedPoint()
		end

		xyd.models.redMark:setJointMarkImg({
			xyd.RedMarkType.ACTIVITY_NEW_GROWTH_PLAN
		}, timeLimitCallPoint)
		timeLimitCallPoint:SetActive(activityData:getRedMarkState())
	end
end

return MainWindowLeftUpCon
