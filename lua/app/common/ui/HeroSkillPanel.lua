-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/HeroSkillPanel.lua

local HeroTable = xyd.tables.hero
local MiscTable = xyd.tables.misc
local HeroSkillTable = xyd.tables.heroSkill
local BuffTable = xyd.tables.buff
local SkillIcon = import("app.common.ui.SkillIcon")
local HeroSkillPanel = class("HeroSkillPanel", import(".BaseTipPanel"))

function HeroSkillPanel.get()
	if not HeroSkillPanel.INSTANCE then
		HeroSkillPanel.INSTANCE = HeroSkillPanel.new()
	end

	return HeroSkillPanel.INSTANCE
end

function HeroSkillPanel:initUI()
	self.skillIcons_ = {}
	self.prefab_ = "Prefabs/Common/hero_skill_panel"

	HeroSkillPanel.super.initUI(self)

	local go = self.offset_
	local spriteICon = go:NodeByName("sprite_icon").gameObject

	if not self.skillIcon_ then
		self.skillIcon_ = SkillIcon.new(spriteICon)
	end

	self.labelName_ = go:ComponentByName("label_name", typeof(UILabel))
	self.labelType_ = go:ComponentByName("label_type", typeof(UILabel))
	self.labelDesc_ = go:ComponentByName("label_desc", typeof(UILabel))
	self.labelTip_ = go:ComponentByName("label_tip", typeof(UILabel))
	self.labelNextLevel_ = go:ComponentByName("label_next_level", typeof(UILabel))
	self.labelNextDesc_ = go:ComponentByName("label_next_desc", typeof(UILabel))
	self.spriteBg_ = go:ComponentByName("sprite_bg", typeof(UISprite))
end

function HeroSkillPanel:setContent(go, params)
	params = params or {}

	local heroID = params.heroID
	local index = params.index
	local rank = params.rank
	local heroInfo = xyd.models.hero:getInfo(heroID)
	local heroLevel = heroInfo:getLevel()
	local skillIDs = HeroTable:getSkills(heroID)
	local sid = skillIDs[index + 1]
	local heroMaxLevel = MiscTable:getData("lord_max_level", 1)
	local skillType = HeroSkillTable:getSkillType(sid)
	local hurtKind = HeroSkillTable:getHurtKind(sid)
	local unlocks = MiscTable:getData("hero_skill_unlock_rank", 1)
	local unlockRank = unlocks[index]
	local isUnlock = unlockRank <= rank
	local isMax = heroLevel == heroMaxLevel
	local slevel

	if isUnlock then
		slevel = math.max(1, heroLevel - xyd.HeroSkillLevelDelta[index])
	else
		slevel = 1
	end

	self.skillIcon_:show(sid)

	self.labelName_.text = __(HeroSkillTable:getName(sid))
	self.labelType_.text = __("HERO_SKILL_TYPE_" .. skillType)

	local attrValue = 0

	if hurtKind == xyd.HurtKind.PHYSICS then
		attrValue = heroInfo:getAttr(xyd.HeroAttr.PHYSATK)
	elseif hurtKind == xyd.HurtKind.MAGIC then
		attrValue = heroInfo:getAttr(xyd.HeroAttr.MAGIATK)
	end

	local strDesc1 = __(HeroSkillTable:getDesc(sid))
	local strDesc2 = self:getHeroSkillDesc(sid, slevel, attrValue, heroLevel)

	self.labelDesc_.text = string.format("[e5e5e5]%s\n%s[-]", strDesc1, strDesc2)

	local noNext = not isUnlock or isMax

	self.labelNextLevel_.gameObject:SetActive(not noNext)
	self.labelNextDesc_.gameObject:SetActive(not noNext)
	self.labelTip_.gameObject:SetActive(noNext)

	if noNext then
		if not isUnlock then
			self.labelTip_.text = __("HERO_SKILL_UNLOCK_" .. unlockRank)
			self.labelTip_.color = Color.New2(3255767807)
		elseif isMax then
			self.labelTip_.text = __("HERO_SKILL_LEVEL_MAX")
			self.labelTip_.color = Color.New2(2947856383)
		end

		self.spriteBg_.height = self.labelDesc_.height + 339
	else
		self.labelNextLevel_.text = __("NEXT_LEVEL_NAME")
		self.labelNextDesc_.text = string.format("[F7C894FF]%s[-]", self:getHeroSkillDesc(sid, slevel + 1, attrValue, heroLevel))
		self.spriteBg_.height = self.labelDesc_.height + self.labelNextDesc_.height + 314
	end

	params.offsetY = self.spriteBg_.height
end

function HeroSkillPanel:getHeroSkillDesc(sid, slevel, attrValue, heroLevel)
	local strInfo = __(HeroSkillTable:getValueInfo(sid))
	local hasX = string.find(strInfo, "%%x")

	if hasX then
		local hurtValue = HeroSkillTable:getHurtValue(sid)
		local hurtAddition = HeroSkillTable:getHurtAddition(sid)
		local hurtIncrValue = HeroSkillTable:getHurtIncreaseValue(sid)
		local valueX = hurtValue + slevel * hurtIncrValue + hurtAddition * attrValue

		strInfo = string.gsub(strInfo, "%%x", xyd.getDisplayNumber(math.floor(valueX)))
	end

	local hasY = string.find(strInfo, "%%y")

	if hasY then
		local stateValue = HeroSkillTable:getStateValue(sid)
		local stateAddition = HeroSkillTable:getStateAddition(sid)
		local stateIncrValue = HeroSkillTable:getStateIncreaseValue(sid)
		local valueY = stateValue + slevel * stateIncrValue + stateAddition * attrValue

		strInfo = string.gsub(strInfo, "%%y", xyd.getDisplayNumber(math.floor(valueY)))
	end

	local hasB = string.find(strInfo, "%%b")

	if hasB then
		local desc = __("HERO_SKILL_ACCURACY_INFO", heroLevel)

		strInfo = string.gsub(strInfo, "%%b", desc)
	end

	return strInfo
end

return HeroSkillPanel
