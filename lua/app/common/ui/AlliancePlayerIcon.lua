-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/AlliancePlayerIcon.lua

local AlliancePlayerIcon = class("AlliancePlayerIcon", import(".BaseIcon"))
local HeroTable = xyd.tables.hero

function AlliancePlayerIcon:initIcon()
	AlliancePlayerIcon.super.initIcon(self)

	local go = self.go_

	self.bg_ = go:ComponentByName("bg", typeof(UISprite))
	self.border_ = go:ComponentByName("border", typeof(UISprite))
	self.points_ = go:ComponentByName("points", typeof(UISprite))
	self.icon_ = go:ComponentByName("icon", typeof(UISprite))
	self.level_ = go:ComponentByName("level", typeof(UISprite))
	self.depthObjs_ = {
		self.widget_,
		self.bg_,
		self.points_,
		self.icon_,
		self.border_,
		self.level_
	}
end

function AlliancePlayerIcon:getPrefabPath()
	return "Prefabs/Common/alliance_player_icon"
end

function AlliancePlayerIcon:show(lordHero, level)
	local atlas = HeroTable:getAtlas(lordHero)
	local icon = HeroTable:getIcon(lordHero)

	self.icon_:SetActive(true)
	xyd.setUISpriteAsync(self.icon_, atlas, icon)

	self.level_.spriteName = "icon_lv" .. level
end

function AlliancePlayerIcon:getIcon()
	return self.icon_
end

return AlliancePlayerIcon
