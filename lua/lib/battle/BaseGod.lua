-- chunkname: @../../../Product/Bundles/Android/src/lib/battle/BaseGod.lua

local BaseGod = class("BaseGod", xyd.Battle.getRequire("BaseFighter"))
local ModelTable = xyd.tables.modelTable
local BattleEffectFactory = xyd.BattleEffectFactory.get()
local PetTable = xyd.tables.petTable
local SkillTable = xyd.tables.skillTable
local FxTable = xyd.tables.fxTable

function BaseGod:ctor()
	BaseGod.super.ctor(self)

	self.wnd_ = nil
end

function BaseGod:populate(top, bottom, scaleY)
	if scaleY == nil then
		scaleY = 1
	end

	self.screenScaleY = scaleY
	self.energy = 0
	self.bottomLayer_ = bottom
	self.topLayer_ = top
end

function BaseGod:isGod()
	return true
end

function BaseGod:changeColor(color, time_)
	return
end

function BaseGod:setMaskColor(flag)
	return
end

function BaseGod:setWnd(wnd)
	self.wnd_ = wnd
end

function BaseGod:setTeamType(teamType)
	self.teamType = teamType
end

function BaseGod:getTeamType()
	return self.teamType
end

function BaseGod:setPosIndex(pos)
	self.posIndex = pos
end

function BaseGod:getPosIndex()
	return self.posIndex
end

function BaseGod:setFrameIndex(index)
	self.frameIndex_ = index
end

function BaseGod:getTableID()
	return 0
end

function BaseGod:getSkillIndex()
	return self.skillIndex_
end

function BaseGod:getFighterModel(needCreate)
	return self.fighterModel
end

function BaseGod:getEnergy()
	return self.energy
end

function BaseGod:updateEnergyBy(value)
	self.energy = self.energy + value

	self:updateEnergy(self.energy)
end

function BaseGod:playAllDamageNumbers()
	return 0
end

function BaseGod:updateEnergy(val)
	self.energy = math.min(val, 100)
	self.energy = math.max(val, 0)
end

function BaseGod:getModelName()
	return ""
end

function BaseGod:getModelID()
	local modelID = PetTable:getModelID(self:getTableID())

	return modelID
end

function BaseGod:getHurtTime()
	return 0
end

function BaseGod:playSound(skillID)
	local id = SkillTable:getSound(skillID, self.skillIndex_)

	if id > 0 then
		xyd.SoundManager.get():playSound(id)
	end
end

function BaseGod:getLayerByType(type)
	if type == xyd.BaseFightLayerType.TOP then
		return self.topLayer_
	elseif type == xyd.BaseFightLayerType.BOTTOM then
		return self.bottomLayer_
	elseif type == xyd.BaseFightLayerType.BUFF_BOT then
		return self.buffBottomLayer
	else
		return self.buffLayer
	end
end

function BaseGod:playAnimation(name, callback, num)
	return
end

function BaseGod:playMaskAction()
	local duration = self:getHurtTime()
	local layer = self:getLayerByType(xyd.BaseFightLayerType.TOP)

	if not self.maskImg_ then
		local img_ = NGUITools.AddChild(layer, "pet_mask")
		local sp = img_:AddComponent(typeof(UISprite))

		xyd.setUISprite(sp, xyd.Atlas.COMMON_UI, "guide_mask")

		sp.depth = layer:GetComponent(typeof(UIWidget)).depth - 1
		sp.width = 1000
		sp.height = 1559
		self.maskImg_ = sp
	end

	local img_ = self.maskImg_

	img_.color = Color.New2(1)

	self.maskImg_:SetLocalPosition(360, -640, 0)
	self.maskImg_:SetActive(true)

	local function getter()
		return img_.color
	end

	local function setter(value)
		img_.color = value
	end

	local delay = (duration - 0.2) / self.timeScale_
	local action = self:getTimeLineLite()

	action:Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 0.7, 0.1)):AppendInterval(delay):Append(DG.Tweening.DOTween.ToAlpha(getter, setter, 0.01, 0.1)):AppendCallback(function()
		self.maskImg_:SetActive(false)
	end)
end

function BaseGod:getEffect(effectName, scaleX, scaleY)
	local effect = BattleEffectFactory:getNewEffect(nil, effectName)

	effect.transform.localScale = Vector3(scaleX, scaleY, 1)

	table.insert(self.effects_, effect)

	return effect
end

function BaseGod:returnToObjs(effect)
	local index = xyd.arrayIndexOf(self.effects_, effect)

	if index > -1 then
		table.remove(self.effects_, index)
	end

	BattleEffectFactory:pushBackEffect(effect)

	local i = xyd.arrayIndexOf(self.effectsStayLastFrame_, effect)

	if i > -1 then
		table.remove(self.effectsStayLastFrame_, i)
	end
end

function BaseGod:playOne(fx, target, skillID, unitPos, delta)
	if skillID == nil then
		skillID = 0
	end

	if unitPos == nil then
		unitPos = -1
	end

	local degree

	function degree(x, y)
		return math.atan(y / x) * 57.29577951
	end

	local diretion = self:getTeamType() == xyd.TeamType.A and 1 or -1
	local effectName = FxTable:getResName(fx)
	local texiaoName = FxTable:getFxName(fx)
	local position = FxTable:getPosition(fx)
	local layer = FxTable:getLayer(fx)
	local retain = FxTable:isRetain(fx)
	local isLoop = FxTable:isLoop(fx)
	local scale = FxTable:getScale(fx)
	local offX = FxTable:getX(fx)
	local offY = FxTable:getY(fx) * self.screenScaleY
	local isParallel = FxTable:isParallel(fx)
	local isPass = FxTable:isPass(fx)
	local playTimes = 1

	if isLoop then
		playTimes = 0
	end

	local effect = self:getEffect(effectName, scale, scale)

	effect.name = "" .. tostring(fx) .. tostring(self.frameIndex_)

	local effectAnim = effect:GetComponent(typeof(SpineAnim))
	local targetDelta

	effectAnim.timeScale = self.timeScale_

	local fxType = FxTable:getType(fx)
	local uiLayer = target:getLayerByType(xyd.BaseFightLayerType.TOP)

	ResCache.AddChild(uiLayer, effect)

	effect.transform.localScale = Vector3(scale * diretion, scale, 1)
	effect.transform.localPosition = Vector3(360, -640, 0)

	effectAnim:play(texiaoName, playTimes)

	if playTimes ~= 0 and not retain then
		effectAnim:addListener("Complete", function()
			self:returnToObjs(effect)
		end)
	end

	if retain and playTimes > 0 then
		effectAnim:addListener("Complete", function()
			if xyd.arrayIndexOf(self.effectsStayLastFrame_, effect) < 0 then
				table.insert(self.effectsStayLastFrame_, effect)
			end
		end)
	end

	effectAnim.RenderTarget = uiLayer:GetComponent(typeof(UIWidget))

	if delta then
		effectAnim.targetDelta = delta
	end

	return effect
end

function BaseGod:playHurtFx(fxs)
	local t = 0

	if #fxs > 0 then
		for _, fx in ipairs(fxs) do
			local tmpT = FxTable:getSpeed(fx)

			t = xyd.checkCondition(t < tmpT, tmpT, t)

			local layer = FxTable:getLayer(fx)
			local uiLayer

			if layer == xyd.FxLayerType.BOTTOM then
				uiLayer = self:getLayerByType(xyd.BaseFightLayerType.BUFF_BOT)
			else
				uiLayer = self:getLayerByType(xyd.BaseFightLayerType.BUFF_TOP)
			end
		end
	end

	return t
end

function BaseGod:pause(onlyModel)
	if onlyModel == nil then
		onlyModel = false
	end

	if onlyModel == false then
		for i = 1, #self.actions do
			local action = self.actions[i]

			action:Pause()
		end
	else
		self.isPause_ = true
	end
end

function BaseGod:resume(onlyModel)
	if onlyModel == nil then
		onlyModel = false
	end

	if onlyModel and self.isPause_ then
		self.isPause_ = false
	end

	if onlyModel == false then
		for i = 1, #self.actions do
			local action = self.actions[i]

			action:Play()
		end
	end
end

function BaseGod:getTimeLineLite()
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

function BaseGod:setTimeScale(num)
	num = num == xyd.BASIC_BATTLE_SPEED and 1 or 2
	self.timeScale_ = num
end

function BaseGod:getTimeScale()
	return self.timeScale_
end

function BaseGod:battleSpeed()
	return
end

function BaseGod:clearAction()
	if #self.actions > 0 then
		for i = 1, #self.actions do
			local action = self.actions[i]

			action:Pause()
			action:Kill()
		end

		self.actions = {}
	end

	for i = 1, #self.effects_ do
		local effect = self.effects_[i]

		self:returnToObjs(effect)
	end
end

function BaseGod:setMaskColor(flag)
	return
end

return BaseGod
