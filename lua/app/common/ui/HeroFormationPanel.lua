-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/HeroFormationPanel.lua

local HeroIcon = import("app.common.ui.HeroIcon")
local HeroFormationPanel = class("HeroFormationPanel", import(".BaseTipPanel"))
local HeroInfo = import("app.models.HeroInfo")

function HeroFormationPanel.get()
	if not HeroFormationPanel.INSTANCE then
		HeroFormationPanel.INSTANCE = HeroFormationPanel.new()
	end

	return HeroFormationPanel.INSTANCE
end

function HeroFormationPanel:initUI()
	self.prefab_ = "Prefabs/Common/hero_formation_panel"

	HeroFormationPanel.super.initUI(self)

	self.nameLabel_ = self.offset_:ComponentByName("label_name", typeof(UILabel))
	self.rankLabel_ = self.offset_:ComponentByName("label_rank", typeof(UILabel))
	self.heroIcons_ = {}

	for i = 1, 5 do
		local iconContainer = self.offset_:ComponentByName("hero_" .. i, typeof(UIWidget)).gameObject
		local heroIcon = HeroIcon.new(iconContainer)

		self.heroIcons_[i] = heroIcon
	end

	self.powerLabel_ = self.offset_:ComponentByName("label_power", typeof(UILabel))
end

function HeroFormationPanel:setContent(go, params)
	params = params or {}

	local info = params.info

	self.nameLabel_.text = info.playerName
	self.rankLabel_.text = xyd.getDisplayNumber(info.rank)
	self.powerLabel_.text = xyd.getDisplayNumber(info.power)

	for i = 1, 5 do
		local heroInfo = info.heroList[i]

		if heroInfo then
			self.heroIcons_[i]:getNode():SetActive(true)
			self.heroIcons_[i]:show(heroInfo:getID(), {
				info = heroInfo
			})
		else
			self.heroIcons_[i]:getNode():SetActive(false)
		end
	end
end

return HeroFormationPanel
