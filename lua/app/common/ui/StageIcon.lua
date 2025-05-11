-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/StageIcon.lua

local StageIcon = class("StageIcon", import(".BaseIcon"))
local ItemTable = xyd.tables.item
local StageTable = xyd.tables.stage
local StageAdvanceTable = xyd.tables.stageAdvance
local StageNormalTable = xyd.tables.stageNormal
local HeroTable = xyd.tables.hero

function StageIcon:initIcon()
	StageIcon.super.initIcon(self)

	local go = self.go_

	self.icon_ = go:ComponentByName("icon", typeof(UISprite))
	self.icon_.width = 265
	self.icon_.height = 265
	self.color_ = go:ComponentByName("color", typeof(UISprite))
	self.points_ = go:ComponentByName("points", typeof(UISprite))
	self.border_ = go:ComponentByName("border", typeof(UISprite))
	self.depthObjs_ = {
		self.widget_,
		self.color_,
		self.points_,
		self.icon_,
		self.border_
	}
end

function StageIcon:show(stageID, advance)
	local infoID

	if advance then
		infoID = StageAdvanceTable:getInfoID(stageID)
	else
		infoID = StageNormalTable:getInfoID(stageID)
	end

	local stageColor = xyd.getStageColor(stageID, advance)
	local heroID = StageTable:getTalker(infoID)

	self.icon_:SetActive(true)
	xyd.setUISpriteAsync(self.icon_, HeroTable:getAtlas(heroID), HeroTable:getIcon(heroID))
	xyd.setUISprite(self.color_, xyd.Atlas.COMMON_UI, "color_" .. stageColor)

	self.points_.color = xyd.PointsColor[stageColor]
end

function StageIcon:getColor()
	return self.color_
end

function StageIcon:getIcon()
	return self.icon_
end

function StageIcon:onlyShowBg()
	xyd.setUISprite(self.color_, xyd.Atlas.COMMON_UI, "color_1")

	self.points_.color = xyd.PointsColor[1]

	self.icon_:SetActive(false)
end

return StageIcon
