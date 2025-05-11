-- chunkname: @../../../Product/Bundles/Android/src/app/components/HeroChallengeFightBossItem.lua

local HeroChallengeFightBossItem = class("HeroChallengeFightBossItem", import(".BaseComponent"))

function HeroChallengeFightBossItem:ctor(parentGO)
	self.isChoose = false

	HeroChallengeFightBossItem.super.ctor(self, parentGO)
end

function HeroChallengeFightBossItem:initUI()
	HeroChallengeFightBossItem.super.initUI(self)

	local go = self.go

	self.img_ = go:ComponentByName("img", typeof(UISprite))
	self.mask_ = go:ComponentByName("mask", typeof(UISprite))
	self.scoreCon = go:NodeByName("scoreCon").gameObject
	self.scoreLabel = self.scoreCon:ComponentByName("scoreLabel", typeof(UILabel))
	self.tipsImg_ = go:NodeByName("tipsImg").gameObject
	self.select = go:NodeByName("select").gameObject

	self:setLock(false)

	UIEventListener.Get(self.tipsImg_).onClick = handler(self, self.tipsOnClick)
end

function HeroChallengeFightBossItem:getPrefabPath()
	return "Prefabs/Components/hero_challenge_fight_boss_item"
end

function HeroChallengeFightBossItem:setInfo(id, params)
	local SkillTable = xyd.tables.partnerChallengeChessBuffTable
	local skillName = SkillTable:getIconName(id)

	xyd.setUISpriteAsync(self.img_, nil, skillName)

	self.id_ = id
	params = params or {}
	self.params_info = params
	self.clickCallBack_ = params.callBack
	self.scoreLabel.text = params.score

	if params.isOpen then
		self:setLock(params.isOpen)
	end

	if params.tipsCallBack then
		self.tipsCallBack_ = params.tipsCallBack
	end

	if params.posTransform then
		self.posTransform_ = params.posTransform
	end
end

function HeroChallengeFightBossItem:tipsOnClick()
	if self.tipsCallBack_ then
		local pos_y

		if self.posTransform_ then
			pos_y = self.posTransform_:InverseTransformPoint(self.go.transform.position).y + 185
		end

		self.tipsCallBack_(self.id_, pos_y)
	end
end

function HeroChallengeFightBossItem:setLock(isOpen)
	self.mask_:SetActive(isOpen)
	self.select:SetActive(isOpen)
end

function HeroChallengeFightBossItem:getIcon()
	return self.icon_
end

return HeroChallengeFightBossItem
