-- chunkname: @../../../Product/Bundles/Android/src/app/components/ChallengeComponent.lua

local ChallengeComponent = class("ChallengeComponent", import(".BaseComponent"))
local HeroIcon = import("app.components.HeroIcon")

function ChallengeComponent:ctor(parentGo, params)
	self.items_ = {}

	ChallengeComponent.super.ctor(self, parentGo)
end

function ChallengeComponent:getPrefabPath()
	return "Prefabs/Components/challenge_fight_item"
end

function ChallengeComponent:initUI()
	ChallengeComponent.super.initUI(self)
	self:getUIComponent()
	self:register()
end

function ChallengeComponent:setInfo(params)
	self.info_ = params

	self:setLayout()
end

function ChallengeComponent:getUIComponent()
	local trans = self.go.transform
	local top = trans:NodeByName("top").gameObject
	local bottom = trans:NodeByName("bottom").gameObject

	self.groupMonster = top:NodeByName("groupMonster").gameObject
	self.groupMonsterGrid = self.groupMonster:GetComponent(typeof(UIGrid))
	self.groupItems = top:NodeByName("groupItems").gameObject
	self.groupItemsGrid = self.groupItems:GetComponent(typeof(UIGrid))
	self.labelText03 = top:ComponentByName("groupReward/labelText03", typeof(UILabel))
	self.labelText02 = top:ComponentByName("groupEnemy/labelText02", typeof(UILabel))
	self.labelText04 = bottom:ComponentByName("groupChallengeLabel/labelText04", typeof(UILabel))
	self.btnBattle = bottom:NodeByName("btnBattle").gameObject
	self.btnBattleLabel = self.btnBattle:ComponentByName("button_label", typeof(UILabel))

	for i = 1, 3 do
		self["challengeItem" .. i] = bottom:ComponentByName("groupChallenges/challengeItem" .. i, typeof(UIWidget))
		self["starImg" .. i] = bottom:ComponentByName("groupChallenges/challengeItem" .. i .. "/starImg", typeof(UISprite))
		self["challengeLabel" .. i] = bottom:ComponentByName("groupChallenges/challengeItem" .. i .. "/labelDesc", typeof(UILabel))
		self["imgComplete" .. i] = bottom:NodeByName("groupChallenges/challengeItem" .. i .. "/imgComplete").gameObject
	end
end

function ChallengeComponent:setLayout()
	self.labelText02.text = __("ACTIVITY_BEACH_ISLAND_TEXT05")
	self.labelText03.text = __("ACTIVITY_BEACH_ISLAND_TEXT06")
	self.labelText04.text = __("ACTIVITY_BEACH_ISLAND_TEXT07")
	self.btnBattleLabel.text = __("TOWER_TEXT04")

	self:setMonsterDisplay()
	self:setRewardDisplay()
	self:initChallengeState()
end

function ChallengeComponent:setMonsterDisplay()
	if self.hasInitMonster_ then
		return
	end

	self.hasInitMonster_ = true

	local battleID = self.info_.battle_id
	local monsters = xyd.tables.battleTable:getMonsters(battleID)

	for i = 1, #monsters do
		local tableID = monsters[i]
		local id = xyd.tables.monsterTable:getPartnerLink(tableID)
		local itemID = xyd.tables.monsterTable:getSkin(tableID)
		local lev = xyd.tables.monsterTable:getShowLev(tableID)
		local icon = HeroIcon.new(self.groupMonster)

		icon:setInfo({
			hide_attr = true,
			noWays = true,
			is_monster = true,
			tableID = id,
			lev = lev,
			skin_id = itemID
		})

		local scale = 0.7962962962962963

		icon.go:SetLocalScale(scale, scale, scale)
	end

	self.groupMonsterGrid:Reposition()
end

function ChallengeComponent:initChallengeState()
	local maxLen = 0

	for i = 1, 3 do
		local text = self.info_.text[i]

		if text and maxLen < #text then
			maxLen = #text
		end

		self["challengeLabel" .. i].text = text

		if self.info_.challengeState[i] and tonumber(self.info_.challengeState[i]) == 1 then
			xyd.setUISpriteAsync(self["starImg" .. i], nil, "activity_beach_star_icon")

			self["challengeLabel" .. i].color = Color.New2(1549556991)
		else
			xyd.setUISpriteAsync(self["starImg" .. i], nil, "activity_beach_star_icon2")

			self["challengeLabel" .. i].color = Color.New2(2795939583)
		end
	end

	if xyd.Global.lang ~= "zh_tw" and xyd.Global.lang ~= "ja_jp" and xyd.Global.lang ~= "ko_kr" then
		if maxLen > 24 and maxLen <= 32 then
			for i = 1, 3 do
				self["challengeItem" .. i].width = 444
			end
		elseif maxLen > 32 then
			for i = 1, 3 do
				self["challengeItem" .. i].width = 532
			end
		end
	elseif maxLen > 48 and maxLen <= 64 then
		for i = 1, 3 do
			self["challengeItem" .. i].width = 444
		end
	elseif maxLen > 64 then
		for i = 1, 3 do
			self["challengeItem" .. i].width = 532
		end
	end
end

function ChallengeComponent:setRewardDisplay()
	self.hasInitAward_ = true

	local rewards = self.info_.awards

	for i = 1, #rewards do
		local tableID = rewards[i][1]
		local num = rewards[i][2]
		local params = {
			notShowGetWayBtn = true,
			scale = 0.9074074074074074,
			itemID = tableID,
			num = num,
			uiRoot = self.groupItems
		}
		local icon

		if self.hasInitAward_ and self.items_[i] then
			if self.info_.hasAwarded then
				self.items_[i]:setChoose(true)
			else
				self.items_[i]:setChoose(false)
			end
		else
			local icon = xyd.getItemIcon(params)

			self.items_[i] = icon

			if self.info_.hasAwarded then
				self.items_[i]:setChoose(true)
			else
				self.items_[i]:setChoose(false)
			end
		end
	end

	self.groupItemsGrid:Reposition()
end

function ChallengeComponent:register()
	UIEventListener.Get(self.btnBattle).onClick = handler(self, self.requestBattle)
end

function ChallengeComponent:requestBattle()
	if self.info_ and self.info_.open_time and self.info_.activity_open_time and self.info_.activity_open_time + xyd.DAY_TIME * self.info_.open_time > xyd.getServerTime() then
		return
	end

	if self.info_.canNotFight then
		xyd.alertTips(__("ACTIVITY_BEACH_ISLAND_TEXT03"))

		return
	end

	local fightParams = {
		showSkip = false,
		stageId = self.info_.id,
		battleType = xyd.BattleType.ENCOUNTER_STORY
	}

	xyd.WindowManager.get():openWindow("battle_formation_window", fightParams)
end

return ChallengeComponent
