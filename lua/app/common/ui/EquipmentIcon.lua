-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/EquipmentIcon.lua

local EquipmentIcon = class("EquipmentIcon", import(".BaseIcon"))
local ItemIcon = import("app.common.ui.ItemIcon")
local EquipmentTable = xyd.tables.equipment

function EquipmentIcon:initIcon()
	EquipmentIcon.super.initIcon(self)

	local go = self.go_

	self.icon_ = go:ComponentByName("icon", typeof(UISprite))
	self.color_ = go:ComponentByName("color", typeof(UISprite))
	self.points_ = go:ComponentByName("points", typeof(UISprite))
	self.border_ = go:ComponentByName("border", typeof(UISprite))
	self.level_ = go:ComponentByName("level", typeof(UILabel))
	self.levelBg_ = self.level_:ComponentByName("bg", typeof(UISprite))
	self.putOn_ = go:ComponentByName("put_on", typeof(UISprite))
	self.forging_ = go:ComponentByName("forging", typeof(UISprite))
	self.depthObjs_ = {
		self.widget_,
		self.color_,
		self.points_,
		self.icon_,
		self.forging_,
		self.putOn_,
		self.levelBg_,
		self.level_,
		self.border_
	}
	self.gems_ = {}

	for i = 1, 4 do
		local gemContainer = go:ComponentByName("gem_" .. i, typeof(UISprite)).gameObject

		self.gems_[i] = ItemIcon.new(gemContainer)
	end
end

function EquipmentIcon:getPrefabPath()
	return "Prefabs/Common/equipment_icon"
end

function EquipmentIcon:show(eid, ecolor, gems, extraParams)
	extraParams = extraParams or {}

	local icon, atlas

	icon = EquipmentTable:getIcon(eid)
	atlas = EquipmentTable:getAtlas(eid)

	xyd.setUISpriteAsync(self.icon_, atlas, icon)

	local color = ecolor or EquipmentTable:getColor(eid)

	xyd.setUISprite(self.color_, xyd.Atlas.COMMON_UI, "color_" .. color)

	self.points_.color = xyd.PointsColor[color]

	if extraParams.showLevel then
		self.level_:SetActive(true)

		local level = EquipmentTable:getLevel(eid)
		local levelText = __("LEVEL_NAME", level)

		if extraParams.checkLevel then
			local selfPlayer = xyd.models.selfPlayer

			if level > selfPlayer:getLevel() then
				levelText = xyd.getRedText(levelText)
			end
		end

		self.level_.text = levelText
	else
		self.level_:SetActive(false)
	end

	if extraParams.putOn then
		self.putOn_:SetActive(true)
	else
		self.putOn_:SetActive(false)
	end

	if extraParams.forging then
		self.forging_:SetActive(true)
	else
		self.forging_:SetActive(false)
	end

	if gems then
		for i = 1, 4 do
			self.gems_[i]:getNode():SetActive(true)
		end

		for i = 1, 3 do
			if gems[i] and gems[i] ~= "" then
				self.gems_[i]:setVisible(true)

				local gem = xyd.split(gems[i], ":", true)

				self.gems_[i]:show(gem[1], {
					color = gem[2]
				})
			else
				self.gems_[i]:setVisible(false)
			end
		end

		self.gems_[4]:setVisible(false)
	else
		for i = 1, 4 do
			self.gems_[i]:getNode():SetActive(false)
		end
	end
end

function EquipmentIcon:getColor()
	return self.color_
end

function EquipmentIcon:getIcon()
	return self.icon_
end

function EquipmentIcon:setContentVisible(visible)
	self.color_:SetActive(visible)
	self.points_:SetActive(visible)
	self.icon_:SetActive(visible)
	self.level_:SetActive(visible)
	self.putOn_:SetActive(visible)
	self.forging_:SetActive(visible)

	for i = 1, 4 do
		self.gems_[i]:getNode():SetActive(visible)
	end
end

return EquipmentIcon
