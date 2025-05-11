-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/SkillIcon.lua

local SkillIcon = class("SkillIcon", import(".BaseIcon"))

function SkillIcon:initIcon()
	SkillIcon.super.initIcon(self)

	local go = self.go_

	self.color_ = go:ComponentByName("color", typeof(UISprite))
	self.icon_ = go:ComponentByName("icon", typeof(UISprite))
	self.border_ = go:ComponentByName("border", typeof(UISprite))
	self.lock_ = go:ComponentByName("lock", typeof(UISprite))
	self.mask_ = self.lock_:ComponentByName("mask", typeof(UISprite))
	self.depthObjs_ = {
		self.widget_,
		self.color_,
		self.icon_,
		self.mask_,
		self.lock_,
		self.border_
	}
end

function SkillIcon:getPrefabPath()
	return "Prefabs/Common/skill_icon"
end

function SkillIcon:show(id, params)
	local HeroSkillTable = xyd.tables.heroSkill

	xyd.setUISpriteAsync(self.icon_, HeroSkillTable:getAtlas(id), HeroSkillTable:getIcon(id))

	params = params or {}

	if params.locked then
		self.lock_:SetActive(true)
		xyd.setUISprite(self.color_, xyd.Atlas.COMMON_UI, "color_1")
	else
		self.lock_:SetActive(false)

		if params.grade then
			xyd.setUISprite(self.color_, xyd.Atlas.COMMON_UI, "color_" .. params.grade)
		else
			xyd.setUISprite(self.color_, xyd.Atlas.COMMON_UI, "color_1")
		end
	end
end

function SkillIcon:getIcon()
	return self.icon_
end

return SkillIcon
