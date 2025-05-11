-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/BattleSkillPanel.lua

local HeroTable = xyd.tables.hero
local MiscTable = xyd.tables.misc
local HeroSkillTable = xyd.tables.heroSkill
local BuffTable = xyd.tables.buff
local SkillIcon = import("app.common.ui.SkillIcon")
local BattleSkillPanel = class("BattleSkillPanel", import(".BaseTipPanel"))

function BattleSkillPanel.get()
	if not BattleSkillPanel.INSTANCE then
		BattleSkillPanel.INSTANCE = BattleSkillPanel.new()
	end

	return BattleSkillPanel.INSTANCE
end

function BattleSkillPanel:initUI()
	self.skillIcons_ = {}
	self.prefab_ = "Prefabs/Common/battle_skill_panel"

	BattleSkillPanel.super.initUI(self)

	local go = self.offset_
	local spriteICon = go:NodeByName("sprite_icon").gameObject

	if not self.skillIcon_ then
		self.skillIcon_ = SkillIcon.new(spriteICon)
	end

	self.labelName_ = go:ComponentByName("label_name", typeof(UILabel))
	self.labelType_ = go:ComponentByName("label_type", typeof(UILabel))
	self.labelDesc_ = go:ComponentByName("label_desc", typeof(UILabel))

	local labelValues = go:ComponentByName("label_values", typeof(UILabel))

	labelValues.text = __("HERO_SKILL_TIP_1")
	self.labelTip_ = go:ComponentByName("label_tip", typeof(UILabel))
	self.uiGrid_ = go:ComponentByName("grid_grades", typeof(UIGrid))
	self.cellItem_ = go:NodeByName("sprite_grade").gameObject

	self.cellItem_:SetActive(false)
end

function BattleSkillPanel:setContent(go, params)
	params = params or {}

	local heroID = params.heroID
	local index = params.index
	local grade = params.grade
	local rank = params.rank
	local landSkills = HeroTable:getLandSkills(heroID)
	local sid = landSkills[index]
	local skillType = HeroSkillTable:getSkillType(sid)

	self.skillIcon_:show(sid, {
		grade = grade
	})

	self.labelName_.text = __(HeroSkillTable:getName(sid))
	self.labelType_.text = __("HERO_SKILL_TYPE_" .. skillType)

	local unlocks = MiscTable:getData("hero_skill_unlock_rank", 1)
	local unlockLevel = unlocks[index]

	if rank < unlockLevel then
		self.labelTip_.text = __("HERO_SKILL_UNLOCK_" .. unlockLevel)
		self.labelTip_.color = Color.New2(3255767807)
	else
		self.labelTip_.text = __("HERO_SKILL_TYPE_DESC_" .. skillType)
		self.labelTip_.color = Color.New2(2947856383)
	end

	if self.uiGrid_.transform.childCount <= 0 then
		for i = 1, 5 do
			local goItem = NGUITools.AddChild(self.uiGrid_.gameObject, self.cellItem_)
			local spriteGrade = goItem:GetComponent(typeof(UISprite))

			spriteGrade.spriteName = "icon_grade_" .. i
		end

		self.uiGrid_:Reposition()
	end

	local levels = MiscTable:getData("hero_skill_level_per_color", 1)
	local buffID = HeroSkillTable:getHurtAddition(sid)
	local baseValue = HeroSkillTable:getHurtValue(sid)
	local incrValue = HeroSkillTable:getHurtIncreaseValue(sid)
	local buffName = BuffTable:getName(buffID)

	for i = 1, 5 do
		local goItem = self.uiGrid_.transform:GetChild(i - 1)
		local labelValue = goItem:ComponentByName("label_value", typeof(UILabel))
		local level = levels[i]
		local value = baseValue + incrValue * level
		local displayValue = xyd.getBuffDisplayValue(buffID, value)

		labelValue.text = displayValue

		if i == grade then
			if index == 1 then
				self.labelDesc_.text = __(buffName, value / 100)
			else
				self.labelDesc_.text = __(buffName) .. displayValue
			end
		end
	end
end

return BattleSkillPanel
