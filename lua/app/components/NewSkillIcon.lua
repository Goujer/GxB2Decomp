-- chunkname: @../../../Product/Bundles/Android/src/app/components/NewSkillIcon.lua

local NewSkillIcon = class("NewSkillIcon", import(".BaseIcon"))

function NewSkillIcon:ctor(parentGO, clickType)
	self.isChoose = false
	self.clickType = clickType

	NewSkillIcon.super.ctor(self, parentGO)
end

function NewSkillIcon:initUI()
	NewSkillIcon.super.initUI(self)

	local go = self.go

	self.bg_ = go:ComponentByName("bg", typeof(UISprite))
	self.img_sprite = go:ComponentByName("img_sprite", typeof(UISprite))
	self.img_texture = go:ComponentByName("img_texture", typeof(UITexture))
	self.lock_ = go:ComponentByName("lock", typeof(UISprite))
	self.mask_ = go:ComponentByName("mask", typeof(UISprite))
	self.scoreCon = go:NodeByName("scoreCon").gameObject
	self.scoreBg = self.scoreCon:ComponentByName("scoreBg", typeof(UISprite))
	self.scoreLabel = self.scoreCon:ComponentByName("scoreLabel", typeof(UILabel))
	self.tipsImg_ = go:NodeByName("tipsImg").gameObject
	self.chooseBorder = go:ComponentByName("chooseBorder", typeof(UISprite))

	self:setLock(false)
	self:setTipsClickOpen(false)
	self:setChoose(self.isChoose)

	if self.clickType and self.clickType == "onclick" then
		UIEventListener.Get(self.go).onClick = handler(self, self.onClick)
	elseif self.clickType and self.clickType == "onpress" then
		UIEventListener.Get(self.go).onPress = function(go, isPress)
			if isPress then
				if self.pressStart then
					self.pressStart()
				end
			elseif self.pressEnd then
				self.pressEnd()
			end
		end
	else
		UIEventListener.Get(self.go).onClick = handler(self, self.onClick)
	end

	UIEventListener.Get(self.tipsImg_).onClick = handler(self, self.tipsOnClick)
end

function NewSkillIcon:getPrefabPath()
	return "Prefabs/Components/new_skill_icon"
end

function NewSkillIcon:setInfo(id, params)
	local SkillTable = xyd.tables.skillTable
	local skillImgStr = SkillTable:getSkillIcon(id)

	if skillImgStr then
		local str_sprite = xyd.Sprites2Atlas.table_map[skillImgStr]

		if str_sprite then
			xyd.setUISpriteAsync(self.img_sprite, nil, skillImgStr)
			self.img_sprite:SetActive(true)
			self.img_texture:SetActive(false)
		end

		local str_texture = xyd.Textures2Config.table_map[skillImgStr]

		if str_texture then
			xyd.setUITextureByNameAsync(self.img_texture, skillImgStr)
			self.img_sprite:SetActive(false)
			self.img_texture:SetActive(true)
		end
	end

	self.id_ = id
	params = params or {}
	self.params_info = params

	self.lock_:SetActive(params.locked == 1)

	self.clickCallBack_ = params.callBack

	if params.dragScrollView then
		local drag = self.go:AddComponent(typeof(UIDragScrollView))

		drag.scrollView = params.dragScrollView
	end

	if params.scale then
		local scale = params.scale

		self.go:SetLocalScale(scale, scale, scale)
	end

	if params.score then
		self.scoreCon:SetActive(true)

		self.scoreLabel.text = params.score
	else
		self.scoreCon:SetActive(false)
	end

	if params.isLock then
		self:setLock(params.isLock)
	end

	if params.tipsCallBack then
		self.tipsCallBack_ = params.tipsCallBack
	end

	if params.posTransform then
		self.posTransform_ = params.posTransform
	end

	if params.isTipsCallBackChoose then
		self.isTipsCallBackChoose_ = params.isTipsCallBackChoose
	end

	if params.win then
		self.win_ = params.win
	end

	if params.pressStart then
		self.pressStart = params.pressStart
	end

	if params.pressEnd then
		self.pressEnd = params.pressEnd
	end
end

function NewSkillIcon:onClick()
	if self.clickCallBack_ then
		self.clickCallBack_(self.id_)
	end
end

function NewSkillIcon:tipsOnClick()
	if self.tipsCallBack_ then
		local pos_y

		if self.posTransform_ then
			pos_y = self.posTransform_:InverseTransformPoint(self.go.transform.position).y
		end

		if self.isTipsCallBackChoose_ and self.isTipsCallBackChoose_ == true then
			if self.isChoose == false and not self.win_ or self.isChoose == false and self.win_ and self.win_:getIsCanChoice(self.id_) == true then
				self.isChoose = true

				self:setChoose(self.isChoose)
			else
				self.isChoose = false

				self:setChoose(self.isChoose)
			end
		end

		self.tipsCallBack_(self.id_, pos_y, self.isChoose)
	end
end

function NewSkillIcon:setLock(isLock)
	self.lock_:SetActive(isLock)
	self.mask_:SetActive(isLock)
end

function NewSkillIcon:setTipsClickOpen(isopen)
	self.tipsImg_:SetActive(isopen)
end

function NewSkillIcon:getIcon()
	return self.icon_
end

function NewSkillIcon:setLocalPosition(x, y, z)
	self.go:SetLocalPosition(x, y, z)
end

function NewSkillIcon:setChoose(isChoose)
	if self.params_info and self.params_info.isLock and isChoose == true then
		isChoose = false
	end

	self.chooseBorder:SetActive(isChoose)
end

return NewSkillIcon
