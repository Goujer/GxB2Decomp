-- chunkname: @../../../Product/Bundles/Android/src/app/components/SkillIconSmall.lua

local SkillIconSmall = class("SkillIconSmall", import(".BaseIcon"))

function SkillIconSmall:ctor(parentGO)
	self.isChoose = false

	SkillIconSmall.super.ctor(self, parentGO)
end

function SkillIconSmall:initUI()
	SkillIconSmall.super.initUI(self)

	local go = self.go

	self.bg_ = go:ComponentByName("bg", typeof(UISprite))
	self.img_ = go:ComponentByName("img", typeof(UISprite))
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

	UIEventListener.Get(self.go).onClick = handler(self, self.onClick)
	UIEventListener.Get(self.tipsImg_).onClick = handler(self, self.tipsOnClick)
end

function SkillIconSmall:getPrefabPath()
	return "Prefabs/Components/skill_icon_small"
end

function SkillIconSmall:setInfo(id, params)
	local SkillTable = xyd.tables.oldBuildingBuffTable
	local skillName = SkillTable:getIconName(id)

	xyd.setUISpriteAsync(self.img_, nil, skillName)

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
end

function SkillIconSmall:onClick()
	if self.clickCallBack_ then
		self.clickCallBack_(self.id_)
	end
end

function SkillIconSmall:tipsOnClick()
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

function SkillIconSmall:setLock(isLock)
	self.lock_:SetActive(isLock)
	self.mask_:SetActive(isLock)

	self.isLock = isLock
end

function SkillIconSmall:setTipsClickOpen(isopen)
	self.tipsImg_:SetActive(isopen)
end

function SkillIconSmall:getIcon()
	return self.icon_
end

function SkillIconSmall:setLocalPosition(x, y, z)
	self.go:SetLocalPosition(x, y, z)
end

function SkillIconSmall:setChoose(isChoose)
	if self.params_info and self.params_info.isLock and isChoose == true then
		isChoose = false
	end

	self.chooseBorder:SetActive(isChoose)
end

return SkillIconSmall
