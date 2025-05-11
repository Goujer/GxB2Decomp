-- chunkname: @../../../Product/Bundles/Android/src/app/windows/ActivitySpaceExploreMapWindow.lua

local ActivitySpaceExploreMapWindow = class("ActivitySpaceExploreMapWindow", import(".BaseWindow"))
local MapGridItem = class("MapGridItem", import("app.components.CopyComponent"))
local WindowTop = import("app.components.WindowTop")
local CountDown = import("app.components.CountDown")

function ActivitySpaceExploreMapWindow:ctor(name, params)
	ActivitySpaceExploreMapWindow.super.ctor(self, name, params)
end

local PLACE_STATE = {
	AWARD = 3,
	COMMON = 2,
	DEFAULT = 0,
	DOOR = 1,
	PERSON = 4,
	OVER = 5,
	BOSS = 6
}

function ActivitySpaceExploreMapWindow:initWindow()
	self:getUIComponent()
	self:registerEvent()
	self:layout()
end

function ActivitySpaceExploreMapWindow:getUIComponent()
	self.trans = self.window_.transform
	self.groupAction = self.trans:NodeByName("groupAction").gameObject
	self.Bg = self.groupAction:ComponentByName("Bg_", typeof(UITexture))
	self.topGroup = self.groupAction:NodeByName("topGroup").gameObject
	self.leftUpCon = self.groupAction:NodeByName("leftUpCon").gameObject
	self.boxBtn = self.leftUpCon:NodeByName("boxBtn_").gameObject
	self.rewardBtn = self.leftUpCon:NodeByName("rewardBtn_").gameObject
	self.autoBtn = self.leftUpCon:NodeByName("autoBtn").gameObject
	self.autoBtn_UIWidget = self.leftUpCon:ComponentByName("autoBtn", typeof(UIWidget))
	self.autoBtnLabel = self.autoBtn:ComponentByName("autoBtnLabel", typeof(UILabel))
	self.autoBtnRed = self.autoBtn:NodeByName("autoBtnRed").gameObject
	self.autoBtnRed_UIWidget = self.autoBtn:ComponentByName("autoBtnRed", typeof(UIWidget))
	self.upCon = self.groupAction:NodeByName("upCon").gameObject
	self.textImg01_ = self.upCon:ComponentByName("textImg01_", typeof(UISprite))
	self.floorLabel = self.upCon:ComponentByName("floorLabel", typeof(UILabel))

	if xyd.Global.lang == "ko_kr" then
		self.floorLabel.gameObject:Y(-45)
	end

	self.rightUpCon = self.groupAction:NodeByName("rightUpCon").gameObject
	self.numGroup = self.rightUpCon:NodeByName("numGroup").gameObject
	self.rankBtn = self.rightUpCon:NodeByName("rankBtn_").gameObject
	self.rankBtn_BoxCollider = self.rightUpCon:ComponentByName("rankBtn_", typeof(UnityEngine.BoxCollider))
	self.helpBtn = self.rightUpCon:NodeByName("helpBtn_").gameObject
	self.bg = self.numGroup:ComponentByName("bg", typeof(UISprite))
	self.icon = self.numGroup:ComponentByName("icon", typeof(UISprite))
	self.btnAdd = self.numGroup:NodeByName("btnAdd").gameObject
	self.label = self.numGroup:ComponentByName("label", typeof(UILabel))
	self.leftDownCon = self.groupAction:NodeByName("leftDownCon").gameObject
	self.tipsBtn = self.leftDownCon:NodeByName("tipsBtn_").gameObject
	self.downGroup = self.groupAction:NodeByName("downGroup").gameObject
	self.timeGroup = self.downGroup:NodeByName("timeGroup").gameObject
	self.timeGroup_UILayout = self.downGroup:ComponentByName("timeGroup", typeof(UILayout))
	self.endLabel = self.timeGroup:ComponentByName("endLabel_", typeof(UILabel))
	self.timeLabel = self.timeGroup:ComponentByName("timeLabel_", typeof(UILabel))
	self.stateShowCon = self.downGroup:NodeByName("stateShowCon").gameObject
	self.stateShowBg = self.stateShowCon:ComponentByName("stateShowBg", typeof(UISprite))
	self.bloodCon = self.stateShowCon:NodeByName("bloodCon").gameObject
	self.bloodIcon = self.bloodCon:ComponentByName("bloodIcon", typeof(UISprite))
	self.bloodLabel = self.bloodCon:ComponentByName("bloodLabel", typeof(UILabel))
	self.powerCon = self.stateShowCon:NodeByName("powerCon").gameObject
	self.powerIcon = self.powerCon:ComponentByName("powerIcon", typeof(UISprite))
	self.powerLabel = self.powerCon:ComponentByName("powerLabel", typeof(UILabel))
	self.guardCon = self.stateShowCon:NodeByName("guardCon").gameObject
	self.guardIcon = self.guardCon:ComponentByName("guardIcon", typeof(UISprite))
	self.guardLabel = self.guardCon:ComponentByName("guardLabel", typeof(UILabel))
	self.teamBtn = self.downGroup:NodeByName("teamBtn").gameObject
	self.teamBtnIcon = self.teamBtn:NodeByName("teamBtnIcon").gameObject
	self.teamBtnLabel = self.teamBtn:ComponentByName("teamBtnLabel", typeof(UILabel))
	self.teamRedPoint = self.teamBtn:ComponentByName("teamRedPoint", typeof(UISprite)).gameObject
	self.centerCon = self.groupAction:NodeByName("centerCon").gameObject
	self.cardItem = self.centerCon:NodeByName("cardItem").gameObject
	self.cardCon = self.centerCon:NodeByName("cardCon").gameObject
	self.cardCon_UIGrid = self.centerCon:ComponentByName("cardCon", typeof(UIGrid))
	self.autoMask = self.centerCon:NodeByName("autoMask").gameObject
	self.autoEffectCon = self.centerCon:ComponentByName("autoEffectCon", typeof(UITexture))
	self.cardItem_awardCon = self.centerCon:NodeByName("cardItem_awardCon").gameObject
	self.cardItem_tipsCon = self.centerCon:NodeByName("cardItem_tipsCon").gameObject
	self.cardItem_personCon = self.centerCon:NodeByName("cardItem_personCon").gameObject
	self.cardItem_noClickCon = self.centerCon:NodeByName("cardItem_noClickCon").gameObject
	self.cardItem_guideTipsCon = self.centerCon:NodeByName("cardItem_guideTipsCon").gameObject
	self.passCon = self.groupAction:NodeByName("passCon").gameObject
	self.passConBg = self.passCon:ComponentByName("passConBg", typeof(UISprite))
	self.passConLabel = self.passCon:ComponentByName("passConLabel", typeof(UILabel))
	self.passConEffect = self.passCon:ComponentByName("passConEffect", typeof(UITexture))
end

function ActivitySpaceExploreMapWindow:registerEvent()
	self.eventProxy_:addEventListener(xyd.event.SPACE_EXPLORE_OPEN_GRID, handler(self, self.openGridBack))
	self.eventProxy_:addEventListener(xyd.event.SPACE_EXPLORE_GRID_EVENT, handler(self, self.onGridEventBack))
	self.eventProxy_:addEventListener(xyd.event.SPACE_EXPLORE_GET_RANK_LIST, handler(self, self.onRankListBack))

	UIEventListener.Get(self.helpBtn.gameObject).onClick = handler(self, function()
		xyd.WindowManager.get():openWindow("help_window", {
			key = "SPACE_EXPLORE_HELP_04"
		})
	end)
	UIEventListener.Get(self.rewardBtn.gameObject).onClick = handler(self, function()
		xyd.WindowManager.get():openWindow("activity_space_explore_check_award_window")
	end)
	UIEventListener.Get(self.teamBtn.gameObject).onClick = handler(self, function()
		xyd.WindowManager.get():openWindow("activity_space_explore_team_window")
	end)
	UIEventListener.Get(self.tipsBtn.gameObject).onClick = handler(self, function()
		xyd.WindowManager.get():openWindow("activity_space_explore_check_buff_window", {
			buff_list = self.buff_list
		})
	end)
	UIEventListener.Get(self.rankBtn.gameObject).onClick = handler(self, function()
		self.rankBtn_BoxCollider.enabled = false

		local msg = messages_pb:space_explore_get_rank_list_req()

		msg.activity_id = xyd.ActivityID.ACTIVITY_SPACE_EXPLORE

		xyd.Backend.get():request(xyd.mid.SPACE_EXPLORE_GET_RANK_LIST, msg)
		self:waitForTime(0.5, function()
			self.rankBtn_BoxCollider.enabled = true
		end)
	end)
	UIEventListener.Get(self.boxBtn.gameObject).onClick = handler(self, function()
		self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

		local items = self.activityData.detail.items

		items = items or {}

		xyd.WindowManager.get():openWindow("activity_space_explore_awarded_window", {
			data = items
		})
	end)
	UIEventListener.Get(self.btnAdd.gameObject).onClick = handler(self, function()
		xyd.WindowManager.get():openWindow("activity_item_getway_window", {
			itemID = xyd.ItemID.ACTIVITY_SPACE_EXPLORE_CRYSTAL
		})
	end)
	UIEventListener.Get(self.autoBtn.gameObject).onClick = handler(self, function()
		local open_lev = xyd.tables.miscTable:getNumber("space_explore_auto_level", "value")

		if open_lev > self.activityData.detail.stage_id then
			xyd.alertTips(__("SPACE_EXPLORE_AUTO_TIPS", open_lev))

			return
		end

		if not self.isAuto then
			self:setIsAutoState(true)
			self:startAutoGo()
		else
			self:setIsAutoState(false)
		end
	end)
end

function ActivitySpaceExploreMapWindow:layout()
	self.passConLabel.text = __("SPACE_EXPLORE_TEXT_24")
	self.endLabel.text = __("SPACE_EXPLORE_TEXT_25")
	self.teamBtnLabel.text = __("SPACE_EXPLORE_TEXT_26")
	self.autoBtnLabel.text = __("SPACE_EXPLORE_AUTO_TIPS2")
	self.autoBtn_UIWidget.height = 44
	self.autoBtnRed_UIWidget.height = 44

	xyd.setUISpriteAsync(self.textImg01_, nil, "activity_space_explore_text_" .. xyd.Global.lang, nil, nil)

	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)
	self.windowTop = WindowTop.new(self.topGroup, self.name_, 50)

	local items = {
		{
			id = xyd.ItemID.CRYSTAL
		},
		{
			id = xyd.ItemID.MANA
		}
	}

	self.windowTop:setItem(items)

	self.gridPosArr = {
		26,
		27,
		28,
		29,
		30,
		21,
		22,
		23,
		24,
		25,
		16,
		17,
		18,
		19,
		20,
		11,
		12,
		13,
		14,
		15,
		6,
		7,
		8,
		9,
		10,
		1,
		2,
		3,
		4,
		5
	}
	self.gridArr = {}

	for i = 1, 30 do
		local tmp = NGUITools.AddChild(self.cardCon.gameObject, self.cardItem.gameObject)
		local item = MapGridItem.new(tmp, self.gridPosArr[i], self)

		self.gridArr[self.gridPosArr[i]] = item
	end

	self.cardCon_UIGrid:Reposition()
	self:updateHurtTime()
	self:updateGridInfo(self.activityData.detail.stage_id)
	self:updateTeamInfoShow()
	self:updateShowItemNum()
	self:checkIfCanUpPartner()
end

function ActivitySpaceExploreMapWindow:updateGridInfo(floor)
	local ids = xyd.tables.activitySpaceExploreMapTable:getIds()

	self.place_id = self.activityData.detail.place_id

	if self.activityData.detail.stage_id > #ids then
		self:setIsAutoState(false)

		for i = 1, 30 do
			self.gridArr[i]:updateState(PLACE_STATE.OVER)
		end

		self.passCon:SetActive(true)

		local ids = xyd.tables.activitySpaceExploreMapTable:getIds()

		self.floorLabel.text = __("SPACE_EXPLORE_TEXT_06", #ids)

		if not self.passEffect then
			self.passEffect = xyd.Spine.new(self.passConEffect.gameObject)

			self.passEffect:setInfo("victory_bar", function()
				self.passEffect:play("texiao01", 1, 1, function()
					self.passEffect:stop()
					self.passConEffect:SetActive(false)
				end)
			end)
		end

		return
	end

	local ids = xyd.tables.activitySpaceExploreMapTable:getIds()

	self.floorLabel.text = __("SPACE_EXPLORE_TEXT_06", floor)
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)
	self.door_place_id = xyd.tables.activitySpaceExplorePlaceTable:getDoor(self.place_id)
	self.floor = floor
	self.award_pos_arr = xyd.tables.activitySpaceExplorePlaceTable:getAward(self.place_id)
	self.monster_pos_arr = xyd.tables.activitySpaceExplorePlaceTable:getMonster(self.place_id)
	self.boss_place_id = xyd.tables.activitySpaceExplorePlaceTable:getBoss(self.place_id)

	for i = 1, 30 do
		if self.activityData.detail.map[i] == 0 or self.activityData.detail.map[i] == 4 then
			self.gridArr[i]:updateState(PLACE_STATE.DEFAULT)
		elseif self.activityData.detail.map[i] == 3 then
			self.gridArr[i]:updateState(PLACE_STATE.OVER)
		end
	end

	self.gridArr[self.door_place_id]:updateState(PLACE_STATE.DOOR)

	if self.activityData.detail.map[self.boss_place_id] == 1 then
		self.gridArr[self.boss_place_id]:updateState(PLACE_STATE.BOSS)
	elseif self.activityData.detail.map[self.boss_place_id] == 3 then
		self.gridArr[self.boss_place_id]:updateState(PLACE_STATE.OVER)
	elseif self.activityData.detail.map[self.boss_place_id] == 4 then
		self.gridArr[self.boss_place_id]:setTipsConVisible(true, PLACE_STATE.BOSS)
	end

	local award_pos_arr = self.award_pos_arr

	for i in pairs(award_pos_arr) do
		if self.activityData.detail.map[award_pos_arr[i]] == 1 then
			self.gridArr[award_pos_arr[i]]:updateState(PLACE_STATE.AWARD)
		end

		if self.activityData.detail.map[award_pos_arr[i]] == 4 then
			self.gridArr[award_pos_arr[i]]:setTipsConVisible(true, PLACE_STATE.AWARD)
		end
	end

	local monster_pos_arr = self.monster_pos_arr

	for i in pairs(monster_pos_arr) do
		if self.activityData.detail.map[monster_pos_arr[i]] == 1 then
			self.gridArr[monster_pos_arr[i]]:updateState(PLACE_STATE.PERSON)
		end

		if self.activityData.detail.map[monster_pos_arr[i]] == 4 then
			self.gridArr[monster_pos_arr[i]]:setTipsConVisible(true, PLACE_STATE.PERSON)
		end
	end

	self:checkLightGrid(floor)
end

function ActivitySpaceExploreMapWindow:checkLightGrid()
	for i = 1, 30 do
		self.gridArr[i]:setNoClickConVisible(false)
	end

	for i = 1, 30 do
		if self.gridArr[i]:getMask().activeSelf == false and (self.activityData.detail.map[i] == 1 or self.activityData.detail.map[i] == 3) then
			local borderArr = self:getBorderIds(i)

			for k in pairs(borderArr) do
				if self.gridArr[borderArr[k].id]:getMask().activeSelf and borderArr[k].state == "four" and (self.activityData.detail.map[borderArr[k].id] == 0 or self.activityData.detail.map[borderArr[k].id] == 4) then
					self.gridArr[borderArr[k].id]:updateState(PLACE_STATE.COMMON)
				end

				if (self.gridArr[i]:getState() == PLACE_STATE.PERSON or self.gridArr[i]:getState() == PLACE_STATE.BOSS) and (self.activityData.detail.map[borderArr[k].id] == 0 or self.activityData.detail.map[borderArr[k].id] == 4) then
					self.gridArr[borderArr[k].id]:setNoClickConVisible(true)
				end
			end
		end
	end
end

function ActivitySpaceExploreMapWindow:getBorderIds(id)
	local borderArr = {}
	local left_index = id - 1
	local right_index = id + 1
	local up_index = id + 5
	local down_index = id - 5
	local left_up = id + 4
	local left_down = id - 6
	local right_up = id + 6
	local right_down = id - 4

	if id % 5 == 1 then
		left_index = -1
		left_up = -1
		left_down = -1
	end

	if left_index ~= -1 then
		table.insert(borderArr, {
			state = "four",
			id = left_index
		})
	end

	if id % 5 == 0 then
		right_index = -1
		right_up = -1
		right_down = -1
	end

	if right_index ~= -1 then
		table.insert(borderArr, {
			state = "four",
			id = right_index
		})
	end

	if id <= 5 then
		down_index = -1
		left_down = -1
		right_down = -1
	end

	if down_index ~= -1 then
		table.insert(borderArr, {
			state = "four",
			id = down_index
		})
	end

	if id >= 26 then
		up_index = -1
		left_up = -1
		right_up = -1
	end

	if up_index ~= -1 then
		table.insert(borderArr, {
			state = "four",
			id = up_index
		})
	end

	if left_up ~= -1 then
		table.insert(borderArr, {
			state = "nine",
			id = left_up
		})
	end

	if left_down ~= -1 then
		table.insert(borderArr, {
			state = "nine",
			id = left_down
		})
	end

	if right_up ~= -1 then
		table.insert(borderArr, {
			state = "nine",
			id = right_up
		})
	end

	if right_down ~= -1 then
		table.insert(borderArr, {
			state = "nine",
			id = right_down
		})
	end

	return borderArr
end

function ActivitySpaceExploreMapWindow:updateTeamInfoShow()
	self.buff_list = {
		0,
		0,
		0,
		0,
		0
	}
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

	local allPartners_ids = xyd.tables.activitySpaceExplorePartnerTable:getIDs()

	self.hp = 0
	self.atk = 0
	self.arm = 0

	for i, level in pairs(self.activityData.detail.partners) do
		local partner_id = tonumber(allPartners_ids[i])

		if level > 0 then
			self.hp = self.hp + xyd.tables.activitySpaceExplorePartnerTable:getBaseHp(partner_id) + xyd.tables.activitySpaceExplorePartnerTable:getGrowHp(partner_id) * (level - 1)
			self.atk = self.atk + xyd.tables.activitySpaceExplorePartnerTable:getBaseAtk(partner_id) + xyd.tables.activitySpaceExplorePartnerTable:getGrowAtk(partner_id) * (level - 1)
			self.arm = self.arm + xyd.tables.activitySpaceExplorePartnerTable:getBaseArm(partner_id) + xyd.tables.activitySpaceExplorePartnerTable:getGrowArm(partner_id) * (level - 1)
		end
	end

	local all_atk_add_value = 1
	local all_arm_add_value = 1
	local all_hp_add_value = 1

	for i, partner_level in pairs(self.activityData.detail.partners) do
		if partner_level > 0 then
			local partner_id = tonumber(allPartners_ids[i])
			local skill_ids = xyd.tables.activitySpaceExplorePartnerTable:getSkillId(partner_id)

			if skill_ids and #skill_ids > 0 then
				local skill_lv_Arr = xyd.tables.activitySpaceExplorePartnerTable:getSkillLv(partner_id)
				local skill_lv_index = 1

				for k in pairs(skill_lv_Arr) do
					if partner_level >= skill_lv_Arr[k] then
						skill_lv_index = skill_lv_index + 1
					else
						break
					end
				end

				for k, skill_id in pairs(skill_ids) do
					local type = xyd.tables.activitySpaceExploreSkillTable:getType1(skill_id)

					if type == 1 then
						local add_value = xyd.tables.activitySpaceExploreSkillTable:getValue(skill_id)[skill_lv_index]

						all_atk_add_value = all_atk_add_value + add_value
						self.buff_list[type] = self.buff_list[type] + add_value
					end

					if type == 2 then
						local add_value = xyd.tables.activitySpaceExploreSkillTable:getValue(skill_id)[skill_lv_index]

						all_arm_add_value = all_arm_add_value + add_value
						self.buff_list[type] = self.buff_list[type] + add_value
					end

					if type == 3 then
						local add_value = xyd.tables.activitySpaceExploreSkillTable:getValue(skill_id)[skill_lv_index]

						all_hp_add_value = all_hp_add_value + add_value
						self.buff_list[type] = self.buff_list[type] + add_value
					end

					if type == 4 then
						self.buff_list[type] = 1
					end

					if type == 5 then
						self.buff_list[type] = 1
					end
				end
			end
		end
	end

	self.hp = math.ceil(self.hp * all_hp_add_value)
	self.atk = math.ceil(self.atk * all_atk_add_value)
	self.arm = math.ceil(self.arm * all_arm_add_value)
	self.bloodLabel.text = tostring(self.hp)
	self.powerLabel.text = tostring(self.atk)
	self.guardLabel.text = tostring(self.arm)
end

function ActivitySpaceExploreMapWindow:openGridBack(event)
	local data = xyd.decodeProtoBuf(event.data)

	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

	local is_empty = true

	if xyd.arrayIndexOf(self.award_pos_arr, data.id) > -1 then
		if self.activityData.detail.map[data.id] == 1 then
			self.gridArr[data.id]:updateState(PLACE_STATE.AWARD)
		elseif self.activityData.detail.map[data.id] == 3 then
			self.gridArr[data.id]:updateState(PLACE_STATE.OVER)
		end

		is_empty = false
	end

	if xyd.arrayIndexOf(self.monster_pos_arr, data.id) > -1 then
		if self.activityData.detail.map[data.id] == 1 then
			self.gridArr[data.id]:updateState(PLACE_STATE.PERSON)
		elseif self.activityData.detail.map[data.id] == 3 then
			self.gridArr[data.id]:updateState(PLACE_STATE.OVER)
		end

		is_empty = false
	end

	if data.id == self.boss_place_id then
		if self.activityData.detail.map[data.id] == 1 then
			self.gridArr[data.id]:updateState(PLACE_STATE.BOSS)
		elseif self.activityData.detail.map[data.id] == 3 then
			self.gridArr[data.id]:updateState(PLACE_STATE.OVER)
		end

		is_empty = false
	end

	if is_empty then
		self.gridArr[data.id]:updateState(PLACE_STATE.OVER)
	end

	self:checkLightGrid()
	self:checkAuto()
end

function ActivitySpaceExploreMapWindow:onGridEventBack(event)
	local data = xyd.decodeProtoBuf(event.data)

	if data.items then
		self:checkIfCanUpPartner()
	end

	if data.is_win then
		self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

		local function callback()
			local map_wd = xyd.WindowManager.get():getWindow("activity_space_explore_map_window")

			if not map_wd then
				return
			end

			if self.activityData.detail.map[data.id] == 3 then
				self.gridArr[data.id]:updateState(PLACE_STATE.OVER)
				self:checkLightGrid()
			end

			if data.is_win == 1 and data.id == self.boss_place_id then
				self.gridArr[self.door_place_id]:playEffect("door")
				self.gridArr[self.door_place_id]:updateState(PLACE_STATE.DOOR)
			end

			if data.is_win == 0 then
				self:updateHurtTime()
			end

			self:checkAuto()
		end

		if self.isAuto then
			if data.is_win == 1 then
				xyd.WindowManager.get():openWindow("battle_win_window", {
					battleParams = {
						items = data.items
					},
					battle_type = xyd.BattleType.ACTIVITY_SPACE_EXPLORE,
					closeCallBack = callback
				})
			elseif data.is_win == 0 then
				self:setIsAutoState(false)
				xyd.WindowManager.get():openWindow("battle_fail_window", {
					battleParams = {},
					battle_type = xyd.BattleType.ACTIVITY_SPACE_EXPLORE,
					closeCallBack = callback
				})
			end

			return
		end

		xyd.WindowManager.get():openWindow("activity_space_explore_battle_window", {
			grid_id = data.id,
			self_blood = self.hp,
			self_atk = self.atk,
			self_arm = self.arm,
			is_win = data.is_win,
			monster_id = tonumber(self.activityData.detail.map_content[data.id]),
			items = data.items,
			callBack = callback
		})
	elseif data.map and data.map_content then
		self.startToNextFloor = true

		if data.items and #data.items > 0 then
			local setIndex = 1

			for i in pairs(self.award_pos_arr) do
				if setIndex > #data.items then
					break
				end

				if self.activityData.detail.map[self.award_pos_arr[i]] == 1 then
					setIndex = setIndex + 1
				end

				if self.activityData.detail.map[self.award_pos_arr[i]] == 0 or self.activityData.detail.map[self.award_pos_arr[i]] == 4 then
					self.activityData.detail.map_content[self.award_pos_arr[i]] = tostring(data.items[setIndex].item_id) .. "#" .. tostring(data.items[setIndex].item_num)
					setIndex = setIndex + 1
				end
			end

			for i in pairs(self.activityData.detail.map) do
				if xyd.arrayIndexOf(self.award_pos_arr, i) > -1 then
					if self.activityData.detail.map[i] == 0 or self.activityData.detail.map[i] == 4 then
						self.gridArr[i]:playEffect("stone")
						self.gridArr[i]:updateState(PLACE_STATE.AWARD)
					end

					if self.activityData.detail.map[i] == 0 or self.activityData.detail.map[i] == 1 or self.activityData.detail.map[i] == 4 then
						self:waitForTime(0.5, function()
							self.gridArr[i]:updateState(PLACE_STATE.OVER)
						end)
					end
				elseif self.activityData.detail.map[i] == 0 then
					self.gridArr[i]:playEffect("stone")
					self.gridArr[i]:updateState(PLACE_STATE.OVER)
				end
			end

			self:waitForTime(1, function()
				self.activityData:updateDoorBack(data)

				self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

				self:updateGridInfo(self.activityData.detail.stage_id)

				self.startToNextFloor = false

				self:checkAuto()
			end)
		else
			self.activityData:updateDoorBack(data)

			self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

			self:updateGridInfo(self.activityData.detail.stage_id)

			self.startToNextFloor = false
		end
	else
		self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

		if self.activityData.detail.map[data.id] == 3 then
			self.gridArr[data.id]:updateState(PLACE_STATE.OVER)
		end
	end

	self:updateShowItemNum()
end

function ActivitySpaceExploreMapWindow:updateHurtTime()
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

	local durationTime = self.activityData.detail.hurt_time - xyd.getServerTime()

	if durationTime > 0 then
		if self.setCountDownTime then
			self.setCountDownTime:dispose()
		end

		self.timeGroup:SetActive(true)

		self.setCountDownTime = CountDown.new(self.timeLabel, {
			duration = durationTime,
			callback = handler(self, self.timeOver)
		})

		self.timeGroup_UILayout:Reposition()
	else
		self.timeLabel.text = "00:00"

		self.timeGroup:SetActive(false)
	end
end

function ActivitySpaceExploreMapWindow:timeOver()
	self.timeLabel.text = "00:00"

	self.timeGroup:SetActive(false)
end

function ActivitySpaceExploreMapWindow:updateShowItemNum()
	self.label.text = xyd.models.backpack:getItemNumByID(xyd.ItemID.ACTIVITY_SPACE_EXPLORE_CRYSTAL)
end

function ActivitySpaceExploreMapWindow:checkGuideClose()
	if self.guideEffect then
		self.guideEffect:stop()
	end

	if self.guideEffectCon then
		self.guideEffectCon.gameObject:SetActive(false)
	end
end

function ActivitySpaceExploreMapWindow:checkIfCanUpPartner()
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

	local isHideUp = xyd.db.misc:getValue("activity_space_explore_team_window_flag" .. 1)

	if not isHideUp or tonumber(isHideUp) == 0 then
		self.teamRedPoint:SetActive(false)

		local has_cost = xyd.models.backpack:getItemNumByID(xyd.ItemID.ACTIVITY_SPACE_EXPLORE_UP_PARTNER)
		local all_ids = xyd.tables.activitySpaceExplorePartnerTable:getIDs()

		for i in pairs(all_ids) do
			local partner_id = all_ids[i]

			if self.activityData.detail.partners[i] > 0 then
				local partner_level = self.activityData.detail.partners[i]
				local need_cost = xyd.tables.activitySpaceExplorePartnerTable:getLvCost1(partner_id)[2] + (partner_level - 1) * xyd.tables.activitySpaceExplorePartnerTable:getLvCost2(partner_id)[2]
				local max_lev = xyd.tables.activitySpaceExplorePartnerTable:getMaxLv(partner_id)

				if need_cost <= has_cost and partner_level < max_lev then
					self.teamRedPoint:SetActive(true)

					break
				end
			end
		end
	else
		self.teamRedPoint:SetActive(false)
	end
end

function ActivitySpaceExploreMapWindow:onRankListBack(event)
	self.rankBtn_BoxCollider.enabled = true

	xyd.WindowManager.get():openWindow("new_dress_rank_window", {
		rank_info = event.data
	})
end

function ActivitySpaceExploreMapWindow:willClose()
	local activityWindow = xyd.WindowManager.get():getWindow("activity_window")

	if activityWindow then
		local curContent = activityWindow:getCurContent()

		if curContent:getActivityContentID() == xyd.ActivityID.ACTIVITY_SPACE_EXPLORE then
			curContent:mapCloseBack()
		end
	end

	ActivitySpaceExploreMapWindow.super.willClose(self)
end

function ActivitySpaceExploreMapWindow:checkAuto()
	if self.isAuto then
		self:startAutoGo()
	end
end

function ActivitySpaceExploreMapWindow:getIsAuto()
	return self.isAuto
end

function ActivitySpaceExploreMapWindow:setIsAutoState(state)
	if not state then
		if self.autoTimeKey and self.autoTimeKey ~= -1 then
			XYDCo.StopWait(self.autoTimeKey)

			self.autoTimeKey = -1
		end

		self:showAutoEffect(false)

		self.autoBtnLabel.text = __("SPACE_EXPLORE_AUTO_TIPS2")
	else
		self.autoBtnLabel.text = __("TRAVEL_NEW_TEXT11")
	end

	local btn_state = not state

	self.helpBtn.gameObject:SetActive(btn_state)
	self.boxBtn.gameObject:SetActive(btn_state)
	self.rewardBtn.gameObject:SetActive(btn_state)
	self.rankBtn.gameObject:SetActive(btn_state)
	self.tipsBtn.gameObject:SetActive(btn_state)
	self.teamBtn.gameObject:SetActive(btn_state)
	self.autoMask.gameObject:SetActive(state)
	self.autoBtnRed.gameObject:SetActive(state)

	self.isAuto = state
end

function ActivitySpaceExploreMapWindow:startAutoGo()
	if not self.isAuto then
		return
	end

	local first_search_door_index = -1
	local first_search_common_index = -1
	local first_search_person_index = -1
	local first_search_boss_index = -1

	for i = 1, 30 do
		if self.gridArr[i]:isCanTouch() then
			if first_search_door_index == -1 and self.gridArr[i]:getState() == PLACE_STATE.DOOR and self.activityData.detail.map[self.boss_place_id] == 3 then
				first_search_door_index = i
			end

			if first_search_door_index == -1 then
				if first_search_common_index == -1 and self.gridArr[i]:getState() == PLACE_STATE.COMMON then
					first_search_common_index = i
				end

				if first_search_common_index == -1 then
					if first_search_person_index == -1 and self.gridArr[i]:getState() == PLACE_STATE.PERSON then
						first_search_person_index = i
					end

					if first_search_person_index == -1 and first_search_boss_index == -1 and self.gridArr[i]:getState() == PLACE_STATE.BOSS then
						first_search_boss_index = i
					end
				end
			end
		end
	end

	if not self.autoEffect then
		self.autoEffect = xyd.Spine.new(self.autoEffectCon.gameObject)

		self.autoEffect:setInfo("fx_ui_dianji", function()
			self.autoEffect:play("texiao01", 0, 1, function()
				return
			end)
		end)
	end

	local auto_time = 0.5

	if UNITY_EDITOR then
		local gm_auto_time = xyd.db.misc:getValue("gm_set_space_explore_auto_time")

		if gm_auto_time then
			auto_time = tonumber(gm_auto_time) / 10
		end
	end

	if first_search_door_index ~= -1 then
		self:showAutoEffect(true, self.gridArr[first_search_door_index]:getGameObject())

		self.autoTimeKey = self:waitForTime(auto_time, function()
			self:showAutoEffect(false)
			self.gridArr[first_search_door_index]:onTouch()
		end)

		return
	end

	if first_search_common_index ~= -1 then
		self:showAutoEffect(true, self.gridArr[first_search_common_index]:getGameObject())

		self.autoTimeKey = self:waitForTime(auto_time, function()
			self:showAutoEffect(false)
			self.gridArr[first_search_common_index]:onTouch()
		end)

		return
	end

	if first_search_person_index ~= -1 then
		if xyd.getServerTime() < self.activityData.detail.hurt_time then
			xyd.alert(xyd.AlertType.TIPS, __("SPACE_EXPLORE_TEXT_09"))
			self:setIsAutoState(false)

			return
		end

		self:showAutoEffect(true, self.gridArr[first_search_person_index]:getGameObject())

		self.autoTimeKey = self:waitForTime(auto_time, function()
			self:showAutoEffect(false)
			self.gridArr[first_search_person_index]:onTouch()
		end)

		return
	end

	if first_search_boss_index ~= -1 then
		self:showAutoEffect(true, self.gridArr[first_search_boss_index]:getGameObject())

		if xyd.getServerTime() < self.activityData.detail.hurt_time then
			xyd.alert(xyd.AlertType.TIPS, __("SPACE_EXPLORE_TEXT_09"))
			self:setIsAutoState(false)

			return
		end

		self.autoTimeKey = self:waitForTime(auto_time, function()
			self:showAutoEffect(false)
			self.gridArr[first_search_boss_index]:onTouch()
		end)

		return
	end

	self:setIsAutoState(false)
end

function ActivitySpaceExploreMapWindow:showAutoEffect(state, obj)
	if state then
		self.autoEffectCon.gameObject:SetLocalPosition(obj.transform.localPosition.x, obj.transform.localPosition.y + 35, 0)
		self.autoEffectCon.gameObject:SetActive(true)
	else
		self.autoEffectCon.gameObject:SetActive(false)
	end
end

function MapGridItem:ctor(goItem, grid_id, parent)
	self.cardItem = goItem
	self.grid_id = grid_id
	self.state = PLACE_STATE.DEFAULT
	self.parent = parent
	self.cardItemBg = self.cardItem:ComponentByName("cardItemBg", typeof(UISprite))

	local default_img_id = math.ceil(math.random() * 4)

	xyd.setUISpriteAsync(self.cardItemBg, nil, "activity_space_explore_grid_" .. default_img_id, nil, nil)

	self.cardItemMask = self.cardItem:ComponentByName("cardItemMask", typeof(UISprite))
	self.stoneEffectCon = self.cardItem:ComponentByName("stoneEffectCon", typeof(UITexture))
	self.doorEffectCon = self.cardItem:ComponentByName("doorEffectCon", typeof(UITexture))
	self.personEffectDepth = 40 + (5 - math.ceil((self.grid_id - 1) / 6)) * 20
	self.cardItemMask:GetComponent(typeof(UIWidget)).depth = self.personEffectDepth + 10
	self.stoneEffectCon.gameObject:GetComponent(typeof(UIWidget)).depth = self.personEffectDepth + 8
	self.doorEffectCon.gameObject:GetComponent(typeof(UIWidget)).depth = self.personEffectDepth + 9
	UIEventListener.Get(self.cardItemBg.gameObject).onClick = handler(self, self.onTouch)
	UIEventListener.Get(self.cardItemMask.gameObject).onClick = handler(self, function()
		xyd.alert(xyd.AlertType.TIPS, __("SPACE_EXPLORE_TEXT_07"))
	end)
end

function MapGridItem:getGameObject()
	return self.cardItem
end

function MapGridItem:onTouch()
	if self.parent.activityData and self.parent.activityData:getEndTime() <= xyd.getServerTime() then
		xyd.alertTips(__("ACTIVITY_END_YET"))
		self:setIsAutoState(false)

		return
	end

	if self.parent.startToNextFloor then
		return
	end

	if not self.cardItemMask.gameObject.activeSelf and self.state ~= PLACE_STATE.DOOR then
		self.parent:checkGuideClose()
	end

	if self.state == PLACE_STATE.COMMON then
		local msg = messages_pb:space_explore_open_grid_req()

		msg.activity_id = xyd.ActivityID.ACTIVITY_SPACE_EXPLORE
		msg.id = self.grid_id

		xyd.Backend.get():request(xyd.mid.SPACE_EXPLORE_OPEN_GRID, msg)
		self:playEffect("stone")
	elseif self.state == PLACE_STATE.AWARD or self.state == PLACE_STATE.PERSON or self.state == PLACE_STATE.BOSS then
		if (self.state == PLACE_STATE.PERSON or self.state == PLACE_STATE.BOSS) and xyd.getServerTime() < self.parent.activityData.detail.hurt_time then
			xyd.alert(xyd.AlertType.TIPS, __("SPACE_EXPLORE_TEXT_09"))
			self.parent:setIsAutoState(false)

			return
		end

		if self.state == PLACE_STATE.BOSS then
			local isCanAtkBoss = true

			for i in pairs(self.parent.monster_pos_arr) do
				if self.parent.activityData.detail.map[self.parent.monster_pos_arr[i]] == 0 or self.parent.activityData.detail.map[self.parent.monster_pos_arr[i]] == 1 or self.parent.activityData.detail.map[self.parent.monster_pos_arr[i]] == 4 then
					isCanAtkBoss = false

					break
				end
			end

			if not isCanAtkBoss then
				xyd.alert(xyd.AlertType.TIPS, __("SPACE_EXPLORE_TEXT_13"))

				return
			end
		end

		local msg = messages_pb:space_explore_grid_event_req()

		msg.activity_id = xyd.ActivityID.ACTIVITY_SPACE_EXPLORE
		msg.id = self.grid_id

		xyd.Backend.get():request(xyd.mid.SPACE_EXPLORE_GRID_EVENT, msg)
	elseif self.state == PLACE_STATE.DOOR then
		if self.parent.activityData.detail.map[self.parent.boss_place_id] == 3 then
			local msg = messages_pb:space_explore_grid_event_req()

			msg.activity_id = xyd.ActivityID.ACTIVITY_SPACE_EXPLORE
			msg.id = self.grid_id

			xyd.Backend.get():request(xyd.mid.SPACE_EXPLORE_GRID_EVENT, msg)
		else
			xyd.alert(xyd.AlertType.TIPS, __("SPACE_EXPLORE_TEXT_23"))
		end
	end
end

function MapGridItem:updateState(state)
	self.state = state
	self.activityData = xyd.models.activity:getActivity(xyd.ActivityID.ACTIVITY_SPACE_EXPLORE)

	self.cardItemMask:SetActive(false)
	self:setAwardConVisible(false)
	self:setPersonConVisible(false)

	if state == PLACE_STATE.DEFAULT then
		self.cardItemMask:SetActive(true)

		local default_img_id = math.ceil(math.random() * 4)

		xyd.setUISpriteAsync(self.cardItemBg, nil, "activity_space_explore_grid_" .. default_img_id, nil, nil)
	elseif state == PLACE_STATE.DOOR then
		if self.parent.activityData.detail.map[self.parent.boss_place_id] == 3 then
			xyd.setUISpriteAsync(self.cardItemBg, nil, "activity_space_explore_bg_m_1", nil, nil)
		else
			xyd.setUISpriteAsync(self.cardItemBg, nil, "activity_space_explore_bg_m_2", nil, nil)
		end
	elseif state == PLACE_STATE.COMMON then
		if self.parent.floor == 1 and self.parent.guideEffect == nil and self.parent.guideEffectCon == nil then
			local open_num = 0

			for i, state in pairs(self.parent.activityData.detail.map) do
				if state ~= 0 then
					open_num = open_num + 1
				end
			end

			if open_num == 1 then
				self:playGuide()
			end
		end
	elseif state == PLACE_STATE.AWARD then
		self:setTipsConVisible(false)
		xyd.setUISpriteAsync(self.cardItemBg, nil, "activity_space_explore_grid_0", nil, nil)
		self:setAwardConVisible(true)

		local award_info = self.activityData.detail.map_content[self.grid_id]
		local award_id = tonumber(xyd.split(award_info, "#")[1])

		xyd.setUISpriteAsync(self.awardImg, nil, "icon_" .. award_id, nil, nil, true)
	elseif state == PLACE_STATE.PERSON then
		self:setTipsConVisible(false)
		xyd.setUISpriteAsync(self.cardItemBg, nil, "activity_space_explore_grid_0", nil, nil)
		self:setPersonConVisible(true)

		local monster_id = tonumber(self.activityData.detail.map_content[self.grid_id])
		local monster_model_id = xyd.tables.activitySpaceExploreMonsterTable:getPartnerModel(monster_id)
		local modelName = xyd.tables.modelTable:getModelName(monster_model_id)
		local modelScale = xyd.tables.modelTable:getScale(monster_model_id)

		if self.personEffect_spine then
			self.personEffect_spine:destroy()
		end

		self.personEffect_spine = xyd.Spine.new(self.personEffect.gameObject)

		self.personEffect_spine:setInfo(modelName, function()
			self.personEffect_spine:play("idle", 0)
			self.personEffect_spine:SetLocalScale(modelScale, modelScale, modelScale)
		end)

		self.bloodLabel.text = xyd.tables.activitySpaceExploreMonsterTable:getHp(monster_id)
		self.powerLabel.text = xyd.tables.activitySpaceExploreMonsterTable:getAtk(monster_id)
		self.guardLabel.text = xyd.tables.activitySpaceExploreMonsterTable:getArm(monster_id)

		self.showIcon:SetActive(false)
	elseif state == PLACE_STATE.BOSS then
		self:setTipsConVisible(false)
		xyd.setUISpriteAsync(self.cardItemBg, nil, "activity_space_explore_grid_0", nil, nil)
		self:setPersonConVisible(true)

		local monster_id = xyd.tables.activitySpaceExploreMapTable:getBossId(self.parent.floor)
		local monster_model_id = xyd.tables.activitySpaceExploreMonsterTable:getPartnerModel(monster_id)
		local modelName = xyd.tables.modelTable:getModelName(monster_model_id)
		local modelScale = xyd.tables.modelTable:getScale(monster_model_id)

		if self.personEffect_spine then
			self.personEffect_spine:destroy()
		end

		self.personEffect_spine = xyd.Spine.new(self.personEffect.gameObject)

		self.personEffect_spine:setInfo(modelName, function()
			self.personEffect_spine:play("idle", 0)
			self.personEffect_spine:SetLocalScale(modelScale, modelScale, modelScale)
		end)

		self.bloodLabel.text = xyd.tables.activitySpaceExploreMonsterTable:getHp(monster_id)
		self.powerLabel.text = xyd.tables.activitySpaceExploreMonsterTable:getAtk(monster_id)
		self.guardLabel.text = xyd.tables.activitySpaceExploreMonsterTable:getArm(monster_id)

		self.showIcon:SetActive(true)
	elseif state == PLACE_STATE.OVER then
		self:setTipsConVisible(false)
		xyd.setUISpriteAsync(self.cardItemBg, nil, "activity_space_explore_grid_0", nil, nil)
	end
end

function MapGridItem:getState()
	return self.state
end

function MapGridItem:getMask()
	return self.cardItemMask.gameObject
end

function MapGridItem:getTipsCon()
	if not self.tipsCon then
		self.tipsCon = NGUITools.AddChild(self.cardItem.gameObject, self.parent.cardItem_tipsCon.gameObject)
		self.tipsImg = self.tipsCon:ComponentByName("tipsImg", typeof(UISprite))
		self.tipsImg:GetComponent(typeof(UIWidget)).depth = self.cardItemMask:GetComponent(typeof(UIWidget)).depth + 2
	end

	return self.tipsCon
end

function MapGridItem:setTipsConVisible(visible, state)
	if visible and not self.tipsCon then
		self:getTipsCon()
	end

	if self.tipsImg and state then
		if state == PLACE_STATE.AWARD then
			xyd.setUISpriteAsync(self.tipsImg, nil, "activity_space_explore_supple_tps2", nil, nil, true)
		elseif state == PLACE_STATE.PERSON then
			xyd.setUISpriteAsync(self.tipsImg, nil, "activity_space_explore_supple_tps3", nil, nil, true)
		elseif state == PLACE_STATE.BOSS then
			xyd.setUISpriteAsync(self.tipsImg, nil, "activity_space_explore_supple_tps1", nil, nil, true)
		end
	end

	if self.tipsImg then
		self.tipsImg:SetLocalScale(0.9, 0.9, 0.9)
	end

	if self.tipsCon then
		self.tipsCon:SetActive(visible)
	end
end

function MapGridItem:getAwardCon()
	if not self.awardCon then
		self.awardCon = NGUITools.AddChild(self.cardItem.gameObject, self.parent.cardItem_awardCon.gameObject)
		self.awardImg = self.awardCon:ComponentByName("awardImg", typeof(UISprite))
	end

	return self.awardCon
end

function MapGridItem:setAwardConVisible(visible)
	if visible and not self.awardCon then
		self:getAwardCon()
	end

	if self.awardCon then
		self.awardCon:SetActive(visible)
	end
end

function MapGridItem:getPersonCon()
	if not self.personCon then
		self.personCon = NGUITools.AddChild(self.cardItem.gameObject, self.parent.cardItem_personCon.gameObject)
		self.personEffect = self.personCon:ComponentByName("personEffect", typeof(UITexture))
		self.stateShowCon = self.personCon:NodeByName("stateShowCon").gameObject
		self.showIcon = self.stateShowCon:ComponentByName("showIcon", typeof(UISprite))
		self.bloodCon = self.stateShowCon:NodeByName("bloodCon").gameObject
		self.bloodIcon = self.bloodCon:ComponentByName("bloodIcon", typeof(UISprite))
		self.bloodLabel = self.bloodCon:ComponentByName("bloodLabel", typeof(UILabel))
		self.powerCon = self.stateShowCon:NodeByName("powerCon").gameObject
		self.powerIcon = self.powerCon:ComponentByName("powerIcon", typeof(UISprite))
		self.powerLabel = self.powerCon:ComponentByName("powerLabel", typeof(UILabel))
		self.guardCon = self.stateShowCon:NodeByName("guardCon").gameObject
		self.guardIcon = self.guardCon:ComponentByName("guardIcon", typeof(UISprite))
		self.guardLabel = self.guardCon:ComponentByName("guardLabel", typeof(UILabel))

		local personEffectDepth = self.personEffectDepth

		self.personEffect:GetComponent(typeof(UIWidget)).depth = personEffectDepth
		self.showIcon:GetComponent(typeof(UIWidget)).depth = personEffectDepth + 1
		self.bloodIcon:GetComponent(typeof(UIWidget)).depth = personEffectDepth + 1
		self.bloodLabel:GetComponent(typeof(UIWidget)).depth = personEffectDepth + 1
		self.powerIcon:GetComponent(typeof(UIWidget)).depth = personEffectDepth + 1
		self.powerLabel:GetComponent(typeof(UIWidget)).depth = personEffectDepth + 1
		self.guardIcon:GetComponent(typeof(UIWidget)).depth = personEffectDepth + 1
		self.guardLabel:GetComponent(typeof(UIWidget)).depth = personEffectDepth + 1
	end

	return self.personCon
end

function MapGridItem:setPersonConVisible(visible)
	if visible and not self.personCon then
		self:getPersonCon()
	end

	if self.personCon then
		self.personCon:SetActive(visible)
	end
end

function MapGridItem:getNoClickCon()
	if not self.noClickCon then
		self.noClickCon = NGUITools.AddChild(self.cardItem.gameObject, self.parent.cardItem_noClickCon.gameObject)
		self.noClickImg = self.noClickCon:ComponentByName("noClickImg", typeof(UISprite))
		self.noClickImg:GetComponent(typeof(UIWidget)).depth = self.cardItemMask:GetComponent(typeof(UIWidget)).depth + 3
		UIEventListener.Get(self.noClickImg.gameObject).onClick = handler(self, function()
			xyd.alert(xyd.AlertType.TIPS, __("SPACE_EXPLORE_TEXT_08"))
		end)
	end

	return self.noClickCon
end

function MapGridItem:setNoClickConVisible(visible)
	if visible and not self.noClickCon then
		self:getNoClickCon()
	end

	if self.noClickCon then
		self.noClickCon:SetActive(visible)
	end
end

function MapGridItem:playEffect(state)
	if state == "stone" then
		if not self.stone_effect then
			self.stone_effect = xyd.Spine.new(self.stoneEffectCon.gameObject)

			self.stone_effect:setInfo("stone_open", function()
				self.stone_effect:play("texiao01", 1, 1, function()
					self.stone_effect:stop()
					self.stoneEffectCon:SetActive(false)
				end)
			end)
		else
			self.stoneEffectCon:SetActive(true)
			self.stone_effect:play("texiao01", 1, 1, function()
				self.stone_effect:stop()
				self.stoneEffectCon:SetActive(false)
			end)
		end
	end

	if state == "door" then
		if not self.door_effect then
			self.door_effect = xyd.Spine.new(self.doorEffectCon.gameObject)

			self.door_effect:setInfo("door_light", function()
				self.door_effect:play("texiao01", 1, 1, function()
					self.door_effect:stop()
					self.doorEffectCon:SetActive(false)
				end)
			end)
		else
			self.doorEffectCon:SetActive(true)
			self.door_effect:play("texiao01", 1, 1, function()
				self.door_effect:stop()
				self.doorEffectCon:SetActive(false)
			end)
		end
	end
end

function MapGridItem:playGuide()
	if not self.guideTipsCon then
		self.guideTipsCon = NGUITools.AddChild(self.cardItem.gameObject, self.parent.cardItem_guideTipsCon.gameObject)
		self.guideEffect = self.guideTipsCon:ComponentByName("guideEffect", typeof(UITexture))
		self.guideEffect:GetComponent(typeof(UIWidget)).depth = self.cardItemMask:GetComponent(typeof(UIWidget)).depth + 11
	end

	if not self.guide_effect then
		self.guide_effect = xyd.Spine.new(self.guideEffect.gameObject)

		self.guide_effect:setInfo("fx_ui_dianji", function()
			self.guide_effect:play("texiao01", 0, 1, function()
				return
			end)
		end)
	end

	self.parent.guideEffect = self.guide_effect
	self.parent.guideEffectCon = self.guideTipsCon
end

function MapGridItem:isCanTouch()
	if self.noClickCon and self.noClickCon.gameObject.activeSelf then
		return false
	end

	if self.noClickCon and self.noClickCon.gameObject.activeSelf then
		return false
	end

	return true
end

return ActivitySpaceExploreMapWindow
