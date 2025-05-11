-- chunkname: @../../../Product/Bundles/Android/src/app/components/GroupBuffIcon.lua

local GroupBuffIcon = class("GroupBuffIcon", import(".BaseComponent"))

function GroupBuffIcon:ctor(parentGo, renderPanel)
	GroupBuffIcon.super.ctor(self, parentGo)

	self.renderPanel = renderPanel
end

function GroupBuffIcon:getPrefabPath()
	return "Prefabs/Components/group_buff_icon"
end

function GroupBuffIcon:initUI()
	GroupBuffIcon.super.initUI(self)

	local content = self.go:NodeByName("content").gameObject

	self.offGroup = content:NodeByName("offGroup").gameObject
	self.iconOffImg = self.offGroup:ComponentByName("iconOffImg", typeof(UISprite))
	self.onGroup = content:NodeByName("onGroup").gameObject
	self.iconOnImg = self.onGroup:ComponentByName("iconOnImg", typeof(UISprite))
	self.onGroupEffect = self.onGroup:NodeByName("onGroupEffect").gameObject
	self.selectImg = content:ComponentByName("selectImg", typeof(UISprite))
end

function GroupBuffIcon:setSelectImg(imgName, state)
	if not state then
		self.selectImg.gameObject:SetActive(false)
	else
		self.selectImg.gameObject:SetActive(true)
		xyd.setUISpriteAsync(self.selectImg, nil, imgName)
	end
end

function GroupBuffIcon:setEffectScale(scale)
	self.onGroupEffect.transform:SetLocalScale(scale, scale, scale)
end

function GroupBuffIcon:setDragScrollView(scrollView)
	local drag = self.go:AddComponent(typeof(UIDragScrollView))

	drag.scrollView = scrollView
end

function GroupBuffIcon:getGameObject()
	return self.go
end

function GroupBuffIcon:setScale(scale)
	self.go.transform:SetLocalScale(scale, scale, 0)
end

function GroupBuffIcon:setInfo(buffId, isAct, type_)
	self.groupBuffId_ = buffId

	if not self.oldGroupBuffID_ then
		self.oldGroupBuffID_ = buffId
	end

	self.type_ = type_

	if not self.type_ or self.type_ == nil then
		self.type_ = xyd.GroupBuffIconType.GROUP_BUFF
	end

	self.isAct = isAct

	self:initItem()
end

function GroupBuffIcon:initItem()
	if self.type_ == xyd.GroupBuffIconType.HERO_CHALLENGE then
		xyd.setUISpriteAsync(self.iconOnImg, nil, xyd.tables.partnerChallengeBuffTable:getFx(self.groupBuffId_))
		xyd.setUISpriteAsync(self.iconOffImg, nil, xyd.tables.partnerChallengeBuffTable:getFx(self.groupBuffId_))
	elseif self.type_ == xyd.GroupBuffIconType.NEW_TRIAL then
		local iconName = xyd.tables.newTrialBuffTable:getIcon(self.groupBuffId_)

		xyd.setUISpriteAsync(self.iconOnImg, nil, iconName)
	elseif self.type_ == xyd.GroupBuffIconType.FAIRY_TALE then
		xyd.setUISpriteAsync(self.iconOnImg, nil, xyd.tables.activityFairyTaleBuffTable:getFx(self.groupBuffId_))
		xyd.setUISpriteAsync(self.iconOffImg, nil, xyd.tables.activityFairyTaleBuffTable:getFx(self.groupBuffId_))
		xyd.applyGrey(self.iconOffImg)
	elseif self.type_ == xyd.GroupBuffIconType.SPORTS then
		xyd.setUISpriteAsync(self.iconOnImg, nil, "skill_icon_86")
	elseif self.type_ == xyd.GroupBuffIconType.FAIR_ARENA then
		local iconName = xyd.tables.activityFairArenaBoxBuffTable:getIcon(self.groupBuffId_)

		xyd.setUISpriteAsync(self.iconOnImg, nil, iconName)
	else
		xyd.setUISpriteAsync(self.iconOffImg, nil, "group_buff_off_" .. tostring(self.groupBuffId_))
		xyd.setUISpriteAsync(self.iconOnImg, nil, "group_buff_on_" .. tostring(self.groupBuffId_))
	end

	if self.isAct then
		self.offGroup:SetActive(false)
		self.onGroup:SetActive(true)
		self:createEffect()
	else
		self.offGroup:SetActive(true)
		self.onGroup:SetActive(false)
	end
end

function GroupBuffIcon:createEffect()
	if self.type_ == xyd.GroupBuffIconType.HERO_CHALLENGE or self.type_ == xyd.GroupBuffIconType.NEW_TRIAL or self.type_ == xyd.GroupBuffIconType.FAIRY_TALE or self.type_ == xyd.GroupBuffIconType.SPORTS or self.type_ == xyd.GroupBuffIconType.FAIR_ARENA then
		if self.effect_ then
			self.effect_:destroy()

			self.effect_ = nil
		end

		return
	end

	local initEffect

	function initEffect()
		if self.effect_ then
			self.effect_:destroy()

			self.effect_ = nil
		end

		local fx = xyd.tables.groupBuffTable:getFx(self.groupBuffId_)

		self.effect_ = xyd.Spine.new(self.onGroupEffect.gameObject)

		self.effect_:setInfo(fx, function()
			self.effect_:play(nil, 0)
		end)

		self.oldGroupBuffID_ = self.groupBuffId_
	end

	if not self.effect_ or self.oldGroupBuffID_ ~= self.groupBuffId_ then
		initEffect()
	end
end

return GroupBuffIcon
