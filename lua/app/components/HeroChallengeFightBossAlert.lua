-- chunkname: @../../../Product/Bundles/Android/src/app/components/HeroChallengeFightBossAlert.lua

local HeroChallengeFightBossAlert = class("HeroChallengeFightBossAlert", import(".BaseComponent"))

function HeroChallengeFightBossAlert:ctor(parentGo, params)
	self.params = params
	self.buffId_ = params.id
	self.index = params.index
	self.isOpen = params.isOpen

	HeroChallengeFightBossAlert.super.ctor(self, parentGo, params)
end

function HeroChallengeFightBossAlert:initUI()
	HeroChallengeFightBossAlert.super.initUI(self)
	self:getUIComponent()
	self:updateInfo()
end

function HeroChallengeFightBossAlert:getPrefabPath()
	return "Prefabs/Components/hero_challenge_fight_boss_alert"
end

function HeroChallengeFightBossAlert:getUIComponent()
	local winTrans = self.go:NodeByName("groupAction")

	self.groupAction_widget = winTrans:GetComponent(typeof(UIWidget))
	self.bg = winTrans:ComponentByName("bg", typeof(UIWidget))
	self.skillImg_ = winTrans:ComponentByName("skillImg", typeof(UISprite))
	self.skillName_ = winTrans:ComponentByName("skillName", typeof(UILabel))
	self.skillDesc_ = winTrans:ComponentByName("skillDesc", typeof(UILabel))
	self.scoreLabel_ = winTrans:ComponentByName("scoreCon/scoreLabel", typeof(UILabel))
	self.extraLabel = winTrans:ComponentByName("extraLabel", typeof(UILabel))
end

function HeroChallengeFightBossAlert:updateInfo()
	local skillIconName = xyd.tables.partnerChallengeChessBuffTable:getIconName(self.buffId_)
	local point = xyd.tables.partnerChallengeChessBuffTable:getPoint(self.buffId_)

	xyd.setUISpriteAsync(self.skillImg_, nil, skillIconName)

	local skillName = xyd.tables.partnerChallangeNewbuffTextTable:getName(self.buffId_)
	local skillDesc = xyd.tables.partnerChallangeNewbuffTextTable:getDesc(self.buffId_)

	self.skillName_.text = skillName
	self.skillDesc_.text = skillDesc
	self.scoreLabel_.text = point
	self.extraLabel.text = " "
	self.finishImg = self.go:ComponentByName("groupAction/finishImg", typeof(UISprite))
	self.finishWords = self.go:ComponentByName("groupAction/finishWords", typeof(UILabel))

	xyd.setUISpriteAsync(self.finishImg, nil, "academy_assessment_done_" .. xyd.Global.lang, nil, nil, false)

	self.finishWords.text = __("PARTNER_CHALLENGE_CHESS_TEXT06", self.buffId_)

	self.finishImg:SetActive(self.isOpen)
end

function HeroChallengeFightBossAlert:getActionHeight()
	return 40 + self.skillDesc_.height
end

return HeroChallengeFightBossAlert
