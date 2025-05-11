-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/MonsterTipPanel.lua

local MonsterTipPanel = class("MonsterTipPanel", import(".BaseTipPanel"))
local HeroIcon = import(".HeroIcon")
local HeroTable = xyd.tables.hero

function MonsterTipPanel.get()
	if not MonsterTipPanel.INSTANCE then
		MonsterTipPanel.INSTANCE = MonsterTipPanel.new()
	end

	return MonsterTipPanel.INSTANCE
end

function MonsterTipPanel:initUI()
	self.prefab_ = "Prefabs/Common/monster_tip_panel"

	MonsterTipPanel.super.initUI(self)

	local info = self.offset_:NodeByName("info")

	self.widgetInfo_ = info:GetComponent(typeof(UIWidget))
	self.labelName_ = info:ComponentByName("label_name", typeof(UILabel))
	self.labelDesc2_ = info:ComponentByName("label_desc_2", typeof(UILabel))
	self.labelDesc3_ = info:ComponentByName("label_desc_3", typeof(UILabel))
	self.labelBoss_ = info:ComponentByName("label_boss", typeof(UILabel))
	self.labelLv_ = info:ComponentByName("label_lv", typeof(UILabel))

	local goIcon = info:NodeByName("widget_icon").gameObject

	self.icon_ = HeroIcon.new(goIcon)
end

function MonsterTipPanel:setContent(go, params)
	local heroID = params.heroID
	local isBoss = params.isBoss

	self.labelBoss_:SetActive(isBoss)
	self.icon_:show(heroID, {
		noRank = true,
		grade = params.grade,
		level = params.level
	})

	self.labelName_.text = __(HeroTable:getTitle(heroID))
	self.labelLv_.text = __("LEVEL_NAME", params.level)
	self.labelDesc2_.text = __(HeroTable:getName(heroID))
	self.labelDesc3_.text = __(HeroTable:getSummary(heroID))
end

function MonsterTipPanel:getPositionSize(go, offsetX, offsetY)
	return self:getPositionSize2(go, offsetX, offsetY)
end

return MonsterTipPanel
