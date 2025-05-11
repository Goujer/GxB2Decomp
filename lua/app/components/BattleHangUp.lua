-- chunkname: @../../../Product/Bundles/Android/src/app/components/BattleHangUp.lua

local BattleHangUp = class("BattleHangUp", import(".BaseComponent"))
local GuildWarHangUp = class("GuildWarHangUp", BattleHangUp)
local SkillTable = xyd.tables.skillTable
local ResourceEffectTable = xyd.tables.resourceEffectTable
local BattleEffectFactory = xyd.BattleEffectFactory.get()

BattleHangUp.GuildWarHangUp = GuildWarHangUp

function BattleHangUp:ctor(parentGo, params)
	BattleHangUp.super.ctor(self, parentGo)

	self.defaultSelfMaxNum = 3
	self.defaultMonsterMaxNum = 2
	self.curIndex_ = -1
	self.selectMonsterSkinIDs = {}
	self.selfHerosNum = 0
	self.monsterNum = 0
	self.standPos = {
		{
			300,
			500,
			550
		},
		{
			100,
			150,
			500,
			550
		},
		{
			300,
			100,
			150,
			500,
			550
		}
	}
	self.standPosYs = {
		{
			200,
			50,
			300
		},
		{
			300,
			50,
			50,
			300
		},
		{
			200,
			300,
			50,
			50,
			300
		}
	}
	self.levels = {
		{
			30,
			10,
			40
		},
		{
			30,
			50,
			10,
			40
		},
		{
			30,
			50,
			0,
			10,
			40
		}
	}
	self.data_ = params
	self.selectMonsterIndex = 0
	self.team = {}
	self.selectStandIndex = 0
	self.timeScale_ = 1
	self.actions = {}
	self.fighterQueue = {}
	self.battleEnds = false
	self.nodeGroups_ = {}
	self.herosPos_ = {}
end

function BattleHangUp:getPrefabPath()
	return "Prefabs/Components/battle_hangup"
end

function BattleHangUp:initUI()
	BattleHangUp.super.initUI(self)

	self.groupMain_ = self.go:NodeByName("main_group").gameObject
	self.uiLayer_ = self.go:NodeByName("uiLayer_").gameObject
	self.heroNode = self.go:NodeByName("heroNode").gameObject
end

function BattleHangUp:updateInfo(params)
	self.data_ = params

	self:clearAction()
	self:startBattle()
end

function BattleHangUp:clearAction(isDestroy)
	self.curIndex_ = self.curIndex_ + 1
	self.selectMonsterIndex = 0

	for i in pairs(self.team) do
		local fighter = self.team[i]

		if fighter then
			fighter:clearAction()
		end
	end

	self:clearEffect(self.team)

	self.team = {}
	self.selectStandIndex = 0
	self.timeScale_ = 1

	for i = 1, #self.actions do
		local action = self.actions[i]

		action:Pause()
		action:Kill()
	end

	self.actions = {}
	self.fighterQueue = {}
	self.battleEnds = false
	self.nodeGroups_ = {}

	NGUITools.DestroyChildren(self.groupMain_.transform)
	NGUITools.DestroyChildren(self.uiLayer_.transform)
end

function BattleHangUp:clearEffect(team)
	local groupNames = {}

	for i in pairs(team) do
		local fighter = team[i]
		local modelName = fighter:getModelName()

		if xyd.arrayIndexOf(groupNames, modelName) < 0 then
			table.insert(groupNames, modelName)
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
end

function BattleHangUp:startBattle()
	if not self.data_ or not self.data_.tableIDs or #self.data_.tableIDs <= 0 or not self.data_.monsterIDs or #self.data_.monsterIDs <= 0 then
		return
	end

	self:setConfig()
	self:setFormation()
	self:loadFighterModel(function()
		local action = self:getTimeLineLite()
		local widget = self.groupMain_:GetComponent(typeof(UIWidget))

		widget.alpha = 0

		local function getter()
			return widget.color
		end

		local function setter(value)
			widget.color = value
		end

		action:Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 1, 0.5))
		action:AppendCallback(function()
			self:createFighterQueue()
			self:mainLoop()
		end)

		local ind = math.floor(math.random() * #self.data_.tableIDs) + 1
		local id = self.data_.tableIDs[ind]

		if xyd.tables.partnerTable then
			self.sound_id_ = xyd.tables.partnerTable:getHangTeamSound(id, self.data_.skinIDs[ind])

			xyd.SoundManager.get():playSound(self.sound_id_)
		end
	end)
end

function BattleHangUp:nextBattle()
	self.fighterQueue = {}
	self.battleEnds = false
	self.selectMonsterIndex = self.selectMonsterIndex + 1

	if self.selectMonsterIndex > #self.data_.monsterIDs then
		self.selectMonsterIndex = 1
	end

	local monsterIDs = self.data_.monsterIDs
	local monsterSkinIDs = self.data_.monsterSkinIDs or {}

	self.herosB = {
		monsterIDs[self.selectMonsterIndex],
		monsterIDs[self.selectMonsterIndex % #self.data_.monsterIDs + 1]
	}
	self.selectMonsterSkinIDs = {
		monsterSkinIDs[self.selectMonsterIndex],
		monsterSkinIDs[self.selectMonsterIndex % #monsterSkinIDs + 1]
	}

	if #self.herosB <= 0 then
		return
	end

	local pos = self.selfHerosNum

	for i = pos + 1, pos + 2 do
		if self.nodeGroups_[i] then
			NGUITools.Destroy(self.nodeGroups_[i])

			self.nodeGroups_[i] = nil

			self:clearEffect({
				self.team[i]
			})
		end
	end

	self:createMonster()
	self:loadFighterModel(function()
		if not self.nodeGroups_[pos + 1] or not self.nodeGroups_[pos + 2] then
			return
		end

		local action = self:getTimeLineLite()

		for i = 1, 2 do
			local w = self.nodeGroups_[pos + i]:GetComponent(typeof(UIWidget))

			w.alpha = 0

			local function getter()
				return w.color
			end

			local function setter(value)
				w.color = value
			end

			action:Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 1, 0.5))
		end

		action:AppendCallback(function()
			self:createFighterQueue()
			self:mainLoop()
		end)
	end)
end

function BattleHangUp:loadFighterModel(callback)
	local subNames = self:getSubNames()
	local effectNames = self:getHeroEffectFile(subNames)

	xyd.Spine:downloadAssets(effectNames, function()
		if self.isDispose_ then
			return
		end

		self:initModel(callback)
	end)
end

function BattleHangUp:getHeroEffectFile(groupNames)
	local datas = {}

	for i = 1, #groupNames do
		local names = ResourceEffectTable:getResNames(groupNames[i])

		for i = 1, #names do
			if xyd.arrayIndexOf(datas, names[i]) < 0 then
				table.insert(datas, names[i])
			end
		end
	end

	return datas
end

function BattleHangUp:initModel(callback)
	for i in pairs(self.team) do
		local fighter = self.team[i]

		if fighter and fighter:getFighterModel() == nil then
			local directX_ = 1

			if tonumber(i) > self.selfHerosNum then
				directX_ = -1
			end

			fighter:initModel(directX_)
			fighter:resumeIdle()
		end
	end

	self:resetZorders()

	if callback ~= nil then
		callback()
	end
end

function BattleHangUp:resetZorders()
	for pos, v in pairs(self.team) do
		if tonumber(pos) <= 12 then
			v:resetZOrder()
		end
	end
end

function BattleHangUp:getSubNames()
	local subNames = {}

	for _, v in pairs(self.team) do
		if v then
			local name = v:getModelName()

			if xyd.arrayIndexOf(subNames, name) < 0 then
				table.insert(subNames, name)
			end
		end
	end

	table.insert(subNames, "buff")

	return subNames
end

function BattleHangUp:createFighterQueue()
	for i = 1, self.selfHerosNum + self.monsterNum do
		if self.team[i] then
			table.insert(self.fighterQueue, self.team[i])
		end
	end
end

function BattleHangUp:setConfig()
	local tableIDs = self.data_.tableIDs
	local poses = self.data_.positions
	local skinIDs = self.data_.skinIDs

	self.selectSkinIDs = {}

	local selectIDs = {}

	selectIDs = tableIDs
	self.selectSkinIDs = skinIDs

	if #tableIDs == 2 then
		local sum = poses[1] + poses[2]

		if sum == 3 then
			self.standPos[2] = {
				300,
				100,
				500,
				550
			}
			self.standPosYs[2] = {
				200,
				300,
				50,
				300
			}
			self.levels[2] = {
				0,
				1,
				0,
				3
			}
		elseif sum == 4 then
			self.standPos[2] = {
				300,
				150,
				500,
				550
			}
			self.standPosYs[2] = {
				200,
				50,
				50,
				300
			}
		end
	else
		local sum = poses[1]

		if sum == 2 then
			self.standPos[1] = {
				100,
				500,
				550
			}
			self.standPosYs[1] = {
				300,
				50,
				300
			}
		elseif sum == 3 then
			self.standPos[1] = {
				150,
				500,
				550
			}
			self.standPosYs[1] = {
				50,
				50,
				300
			}
			self.levels[1] = {
				0,
				1,
				2
			}
		end
	end

	self.selectStandIndex = #selectIDs
	self.herosA = selectIDs
	self.selfHerosNum = #self.herosA

	local selectMonsterIDs = {}

	self.selectMonsterSkinIDs = {}

	local monsterIDs = self.data_.monsterIDs
	local monsterSkinIDs = self.data_.monsterSkinIDs or {}

	if #monsterIDs > self.defaultMonsterMaxNum then
		local randIDs = {}

		while #selectMonsterIDs < self.defaultMonsterMaxNum do
			local randID = math.random(#monsterIDs)

			if xyd.arrayIndexOf(randIDs, randID) < 0 then
				table.insert(randIDs, randID)

				local selectID = monsterIDs[randID]

				table.insert(selectMonsterIDs, selectID)
				table.insert(self.selectMonsterSkinIDs, monsterSkinIDs[randID] or 0)
			end
		end
	else
		selectMonsterIDs = monsterIDs
		self.selectMonsterSkinIDs = monsterSkinIDs
	end

	self.herosB = selectMonsterIDs
	self.monsterNum = #self.herosB
end

function BattleHangUp:setFormation()
	for i = 1, self.selfHerosNum do
		local tableID = self.herosA[i]
		local zOrder = self.levels[self.selectStandIndex][i]
		local fighter = self:newFighter({
			show_skin = 1,
			table_id = tableID,
			skin_id = self.selectSkinIDs[i]
		}, xyd.TeamType.A, i, false, 10000, zOrder)

		self.team[i] = fighter
	end

	self:createMonster()
end

function BattleHangUp:createMonster()
	for i = 1, #self.herosB do
		local tableID = self.herosB[i]
		local hp = math.random(8, 13)
		local zOrder = self.levels[self.selectStandIndex][i + self.selfHerosNum]
		local fighter = self:newFighter({
			show_skin = 1,
			table_id = tableID,
			skin_id = self.selectMonsterSkinIDs[i]
		}, xyd.TeamType.B, self.selfHerosNum + i, true, hp, zOrder)

		self.team[self.selfHerosNum + i] = fighter
	end
end

function BattleHangUp:newFighter(hero, teamType, pos, flipX, hp, zOrder)
	local x = self.standPos[self.selectStandIndex][pos]
	local y = self.standPosYs[self.selectStandIndex][pos] * xyd.Battle.unityPosYFlip
	local group = NGUITools.AddChild(self.groupMain_, self.heroNode)
	local depth = self.groupMain_:GetComponent(typeof(UIWidget)).depth + zOrder

	self.herosPos_[pos] = {
		x = x,
		y = y
	}

	group:SetLocalPosition(x, y, -depth)

	self.nodeGroups_[pos] = group

	local fighter = xyd.Battle.getRequire("BaseFighter").new()

	fighter:populate(hero, group, self.uiLayer_, self.bottomLayer_, self.screenScaleY)
	fighter:setBaseDepth(depth)
	fighter:setTimeScale(self.timeScale_)
	fighter:setTeamType(teamType)
	fighter:setPosIndex(pos)
	fighter:updateHp(hp)
	fighter:setBattleHangUp(true)

	return fighter
end

function BattleHangUp:mainLoop()
	local fighter = self:getCurFighter()

	if fighter then
		local tNext = self:playActor(fighter, fighter:getPugongID(), self:getActee(fighter))
	end
end

function BattleHangUp:getActee(fighter)
	local randID

	if fighter:getTeamType() == xyd.TeamType.A then
		randID = math.random(#self.herosB) + self.selfHerosNum
	else
		randID = math.random(self.selfHerosNum)
	end

	if self.team[randID]:isDeath() then
		if randID == self.selfHerosNum + #self.herosB then
			randID = randID - 1
		else
			randID = randID + 1
		end
	end

	local actee = self.team[randID]

	return {
		actee
	}
end

function BattleHangUp:getCurFighter()
	local fighter = self.fighterQueue[1]

	table.remove(self.fighterQueue, 1)
	table.insert(self.fighterQueue, fighter)

	while fighter:isDeath() do
		fighter = self.fighterQueue[1]

		table.remove(self.fighterQueue, 1)
		table.insert(self.fighterQueue, fighter)
	end

	return fighter
end

function BattleHangUp:playActor(actor, skillID, actees1)
	local attack = true
	local tAttack = actor:getAttackTime(skillID, actees1)
	local tFxHurt = actor:getHurtTime(skillID)
	local tJump = 0
	local tBack = 0
	local changeTime = actor:getChangeTime(skillID)
	local delayBack = tAttack - (changeTime[2] or 0) / 30

	if attack and SkillTable:jump(skillID, actor:getSkillIndex()) > 0 then
		tJump = 0.12
		tBack = 0.05

		local z2 = (xyd.UNIT_ZORDERS[1] + xyd.UNIT_ZORDERS[2]) / 2
		local heroPos = self.herosPos_[actor:getPosIndex()]
		local p1 = Vector3(heroPos.x, heroPos.y, 0)
		local p2

		if SkillTable:jump(skillID, actor:getSkillIndex()) == 1 then
			local actee

			if #actees1 > 0 then
				actee = actees1[1]
			end

			if actee ~= nil then
				local parentPos = actee:getParentPos()

				if actor:getTeamType() == xyd.TeamType.A then
					p2 = Vector3(parentPos.x - 113.9 + actee:getXOffset(), parentPos.y, 0)
				else
					p2 = Vector3(parentPos.x + 113.9, parentPos.y, 0)
				end

				z2 = actee:getParentCurDepth() + 1
			end
		end

		local transform = actor:getParent().transform
		local jumpAction = self:getTimeLineLite()

		jumpAction:Append(transform:DOLocalMove(p2, tJump, true)):AppendCallback(function()
			actor:setZOrder(z2)
		end):AppendInterval(delayBack):Append(transform:DOLocalMove(p1, tBack)):AppendCallback(function()
			actor:resetZOrder()
		end)
	end

	if actor and attack == true then
		self:schedule(tJump, function()
			actor:playAttack(skillID, actees1, function(event)
				if event ~= nil and event.Data.Name == "hit" then
					if tBack > 0 then
						tAttack = tAttack - event.Time
					else
						tAttack = 0.3
					end

					tAttack = math.max(tAttack, 0.3)

					actor:playAll(skillID, actees1)
					self:schedule(tFxHurt, function()
						self:updateAllBuffs(actor, skillID, actees1)
						self:schedule(tBack + tAttack - (changeTime[1] or 0) / 30, function()
							self:checkEnds()
						end)
					end)
					actor:playSound(skillID)
				end
			end)
		end)
	end
end

function BattleHangUp:getTimeLineLite()
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

function BattleHangUp:schedule(time, callback)
	if self.isDispose_ then
		return
	end

	time = xyd.checkCondition(time > 0, time, 0)

	if time == 0 then
		if callback ~= nil then
			callback()
		end

		return
	end

	local complete

	function complete()
		if not self.isDispose_ and callback ~= nil then
			callback()
		end
	end

	local action = self:getTimeLineLite()

	action:AppendInterval(time / self.timeScale_)
	action:AppendCallback(complete)
end

function BattleHangUp:updateAllBuffs(actor, skillID, actees1)
	for i = 1, #actees1 do
		local actee = actees1[i]

		actee:attacked()

		if actee:getTeamType() == xyd.TeamType.B then
			actee:updateHpBy(-1)
		end

		if actee:isDeath() then
			actee:die()
		end
	end
end

function BattleHangUp:checkEnds()
	if self.battleEnds then
		return true
	end

	if self.team[self.selfHerosNum + 1]:isDeath() and self.team[self.selfHerosNum + 2]:isDeath() then
		self.battleEnds = true

		self:schedule(1.6, function()
			if self.data_.ifUpdate then
				self.data_.ifUpdate = false

				self:updateInfo(self.data_)
			else
				self:nextBattle()
			end
		end)

		return true
	end

	self:mainLoop()

	return false
end

function BattleHangUp.getGuildWar()
	return GuildWarHangUp
end

function GuildWarHangUp:ctor(parentGo, params)
	GuildWarHangUp.super.ctor(self, parentGo, params)

	self.selectMonsterSkinIDs = {}
	self.standPosX = {
		125,
		65,
		315,
		250
	}
	self.standPosY = {
		165,
		190,
		190,
		165
	}
end

function GuildWarHangUp:setConfig()
	local tableIDs = self.data_.tableIDs
	local skinIDs = self.data_.skinIDs or {}

	self.selectSkinIDs = {}

	local selectIDs = {}

	if #tableIDs > self.defaultSelfMaxNum then
		local randIDs = {}

		while #selectIDs < self.defaultSelfMaxNum do
			local randID = math.floor(math.random() * #tableIDs + 0.5)

			if xyd.arrayIndexOf(randIDs, randID) < 0 then
				table.insert(randIDs, randID)

				local selectID = tableIDs[randID + 1]

				table.insert(selectIDs, selectID)
				table.insert(self.selectSkinIDs, skinIDs[randID + 1] or 0)
			end
		end
	else
		selectIDs = tableIDs
		self.selectSkinIDs = skinIDs
	end

	self.herosA = selectIDs
	self.selfHerosNum = #self.herosA

	local selectMonsterIDs = {}

	self.selectMonsterSkinIDs = {}

	local monsterIDs = self.data_.monsterIDs
	local monsterSkinIDs = self.data_.monsterSkinIDs or {}

	if #monsterIDs > self.defaultSelfMaxNum then
		local randIDs = {}

		while #selectMonsterIDs < self.defaultSelfMaxNum do
			local randID = math.floor(math.random() * #monsterIDs + 0.5)

			if xyd.arrayIndexOf(randIDs, randID) < 0 then
				table.insert(randIDs, randID)

				local selectID = monsterIDs[randID + 1]

				table.insert(selectMonsterIDs, selectID)
				table.insert(self.selectMonsterSkinIDs, monsterSkinIDs[randID + 1] or 0)
			end
		end
	else
		selectMonsterIDs = monsterIDs
		self.selectMonsterSkinIDs = monsterSkinIDs
	end

	self.herosB = selectMonsterIDs
	self.monsterNum = #self.herosB
end

function GuildWarHangUp:setFormation()
	for i = 1, #self.herosA do
		local tableID = self.herosA[i]
		local fighter = self:newFighter({
			show_skin = 1,
			table_id = tableID,
			skin_id = self.selectSkinIDs[i + 1]
		}, xyd.TeamType.A, i, false, 10000)

		self.team[i] = fighter
	end

	self:createMonster()
end

function GuildWarHangUp:createMonster()
	for i = 1, #self.herosB do
		local tableID = self.herosB[i]
		local hp = math.floor(math.random() * 8 + 5 + 0.5)
		local fighter = self:newFighter({
			show_skin = 1,
			table_id = tableID,
			skin_id = self.selectMonsterSkinIDs[i + 1]
		}, xyd.TeamType.B, 2 + i, true, hp)

		self.team[i + 2] = fighter
	end
end

function GuildWarHangUp:updateAllBuffs(actor, skillID, actees1)
	for i = 1, #actees1 do
		local actee = actees1[i]

		actee:attacked()
	end
end

function GuildWarHangUp:newFighter(hero, teamType, pos, flipX, hp)
	local x = self.standPosX[pos]
	local y = self.standPosY[pos]
	local group = NGUITools.AddChild(self.groupMain_, self.heroNode)
	local depth = self.groupMain_:GetComponent(typeof(UIWidget)).depth

	self.nodeGroups_[pos] = group

	local fighter = xyd.Battle.getRequire("BaseFighter").new()

	fighter:populate(hero, group, self.uiLayer_, self.bottomLayer_, self.screenScaleY)
	fighter:setBaseDepth(depth)
	fighter:setTimeScale(self.timeScale_)
	fighter:setTeamType(teamType)
	fighter:setPosIndex(pos)
	fighter:updateHp(hp)
	fighter:setBattleHangUp(true)

	self.herosPos_[pos] = {
		x = x,
		y = y
	}

	group:SetLocalPosition(x, y, 0)
	group:SetLocalScale(0.7, 0.7, 0.7)

	return fighter
end

function GuildWarHangUp:getActee(fighter)
	local randID

	if fighter:getTeamType() == xyd.TeamType.A then
		randID = math.floor(math.random() * (#self.herosB - 1) + 0.5) + 2
	else
		randID = math.floor(math.random() * (#self.herosA - 1) + 0.5)
	end

	local actee = self.team[randID + 1]

	return {
		actee
	}
end

function GuildWarHangUp:checkEnds()
	if self.battleEnds then
		return true
	end

	self:mainLoop()

	return false
end

return BattleHangUp
