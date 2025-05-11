-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/LandSkillPanel.lua

local HeroTable = xyd.tables.hero
local MiscTable = xyd.tables.misc
local HeroSkillTable = xyd.tables.heroSkill
local BuffTable = xyd.tables.buff
local HeroIcon = import("app.common.ui.HeroIcon")
local SkillIcon = import("app.common.ui.SkillIcon")
local LandSkillPanel = class("LandSkillPanel", import(".BaseTipPanel"))

function LandSkillPanel.get()
	if not LandSkillPanel.INSTANCE then
		LandSkillPanel.INSTANCE = LandSkillPanel.new()
	end

	return LandSkillPanel.INSTANCE
end

function LandSkillPanel:initUI()
	self.skillIcons_ = {}
	self.prefab_ = "Prefabs/Common/land_skill_panel"

	LandSkillPanel.super.initUI(self)

	local heroNode = self.offset_:NodeByName("hero")
	local heroContainer = heroNode:ComponentByName("hero_icon", typeof(UIWidget))

	self.heroIcon_ = HeroIcon.new(heroContainer.gameObject)
	self.nameLabel_ = heroNode:ComponentByName("label_name", typeof(UILabel))
	self.typeLabel_ = heroNode:ComponentByName("label_type", typeof(UILabel))
	self.rankBg_ = heroNode:ComponentByName("rank", typeof(UISprite))
	self.rankIcon_ = self.rankBg_:ComponentByName("icon", typeof(UISprite))
	self.numLabel_ = heroNode:ComponentByName("label_num", typeof(UILabel))
end

function LandSkillPanel:setContent(go, params)
	params = params or {}

	local heroInfo = params.heroInfo

	self:initHero(heroInfo)
	self:initSkills(heroInfo)
end

function LandSkillPanel:initHero(heroInfo)
	local heroId = heroInfo:getID()

	self.heroIcon_:show(heroId, {
		info = heroInfo
	})

	self.nameLabel_.text = __(HeroTable:getName(heroId))

	local soldierType = HeroTable:getSoldierType(heroId)

	self.typeLabel_.text = __("TRAP_KIND_" .. soldierType)

	local rank = heroInfo:getRank() or 1

	xyd.setHeroRankIcon(self.rankIcon_.gameObject, rank)

	self.rankBg_.spriteName = "icon_rank_" .. rank

	local rank2ArmyNum = MiscTable:getData("hero_num_of_army", 1)

	self.numLabel_.text = xyd.getDisplayNumber(rank2ArmyNum[rank])
end

function LandSkillPanel:initSkills(heroInfo)
	local landSkills = HeroTable:getLandSkills(heroInfo:getID())
	local levels = MiscTable:getData("hero_skill_level_per_color", 1)
	local unlocks = MiscTable:getData("hero_skill_unlock_rank", 1)
	local grade = heroInfo:getGrade()

	for i = 1, 4 do
		local skillNode = self.offset_:NodeByName("skill_" .. i)
		local nameLabel = skillNode:ComponentByName("label_name", typeof(UILabel))
		local id = landSkills[i]

		nameLabel.text = __(HeroSkillTable:getName(id))

		local descLabel = skillNode:ComponentByName("label_desc", typeof(UILabel))
		local level = levels[grade]
		local buffId = HeroSkillTable:getHurtAddition(id)
		local baseValue = HeroSkillTable:getHurtValue(id)
		local incrValue = HeroSkillTable:getHurtIncreaseValue(id)
		local value = baseValue + incrValue * level
		local buffName = BuffTable:getName(buffId)
		local displayValue = xyd.getBuffDisplayValue(buffId, value)

		if i == 1 then
			descLabel.text = __(buffName, value / 100)
		else
			descLabel.text = __(buffName) .. displayValue
		end

		local locked
		local unlockLevel = unlocks[i]
		local rank = heroInfo:getRank()

		if rank < unlockLevel then
			locked = true
		end

		local skillContainer = skillNode:ComponentByName("skill_icon", typeof(UIWidget))
		local skillIcon = self.skillIcons_[i]

		if not skillIcon then
			skillIcon = SkillIcon.new(skillContainer.gameObject)
			self.skillIcons_[i] = skillIcon
		end

		skillIcon:show(id, {
			locked = locked
		})
	end
end

function LandSkillPanel:getPositionSize(go, offsetX, offsetY)
	return self:getPositionSize2(go, offsetX, offsetY)
end

return LandSkillPanel
