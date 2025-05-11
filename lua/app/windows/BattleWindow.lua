-- chunkname: @../../../Product/Bundles/Android/src/app/windows/BattleWindow.lua

local BattleWindow = class("BattleWindow", import(".BaseWindow"))
local BattleTable = xyd.tables.battleTable
local GroupBuffTable = xyd.tables.groupBuffTable
local StageTable = xyd.tables.stageTable
local GroupBuffDetailTips = class("GroupBuffDetailTips", import("app.components.BaseComponent"))
local GroupBuffIcon = import("app.components.GroupBuffIcon")
local PngNum = import("app.components.PngNum")
local SkillTable = xyd.tables.skillTable
local EffectTable = xyd.tables.effectTable
local DBuffTable = xyd.tables.dBuffTable
local GroupTable = xyd.tables.groupTable
local FxTable = xyd.tables.fxTable
local PartnerTable = xyd.tables.partnerTable
local NewTrialRewardTable = xyd.tables.newTrialRewardTable
local ResourceEffectTable = xyd.tables.resourceEffectTable
local BattleEffectFactory = xyd.BattleEffectFactory.get()

function GroupBuffDetailTips:ctor(parentGo, params)
	GroupBuffDetailTips.super.ctor(self, parentGo)

	self.StageTable = StageTable
	self.GroupBuffTable = GroupBuffTable
	self.GroupBuffTextTable = xyd.tables.groupBuffTextTable
	self.DBuffTable = DBuffTable
	self.buffID_ = params.buffID
	self.group7Num = params.group7Num or 0
	self.alreadyFinishRound = 0

	self:initLayOut()
end

function GroupBuffDetailTips:getPrefabPath()
	return "Prefabs/Components/group_buff_detail_tips"
end

function GroupBuffDetailTips:initUI()
	GroupBuffDetailTips.super.initUI(self)

	local go = self.go
	local content = go:NodeByName("content").gameObject

	self.content = content:GetComponent(typeof(UIWidget))
	self.bgImg = content:ComponentByName("bgImg", typeof(UISprite))

	local top = content:NodeByName("top").gameObject

	self.labelName = top:ComponentByName("labelName", typeof(UILabel))
	self.labelLine1 = top:ComponentByName("labelLine1", typeof(UILabel))

	if xyd.Global.lang == "ja_jp" then
		self.labelLine1.fontSize = 17
	end

	self.buffIconGroup = top:NodeByName("buffIconGroup").gameObject

	local bottom = content:NodeByName("bottom").gameObject

	self.labelDes = bottom:ComponentByName("labelDes", typeof(UILabel))
	self.attrGroup = bottom:NodeByName("attrGroup").gameObject
	self.attrGroupTable = self.attrGroup:GetComponent(typeof(UITable))
	self.initHeight = self.labelDes.height
	self.baseConHeight = self.content.height
end

function GroupBuffDetailTips:initLayOut()
	local buffIcon = GroupBuffIcon.new(self.buffIconGroup)

	buffIcon:setInfo(self.buffID_, true)
	buffIcon:SetLocalScale(0.86, 0.86, 1)

	self.labelDes.text = self.GroupBuffTextTable:getDesc(self.buffID_)
	self.labelName.text = self.GroupBuffTextTable:getName(self.buffID_)
	self.labelLine1.text = __("GROUP_BUFF_DES")

	local effectShowData = xyd.split(self.GroupBuffTable:getEffectShow(self.buffID_), "|")
	local addStr = "+ "

	if self.buffID_ == xyd.GROUP_7_BUFF then
		addStr = "+"
		self.attrGroupTable.enabled = false
		effectShowData = xyd.split(self.GroupBuffTable:getEffectShow(self.buffID_), "@")
	end

	local height = self.labelDes.height - self.initHeight
	local poses = xyd.tables.groupBuffTable:getEffectStands(self.buffID_)

	for i = 1, #effectShowData do
		if effectShowData[i] then
			local effectData = xyd.split(effectShowData[i], "#")
			local effectName = effectData[1]
			local effectNum = tonumber(effectData[2])
			local pos_label = self:getPosDesc(poses[i])
			local labelAttr = self.attrGroup:ComponentByName("labelAttr" .. i, typeof(UILabel))
			local labelAttrNum = self.attrGroup:ComponentByName("labelAttrNum" .. i, typeof(UILabel))

			labelAttr.text = __("POSITION_DESC", pos_label, xyd.tables.dBuffTable:getDesc(effectName))

			local factor = tonumber(self.DBuffTable:getFactor(effectName))

			if factor <= 0 then
				factor = 1
			end

			if self.DBuffTable:isShowPercent(effectName) then
				labelAttrNum.text = addStr .. tostring(effectNum / factor * 100) .. "%"
			else
				labelAttrNum.text = addStr .. tostring(effectNum)
			end

			if self.buffID_ == xyd.GROUP_7_BUFF then
				labelAttrNum.text = labelAttr.text .. labelAttrNum.text
				labelAttr.text = __("GROUP_7_BUFF_TIP", i)

				labelAttr.gameObject:X(19)
				labelAttrNum.gameObject:X(430 - labelAttrNum.width)

				if i > self.group7Num then
					labelAttr.color = Color.New2(2829955839)
					labelAttrNum.color = Color.New2(2829955839)
				else
					labelAttr.color = Color.New2(11731199)
					labelAttrNum.color = Color.New2(472325119)
				end
			end

			height = height + 30
		end
	end

	if self.buffID_ ~= xyd.GROUP_7_BUFF then
		self.attrGroupTable:Reposition()
	end

	self.content.height = self.baseConHeight + height
end

function GroupBuffDetailTips:getPosDesc(pos)
	if not pos then
		return ""
	end

	local result = ""
	local poses = xyd.split(pos, "|", true)

	if #poses == 6 then
		-- block empty
	elseif #poses == 2 and poses[1] == 1 and poses[2] == 2 then
		result = __("HEAD_POS1")
	else
		result = __("BACK_POS1")
	end

	return result
end

function BattleWindow:ctor(name, params)
	BattleWindow.super.ctor(self, name, params)

	self.battleID = 0
	self.isWin = 0
	self.isSkillSound_ = false
	self.timers = {}
	self.sounds = {}
	self.soundsRate_ = {}
	self.battleSound = 0
	self.battleSoundPos = -1
	self.soundEffects_ = {}
	self.timeScale_ = 1
	self.newTimeScale_ = 1
	self.isGuideStopBattle_ = false
	self.screenScaleX = 1
	self.screenScaleY = 1
	self.isShake_ = false
	self.isTouchSkip_ = false
	self.BUFF_ON_WORK = 0
	self.BUFF_ON = 1
	self.BUFF_WORK = 2
	self.BUFF_OFF = 3
	self.BUFF_REMOVE = 4
	self.PET_ROUND_MP = 20
	self.PET_SKILL_MP = 10
	self.zOrders_ = {}
	self.roundNum = 1
	self.actions = {}
	self.effectsCount = {}
	self.effectsObj = {}
	self.isBattleStart_ = false
	self.herosPos_ = {}
	self.petEnergy_ = 0
	self.team = {}
	self.nodeGroups_ = {}
	self.frameIndex = 0
	self.battleEnds = false
	self.isPlayPetSkill = false
	self.unAutoEnd_ = false
	self.BossHarm = 0
	self.BossShowedHarm = 0
	self.AwardId = 0
	self.tips_ = {}
	self.curDepth_ = 0
	self.data_ = params
	xyd.Battle.curBattleType = self.data_.battle_type

	local battleData = params.event_data

	self.battleReport_ = params.battle_report

	if battleData and battleData.battle_report then
		self.battleReport_ = battleData.battle_report
	end

	self.sounds = params.sounds or {}
	self.battleSound = params.battle_sound or 0
	self.battleSoundPos = params.sound_pos or 0

	self:initConst()

	self.timeScale_ = xyd.BASIC_BATTLE_SPEED
	self.newTimeScale_ = xyd.BASIC_BATTLE_SPEED

	self:initData(self.battleReport_)
end

function BattleWindow:initConst()
	local speed = xyd.tables.miscTable:split2num("battle_speed_up", "value", "|")

	xyd.BASIC_BATTLE_SPEED = speed[1]
	xyd.DOUBLE_BATTLE_SPEED = speed[2]
	xyd.QUADRUPLE_BATTLE_SPEED = speed[3]

	if self.data_.battle_type == xyd.BattleType.TEST then
		xyd.DOUBLE_BATTLE_SPEED = 0.5
	end
end

function BattleWindow:initData(params)
	self.herosA = params.teamA
	self.herosB = params.teamB
	self.petA = params.petA
	self.petB = params.petB

	if tostring(self.petA) == "" or self.petA and self.petA.lv == nil then
		self.petA = nil
	end

	if tostring(self.petB) == "" or self.petB and self.petB.lv == nil then
		self.petB = nil
	end

	self.frames = params.frames
	self.isWin = params.isWin
	self.battleInfo = params.info
	self.battleID = self.battleInfo.battle_id

	if params.hasDecoded then
		self:initEmptyField()
	end
end

function BattleWindow:initEmptyField()
	if not self.petA or not self.petA.pet_id then
		self.petA = nil
	end

	if not self.petB or not self.petB.pet_id then
		self.petB = nil
	end
end

function BattleWindow:getData()
	return self.data_ or {}
end

function BattleWindow:initWindow()
	BattleWindow.super.initWindow()
	self:getUIComponent()
	self:resizePosY(self.bottomLight, -565, -704)
	self:setMap()
	self:setConfig()
	self:initButton()
end

function BattleWindow:playOpenAnimation(callback)
	BattleWindow.super.playOpenAnimation(self, callback)

	local layer = xyd.WindowManager.get():getUILayer(self.layerType_)

	if tolua.isnull(self.window_) or tolua.isnull(layer) then
		return
	end

	local minDepth = self.minDepth_

	self.curDepth_ = Mathf.Clamp(XYDUtils.GetMaxTargetDepth(layer, false) + 1, minDepth, XYDUtils.MaxInt)

	self:setFormation()
	self:initPetInfo()
	self:updateRoundLabel()
	self:initGroupBuff()
	self:initEffects()
	self:startBattle()
end

function BattleWindow:getUIComponent()
	local winTrans = self.window_.transform
	local centerObj = winTrans:NodeByName("center").gameObject

	self.imgBgBot_ = centerObj:ComponentByName("imgBgBot_", typeof(UITexture))
	self.imgBgTop_ = centerObj:ComponentByName("imgBgTop_", typeof(UITexture))
	self.rectEnergyMask_ = centerObj:ComponentByName("rectEnergyMask_", typeof(UISprite))

	local topObj = winTrans:NodeByName("top").gameObject

	self.imgRound = topObj:ComponentByName("topRound_/imgRound", typeof(UISprite))

	if xyd.Global.lang == "en_en" then
		self.imgRound.width = 144
		self.imgRound.height = 42
	end

	local pngNum = topObj:NodeByName("topRound_/pngRound_").gameObject

	self.pngRound_ = PngNum.new(pngNum, false)
	self.trialBossNode = topObj:NodeByName("trial_boss_node").gameObject
	self.bossHpBar = self.trialBossNode:ComponentByName("bossHpBar", typeof(UIProgressBar))
	self.bossHpBarText = self.trialBossNode:ComponentByName("bossHpBarText", typeof(UILabel))
	self.trialAwardEffectNode = self.trialBossNode:NodeByName("trialAwardEffectNode").gameObject
	self.trialAwardLevText = self.trialBossNode:ComponentByName("trialAwardLevText", typeof(UILabel))
	self.groupBuffDetail = topObj:NodeByName("group_buff_detail").gameObject
	self.speedModeNode = topObj:NodeByName("speedModeNode").gameObject
	self.speedModeWords = self.speedModeNode:ComponentByName("speedModeWords", typeof(UILabel))
	self.speedModeNodeImg1 = self.speedModeNode:ComponentByName("speedModeNodeImg1", typeof(UISprite))
	self.speedModeNodeImg2 = self.speedModeNode:ComponentByName("speedModeNodeImg2", typeof(UISprite))

	local bottomRightObj = winTrans:NodeByName("bottom_right").gameObject

	self.btnSpeed = bottomRightObj:NodeByName("btnSpeed").gameObject
	self.btnSkip_ = bottomRightObj:NodeByName("btnSkip_").gameObject

	local bottomLeftObj = winTrans:NodeByName("bottom_left").gameObject

	self.btnPause_ = bottomLeftObj:NodeByName("btnPause_").gameObject
	self.buffBtn = bottomLeftObj:NodeByName("buffBtn").gameObject
	self.mainLayer_ = centerObj:NodeByName("mainLayer_").gameObject
	self.bottomLayer_ = centerObj:NodeByName("bottomLayer_").gameObject
	self.uiLayer_ = centerObj:NodeByName("uiLayer_").gameObject
	self.heroNode = centerObj:NodeByName("heroNode").gameObject
	self.bottomLight = winTrans:NodeByName("bottomLight").gameObject

	local topLeftObj = winTrans:NodeByName("top_left").gameObject

	self.groupBuff1_ = topLeftObj:NodeByName("groupBuff1_").gameObject
	self.shrine_hurdle_node_ = topLeftObj:NodeByName("shrine_hurdle_node").gameObject
	self.shrinePointLabel_ = self.shrine_hurdle_node_:ComponentByName("pointGroup/label", typeof(UILabel))
	self.shrineHurtLabel_ = self.shrine_hurdle_node_:ComponentByName("hurtGroup/labelHurt", typeof(UILabel))

	local topRightObj = winTrans:NodeByName("top_right").gameObject

	self.groupBuff2_ = topRightObj:NodeByName("groupBuff2_").gameObject

	local bottomCenterObj = winTrans:NodeByName("bottom_center").gameObject

	self.petBar_ = bottomCenterObj:ComponentByName("petBar_", typeof(UISlider))
	self.petIcon = bottomCenterObj:ComponentByName("petBar_/petIcon", typeof(UISprite))
end

function BattleWindow:checkPlayAfterStory()
	if not self.data_.is_win then
		return false
	end

	if self.data_.battle_type == xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT2 then
		local stageID = self.data_.event_data.stage_id

		if xyd.tables.activityThermStoryTable.getPlotIds(stageID)[4] > 0 and self.data_.sub_stage == 1 then
			self.storyTable = xyd.tables.storyTable

			return true
		end
	end

	return false
end

function BattleWindow:initBossBar(allDamage)
	self.bossHpBar.value = 0
	self.bossHpBarText.text = "0 / " .. xyd.getDisplayNumber(allDamage)
	self.trialAwardLevText.text = "0"

	local effectArr = NewTrialRewardTable:getRewardsEffect(1)

	self.trialAwardEffect = xyd.Spine.new(self.trialAwardEffectNode)

	self.trialAwardEffect:setInfo("new_trial_baoxiang", function()
		self.trialAwardEffect:play(effectArr[2], 0)
	end)
end

function BattleWindow:setMap()
	local map = BattleTable:getMap(self.battleID)

	xyd.Global.battleMap = {}

	self.trialBossNode:SetActive(false)
	self.speedModeNode:SetActive(false)

	if self.data_.battle_type == xyd.BattleType.TRIAL then
		local mapPngStr = xyd.tables.newTrialBossScenesTable:getBattleScene(xyd.models.trial:getBossId())

		if self:checkNeedTrialBossBar() then
			mapPngStr = xyd.tables.newTrialBossScenesTable:getBattleSceneBoss(xyd.models.trial:getBossId())

			self.trialBossNode:SetActive(true)

			self.rewardTable = xyd.tables.newTrialRewardTable
			self.timer = self:getTimer(handler(self, self.checkBossBar), 0.05, -1)

			self.timer:Start()
		end

		xyd.setUITextureByNameAsync(self.imgBgBot_, mapPngStr, false)
		self.imgBgTop_:SetActive(false)
		table.insert(xyd.Global.battleMap, mapPngStr)

		local allDamage = NewTrialRewardTable:getDamageToBoss(1)

		self:initBossBar(allDamage)
	elseif self.data_.battle_type == xyd.BattleType.SHRINE_HURDLE then
		local beforeScore = xyd.models.shrineHurdleModel:checkIsBoss()

		if self:checkShrineHurdle() then
			self.shrine_hurdle_node_:SetActive(true)

			self.timer = self:getTimer(handler(self, self.checkShrineHurdleHurt), 0.05, -1)

			self.timer:Start()
		end

		if #map > 0 then
			xyd.setUITextureByNameAsync(self.imgBgBot_, map[1], false)
		end
	elseif self.data_.battle_type == xyd.BattleType.GUILD_WAR then
		xyd.setUITextureByNameAsync(self.imgBgBot_, "battle_map_13_1", false)
		self.imgBgTop_:SetActive(false)
		table.insert(xyd.Global.battleMap, "battle_map_13_1")
	elseif #map > 0 then
		xyd.Global.battleMap = map

		xyd.setUITextureByNameAsync(self.imgBgBot_, map[1], false)

		if map[2] then
			xyd.setUITextureByNameAsync(self.imgBgTop_, map[2], false)
		else
			self.imgBgTop_:SetActive(false)
		end
	end

	if self.data_.battle_type == xyd.BattleType.HERO_CHALLENGE_SPEED then
		self.speedModeNode:SetActive(true)

		local tableId = xyd.tables.partnerChallengeSpeedTable:getIdByBattleId(self.battleID)

		self.speedModeWords.text = xyd.tables.partnerChallengeSpeedTable:getSkillDesc(tableId)
	end

	if self.data_.battle_type == xyd.BattleType.HERO_CHALLENGE and next(xyd.tables.partnerChallengeTable:getSkillIds(self.data_.event_data.stage_id)) then
		self.speedModeNode:SetActive(true)

		self.speedModeWords.text = xyd.tables.partnerChallengeTable:getSkillDesc(self.data_.event_data.stage_id)

		xyd.setUISpriteAsync(self.speedModeNodeImg1, nil, "hero_challenge_nomal_icon")

		UIEventListener.Get(self.speedModeNodeImg1.gameObject).onClick = function()
			local v = self.speedModeWords.gameObject.activeSelf

			self.speedModeWords:SetActive(not v)
			self.speedModeNodeImg2:SetActive(not v)
		end
	end

	if self.data_.battle_type == xyd.BattleType.ICE_SECRET_BOSS then
		self.trialBossNode:SetActive(true)

		self.rewardTable = xyd.tables.activityIceSecretBossRewardTable
		self.timer = self:getTimer(handler(self, self.checkBossBar), 0.05, -1)

		self.timer:Start()

		local allDamage = self.rewardTable:getDamage(1)

		self:initBossBar(allDamage)
	end

	if self.data_.battle_type == xyd.BattleType.LIMIT_CALL_BOSS then
		self.trialBossNode:SetActive(true)

		self.rewardTable = xyd.tables.activityLimitBossAwardTable
		self.timer = self:getTimer(handler(self, self.checkBossBar), 0.05, -1)

		self.timer:Start()

		local allDamage = self.rewardTable:getDamage(1)

		self:initBossBar(allDamage)
	end

	local roundSource = "battle_text_round_" .. xyd.Global.lang

	xyd.setUISprite(self.imgRound, xyd.Atlas.BATTLE, roundSource)
	self.imgRound:MakePixelPerfect()
end

function BattleWindow:setConfig()
	self.isStop = false

	local val = xyd.db.misc:getValue("battle_speed_new")

	if val then
		local type = tonumber(val)
		local timeScale = xyd.BASIC_BATTLE_SPEED
		local src = "new_battle_speed1"

		if type == 2 then
			timeScale = xyd.DOUBLE_BATTLE_SPEED
			src = "new_battle_speed2"
		elseif type == 3 then
			timeScale = xyd.QUADRUPLE_BATTLE_SPEED
			src = "new_battle_speed4"
		end

		self.timeScale_ = timeScale
		self.newTimeScale_ = timeScale

		local sprite = self.btnSpeed:GetComponent(typeof(UISprite))

		xyd.setUISprite(sprite, xyd.Atlas.COMMON_Btn, src)
	end

	if self:isHideSkip() then
		self.btnSkip_:SetActive(false)

		local pos = self.btnSpeed.transform.localPosition

		self.btnSpeed.transform:SetLocalPosition(-47, pos.y, pos.z)
	end

	xyd.Battle.aoeBuffEffect_ = {}
end

function BattleWindow:initButton()
	UIEventListener.Get(self.btnSpeed).onClick = handler(self, self.onSpeedTouch)
	UIEventListener.Get(self.btnSkip_).onClick = handler(self, self.touchSkip)
	UIEventListener.Get(self.btnPause_).onClick = handler(self, self.pauseTouch)
	UIEventListener.Get(self.buffBtn).onClick = handler(self, self.touchBuff)
end

function BattleWindow:resumeBattleCallback()
	local wnd = xyd.WindowManager.get():getWindow("battle_window")

	if not wnd then
		return
	end

	wnd:resumeBattle()

	if not wnd.isBattleStart_ then
		wnd:mainLoop()
	end
end

function BattleWindow:touchBuff()
	if self.battleEnds == true then
		return
	end

	self:stopBattle()

	local selfFighters = {}
	local sideFighters = {}

	for i = 1, 12 do
		local needTable = selfFighters

		if i > 6 then
			needTable = sideFighters
		end

		if self.team[i] and not self.team[i]:isDeath() then
			table.insert(needTable, self.team[i])
		end
	end

	local params = {
		callback = self.resumeBattleCallback,
		selfFighters = selfFighters,
		sideFighters = sideFighters
	}

	xyd.WindowManager.get():openWindow("battle_all_buffs_window", params)
end

function BattleWindow:pauseTouch()
	if self.battleEnds == true then
		return
	end

	self:stopBattle()

	local params = {
		callback = self.resumeBattleCallback
	}

	xyd.WindowManager.get():openWindow("battle_tips_window", params)
end

function BattleWindow:showPvpWindow(callback)
	self.data_.pvpCallBack = callback

	xyd.WindowManager.get():openWindow("pvp_vs_window", self.data_)
end

function BattleWindow:showTimeCloisterBattleCards(callback)
	local time_cloister_main_wd = xyd.WindowManager.get():getWindow("time_cloister_main_window")

	if time_cloister_main_wd then
		local curTimeCloisterId = time_cloister_main_wd:getCurCloister()

		if curTimeCloisterId == xyd.TimeCloisterMissionType.THREE then
			local battleCardIds = xyd.models.timeCloisterModel:getThreeChoiceCrystalBattleCardIds()

			if battleCardIds ~= nil and #battleCardIds > 0 then
				local params = {
					callback = callback,
					battleCardIds = battleCardIds
				}

				xyd.WindowManager.get():openWindow("time_cloister_crystal_battle_happen_window", params)

				return
			end
		end
	end

	callback()
end

function BattleWindow:getGroupBuffID(key)
	local result = {}

	if self.data_.battle_type == xyd.BattleType.ACTIVITY_SPFARM then
		return result
	end

	local groupNum = {}
	local tNum = 0

	for i = key, key + 5 do
		local fighter = self.team[i]

		if fighter then
			local group = fighter:getGroup()

			groupNum[group] = (groupNum[group] or 0) + 1
			tNum = tNum + 1
		end

		if key == 1 and fighter and fighter.isMonster and self.data_.battle_type == xyd.BattleType.FAIRY_TALE then
			local group = fighter:getGroup()

			groupNum[group] = (groupNum[group] or 0) + 1
			tNum = tNum + 1
		end
	end

	for i = 1, xyd.GROUP_NUM do
		if not groupNum[i] then
			groupNum[i] = 0
		end
	end

	result = GroupBuffTable:getBuffIds(groupNum)

	return result
end

function BattleWindow:initGroupBuff()
	local function initEffect(buffID, parent, renderTarget)
		local fx = GroupBuffTable:getFx(buffID)
		local sp = xyd.Spine.new(parent)

		sp:setInfo(fx, function()
			sp:setRenderTarget(renderTarget, 1)
			sp:SetLocalPosition(0, 0, 0)
			sp:play("texiao01", 0)
		end)
	end

	local group1 = self:getGroupBuffID(1)

	if next(group1) then
		local imgBuff1 = self.groupBuff1_:ComponentByName("imgBuff1", typeof(UISprite))

		xyd.setUISprite(imgBuff1, xyd.Atlas.GROUP_BUFF, "group_buff_on_" .. group1[1].id)
		imgBuff1:SetActive(true)
		initEffect(group1[1].id, self.groupBuff1_, imgBuff1)
		self:addGroupBuffTouch(self.groupBuff1_, group1, 1)
	else
		UIEventListener.Get(self.groupBuff1_).onClick = function()
			xyd.alert(xyd.AlertType.TIPS, __("NO_GROUP_BUFF"))
		end
	end

	local group2 = self:getGroupBuffID(7)

	if next(group2) then
		local imgBuff2 = self.groupBuff2_:ComponentByName("imgBuff2", typeof(UISprite))

		xyd.setUISprite(imgBuff2, xyd.Atlas.GROUP_BUFF, "group_buff_on_" .. group2[1].id)
		imgBuff2:SetActive(true)
		initEffect(group2[1].id, self.groupBuff2_, imgBuff2)
		self:addGroupBuffTouch(self.groupBuff2_, group2, 2)
	else
		UIEventListener.Get(self.groupBuff2_).onClick = function()
			xyd.alert(xyd.AlertType.TIPS, __("NO_GROUP_BUFF"))
		end
	end
end

function BattleWindow:addGroupBuffTouch(obj, buffIDs, index)
	UIEventListener.Get(obj).onPress = function(go, isPressed)
		if isPressed then
			local lastItem

			for k, v in ipairs(buffIDs) do
				local item = GroupBuffDetailTips.new(self.groupBuffDetail, {
					buffID = v.id,
					group7Num = v.group7Num
				})

				if lastItem then
					item.go:Y(lastItem.go.transform.localPosition.y - lastItem.content.height - 10)
				end

				table.insert(self.tips_, item)

				lastItem = item
			end
		elseif next(self.tips_) then
			for _, tip in ipairs(self.tips_) do
				NGUITools.Destroy(tip.go)
			end
		end
	end
end

function BattleWindow:initEffects()
	local getMax

	function getMax(a, b)
		return xyd.checkCondition((a or 0) > (b or 0), a, b)
	end

	local getSkillEffect

	function getSkillEffect(skillID, data, num, skillIndex)
		local fxs = SkillTable:getFx(skillID, skillIndex)
		local hurt1 = SkillTable:getFxHurt1(skillID, skillIndex)
		local hurt2 = SkillTable:getFxHurt2(skillID, skillIndex)
		local tmpData = {}

		for id in pairs(fxs) do
			local fx = fxs[id]
			local curNum = num

			if FxTable:isAoe(fx) then
				curNum = 1
			end

			local effectName = FxTable:getResName(fx)

			tmpData[effectName] = (tmpData[effectName] or 0) + curNum
		end

		for id in pairs(hurt1) do
			local fx = hurt1[id]
			local effectName = FxTable:getResName(fx)

			tmpData[effectName] = (tmpData[effectName] or 0) + num
		end

		for id in pairs(hurt2) do
			local fx = hurt2[id]
			local effectName = FxTable:getResName(fx)

			tmpData[effectName] = (tmpData[effectName] or 0) + num
		end

		for effectName in pairs(tmpData) do
			data[effectName] = getMax(tmpData[effectName], data[effectName])
		end
	end

	local frames = self.frames
	local tmpEffects = {}

	for _, frame in ipairs(frames) do
		local round = frame.round
		local skillID = tonumber(frame.skill_id)
		local buffs = frame.buffs
		local targets = frame.targets
		local actor = self.team[frame.pos]

		if skillID > 0 then
			getSkillEffect(skillID, tmpEffects, #targets, actor:getSkillIndex())
		end
	end

	self.effectsCount = tmpEffects
end

function BattleWindow:createEffects()
	return
end

function BattleWindow:checkCanSpeed()
	if self.data_.battle_type == xyd.BattleType.SKIN_PLAY or self.data_.battle_type == xyd.BattleType.TEST then
		return true
	end

	if self.newTimeScale_ == xyd.BASIC_BATTLE_SPEED or self.newTimeScale_ == xyd.QUADRUPLE_BATTLE_SPEED then
		return true
	end

	local mapInfo = xyd.models.map:getMapInfo(xyd.MapType.CAMPAIGN)
	local maxStage = mapInfo.max_stage
	local vip = xyd.models.backpack:getVipLev()

	if maxStage < 22 and vip < 1 then
		xyd.alert(xyd.AlertType.TIPS, __("BATTLE_SPEED_ERROR_TEST"))

		return false
	end

	return true
end

function BattleWindow:onSpeedTouch()
	self:setNewSpeed()

	local src_ = "new_battle_speed1"

	if self.newTimeScale_ == xyd.DOUBLE_BATTLE_SPEED then
		src_ = "new_battle_speed2"
	elseif self.newTimeScale_ == xyd.QUADRUPLE_BATTLE_SPEED then
		src_ = "new_battle_speed4"
	end

	local sprite = self.btnSpeed:GetComponent(typeof(UISprite))

	xyd.setUISprite(sprite, xyd.Atlas.COMMON_Btn, src_)

	if xyd.isIosTest() then
		src_ = src_ .. "_ios_test"

		xyd.setUISprite(sprite, nil, src_)
	end
end

function BattleWindow:setNewSpeed()
	local canSpeed = self:checkCanSpeed()
	local type = 1

	if self.newTimeScale_ == xyd.BASIC_BATTLE_SPEED then
		self.newTimeScale_ = xyd.DOUBLE_BATTLE_SPEED
		type = 2
	elseif self.newTimeScale_ == xyd.DOUBLE_BATTLE_SPEED then
		self.newTimeScale_ = xyd.QUADRUPLE_BATTLE_SPEED
		type = 3

		if not canSpeed then
			self.newTimeScale_ = xyd.BASIC_BATTLE_SPEED
			type = 1
		end
	else
		self.newTimeScale_ = xyd.BASIC_BATTLE_SPEED
	end

	xyd.db.misc:addOrUpdate({
		key = "battle_speed_new",
		value = type
	})
end

function BattleWindow:updateSpeed()
	if self.newTimeScale_ ~= self.timeScale_ then
		self.timeScale_ = self.newTimeScale_

		for id in pairs(self.team) do
			self.team[id]:setTimeScale(self.timeScale_)
		end
	end
end

function BattleWindow:updateFrameIndex()
	for id in pairs(self.team) do
		self.team[id]:setFrameIndex(self.frameIndex)
	end
end

function BattleWindow:resumeBattle()
	if not self.isStop then
		return
	end

	self.isStop = false

	for i = 1, self.uiLayer_.transform.childCount do
		local child = self.uiLayer_.transform:GetChild(i - 1).gameObject
		local spineAnim = child:GetComponent(typeof(SpineAnim))

		if spineAnim then
			spineAnim:resume()
		end
	end

	for id in pairs(self.team) do
		local child = self.team[id]

		child:resume()
	end

	for i = 1, #self.actions do
		local action = self.actions[i]

		action:Play()
	end

	for i = 1, #self.timers_ do
		local timer = self.timers_[i]

		timer:Start()
	end
end

function BattleWindow:stopBattle()
	if self.isStop then
		return
	end

	self.isStop = true

	for i = 1, self.uiLayer_.transform.childCount do
		local child = self.uiLayer_.transform:GetChild(i - 1).gameObject
		local spineAnim = child:GetComponent(typeof(SpineAnim))

		if spineAnim then
			spineAnim:pause()
		end
	end

	for id in pairs(self.team) do
		local child = self.team[id]

		child:pause()
	end

	for i = 1, #self.actions do
		local action = self.actions[i]

		action:Pause()
	end

	for i = 1, #self.timers_ do
		local timer = self.timers_[i]

		timer:Stop()
	end
end

function BattleWindow:stopBattleByGuide()
	self.isGuideStopBattle_ = true
end

function BattleWindow:setFormation()
	local function getZOder(hero)
		local pos = hero.pos
		local zOrder = xyd.UNIT_ZORDERS[pos]

		if hero.isMonster and xyd.tables.monsterTable:isBoss(hero.table_id) then
			if pos < 6 then
				zOrder = (xyd.UNIT_ZORDERS[pos] + xyd.UNIT_ZORDERS[pos + 1]) / 2
			elseif pos == 6 then
				zOrder = (xyd.UNIT_ZORDERS[pos] + xyd.UNIT_ZORDERS[pos - 1]) / 2
			end
		end

		return zOrder
	end

	table.sort(self.herosA, function(a, b)
		local aNum = getZOder(a)
		local bNum = getZOder(b)

		if aNum ~= bNum then
			return bNum < aNum
		end

		return false
	end)
	table.sort(self.herosB, function(a, b)
		local aNum = getZOder(a)
		local bNum = getZOder(b)

		if aNum ~= bNum then
			return bNum < aNum
		end

		return false
	end)

	self.zOrders_ = {}

	for i = #self.herosA, 1, -1 do
		local hero = self.herosA[i]

		if tolua.isnull(hero.status) or hero.status.hp ~= 0 then
			local fighter = self:newFighter(hero, xyd.TeamType.A, hero.pos, false, getZOder(hero))

			self.team[hero.pos] = fighter
		end
	end

	for i = #self.herosB, 1, -1 do
		local hero = self.herosB[i]

		if tolua.isnull(hero.status) or hero.status.hp ~= 0 then
			local isInit = true

			if hero ~= nil and hero.status ~= nil and hero.status.hp ~= nil and hero.status.hp == 0 then
				isInit = false
			end

			if isInit then
				local fighter = self:newFighter(hero, xyd.TeamType.B, hero.pos + xyd.TEAM_B_POS_BASIC, true, getZOder(hero) + 3)

				self.team[hero.pos + xyd.TEAM_B_POS_BASIC] = fighter
			end
		end
	end

	if self.petA then
		self.team[13] = self:newPet(self.petA, xyd.TeamType.A, 13)
	end

	if self.petB then
		self.team[14] = self:newPet(self.petB, xyd.TeamType.B, 14)
	end

	self.team[15] = self:newGod()

	table.sort(self.zOrders_, function(a, b)
		return a.zOrder - b.zOrder
	end)
	self:resetZorders()
	self:getFinalBossHit()
end

function BattleWindow:newFighter(hero, teamType, pos, flipX, zOrder)
	local group = NGUITools.AddChild(self.mainLayer_, self.heroNode)
	local depth = self.mainLayer_:GetComponent(typeof(UIWidget)).depth + zOrder

	self.nodeGroups_[pos] = group

	local fighter = xyd.Battle.getRequire("BaseFighter").new()

	fighter:populate(hero, group, self.uiLayer_, self.bottomLayer_, self.screenScaleY)
	fighter:setBaseDepth(depth)
	fighter:setTimeScale(self.timeScale_)
	fighter:setTeamType(teamType)
	fighter:setPosIndex(pos)
	fighter:setWnd(self)

	local offset = fighter:getModelOffset()
	local x = math.round(xyd.HeroBattlePos[pos].x * 0.67 + offset[1])
	local y = 0

	if fighter:isBoss() then
		if pos < 6 or pos > 6 and pos < 12 then
			y = (xyd.HeroBattlePos[pos].y + xyd.HeroBattlePos[pos + 1].y) * 0.5 * self.screenScaleY * 0.67
		elseif pos == 6 or pos == 12 then
			y = (xyd.HeroBattlePos[pos].y + xyd.HeroBattlePos[pos - 1].y) * 0.5 * self.screenScaleY * 0.67
		end
	else
		y = xyd.HeroBattlePos[pos].y * self.screenScaleY * 0.67
	end

	y = math.round((y + offset[2]) * xyd.Battle.unityPosYFlip)
	self.herosPos_[pos] = {
		x = x,
		y = y
	}

	group:SetLocalPosition(x, y, 0)

	return fighter
end

function BattleWindow:newGod()
	local fighter = xyd.Battle.getRequire("BaseGod").new()

	fighter:populate(self.uiLayer_, self.bottomLayer_, self.screenScaleY)
	fighter:setTimeScale(self.timeScale_)
	fighter:setTeamType(xyd.TeamType.A)
	fighter:setPosIndex(15)
	fighter:setWnd(self)

	return fighter
end

function BattleWindow:newPet(pet, teamType, pos)
	local fighter = xyd.Battle.getRequire("BasePet").new()

	fighter:populate(pet, self.uiLayer_, self.bottomLayer_, self.screenScaleY)
	fighter:setTimeScale(self.timeScale_)
	fighter:setTeamType(teamType)
	fighter:setPosIndex(pos)
	fighter:setWnd(self)

	return fighter
end

function BattleWindow:updateRoundLabel()
	if self.pngRound_:getNum() ~= self.roundNum then
		self.pngRound_:setInfo({
			iconName = "battle_round",
			num = self.roundNum
		})
	end
end

function BattleWindow:loadFighterModel(callback)
	self:waitForFrame(2, function()
		for i in pairs(self.team) do
			local fighter = self.team[i]

			if fighter:getPosIndex() < 13 and fighter:getFighterModel() == nil then
				local directX_ = 1

				if tonumber(i) > 6 then
					directX_ = -1
				end

				fighter:initModel(directX_)
				fighter:resumeIdle()
				fighter:initHeadView()

				if (self:checkNeedTrialBossBar() or self:checkNeedIceBossBar() or self:checkNeedLimitBossBar()) and fighter:getTeamType() == xyd.TeamType.B then
					fighter:getHeadView():SetActive(false)
					fighter:setNeedHideHeadView(true)
				end

				fighter:updateHpBar()
				fighter:updateMpBar()
			end
		end

		self:resetZorders()

		if callback ~= nil then
			callback()
		end
	end, nil)
end

function BattleWindow:startBattle()
	self:loadFighterModel(function()
		self:waitForFrame(1, function()
			local wnd = xyd.WindowManager.get():getWindow("battle_loading_window")

			if wnd then
				wnd:setCallBack(function()
					self:createEffects()
					xyd.closeWindow("battle_loading_window")
					self:playSecondStory()
				end)
			end
		end)
	end)
end

function BattleWindow:playSecondStory()
	local battleType = self.data_.battle_type
	local stageId = self.data_.stage_id

	if self.data_.event_data and self.data_.event_data.stage_id then
		stageId = self.data_.event_data.stage_id
	end

	local plotIds = {}
	local storyType = xyd.StoryType.MAIN
	local save_callback

	if battleType == xyd.BattleType.CAMPAIGN then
		local fort_id = StageTable:getFortID(stageId)

		if fort_id > 10 then
			local timestamp = xyd.tables.miscTable:getNumber("new_story_lock_time", "value")

			if timestamp > xyd.getServerTime() then
				plotIds = nil
			else
				plotIds = xyd.tables.mainPlotListTable:getPlotIDsByStageID(stageId)
			end
		else
			plotIds = xyd.tables.mainPlotListTable:getPlotIDsByStageID(stageId)
		end
	elseif battleType == xyd.BattleType.HERO_CHALLENGE and xyd.models.heroChallenge:checkPlayStory(stageId) then
		plotIds = xyd.tables.partnerChallengeTable:plotId(stageId)
		storyType = xyd.StoryType.PARTNER

		function save_callback(id)
			if id >= 0 then
				return
			end

			local fort_id = xyd.tables.partnerChallengeTable:getFortID(stageId)
			local cur_data = xyd.models.heroChallenge:getMapList()[fort_id]

			if cur_data and cur_data.base_info and cur_data.base_info.pre_stage ~= nil and cur_data.base_info.fight_max_stage > cur_data.base_info.pre_stage then
				local msg = messages_pb.partner_end_story_req()

				msg.stage_id = stageId

				xyd.Backend.get():request(xyd.mid.PARTNER_END_STORY, msg)
			end
		end
	elseif battleType == xyd.BattleType.HERO_CHALLENGE_CHESS and xyd.models.heroChallenge:checkPlayChessStory(stageId) then
		plotIds = xyd.tables.partnerChallengeChessTable:plotId(stageId)
		storyType = xyd.StoryType.PARTNER

		function save_callback(id)
			if id >= 0 then
				return
			end

			local fort_id = xyd.tables.partnerChallengeChessTable:getFortID(stageId)
			local cur_data = xyd.models.heroChallenge:getChessMapList()[fort_id]

			if cur_data and cur_data.base_info and cur_data.base_info.pre_stage ~= nil and cur_data.base_info.fight_max_stage > cur_data.base_info.pre_stage then
				local msg = messages_pb.partner_end_story_req()

				msg.stage_id = stageId

				xyd.Backend.get():request(xyd.mid.PARTNER_END_STORY, msg)
			end
		end
	elseif battleType == xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT then
		plotIds = xyd.tables.activityNewStoryTable:getPlotIds(stageId)
		storyType = xyd.StoryType.MAIN
	elseif battleType == xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT2 then
		plotIds = xyd.tables.activityThermStoryTable:getPlotIds(stageId)
		storyType = xyd.StoryType.ACTIVITY
	elseif battleType == xyd.BattleType.NEW_PARTNER_WARMUP then
		plotIds = xyd.tables.newPartnerWarmUpStageTable:getPlotIds(stageId)
		storyType = xyd.StoryType.OTHER
	elseif battleType == xyd.BattleType.ACTIVITY_ANGLE_TEA_PARTY then
		plotIds = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_ANGLE_TEA_PARTY).nowPlotID
		storyType = xyd.StoryType.ACTIVITY
	end

	if xyd.Global.isReview == 0 and plotIds and plotIds[2] and plotIds[2] > 0 then
		self.mainLayer_:SetActive(false)
		xyd.openWindow("story_window", {
			isShowSwitch = true,
			is_back = true,
			story_id = plotIds[2],
			story_type = storyType,
			save_callback = save_callback
		})

		return
	end

	self:playStartAction()
end

function BattleWindow:playStartAction()
	local soundID = xyd.tables.windowTable:openSound(self.name_)

	if soundID then
		xyd.SoundManager.get():playSound(soundID)
	end

	if not self.mainLayer_ then
		return
	end

	self.mainLayer_:SetActive(true)

	local battleType = self.data_.battle_type
	local stageID = self.data_.stage_id

	if self.data_.event_data and self.data_.event_data.stage_id then
		stageID = self.data_.event_data.stage_id
	end

	local function callback()
		if StageTable:isShowBattleEffect(stageID) or battleType == xyd.BattleType.HERO_CHALLENGE then
			self:showEnemyEffect()
		else
			self:showBattleSound()
		end
	end

	if xyd.checkShowPvpWindow(battleType) then
		self:showPvpWindow(callback)
	elseif battleType == xyd.BattleType.TIME_CLOISTER_BATTLE or battleType == xyd.BattleType.TIME_CLOISTER_EXTRA then
		self:showTimeCloisterBattleCards(callback)
	else
		callback()
	end
end

function BattleWindow:showEnemyEffect()
	for i = xyd.TEAM_B_POS_BASIC + 1, xyd.Battle.MAX_TEAM_NUM do
		if self.nodeGroups_[i] then
			local group = self.nodeGroups_[i]
			local pos = group.transform.localPosition
			local renderTarget = self.uiLayer_:GetComponent(typeof(UITexture))
			local effect = xyd.Spine.new(self.mainLayer_)

			effect:setInfo(xyd.Battle.effect_battlecover, function()
				effect:setRenderTarget(renderTarget, 1)
				effect:SetLocalPosition(pos.x, pos.y + 100, -i)
				effect:play("texiao01", 1, 1, function()
					effect:destroy()
				end)
			end)
			group:SetActive(false)
		end
	end

	self:waitForTime(1, function()
		for i = xyd.TEAM_B_POS_BASIC + 1, xyd.Battle.MAX_TEAM_NUM do
			if self.nodeGroups_[i] then
				local group = self.nodeGroups_[i]

				group:SetActive(true)
			end
		end
	end, "")
	self:waitForTime(1.8, function()
		self:showBattleSound()
	end, "")
end

function BattleWindow:showBattleSound()
	if self.battleID == 100001 then
		return
	end

	if self.battleSoundPos > 0 or self.battleSound > 0 then
		local fighter = self.team[self.battleSoundPos]

		if fighter then
			self:showDialog({
				fighter
			}, xyd.PartnerBattleDialog.BATTLE_DIALOG)
		end
	end

	self:waitForTime(0.5, function()
		self:mainLoop()
	end, "")
end

function BattleWindow:mainLoop()
	if self.isStop then
		return
	end

	self.isBattleStart_ = true

	self:updateSpeed()

	self.frameIndex = self.frameIndex + 1

	self:updateFrameIndex()

	local frame = self.frames[self.frameIndex]

	if not frame.buffs then
		frame.buffs = {}
	end

	if frame ~= nil then
		self.roundNum = frame.round

		self:updateRoundLabel()

		if frame.pos == 15 or frame.pos == 0 then
			self.alreadyFinishRound = self.roundNum

			self:schedule(0.2, function()
				if frame.pos == 0 then
					self:playRoundEndAction(frame)
				end

				local anyDead = self:updateAllBuffs(frame, true)
				local delay = self:getCurFrameBuffEffectTime(frame)

				self:schedule(delay, function()
					self:refreshTeam(frame)

					local anyRevive = self:checkAnyRevive(frame)
					local tDead = 0.2
					local tRevive = 1.3

					if anyDead == 2 then
						tDead = 3
						anyDead = true
					end

					if anyRevive == 2 then
						tRevive = 3
					end

					anyRevive = anyRevive ~= 0

					if anyRevive then
						local tProcessRevive = xyd.checkCondition(anyDead, tDead, 0)

						self:schedule(tProcessRevive, function()
							self:processRevive(frame)
						end)
					end

					local tNext = xyd.checkCondition(anyRevive, xyd.checkCondition(anyDead, tDead + tRevive, tRevive), 0)

					if frame.pos == 0 then
						tNext = tNext + self:getCurFrameBuffEffectTime(frame)
						tNext = tNext + self:getRoundEndAction(frame)
					end

					self:schedule(tNext + 0.26, function()
						self:checkEnds()
					end)
				end)
			end)

			return
		end

		local group = self.nodeGroups_[frame.pos]
		local actor = self.team[frame.pos]
		local actees1 = {}
		local actees2 = {}

		for id in pairs(frame.targets) do
			local actee = self.team[frame.targets[id]]

			table.insert(actees1, actee)
		end

		for id in pairs(frame.targets_2) do
			local actee = self.team[frame.targets_2[id]]

			table.insert(actees2, actee)
		end

		if frame.pos < 13 then
			self:playActor(frame, actor, tonumber(frame.skill_id), actees1, actees2)
		else
			self:playPet(frame, actor, tonumber(frame.skill_id), actees1, actees2)
		end
	end
end

function BattleWindow:getCurFrameBuffEffectTime(frame)
	local t_ = 0
	local buffs = frame.buffs

	for id, _ in ipairs(buffs) do
		local buff = buffs[id]
		local buffName = buff.name
		local buffFighter

		if buff.f_pos and buff.f_pos > 0 then
			buffFighter = self.team[buff.f_pos]
		end

		if buffFighter then
			if buffName == xyd.BUFF_ENERGY_SKILL_HOLD and buff.buffOn == self.BUFF_ON then
				local duration = self:getHoldBuffTime(buff)

				t_ = xyd.checkCondition(t_ < duration, duration, t_)
			else
				local modelID = buffFighter:getModelID()
				local heroWorkFx = DBuffTable:heroWorkFx(buffName, modelID)
				local fxs = DBuffTable:getFx(buffName)

				if heroWorkFx and heroWorkFx[2] then
					local duration = FxTable:getSpeed(heroWorkFx[2])

					t_ = xyd.checkCondition(t_ < duration, duration, t_)
				elseif next(fxs) then
					local duration = 0

					for k, fx in ipairs(fxs) do
						if FxTable:getHurtSecondDelay(fx) then
							duration = duration + FxTable:getHurtSecondDelay(fx) / 30
						end
					end

					t_ = xyd.checkCondition(t_ < duration, duration, t_)
				end
			end
		end
	end

	return t_
end

function BattleWindow:getHoldBuffTime(buff)
	local ModelTable = xyd.tables.modelTable
	local duration = 0
	local buffName = buff.name
	local buffFighter

	if buff.f_pos and buff.f_pos > 0 then
		buffFighter = self.team[buff.f_pos]
	end

	if not buffFighter then
		return duration
	end

	local time1 = buffFighter:getAnimationTime("skill01")
	local time2 = buffFighter:getAnimationTime("skill02")
	local duration = time1 + time2

	return duration
end

function BattleWindow:checkNeedTrialBossBar()
	if self.data_.battle_type == xyd.BattleType.TRIAL and self.data_.stage_id == -1 then
		return true
	end

	return false
end

function BattleWindow:checkShrineHurdle()
	local beforeScore = xyd.models.shrineHurdleModel:checkIsBoss()

	return beforeScore and beforeScore > 0 or self.data_.event_data.isBoss
end

function BattleWindow:checkNeedIceBossBar()
	if self.data_.battle_type == xyd.BattleType.ICE_SECRET_BOSS then
		return true
	end

	return false
end

function BattleWindow:checkNeedLimitBossBar()
	if self.data_.battle_type == xyd.BattleType.LIMIT_CALL_BOSS then
		return true
	end

	return false
end

function BattleWindow:playHurtEffects(frame)
	local actor

	actor = self.team[frame.pos]

	local buffs = frame.buffs
	local floatTime = 0
	local targets = frame.targets or {}
	local targets2 = frame.targets_2 or {}

	for _, buff in ipairs(buffs) do
		if buff.name ~= xyd.BUFF_REVIVE and buff.name ~= xyd.BUFF_ENERGY and self.team[buff.pos] then
			local result = {
				value = xyd.getBattleNum(buff.value),
				isMiss = buff.type == xyd.BuffType.MISS,
				isCrit = buff.type == xyd.BuffType.CRIT,
				isFree = buff.type == xyd.BuffType.FREE,
				hp = buff.hp == nil and -1 or buff.hp
			}
			local actee = self.team[buff.pos]
			local isEnemy = actor:getTeamType() ~= actee:getTeamType()
			local targetIndex = xyd.arrayIndexOf(targets, buff.pos)
			local effectIndex = tonumber(buff.effect_index) or 1

			if effectIndex > 1 then
				targetIndex = xyd.arrayIndexOf(targets2, buff.pos)
			end

			if isEnemy and targetIndex < 0 and buff.name ~= xyd.BUFF_HURT_0 then
				-- block empty
			elseif (result.value and result.hp >= 0 or result.isMiss or buff.name == xyd.BUFF_HURT_0) and tonumber(frame.skill_id) > 0 and (buff.skill_id == nil or tonumber(frame.skill_id) == tonumber(buff.skill_id)) then
				local tmpT = self:playActee(actor, actee, tonumber(frame.skill_id), buff.name, result.isMiss, targetIndex)

				floatTime = xyd.checkCondition(tmpT < floatTime, floatTime, tmpT)
			end
		end

		if buff.name == xyd.BUFF_DEBUFF_CLEAN_2_LIMIT or buff.name == xyd.BUFF_WEI_WEI_AN_HEAL then
			local actor = self.team[buff.f_pos]
			local layer = actor:getLayerByType(xyd.BaseFightLayerType.BUFF_TOP)
			local buffEffect = layer:NodeByName("yueying")

			if buffEffect then
				buffEffect = buffEffect.gameObject

				local effectAnim = buffEffect:GetComponent(typeof(SpineAnim))

				effectAnim:play("texiao01", 1)
				effectAnim:addListener("Complete", function()
					effectAnim:play("texiao02", 0)
				end)
			end
		end
	end

	return floatTime
end

function BattleWindow:buffIsDot(name)
	if name == xyd.BUFF_DOT or name == xyd.BUFF_DOT_POISON or name == xyd.BUFF_DOT_BLOOD or name == xyd.BUFF_DOT_FIRE or name == xyd.BUFF_DOT_TWINS or name == xyd.BUFF_DOT_FIRE_MAX_HP or name == xyd.BUFF_ANSUNA_DOT or name == xyd.BUFF_DOT_MAX_HP then
		return true
	end

	return false
end

function BattleWindow:updateEnergys(frame)
	if not frame.eps then
		return
	end

	for k, v in ipairs(frame.eps) do
		if self.team[v.pos] then
			self.team[v.pos]:updateEnergy(v.ep)

			if v.pos == 13 then
				self:updatePetEnergy(v.ep, true)
			end
		end
	end
end

function BattleWindow:updateAllBuffs(frame, isRoundEnd)
	local anyDead = false
	local actor

	actor = self.team[frame.pos]

	local buffs = frame.buffs
	local dieActee = {}

	self:updateEnergys(frame)

	for index, buff in ipairs(buffs) do
		local buffFighter

		if buff.f_pos and buff.f_pos > 0 then
			buffFighter = self.team[buff.f_pos]
		end

		if buff.name == xyd.BUFF_APATE_REVIVE and buff.buffOn == self.BUFF_WORK and buff.pos == buffFighter:getPosIndex() then
			anyDead = 2

			local layer = buffFighter:getLayerByType(xyd.BaseFightLayerType.BUFF_TOP)
			local dieEffect = layer:NodeByName("fuhuo_fx2")
			local value = 4 - math.max(tonumber(buff.value), 1)
			local dieEffectAnim

			if dieEffect then
				dieEffectAnim = dieEffect.gameObject:GetComponent(typeof(SpineAnim))
			end

			if dieEffectAnim and buffFighter:getValue() < 4 then
				buffFighter:addBuffs(buff)
				buffFighter:refreshBuffIcons()
				buffFighter:setValue(buffFighter:getValue() + 1)
				dieEffectAnim:play("texiao0" .. buffFighter:getValue() * 2 - 1, 1)

				dieEffectAnim.timeScale = self.timeScale_

				dieEffectAnim:addListener("Complete", function()
					dieEffectAnim.timeScale = self.timeScale_

					dieEffectAnim:play("texiao0" .. buffFighter:getValue() * 2, 0)
				end)
			end
		end

		if buff.name == xyd.BUFF_APATE_HURT then
			local layer = buffFighter:getLayerByType(xyd.BaseFightLayerType.BUFF_TOP)
			local dieEffect = layer:NodeByName("fuhuo_fx1")
			local dieEffectAnim = dieEffect.gameObject:GetComponent(typeof(SpineAnim))

			if dieEffectAnim then
				buffFighter:stop(dieEffectAnim)
				dieEffectAnim:play("texiao03", 1)
				buffFighter:startAtFrame(dieEffectAnim, 0)

				dieEffectAnim.timeScale = self.timeScale_

				dieEffectAnim:addListener("Complete", function()
					dieEffectAnim.timeScale = self.timeScale_

					buffFighter:stop(dieEffectAnim)
					dieEffectAnim:play("texiao02", 0)
					buffFighter:startAtFrame(dieEffectAnim, 0)
				end)
			end
		end

		if self:checkGodBuff(buff) and buff.name ~= xyd.BUFF_REVIVE and buff.name ~= xyd.BUFF_ENERGY and buff.name ~= xyd.BUFF_APATE_REVIVE then
			local result = {
				value = xyd.getBattleNum(buff.value),
				isMiss = buff.type == xyd.BuffType.MISS,
				isCrit = buff.type == xyd.BuffType.CRIT,
				isFree = buff.type == xyd.BuffType.FREE,
				isBlock = buff.is_block == 1,
				hp = buff.hp == nil and -1 or buff.hp,
				shieldCost = xyd.getBattleNum(buff.shieldCost)
			}

			if DBuffTable:getIsHpChange(buff.name) == 2 then
				result.hp = -1
			end

			local actee = self.team[buff.pos]

			if not result.isMiss and result.value and result.hp >= 0 and tonumber(frame.skill_id) > 0 then
				local isEnemy = actor:getTeamType() ~= actee:getTeamType()

				if isEnemy and not self:checkHasFreeHarm(buffs, buff.pos) and not self:checkHasExceptDotShield(buffs, buff) and self:checkPlayAttacked(buff.name) and actee.hp > 0 then
					actee:attacked()
				end
			end

			if result.hp >= 0 and not actee:isDeath() then
				actee:updateHp(result.hp)
			end

			if buff.shield then
				actee:updateShieldHpBar(buff.shield)
			end

			local firstName = EffectTable:getType(buff.table_id)

			if not buff.table_id then
				firstName = buff.name
			end

			local isDmg = DBuffTable:isDmg(firstName)
			local mpKey = self:getMpKey(buff)

			if SkillTable:getIsAddEnergy(buff.skill_id) == 1 then
				isDmg = false
			elseif SkillTable:getIsAddEnergy(buff.skill_id) == 2 then
				isDmg = true
			end

			if buffFighter and DBuffTable:isDmgRestarints(firstName) and GroupTable:isRestraint(buffFighter, actee) then
				result.isRestarint = true
			end

			if buff.buffOn == self.BUFF_ON_WORK or buff.buffOn == self.BUFF_WORK or self:checkBuffPlayEffect(buff) then
				actee:playBuffEffect(buff.name, buffFighter)
			end

			if buff.buffOn == self.BUFF_OFF and buff.name == xyd.BUFF_DOT_POISON then
				actee:playBuffEffect(buff.name, buffFighter)
			end

			if buff.name == xyd.BUFF_TRANSFORM_BK then
				actee.isHoldEnergyPose = false

				actee:playTransform(result.value)
			end

			if (result.hp >= 0 and result.value and buff.buffOn ~= self.BUFF_REMOVE and not self:checkNoRecordNum(buff.name) or result.isMiss or result.isFree or result.shieldCost) and (result.value > 0 or not self:checkHasExceptDotShield(buffs, buff)) then
				actee:recordDamageNumber(result)
			end

			if buff.buffOn == self.BUFF_ON or buff.buffOn == self.BUFF_ON_WORK then
				actee:addBuffs({
					name = buff.name,
					value = result.value,
					table_id = buff.table_id
				})
			elseif buff.buffOn == self.BUFF_OFF or buff.buffOn == self.BUFF_REMOVE then
				actee:removeBuffs({
					name = buff.name,
					value = result.value
				})

				if buff.name == xyd.BUFF_CIMPRESS or buff.name == xyd.BUFF_RIMPRESS or buff.name == xyd.BUFF_RIMPRESS_HP_LIMIT or buff.name == xyd.BUFF_GET_HEAL_CURSE or buff.name == xyd.BUFF_FEISINA_EXPLODE or buff.name == xyd.BUFF_FULL_ENERGY_HURT then
					actee:playBuffEffect(tostring(buff.name) .. "B", buffFighter)
				end
			end

			if buff.name == xyd.BUFF_GET_LEAF then
				actee:playGetLeaf(buff.name, buff.buffOn == self.BUFF_ON, false)
			end

			if buff.name == xyd.BUFF_EXCHANGE_SPD then
				if buff.buffOn == self.BUFF_ON then
					actee:playExchangeSpd(buff.name)
				else
					actee:removeBuff(buff.name)
				end
			end

			if buff.name == xyd.BUFF_ENERGY_SKILL_HOLD and buff.buffOn == self.BUFF_ON then
				actee:holdEnergyPose()
			end

			if buff.name == xyd.BUFF_ENERGY_SKILL_LIMIT and buff.buffOn == self.BUFF_ON then
				actee.isHoldEnergyPose = false
			end

			if result.hp == 0 then
				anyDead = true

				if self:checkFakeDeath(actee) then
					actee:removeBuff(xyd.BUFF_FEISINA_EXPLODE)
				elseif buff.name == xyd.BUFF_EAT then
					actee:die3()
				else
					local keepC = self:keepCorpse(actee)

					if keepC == 1 then
						actee:die2()
					elseif keepC == 2 then
						actee:die4()
					elseif keepC == 5 then
						actee:die5()
					else
						actee:die()
					end
				end
			end
		end
	end

	if isRoundEnd ~= true then
		self:refreshTeam(frame)
	end

	return anyDead
end

function BattleWindow:checkGodBuff(buff)
	if buff.pos ~= 15 then
		return true
	end

	if buff.name == xyd.BUFF_BOSS_STORM then
		return true
	end
end

function BattleWindow:checkNoRecordNum(buffName)
	if buffName == xyd.BUFF_REVIVE_INF or buffName == xyd.BUFF_TRANSFORM_BK or buffName == xyd.BUFF_DEBUFF_CLEAN or buffName == xyd.BUFF_TRANSFORM_BK or buffName == xyd.BUFF_FREE_HARM or buffName == xyd.BUFF_EAT_FREEHARM or buffName == xyd.BUFF_DEBUFF_TRANS_ALL or buffName == xyd.BUFF_GET_REFLECT or buffName == xyd.BUFF_IMMENU or buffName == xyd.BUFF_CLEAR or buffName == xyd.BUFF_DEBUFF_CLEAN_2_LIMIT or buffName == xyd.BUFF_GET_ABSORB_SHIELD or buffName == xyd.BUFF_TIME_RULE or buffName == xyd.BUFF_GET_HEAL_CURSE then
		return true
	end

	return false
end

function BattleWindow:checkHasFreeHarm(buffs, acteePos)
	local flag = false
	local freeHarmBuffOff = false

	for _, buff in ipairs(buffs) do
		if buff.pos == acteePos and buff.name == xyd.BUFF_FREE_HARM then
			if buff.buffOn ~= self.BUFF_OFF then
				flag = true
			else
				freeHarmBuffOff = true
			end
		end
	end

	if flag and freeHarmBuffOff then
		flag = false
	end

	return flag
end

function BattleWindow:checkHasExceptDotShield(buffs, buff)
	local acteePos = buff.pos
	local flag = false
	local dotShieldBuffOff = false

	for _, buff in ipairs(buffs) do
		if buff.pos == acteePos and buff.name == xyd.BUFF_EXCEPT_DOT_SHIELD then
			if buff.buffOn ~= self.BUFF_OFF then
				flag = true
			else
				dotShieldBuffOff = true
			end
		end
	end

	if flag and dotShieldBuffOff then
		flag = false
	end

	if self:buffIsDot(buff.name) and buff.isHarm and buff.isHarm == 0 then
		flag = false
	end

	return flag
end

function BattleWindow:checkPlayAttacked(buffName)
	if buffName == xyd.BUFF_XIFENG_SPD then
		return false
	end

	return true
end

function BattleWindow:getMpKey(buff)
	local skill_id = tonumber(buff.skill_id)

	skill_id = skill_id or "nil"

	local key = skill_id .. "|" .. buff.pos

	if buff.f_pos then
		key = key .. "|" .. buff.f_pos
	end

	return key
end

function BattleWindow:checkSkillIsCrit(mpKey, index, buffs)
	local isCrit = false

	for i = index + 1, #buffs do
		local buff = buffs[i]
		local tmpKey = self:getMpKey(buff)
		local isDmg = DBuffTable:isDmg(buff.name)

		if isDmg and mpKey == tmpKey and buff.type == xyd.BuffType.CRIT then
			isCrit = true

			break
		end
	end

	return isCrit
end

function BattleWindow:checkBuffPlayEffect(buff)
	if buff.buffOn == self.BUFF_ON then
		local isDot = DBuffTable:isDot(buff.name)

		if isDot or buff.name == xyd.BUFF_CIMPRESS or buff.name == xyd.BUFF_RIMPRESS or buff.name == xyd.BUFF_RIMPRESS_HP_LIMIT or buff.name == xyd.BUFF_FIMPRESS or buff.name == xyd.BUFF_OIMPRESS or buff.name == xyd.BUFF_SHIELD or buff.name == xyd.BUFF_FREE_SHIELD_LIMIT5 or buff.name == xyd.BUFF_DEC_DMG_SHIELD_LIMIT5 or buff.name == xyd.BUFF_FRIGHTEN or buff.name == xyd.BUFF_MIND_CONTROL or buff.name == xyd.BUFF_BIMPRESS_LIMIT30 or buff.name == xyd.BUFF_CRYSTALL or buff.name == xyd.BUFF_MARK_CRYSTAL or buff.name == xyd.BUFF_CRYSTALLIZE or buff.name == xyd.BUFF_MOON_SHADOW or buff.name == xyd.BUFF_STAR_MOON or buff.name == xyd.BUFF_WEI_WEI_AN_HEAL or buff.name == xyd.BUFF_HURT_BY_RECEIVE or buff.name == xyd.BUFF_FRAGRANCE_GET or buff.name == xyd.BUFF_HURT_SHIELD_LIMIT1 or buff.name == xyd.BUFF_HURT_SHIELD_LIMIT2 or buff.name == xyd.BUFF_HURT_SHIELD_LIMIT3 or buff.name == xyd.BUFF_GET_LIGHT or buff.name == xyd.BUFF_ADD_GET_LIGHT or buff.name == xyd.BUFF_GET_ABSORB_SHIELD or buff.name == xyd.BUFF_GET_HEAL_CURSE or buff.name == xyd.BUFF_WULIEER_SEAL or buff.name == xyd.BUFF_EXCHANGE_SPD or buff.name == xyd.BUFF_GET_THORNS or buff.name == xyd.BUFF_GET_LEAF or buff.name == xyd.BUFF_FULL_ENERGY_HURT or buff.name == xyd.BUFF_APATE_ENERGY_HURT or buff.name == xyd.BUFF_FEISINA_MISS or buff.name == xyd.BUFF_ABSORB_DAMAGE then
			return true
		end
	elseif buff.buffOn == self.BUFF_OFF and (buff.name == xyd.BUFF_HOT_HUATUO or buff.name == xyd.BUFF_DOT_TWINS) then
		return true
	end

	return false
end

function BattleWindow:getFinalBossHit()
	self.finalBossHitFrameIndex = 0

	for i = #self.frames, 1, -1 do
		local frame = self.frames[i]
		local actees = {}

		for _, id in ipairs(frame.targets) do
			if xyd.arrayIndexOf(actees, id) < 0 then
				table.insert(actees, id)
			end
		end

		for _, id in ipairs(frame.targets_2) do
			if xyd.arrayIndexOf(actees, id) < 0 then
				table.insert(actees, id)
			end
		end

		for index = 1, #actees do
			local id = actees[index]
			local fighter = self.team[id]

			if fighter and fighter:getTeamType() == 2 then
				self.finalBossHitFrameIndex = i

				break
			end
		end

		if self.finalBossHitFrameIndex ~= 0 then
			break
		end
	end
end

function BattleWindow:refreshTeam(frame)
	local skillID = tonumber(frame.skill_id)
	local fighter = self.team[frame.pos]

	if fighter and frame.pos ~= 15 then
		local isShake = SkillTable:isShake(skillID, fighter:getSkillIndex())
		local shakeTime = SkillTable:shakeTime(skillID, fighter:getSkillIndex())

		if isShake and (not shakeTime or shakeTime == "") then
			self:playShake()
		end
	end

	local actees = {}

	for _, id in ipairs(frame.targets) do
		if xyd.arrayIndexOf(actees, id) < 0 then
			table.insert(actees, id)
		end
	end

	for _, id in ipairs(frame.targets_2) do
		if xyd.arrayIndexOf(actees, id) < 0 then
			table.insert(actees, id)
		end
	end

	for index = 1, #actees do
		local id = actees[index]
		local fighter = self.team[id]

		if fighter then
			local totalHarm = fighter:playAllDamageNumbers()

			if self:checkNeedTrialBossBar() and fighter:getTeamType() == 2 then
				self:bossHurt(totalHarm)
			end

			if self:checkNeedIceBossBar() and fighter:getTeamType() == 2 then
				self:bossHurt(totalHarm)
			end

			if self:checkNeedLimitBossBar() and fighter:getTeamType() == 2 then
				self:bossHurt(totalHarm)
			end

			if self:checkShrineHurdle() and fighter:getTeamType() == 2 then
				self:bossHurt(totalHarm)
			end

			fighter:refreshBuffIcons()
			fighter:clearBuffOff()
		end
	end
end

function BattleWindow:checkBossBar()
	if self.realBossHarm and self.frameIndex >= self.finalBossHitFrameIndex then
		self.BossHarm = self.realBossHarm
		self.BossShowedHarm = self.BossHarm - 1
	end

	local RewardTable = self.rewardTable
	local barSpeed = 20

	if self.BossShowedHarm < self.BossHarm then
		RewardTable = RewardTable or xyd.tables.activityLimitBossAwardTable

		local awardIDs = RewardTable:getIds()
		local nowLev = RewardTable:getLevByDamage(self.BossShowedHarm)
		local allDamage = RewardTable:getDamageToBoss(nowLev + 1)
		local alreadyLevDamage = RewardTable:getDamageToBoss(nowLev)
		local additionNum = (allDamage - alreadyLevDamage) / barSpeed

		if additionNum == 0 then
			local maxId = #awardIDs

			additionNum = (RewardTable:getDamageToBoss(maxId) - RewardTable:getDamageToBoss(maxId - 1)) / barSpeed
		end

		if self.BossShowedHarm + additionNum > self.BossHarm then
			additionNum = self.BossHarm - self.BossShowedHarm
		end

		local nowDamage = self.BossShowedHarm + additionNum
		local isFinalLev = false

		if nowLev + 1 > #awardIDs then
			isFinalLev = true
		end

		if allDamage < nowDamage then
			allDamage = RewardTable:getDamageToBoss(nowLev + 2)
			alreadyLevDamage = RewardTable:getDamageToBoss(nowLev + 1)

			if nowLev + 2 > #awardIDs then
				isFinalLev = true
			end
		end

		local value = (nowDamage - alreadyLevDamage) / (allDamage - alreadyLevDamage)

		nowDamage = math.floor(nowDamage)

		if not isFinalLev and (value == 1 or value < self.bossHpBar.value) then
			self:playTrialAwardEffect(nowLev + 1)
		end

		self.bossHpBar.value = value
		self.bossHpBarText.text = xyd.getDisplayNumber(nowDamage) .. " / " .. xyd.getDisplayNumber(allDamage)

		if isFinalLev then
			self.bossHpBar.value = 1

			local finalDamage = RewardTable:getDamageToBoss(#awardIDs)

			self.bossHpBarText.text = xyd.getDisplayNumber(nowDamage) .. " / " .. xyd.getDisplayNumber(finalDamage)
		end

		self.trialAwardLevText.text = RewardTable:getLevByDamage(nowDamage)
		self.BossShowedHarm = self.BossShowedHarm + additionNum
	end

	if self.data_.battle_type == xyd.BattleType.SHRINE_HURDLE and self:checkShrineHurdle() then
		self:finalShowShrineHarm(self.BossShowedHarm)
	end
end

function BattleWindow:playTrialAwardEffect(id)
	if self.AwardId == id then
		return
	end

	self.AwardId = id

	local effectArr = NewTrialRewardTable:getRewardsEffect(id)

	if self.trialAwardEffect then
		self.trialAwardEffect:play(effectArr[1], 1, 1, function()
			self.trialAwardEffect:play(effectArr[2], 0)
		end)
	end
end

function BattleWindow:bossHurt(hurtNum)
	if hurtNum > 0 then
		return
	end

	local harmNum = -hurtNum
	local maxHarm = 0
	local hurts = self.battleReport_.hurts

	for _, hurtData in ipairs(hurts) do
		local pos = tostring(hurtData.pos)

		if tonumber(pos) <= 6 or tonumber(pos) == 13 then
			local hurt = xyd.getBattleNum(hurtData.hurt)

			maxHarm = maxHarm + hurt
		end
	end

	self.realBossHarm = maxHarm

	if self.frameIndex >= self.finalBossHitFrameIndex then
		self.BossHarm = maxHarm
		self.BossShowedHarm = self.BossHarm - 1

		self:checkBossBar()
	elseif maxHarm < self.BossHarm + harmNum then
		self.BossHarm = self.BossHarm + (maxHarm - self.BossHarm) / 2
	else
		self.BossHarm = self.BossHarm + harmNum
	end
end

function BattleWindow:checkFakeDeath(fighter)
	local id = fighter:getHeroTableID()
	local table = PartnerTable
	local effects = {}

	for i = 1, 3 do
		local pasSkill = table:getPasSkill(id, i)

		if pasSkill ~= nil and pasSkill ~= 0 then
			for j = 1, 3 do
				effects = xyd.tableConcat(effects, SkillTable:getEffect(pasSkill, j))
			end
		end
	end

	for _, effect in ipairs(effects) do
		if EffectTable:getType(effect) == xyd.BUFF_REVIVE_INF then
			return true
		end
	end
end

function BattleWindow:keepCorpse(fighter)
	local frame = self.frames[self.frameIndex]
	local selectIndex = 0
	local hasBuff = false

	for _, buff in ipairs(frame.buffs) do
		if buff.pos == fighter:getPosIndex() and buff.name == xyd.BUFF_REVIVE and buff.buffOn == self.BUFF_ON then
			if tonumber(buff.value) > 0 then
				if tonumber(buff.value) == selectIndex then
					hasBuff = true
				else
					selectIndex = selectIndex + 1
				end
			else
				hasBuff = true
			end

			if hasBuff then
				local effectArr = EffectTable:getNum(buff.table_id, true)

				if effectArr and #effectArr == 3 then
					return 5
				else
					return 1
				end
			end
		end

		if buff.pos == fighter:getPosIndex() and buff.name == xyd.BUFF_APATE_REVIVE and buff.buffOn == self.BUFF_ON then
			return 2
		end
	end

	return 0
end

function BattleWindow:checkAnyRevive(frame)
	local time = 0

	for _, b in ipairs(frame.buffs) do
		if b.name == xyd.BUFF_REVIVE and (b.buffOn == self.BUFF_WORK or b.buffOn == self.BUFF_ON_WORK) then
			time = math.max(time, 1)
		end

		if b.name == xyd.BUFF_APATE_REVIVE and b.buffOn == self.BUFF_OFF then
			time = math.max(time, 2)
		end
	end

	return time
end

function BattleWindow:processRevive(frame)
	local hasEnergyBuff = false

	for b in __TS__Iterator(frame.buffs) do
		if b.name == xyd.BUFF_ENERGY then
			hasEnergyBuff = true

			break
		end
	end

	for b in __TS__Iterator(frame.buffs) do
		if b.name == xyd.BUFF_REVIVE and (b.buffOn == self.BUFF_WORK or b.buffOn == self.BUFF_ON_WORK) then
			local actee = self.team[b.pos]

			if actee then
				actee:updateHp(b.hp)

				if not hasEnergyBuff then
					actee:updateEnergy(0)
				end

				actee:revive()
				actee:playGetLeaf("", false, true)
			end
		end

		if b.name == xyd.BUFF_APATE_REVIVE and b.buffOn == self.BUFF_OFF then
			local actee = self.team[b.pos]

			if actee then
				actee:updateHp(b.hp)
				actee:updateEnergy(100)
				actee:apateRevive(b.buffOn, b.value)
				actee:playGetLeaf("", false, true)
			end
		end
	end
end

function BattleWindow:checkEnds()
	self:resetZorders()

	if self.battleEnds == true then
		return true
	end

	if (not xyd.Battle.unAuto or self.unAutoEnd_) and self.frameIndex == #self.frames then
		self.battleEnds = true

		if self:checkPlayAfterStory() then
			self:playStory(3, function()
				self:playBattleResult()
			end)

			return true
		end

		self:playBattleResult()

		return true
	elseif xyd.Battle.unAuto and not self.frames[self.frameIndex + 1] then
		self:showUnAutoBtn(true)

		return
	end

	self:mainLoop()

	return false
end

function BattleWindow:resetZorders()
	for pos, v in pairs(self.team) do
		if tonumber(pos) <= 12 then
			v:resetZOrder()
		end
	end
end

function BattleWindow:checkCanSkip()
	if self.data_.battle_type == xyd.BattleType.GUILD_WAR or self.data_.battle_type == xyd.BattleType.SKIN_PLAY or self.data_.battle_type == xyd.BattleType.PARTNER_STATION or self.data_.battle_type == xyd.BattleType.TEST then
		return true
	end

	local lev = xyd.models.backpack:getLev()
	local needLev = xyd.tables.miscTable:getNumber("battle_skip_level", "value")
	local towerLev = xyd.tables.miscTable:getNumber("tower_skipfight_level", "value")

	if self.data_.battle_type == xyd.BattleType.TOWER and towerLev <= lev and not self.isTouchSkip_ then
		return true
	elseif lev < needLev then
		xyd.alertTips(__("BATTLE_SKIP_ERROR"))

		return false
	end

	if self.isTouchSkip_ then
		return false
	end

	return true
end

function BattleWindow:isHideSkip()
	local battleType = self.data_.battle_type
	local stageID = self.data_.stage_id

	if self.data_.event_data and self.data_.event_data.stage_id then
		stageID = self.data_.event_data.stage_id
	end

	local isHide = false

	if battleType == xyd.BattleType.CAMPAIGN or battleType == xyd.BattleType.HERO_CHALLENGE and xyd.models.heroChallenge:checkHideSkip(stageID) or battleType == xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT then
		isHide = true
	end

	return isHide
end

function BattleWindow:touchSkip()
	if not self:checkCanSkip() then
		return false
	end

	self.isTouchSkip_ = true

	self:openSkipWindow()
end

function BattleWindow:openSkipWindow()
	self.isTouchSkip_ = false

	self:stopBattle()
	xyd.alertYesNo(__("SKIP_BATTLE"), function(yes)
		local wnd = xyd.WindowManager.get():getWindow("battle_window")

		if wnd then
			if yes then
				if self:checkPlayAfterStory() then
					self:playStory(3, function()
						self:playBattleResult()
					end)

					return
				end

				wnd:playBattleResult(true)
			else
				wnd:resumeBattle()

				if not wnd.isBattleStart_ then
					wnd:mainLoop()
				end
			end
		end
	end)
end

function BattleWindow:playBattleResult(isSkip)
	if isSkip == nil then
		isSkip = false
	end

	xyd.SoundManager.get():stopBg()

	if #self.soundEffects_ > 0 then
		for id = 1, #self.soundEffects_ do
			local effect = self.soundEffects_[id]

			effect:stopSound()
		end
	end

	local battleType = self.data_.battle_type

	if xyd.Global.isReview == 0 and (battleType == xyd.BattleType.CAMPAIGN or battleType == xyd.BattleType.HERO_CHALLENGE or battleType == xyd.BattleType.HERO_CHALLENGE_CHESS or battleType == xyd.BattleType.LIBRARY_WATCHER_STAGE_FIGHT) then
		local stageId = self.data_.stage_id
		local data = self.data_

		data.real_battle_report = self.battleReport_

		if self.data_.event_data and self.data_.event_data.stage_id then
			stageId = self.data_.event_data.stage_id
		end

		xyd.BattleController.get():playThirdStory(stageId, data, battleType)
	else
		local data = self.data_

		data.real_battle_report = self.battleReport_

		xyd.EventDispatcher:inner():dispatchEvent({
			name = xyd.event.BATTLE_END,
			data = data
		})
	end
end

function BattleWindow:didOpen(params)
	return
end

function BattleWindow:willClose()
	BattleWindow.super.willClose(self)
	self:clearConfig()
end

function BattleWindow:didClose()
	BattleWindow.super.didClose(self)
end

function BattleWindow:clearConfig()
	xyd.Global.retainDragonbones = {}

	for i in pairs(self.team) do
		local fighter = self.team[i]

		fighter:clearAction()
	end

	self:clearEffect()
	self:clearSounds()

	xyd.Global.battleMap = {}

	for i = 1, #self.actions do
		local action = self.actions[i]

		action:Pause()
		action:Kill()
	end

	self.actions = {}

	ResManager.ForceGCCollect()
end

function BattleWindow:clearEffect()
	local groupNames = {}

	for i in pairs(self.team) do
		if i ~= 15 then
			local fighter = self.team[i]
			local modelName = fighter:getModelName()

			if xyd.arrayIndexOf(groupNames, modelName) < 0 then
				table.insert(groupNames, modelName)
			end
		end
	end

	table.insert(groupNames, "buff")

	for i = 1, #groupNames do
		local modelName = groupNames[i]
		local names = ResourceEffectTable:getResNames(modelName)

		for _, name_ in ipairs(names) do
			local flag = BattleEffectFactory:clearEffects(name_, true)
		end
	end

	BattleEffectFactory:clearEffectList()
end

function BattleWindow:clearSounds()
	return
end

function BattleWindow:schedule(time, callback)
	time = xyd.checkCondition(time > 0, time, 0)

	if time == 0 then
		if callback ~= nil then
			callback()
		end

		return
	end

	local complete

	function complete()
		if callback ~= nil then
			callback()
		end
	end

	local action = self:getTimeLineLite()

	action:AppendInterval(time)
	action:AppendCallback(complete)
end

function BattleWindow:getEnemyActor(actor, actees1)
	for k, v in ipairs(actees1) do
		if actor.posIndex <= 6 and v.posIndex > 6 and v.posIndex <= 12 then
			return v
		elseif v.posIndex <= 6 and actor.posIndex > 6 and actor.posIndex <= 12 then
			return v
		end
	end

	return actees1[1]
end

function BattleWindow:playActor(frame, actor, skillID, actees1, actees2)
	local attack = false
	local liubeiFragranceAtk = false

	if actor then
		if actor:checkSkillHasAddHurtFreeArm(skillID) == 2 then
			liubeiFragranceAtk = true
		elseif actor:checkIsAttack(skillID) then
			attack = true
		end
	end

	if actor and (actor:isLiuBeiAttack(skillID) or not actor.parent.activeInHierarchy) then
		liubeiFragranceAtk = true
	end

	if actor:isHasBuff(xyd.BUFF_NUOLISI_ADD_RATE) or actor:isHasBuff(xyd.BUFF_LUOBI_PRE_COMBOL) then
		liubeiFragranceAtk = true
	end

	local tAttack = 0
	local tFxHurt = 0
	local changeTime = {}

	if actor:checkIsMindControl(skillID) then
		skillID = actor:getPugongID()
	end

	if attack == true then
		tAttack = actor:getAttackTime(skillID, actees1)
		changeTime = actor:getChangeTime(skillID)
	end

	tFxHurt = actor:getHurtTime(skillID)

	local tRdFxHurt = actor:getSpeedReduce(skillID)
	local tJump = 0
	local tBack = 0
	local heroPosType = SkillTable:heroPosType(skillID, actor:getSkillIndex())
	local shakeTime = SkillTable:shakeTime(skillID, actor:getSkillIndex())
	local delayBack = tAttack - (changeTime[2] or 0) / 30

	if attack and SkillTable:jump(skillID, actor:getSkillIndex()) == 1 then
		tJump = 0.12
		tBack = 0.05

		local z2 = (xyd.UNIT_ZORDERS[1] + xyd.UNIT_ZORDERS[2]) / 2
		local heroPos = self.herosPos_[actor:getPosIndex()]
		local p1 = Vector3(heroPos.x, heroPos.y, 0)
		local p2

		if SkillTable:jump(skillID, actor:getSkillIndex()) == 1 then
			local actee

			if #actees1 > 0 then
				actee = self:getEnemyActor(actor, actees1)
			elseif #actees2 > 0 then
				actee = actees2[1]
			end

			local delta = SkillTable:jumpDelta(skillID, actor:getSkillIndex())

			if not delta or not delta[1] or not delta[2] then
				delta = {
					0,
					0
				}
			end

			if actee ~= nil then
				local parentPos = actee:getParentPos()

				if actor:getTeamType() == xyd.TeamType.A then
					p2 = Vector3(parentPos.x - 113.9 + actee:getXOffset() + delta[1], parentPos.y + delta[2], 0)
				else
					p2 = Vector3(parentPos.x + 113.9 - delta[1], parentPos.y + delta[2], 0)
				end

				z2 = actee:getParentCurDepth() + 1
			end

			p2 = p2 or p1
		end

		local transform = actor:getParent().transform
		local jumpAction = self:getTimeLineLite()

		jumpAction:Append(transform:DOLocalMove(p2, tJump, true)):AppendCallback(function()
			actor:setZOrder(z2)
		end):AppendInterval(delayBack):Append(transform:DOLocalMove(p1, tBack)):AppendCallback(function()
			actor:resetZOrder()
		end)
	elseif attack and heroPosType > 0 then
		tJump, tBack = self:playActorPosAction(actor, heroPosType, delayBack, skillID)
	end

	if actor and attack == true and actor.parent.activeInHierarchy then
		self:schedule(tJump, function()
			local soundId = actor:getSound(skillID)
			local ifAheadPlaySound = xyd.tables.soundTable:isPlaySelf(soundId)

			if ifAheadPlaySound then
				actor:playSound(skillID)
			end

			if skillID == actor:getEnergyID() then
				local fx = SkillTable:getSkillEffects(skillID)

				if fx > 0 then
					actor:playOne(fx, actor)
				end
			end

			actor:playAttack(skillID, actees1, function(event)
				if event ~= nil and event.Data.Name == "hit" then
					if tBack > 0 then
						tAttack = tAttack - event.Time
					else
						tAttack = 0.3
					end

					tAttack = math.max(tAttack, 0.3)

					self:updateActorEnergy(actor, frame)
					actor:playAll(skillID, actees1)

					if shakeTime and shakeTime ~= "" then
						local tmpShakeTime = xyd.split(shakeTime, "|", true)

						self:schedule(tmpShakeTime[1] / 30, function()
							self:playShake(tmpShakeTime[2])
						end)
					end

					self:schedule(tFxHurt - tRdFxHurt, function()
						local res = self:playHurtEffects(frame)
						local a = 0

						if res > 0 then
							a = res

							self:schedule(res, function()
								self:playOtherPlayerAction(frame)
								self:updateAllBuffs(frame)
								self:resetEnergyMask()
							end)
						else
							self:playOtherPlayerAction(frame)
							self:updateAllBuffs(frame)
							self:resetEnergyMask()
						end

						res = res + self:getPlayOtherPlayerActionTime(frame)

						local b = tBack + tAttack - (changeTime[1] or 0) / 30 + res

						if b < a then
							print("hurt to slow=====================", a)
						end

						local fxs = SkillTable:getFxHurt1(skillID, actor:getSkillIndex())
						local tableRes = 0

						for k, fx in ipairs(fxs) do
							if FxTable:getHurtSecondDelay(fx) then
								tableRes = tableRes + FxTable:getHurtSecondDelay(fx) / 30
							end
						end

						res = tBack + tAttack - (changeTime[1] or 0) / 30 + res

						if tableRes ~= 0 then
							res = tableRes - (changeTime[1] or 0) / 30
						end

						self:schedule(res, function()
							self:checkEnds()
						end)
					end)

					if not ifAheadPlaySound then
						actor:playSound(skillID)
					end
				end
			end)

			if skillID == actor:getEnergyID() and self.frameIndex > 0 then
				self:showDialog({
					actor
				}, xyd.PartnerBattleDialog.SKILL_DIALOG)
			end
		end)
	elseif actor and liubeiFragranceAtk then
		self:schedule(tFxHurt - tRdFxHurt, function()
			local tAttack = 0.3
			local res = self:playHurtEffects(frame)

			if res > 0 then
				self:schedule(res, function()
					self:playOtherPlayerAction(frame)
					self:updateAllBuffs(frame)
					self:resetEnergyMask()
				end)
			else
				self:playOtherPlayerAction(frame)
				self:updateAllBuffs(frame)
				self:resetEnergyMask()
			end

			res = res + self:getPlayOtherPlayerActionTime(frame)

			self:schedule(tBack + tAttack - (changeTime[1] or 0) / 30 + res, function()
				self:checkEnds()
			end)
		end)
	else
		self:schedule(0.2, function()
			local anyDead = self:updateAllBuffs(frame)
			local anyRevive = self:checkAnyRevive(frame)
			local tDead = 0.2
			local tRevive = 1.3

			if anyDead == 2 then
				tDead = 3
				anyDead = true
			end

			if anyRevive == 2 then
				tRevive = 3
			end

			anyRevive = anyRevive ~= 0

			if anyRevive then
				local tProcessRevive = xyd.checkCondition(anyDead, tDead, 0)

				self:schedule(tProcessRevive, function()
					self:processRevive(frame)
				end)
			end

			local tNext = xyd.checkCondition(anyRevive, xyd.checkCondition(anyDead, tDead + tRevive, tRevive), 0)

			tNext = tNext + self:getCurFrameBuffEffectTime(frame)

			self:schedule(tNext + 0.26, function()
				self:checkEnds()
			end)
		end)
	end

	if actor and skillID == actor:getEnergyID() and actor:isBlackScreen(skillID) then
		self:setEnergyMask(actor, actees1)
	end
end

function BattleWindow:getSkillAnimationName(buff)
	local actionName

	if buff.f_pos and self.team[buff.f_pos] and tonumber(buff.skill_id) and tonumber(buff.skill_id) ~= 0 then
		local buffFighter = self.team[buff.f_pos]
		local pos = buff.pos

		if pos > xyd.TEAM_B_POS_BASIC then
			pos = pos - xyd.TEAM_B_POS_BASIC
		end

		local animation = SkillTable:animation(tonumber(buff.skill_id), buffFighter:getSkillIndex())

		if animation then
			if animation[pos] then
				actionName = animation[pos]
			elseif animation[1] then
				actionName = animation[1]
			end
		end
	end

	return actionName
end

function BattleWindow:getPlayOtherPlayerActionTime(frame)
	local buffs = frame.buffs
	local curFighterPos_ = frame.pos
	local t_ = 0

	for id, __ in ipairs(buffs) do
		local buff = buffs[id]

		if (not buff.f_pos or buff.f_pos ~= curFighterPos_) and buff.buffOn ~= self.BUFF_REMOVE and buff.buffOn ~= 5 then
			local actionName = self:getSkillAnimationName(buff)

			if actionName then
				local buffFighter = self.team[buff.f_pos]
				local tmpT = buffFighter:getAnimationTime(actionName)

				t_ = xyd.checkCondition(t_ < tmpT, tmpT, t_)
			end
		end
	end

	return t_
end

function BattleWindow:playOtherPlayerAction(frame)
	local buffs = frame.buffs
	local curFighterPos_ = frame.pos

	for id, _ in ipairs(buffs) do
		local buff = buffs[id]

		if (not buff.f_pos or buff.f_pos ~= curFighterPos_) and buff.buffOn ~= self.BUFF_REMOVE and buff.buffOn ~= 5 then
			local actionName = self:getSkillAnimationName(buff)

			if actionName then
				local buffFighter = self.team[buff.f_pos]

				buffFighter:playOnlyAnimation(actionName)
			end
		end
	end
end

function BattleWindow:playRoundEndAction(frame)
	local buffs = frame.buffs

	for id, _ in ipairs(buffs) do
		local buff = buffs[id]

		if buff.buffOn ~= self.BUFF_REMOVE and buff.buffOn ~= self.BUFF_OFF and buff.buffOn ~= 5 then
			local actionName = self:getSkillAnimationName(buff)

			if actionName then
				local buffFighter = self.team[buff.f_pos]

				buffFighter:playOnlyAnimation(actionName)
			end
		end
	end
end

function BattleWindow:getRoundEndAction(frame)
	local buffs = frame.buffs
	local t_ = 0

	for id, _ in ipairs(buffs) do
		local buff = buffs[id]

		if buff.buffOn ~= self.BUFF_REMOVE and buff.buffOn ~= self.BUFF_OFF and buff.buffOn ~= 5 then
			local actionName = self:getSkillAnimationName(buff)

			if actionName then
				local buffFighter = self.team[buff.f_pos]
				local tmpT = buffFighter:getAnimationTime(actionName)

				t_ = xyd.checkCondition(t_ < tmpT, tmpT, t_)
			end
		end
	end

	return t_
end

function BattleWindow:setEnergyMask(actor, actees1)
	self.rectEnergyMask_:SetActive(true)

	for id in pairs(self.team) do
		local child = self.team[id]
		local flag = true

		if child == actor or xyd.arrayIndexOf(actees1, child) > -1 then
			flag = false
		end

		child:setMaskColor(flag)
	end
end

function BattleWindow:resetEnergyMask(actor, actees1)
	self.rectEnergyMask_:SetActive(false)

	for id in pairs(self.team) do
		local child = self.team[id]

		child:setMaskColor(false)
	end
end

function BattleWindow:playActorPosAction(actor, heroPosType, delayBack, skillID)
	local tJump = 0
	local tBack = 0
	local w = actor:getParent():GetComponent(typeof(UIWidget))

	local function getter()
		return w.color
	end

	local function setter(value)
		w.color = value
	end

	local heroPosTypeXY = SkillTable:heroPosTypeXY(skillID, actor:getSkillIndex())

	if heroPosType == 1 then
		local center = {
			x = heroPosTypeXY[1],
			y = -heroPosTypeXY[2]
		}

		tJump = 0.2

		local z2 = 0
		local index1 = 1
		local index2 = 2
		local headView = actor:getHeadView()

		if actor:getTeamType() == xyd.TeamType.B then
			index1 = 1 + xyd.TEAM_B_POS_BASIC
			index2 = 2 + xyd.TEAM_B_POS_BASIC
			center = {
				x = 720 - center.x,
				y = -heroPosTypeXY[2]
			}
		end

		if self.team[index2] then
			z2 = self.team[index2]:getParentCurDepth() + 1
		elseif self.team[index1] then
			z2 = self.team[index1]:getParentCurDepth() - 1
		end

		z2 = math.max(0, z2)

		local heroPos = self.herosPos_[actor:getPosIndex()]
		local p1 = Vector3(heroPos.x, heroPos.y, 0)
		local p2 = Vector3(center.x, center.y, 0)
		local transform = actor:getParent().transform
		local jumpAction = self:getTimeLineLite()

		jumpAction:Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 0, 0.1)):AppendCallback(function()
			actor:getParent():SetLocalPosition(p2.x, p2.y, p2.z)

			if headView then
				headView:SetActive(false)
			end

			actor:setZOrder(z2)
		end):Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 1, 0.1)):AppendInterval(delayBack):Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 0, 0.1)):AppendCallback(function()
			actor:getParent():SetLocalPosition(p1.x, p1.y, p1.z)

			if headView and not actor:getNeedHideHeadView() then
				headView:SetActive(true)
			end

			actor:resetZOrder()
		end):Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 1, 0.1))
	elseif heroPosType == 2 then
		local center = {
			x = heroPosTypeXY[1],
			y = -heroPosTypeXY[2]
		}

		tJump = 0

		local z2 = 0
		local index1 = 1
		local index2 = 2
		local headView = actor:getHeadView()

		if actor:getTeamType() == xyd.TeamType.B then
			index1 = 1 + xyd.TEAM_B_POS_BASIC
			index2 = 2 + xyd.TEAM_B_POS_BASIC
			center = {
				x = 720 - center.x,
				y = -heroPosTypeXY[2]
			}
		end

		if self.team[index2] then
			z2 = self.team[index2]:getParentCurDepth() + 1
		elseif self.team[index1] then
			z2 = self.team[index1]:getParentCurDepth() - 1
		end

		z2 = math.max(0, z2)

		local heroPos = self.herosPos_[actor:getPosIndex()]
		local transform = actor:getParent().transform
		local jumpAction = self:getTimeLineLite()

		jumpAction:AppendCallback(function()
			actor:getParent():SetLocalPosition(center.x, center.y, 0)

			if headView then
				headView:SetActive(false)
			end

			actor:setZOrder(z2)
		end):AppendInterval(delayBack):Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 0, 0.1)):AppendCallback(function()
			actor:getParent():SetLocalPosition(heroPos.x, heroPos.y, 0)

			if headView and not actor:getNeedHideHeadView() then
				headView:SetActive(true)
			end

			actor:resetZOrder()
		end):Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 1, 0.1))
	end

	return tJump, tBack
end

function BattleWindow:playPet(frame, actor, skillID, actees1, actees2)
	local attack = true
	local tFxMain = 0
	local tFxHurt = actor:getHurtTime()
	local tFxSelf = 0
	local nextTime = 1

	if actor and attack == true then
		actor:playEnergySkill()
		self:schedule(tFxHurt, function()
			local res = self:playHurtEffects(frame)

			if res > 0 then
				self:schedule(res, function()
					self:playOtherPlayerAction(frame)
					self:updateAllBuffs(frame)
				end)
			else
				self:playOtherPlayerAction(frame)
				self:updateAllBuffs(frame)
			end

			res = res + self:getPlayOtherPlayerActionTime(frame)

			self:schedule(res + nextTime, function()
				self:checkEnds()
			end)
		end)
		actor:playSound(skillID)
	end
end

function BattleWindow:showDialog(fighters, index)
	local curSoundEffects = {}
	local soundIDs = {}

	for i = 1, #fighters do
		local fighter = fighters[i]
		local headView = fighter:getHeadView()

		if headView then
			local flag = true
			local soundID = 0

			if index == xyd.PartnerBattleDialog.DEAD_DIALOG then
				local heroID = fighter:getHeroTableID()
				local sound = PartnerTable:getDeadSound(heroID, fighter:getSkin())

				soundID = sound.id or 0

				if xyd.arrayIndexOf(soundIDs, soundID) > -1 then
					flag = false
				end
			end

			if index == xyd.PartnerBattleDialog.SKILL_DIALOG and fighter:getTeamType() == xyd.TeamType.B then
				flag = false
			end

			local soundEffect = headView:showDialog(index, flag)

			if soundEffect then
				table.insert(curSoundEffects, soundEffect)

				if index == xyd.PartnerBattleDialog.DEAD_DIALOG and xyd.arrayIndexOf(soundIDs, soundID) < 0 then
					table.insert(soundIDs, soundID)
				end
			end
		end
	end

	if #curSoundEffects > 0 then
		for i = 1, #self.soundEffects_ do
			local soundEffect = self.soundEffects_[i]

			soundEffect:setVolume(0.5)
		end

		self.soundEffects_ = curSoundEffects
	end
end

function BattleWindow:playSounds()
	return
end

function BattleWindow:createShakeData(t)
	local data = {}
	local init_shake_x = 15
	local init_shake_y = 30
	local shake_x = {}
	local shake_y = {}

	do
		local i = 0

		while i < t do
			if math.random() < 0.5 then
				shake_x[2 * i - 1 + 1] = init_shake_x
			else
				shake_x[2 * i - 1 + 1] = -init_shake_x
			end

			if math.random() < 0.5 then
				shake_x[2 * i + 1] = init_shake_x
			else
				shake_x[2 * i + 1] = -init_shake_x
			end

			shake_y[2 * i - 1 + 1] = init_shake_y
			shake_y[2 * i + 1] = -init_shake_y
			i = i + 1
		end
	end

	return {
		shake_x,
		shake_y
	}
end

function BattleWindow:playShake(shakeTime)
	shakeTime = shakeTime or 3

	if self.shakeTimer_ then
		self.shakeTimer_:Stop()

		self.shakeTimer_ = nil
	end

	local data = {
		{
			x = 0,
			y = 0
		},
		{
			x = 10,
			y = 0
		},
		{
			x = 17,
			y = 5
		},
		{
			x = -10,
			y = 0
		},
		{
			x = 0,
			y = 5
		},
		{
			x = 15,
			y = 0
		},
		{
			x = 5,
			y = 2
		},
		{
			x = -5,
			y = 4
		},
		{
			x = 0,
			y = 0
		}
	}
	local count = 0

	local function callback()
		if count >= #data then
			self.imgBgBot_:SetLocalPosition(0, 0, 0)

			self.isShake_ = false

			return
		end

		self.imgBgBot_:SetLocalPosition(data[count + 1].x, data[count + 1].y, 0)

		count = count + 1
	end

	self.shakeTimer_ = self:getFrameTimer(callback, 1, #data)

	self.shakeTimer_:Start()

	self.isShake_ = true
end

function BattleWindow:updateActorEnergy(actor, frame)
	for id, _ in pairs(frame.buffs) do
		local buff = frame.buffs[id]

		if buff.f_ep and actor then
			actor:updateEnergy(buff.f_ep)
		end
	end

	if actor and actor:checkSkillIsPugong(tonumber(frame.skill_id)) then
		-- block empty
	elseif actor and actor:getEnergyID() == tonumber(frame.skill_id) then
		local flag = true

		if actor:isHasBuff(xyd.BUFF_FREE_SKILL) then
			local hasFreeSkill = actor:getFreeSkill()

			if hasFreeSkill then
				flag = false
			end

			actor:setFreeSkill(not hasFreeSkill)
		end
	end
end

function BattleWindow:playActee(actor, actee, skillID, name, isMiss, targetIndex)
	local t = 0
	local isEnemy = actor:getTeamType() ~= actee:getTeamType()

	if isEnemy then
		local fxs = SkillTable:getFxHurt1(skillID, actor:getSkillIndex())
		local selectType = SkillTable:getTargets(skillID, 1)

		if selectType == xyd.NDSV_SKILL_TARGET and targetIndex > 1 then
			fxs = SkillTable:getFxHurt1Add(skillID, actor:getSkillIndex())[targetIndex - 1]
		end

		t = actee:playHurtFx(fxs)
	elseif not isMiss then
		t = actee:playHurtFx(SkillTable:getFxHurt2(skillID, actor:getSkillIndex()))
	end

	return t
end

function BattleWindow:getTimeLineLite()
	local action

	local function completeCallback()
		for i = 1, #self.actions do
			if self.actions[i] == action then
				table.remove(self.actions, i)

				break
			end
		end
	end

	action = DG.Tweening.DOTween.Sequence():OnComplete(completeCallback)
	action.timeScale = self.timeScale_

	action:SetAutoKill(true)
	table.insert(self.actions, action)

	return action
end

function BattleWindow:initPetInfo()
	self.petBar_:SetActive(false)

	if self.petA then
		self.petBar_:SetActive(true)

		self.petBar_.value = 0
		self.petEnergy_ = 0

		local iconSource = xyd.tables.petTable:getBattleAvatar(self.petA.pet_id) .. tostring(self.petA.grade)

		xyd.setUISpriteAsync(self.petIcon, "pet_avatar_web", iconSource)
		XYDUtils.AddEventDelegate(self.petBar_.onChange, handler(self, self.showBarEffect))
	end
end

function BattleWindow:updatePetEnergy(val, direct)
	if not self.petA then
		return
	end

	self.petEnergy_ = self.petEnergy_ + val

	if direct then
		self.petEnergy_ = val
	end

	local showVal = math.min(self.petEnergy_, 100) / 100

	if self.petBar_.value ~= showVal then
		if self.petBarAction_ then
			self.petBarAction_:Kill(false)

			self.petBarAction_ = nil
		end

		self.petBarAction_ = self:getTimeLineLite()

		local t = 0.15

		if showVal == 0 then
			t = 0.5
		end

		local startVal = self.petBar_.value
		local bar = self.petBar_

		local function setter(value)
			bar.value = value
		end

		self.petBarAction_:Append(DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter), startVal, showVal, t))
	end
end

function BattleWindow:showBarEffect()
	if self.petEnergy_ == 0 and self.petBar_.value > 0 and not self.isPlayPetSkill then
		self.isPlayPetSkill = true

		self:showBarFull(true, "texiao02", 1)

		return
	elseif self.petEnergy_ == 0 and self.petBar_.value == 0 then
		self.isPlayPetSkill = false

		self:showBarFull(false)
	end

	if self.petBar_.value <= 0 then
		self:showBarPro(false)

		return
	elseif self.petBar_.value > 0 and self.petBar_.value < 1 then
		self:showBarPro(true)

		return
	else
		self:showBarPro(false)
		self:showBarFull(true, "texiao01", 0)
	end
end

function BattleWindow:showBarPro(flag)
	if flag then
		local val = self.petBar_.value
		local width = math.floor(380 * val)

		if not self.barEffectPro_ then
			self.barEffectPro_ = xyd.Spine.new(self.petBar_.gameObject)

			local renderTarget = self.petBar_:ComponentByName("barThumb", typeof(UISprite))

			self.barEffectPro_:setInfo("ui_pet_energybar", function()
				self.barEffectPro_:setRenderTarget(renderTarget, 1)
				self.barEffectPro_:play("texiao01", 0)
			end)
		end

		self.barEffectPro_:SetLocalPosition(width - 146, 4, 0)
		self.barEffectPro_:SetActive(true)
	elseif self.barEffectPro_ then
		self.barEffectPro_:SetActive(false)
	end
end

function BattleWindow:showBarFull(flag, effectName, count)
	if flag then
		if not self.barEffectFull then
			self.barEffectFull = xyd.Spine.new(self.petBar_.gameObject)

			local renderTarget = self.petBar_:ComponentByName("barThumb", typeof(UISprite))

			self.barEffectFull:setInfo("ui_pet_energyfull", function()
				self.barEffectFull:setRenderTarget(renderTarget, 1)
				self.barEffectFull:play(effectName, count)
				self.barEffectFull:SetLocalPosition(0, 3, 0)
			end)
		end

		self.barEffectFull:SetActive(true)
	elseif self.barEffectFull then
		self.barEffectFull:SetActive(false)
	end
end

function BattleWindow:useSkill(index)
	return
end

function BattleWindow:setCurFighter(fighter)
	return
end

function BattleWindow:playUnautoEnd()
	return
end

function BattleWindow:showUnAutoBtn(flag)
	return
end

function BattleWindow:showFightersSpeed(flag)
	return
end

function BattleWindow:checkShrineHurdleHurt()
	local extra = xyd.models.shrineHurdleModel:getExtra()
	local battle_table_id = extra.battle_id
	local hurtPoint = xyd.tables.shrineHurdleBossTable:getPointHurt(battle_table_id)
	local defNum = xyd.models.shrineHurdleModel:getDiffNum()
	local ratio = xyd.tables.shrineHurdleDiffTable:getRatio(defNum)

	ratio = ratio or 1
	hurtPoint = hurtPoint or 1e-08

	local bossHarm = math.ceil(self.BossHarm)
	local totalPoint = math.ceil(hurtPoint * bossHarm * ratio)
	local bossHarmShow = xyd.getDisplayNumber(bossHarm)
	local miscString = xyd.tables.miscTable:getString("shrine_hurdle_boss_score_count", "value")
	local string2 = xyd.stringFormat2(miscString, 2, ratio, bossHarm)
	local pointFunc = load(string2)

	totalPoint = pointFunc()
	self.shrineHurtLabel_.text = __("WORLD_BOSS_DESC_TEXT") .. " : " .. bossHarmShow
	self.shrinePointLabel_.text = __("SHRINE_HURDLE_TEXT10", "[c][d15b8b]" .. totalPoint .. "[-][/c]")
end

function BattleWindow:finalShowShrineHarm(showBossHarm)
	local extra = xyd.models.shrineHurdleModel:getExtra()
	local battle_table_id = extra.battle_id
	local hurtPoint = xyd.tables.shrineHurdleBossTable:getPointHurt(battle_table_id)
	local defNum = xyd.models.shrineHurdleModel:getDiffNum()
	local ratio = xyd.tables.shrineHurdleDiffTable:getRatio(defNum)
	local bossHarm = math.ceil(showBossHarm)

	ratio = ratio or 1
	hurtPoint = hurtPoint or 1e-08

	local totalPoint = math.floor(hurtPoint * bossHarm * ratio)
	local bossHarmShow = xyd.getDisplayNumber(bossHarm)
	local miscString = xyd.tables.miscTable:getString("shrine_hurdle_boss_score_count", "value")
	local string2 = xyd.stringFormat2(miscString, 2, ratio, bossHarm)
	local pointFunc = load(string2)

	totalPoint = pointFunc()
	self.shrineHurtLabel_.text = __("WORLD_BOSS_DESC_TEXT") .. ": " .. bossHarmShow
	self.shrinePointLabel_.text = __("SHRINE_HURDLE_TEXT10", "[c][d15b8b]" .. totalPoint .. "[-][/c]")
end

function BattleWindow:iosTestChangeUI()
	local allSprites = self.window_:GetComponentsInChildren(typeof(UISprite), true)

	for i = 0, allSprites.Length - 1 do
		local sprite = allSprites[i]

		xyd.setUISprite(sprite, nil, sprite.spriteName .. "_ios_test")
	end
end

return BattleWindow
