-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/ArmyTipPanel.lua

local ArmyTipPanel = class("ArmyTipPanel", import(".BaseTipPanel"))

function ArmyTipPanel.get()
	if not ArmyTipPanel.INSTANCE then
		ArmyTipPanel.INSTANCE = ArmyTipPanel.new()
	end

	return ArmyTipPanel.INSTANCE
end

function ArmyTipPanel:initUI()
	self.prefab_ = "Prefabs/Common/army_tip_panel"

	ArmyTipPanel.super.initUI(self)

	self.offset_:ComponentByName("label_title", typeof(UILabel)).text = __("SOLDIER_RESISTANT_TITLE")
	self.offset_:ComponentByName("tip_label", typeof(UILabel)).text = __("RESISTANT")
	self.soldierPart_ = self.offset_:NodeByName("army_part").gameObject
	self.trapPart_ = self.offset_:NodeByName("trap_part").gameObject
end

function ArmyTipPanel:setContent(go, params)
	self.soldierPart_:SetActive(params.type == xyd.ArmyTipType.SOLDIER)
	self.trapPart_:SetActive(params.type == xyd.ArmyTipType.TRAP)
end

return ArmyTipPanel
