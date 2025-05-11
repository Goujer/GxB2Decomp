-- chunkname: @../../../Product/Bundles/Android/src/app/components/ActivitySpaceExploreHeroIcon.lua

local ActivitySpaceExploreHeroIcon = class("ActivitySpaceExploreHeroIcon", import(".BaseIcon"))
local iconTable = xyd.tables.activitySpaceExplorePartnerTable

function ActivitySpaceExploreHeroIcon:ctor(parentGo)
	ActivitySpaceExploreHeroIcon.super.ctor(self, parentGo)
end

function ActivitySpaceExploreHeroIcon:getPrefabPath()
	return "Prefabs/Components/activity_space_explore_hero_icon"
end

function ActivitySpaceExploreHeroIcon:initUI()
	ActivitySpaceExploreHeroIcon.super.initUI(self)

	self.imgBorder_ = self.go:ComponentByName("imgBorder_", typeof(UISprite))
	self.imgIcon_ = self.go:ComponentByName("imgIcon_", typeof(UISprite))
	self.labelLev = self.go:ComponentByName("labelLev", typeof(UILabel))
	self.redPoint = self.go:ComponentByName("redPoint", typeof(UISprite))
	self.imgChoose_ = self.go:ComponentByName("imgChoose_", typeof(UISprite))
	self.upTips_ = self.go:ComponentByName("upTips_", typeof(UISprite))
	self.labelNum_ = self.go:ComponentByName("labelNum_", typeof(UILabel))
	self.imgDebris_ = self.go:ComponentByName("imgDebris_", typeof(UISprite))

	self.redPoint:SetActive(false)
	self.imgChoose_:SetActive(false)
	self.upTips_:SetActive(false)
end

function ActivitySpaceExploreHeroIcon:setInfo(params)
	self.itemID = params.itemID
	self.params = params
	self.noClick = params.noClick
	self.callback = params.callback
	self.grey = params.grey

	local imgIconSoure = iconTable:getAvatar(self.itemID)

	xyd.setUISpriteAsync(self.imgIcon_, nil, imgIconSoure)

	self.lev = params.lev or 1

	if params.isLevMax then
		self.lev = iconTable:getMaxLv(self.itemID)
	end

	if params.showLev then
		self.labelLev.text = self.lev
	end

	local grade = iconTable:getGrade(self.itemID)

	xyd.setUISpriteAsync(self.imgBorder_, nil, "act_space_expl_icon_border_" .. grade)

	if not self.noClick then
		self:setTouchListener(handler(self, self.onClickIcon))
	end

	if params.dragScrollView then
		self:setDragScrollView(params.dragScrollView)
	end

	if params.scale then
		local scale = params.scale

		self.go:SetLocalScale(scale, scale, scale)
	end

	if params.grey then
		self:setGrey(params.grey)
	end

	if params.num then
		self:setLabelNum(params.num)
	end
end

function ActivitySpaceExploreHeroIcon:setNoClick(flag)
	self.noClick = flag
end

function ActivitySpaceExploreHeroIcon:onClickIcon()
	if self.noClick then
		return
	end

	if self.callback then
		self:callback()
	else
		xyd.WindowManager.get():openWindow("activity_space_explore_partner_up_window", {
			is_short = true,
			id = self.itemID,
			level = self.lev or 1
		})
	end
end

function ActivitySpaceExploreHeroIcon:setChoose(flag)
	self.imgChoose_:SetActive(flag)
end

function ActivitySpaceExploreHeroIcon:setRedMark(flag)
	self.redPoint:SetActive(flag)
end

function ActivitySpaceExploreHeroIcon:setGrey(state)
	if state then
		xyd.applyChildrenGrey(self.go)
	else
		xyd.applyChildrenOrigin(self.go)
	end
end

function ActivitySpaceExploreHeroIcon:setLabelNum(num)
	self.labelNum_.text = num
end

function ActivitySpaceExploreHeroIcon:setLabelNumVisble(visible)
	self.labelNum_.gameObject:SetActive(visible)
end

function ActivitySpaceExploreHeroIcon:setUpTips(flag)
	self.upTips_:SetActive(flag)
end

function ActivitySpaceExploreHeroIcon:getIconSprite()
	return self.imgIcon_
end

function ActivitySpaceExploreHeroIcon:getBorder()
	return self.imgBorder_
end

function ActivitySpaceExploreHeroIcon:setImgDebris_(imgSource)
	xyd.setUISpriteAsync(self.imgDebris_, nil, imgSource)
end

function ActivitySpaceExploreHeroIcon:setLevLabel(lev)
	self.labelLev.text = tostring(lev)
end

return ActivitySpaceExploreHeroIcon
