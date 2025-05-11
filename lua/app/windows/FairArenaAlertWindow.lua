-- chunkname: @../../../Product/Bundles/Android/src/app/windows/FairArenaAlertWindow.lua

local AlertWindow = import(".AlertWindow")
local FairArenaAlertWindow = class("FairArenaAlertWindow", AlertWindow)

function FairArenaAlertWindow:ctor(name, params)
	FairArenaAlertWindow.super.ctor(self, name, params)

	self.closeText = params.closeText
end

function FairArenaAlertWindow:setupButtons()
	FairArenaAlertWindow.super.setupButtons(self)

	if self.noClose then
		self.closeBtn:SetActive(false)
	else
		self.closeBtn:SetActive(true)
	end

	if self.type_ == xyd.AlertType.YES_NO then
		self.bg_:SetActive(false)
	end

	local label2 = self.btnCancel_:ComponentByName("button_label", typeof(UILabel))

	label2.text = self.closeText or __("NO")
end

function FairArenaAlertWindow:bgAnimation()
	return
end

return FairArenaAlertWindow
