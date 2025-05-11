-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/PlayerIcon.lua

local PlayerIcon = class("PlayerIcon", import(".BaseIcon"))
local HeroTable = xyd.tables.hero

function PlayerIcon:initIcon()
	PlayerIcon.super.initIcon(self)

	local go = self.go_

	self.bg_ = go:ComponentByName("bg", typeof(UISprite))
	self.border_ = go:ComponentByName("border", typeof(UISprite))
	self.points_ = go:ComponentByName("points", typeof(UISprite))
	self.icon_ = go:ComponentByName("icon", typeof(UISprite))
	self.mark_ = go:ComponentByName("mark", typeof(UISprite))
	self.depthObjs_ = {
		self.widget_,
		self.bg_,
		self.points_,
		self.icon_,
		self.mark_,
		self.border_
	}
end

function PlayerIcon:getPrefabPath()
	return "Prefabs/Common/player_icon"
end

function PlayerIcon:show(lordHero)
	if lordHero and lordHero == 0 then
		self.mark_:SetActive(true)
		self.icon_:SetActive(false)
	else
		local atlas = HeroTable:getAtlas(lordHero)
		local icon = HeroTable:getIcon(lordHero)

		self.icon_:SetActive(true)
		self.mark_:SetActive(false)
		xyd.setUISpriteAsync(self.icon_, atlas, icon)
	end
end

function PlayerIcon:getIcon()
	return self.icon_
end

return PlayerIcon
