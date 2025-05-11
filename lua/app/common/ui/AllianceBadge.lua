-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/AllianceBadge.lua

local AllianceBadge = class("AllianceBadge", import(".BaseIcon"))

function AllianceBadge:initIcon()
	AllianceBadge.super.initIcon(self)

	local go = self.go_

	self.icon_ = go:ComponentByName("badge_icon", typeof(UISprite))
	self.icon_.width = 265
	self.icon_.height = 265
	self.color_ = go:ComponentByName("color", typeof(UISprite))
	self.bg_ = go:ComponentByName("badge_bg", typeof(UISprite))
	self.depthObjs_ = {
		self.widget_,
		self.color_,
		self.bg_,
		self.icon_
	}
end

function AllianceBadge:getPrefabPath()
	return "Prefabs/Common/alliance_badge"
end

function AllianceBadge:show(bgID, colorID, iconID, params)
	xyd.setUISprite(self.bg_, xyd.Atlas.ALLIANCE_BADGE, "badge_bg" .. bgID)

	self.bg_.color = Color.New2(xyd.AllianceBadgeColor[colorID])

	xyd.setUISpriteAsync(self.icon_, xyd.Atlas.BADGE_WEB, "badge_icon" .. iconID)

	params = params or {}

	if params.hideColor then
		self.color_:SetActive(false)
	else
		self.color_:SetActive(true)
	end
end

return AllianceBadge
