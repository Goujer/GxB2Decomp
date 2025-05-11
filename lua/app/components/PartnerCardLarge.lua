-- chunkname: @../../../Product/Bundles/Android/src/app/components/PartnerCardLarge.lua

local PartnerCardLarge = class("PartnerCardLarge", import(".BaseComponent"))

function PartnerCardLarge:ctor(parentGo, isLoadResource)
	PartnerCardLarge.super.ctor(self, parentGo)

	self.starSize = 31
	self.redStar = "partner_star_red_big"
	self.yellowStar = "partner_star_yellow"
	self.skinName = "PartnerCardLargeSkin"
	self.isLoadResource = isLoadResource
	self.height = 295
end

function PartnerCardLarge:getPrefabPath()
	return "Prefabs/Components/partner_card_large"
end

function PartnerCardLarge:initUI()
	PartnerCardLarge.super.initUI(self)

	local go = self.go

	self.cardBg = go:ComponentByName("cardBg", typeof(UISprite))
	self.cardBg2 = go:ComponentByName("cardBg2", typeof(UISprite))
	self.cardBg3 = go:ComponentByName("cardBg3", typeof(UISprite))

	xyd.setUISpriteAsync(self.cardBg, nil, "partner_card_bg01")
	xyd.setUISpriteAsync(self.cardBg3, nil, "prophet_jia")

	self.defaultCard = go:ComponentByName("defaultCard", typeof(UISprite))

	xyd.setUISpriteAsync(self.defaultCard, nil, "partner_card00")

	self.imgBoder = go:ComponentByName("imgBoder", typeof(UISprite))

	xyd.setUISpriteAsync(self.imgBoder, nil, "partner_large_card")

	self.heroBg_slider = go:ComponentByName("heroBg_slider", typeof(UISlider))
	self.heroBg = go:ComponentByName("heroBg_slider/heroBg", typeof(UISprite))
	self.groupName = go:NodeByName("groupName").gameObject
	self.partnerName = self.groupName:ComponentByName("partnerName", typeof(UILabel))
	self.groupIcon = go:ComponentByName("groupIcon", typeof(UISprite))
	self.levNum = go:ComponentByName("levNum", typeof(UILabel))
	self.stars = go:NodeByName("stars").gameObject
	self.commonStars = self.stars:NodeByName("commonStars").gameObject
	self.gEffect = go:NodeByName("gEffect").gameObject
	self.maskImg = go:NodeByName("maskImg").gameObject
	self.maskRect = go:NodeByName("maskRect").gameObject
	self.orangeStar = self.stars:NodeByName("orangeStar").gameObject
	self.imgStar = self.orangeStar:ComponentByName("imgStar", typeof(UISprite))

	self.imgStar:MakePixelPerfect()

	self.labelStar = self.orangeStar:ComponentByName("labelStar", typeof(UILabel))
	self.orangeEffect = self.orangeStar:ComponentByName("orangeEffect", typeof(UITexture))

	if self.isLoadResource then
		self.maskEffect = xyd.Spine.new(self.gEffect)

		self.maskEffect:setInfo("fx_saomiao", function()
			self.maskEffect:SetLocalPosition(0, 0, 0)
			self.maskEffect:SetLocalScale(1, 1, 1)
			self.maskEffect:setRenderTarget(self.gEffect:GetComponent(typeof(UIWidget)), 1)
		end)
		self:setResource()
	end
end

function PartnerCardLarge:setHeroSource(source)
	if not source then
		return
	end

	xyd.setUISpriteAsync(self.heroBg, nil, source)
end

function PartnerCardLarge:loadResource()
	self.maskEffect = xyd.Spine.new(self.gEffect)

	self.maskEffect:setInfo("fx_saomiao", function()
		self.maskEffect:SetLocalPosition(0, 0, 0)
		self.maskEffect:SetLocalScale(1, 1, 1)
		self.maskEffect:setRenderTarget(self.gEffect:GetComponent(typeof(UIWidget)), 1)
	end)
	self:setResource()
end

function PartnerCardLarge:setResource()
	self.maskEffect:SetActive(false)
end

function PartnerCardLarge:showCardEffect(time)
	local bool = self.maskEffect and self.maskEffect:isValid()

	if not bool then
		return
	end

	local action1 = self:getSequence()

	self.maskEffect.go.transform:SetLocalPosition(0, -self.height / 2, 0)
	action1:Append(self.maskEffect.go.transform:DOLocalMoveY(self.height / 2, time))
	action1:AppendCallback(function()
		action1:Kill(false)

		action1 = nil
	end)
	self.maskEffect:SetActive(true)
	self.maskEffect:play("texiao", 1, 1, function()
		self.defaultCard:SetActive(false)
		self.maskEffect:SetActive(false)
	end)

	local function setter1(value)
		self.heroBg_slider.value = value
	end

	self.heroBg_slider:SetActive(true)

	local action = self:getSequence()

	action:Insert(0, DG.Tweening.DOTween.To(DG.Tweening.Core.DOSetter_float(setter1), 0.01, 1, time))
end

function PartnerCardLarge:setInfo(partnerInfo, partner)
	local tableID

	if partnerInfo then
		tableID = partnerInfo.tableID
	else
		tableID = partner:getTableID()
	end

	local star_num = partnerInfo and partnerInfo.star or partner:getStar()
	local lev = partnerInfo and partnerInfo.lev or partner:getLevel()
	local group = partnerInfo and partnerInfo.group and partnerInfo.group or xyd.tables.partnerTable:getGroup(tableID)

	self.groupID = group
	self.partnerName.text = xyd.tables.partnerTable:getName(tableID)

	if partnerInfo then
		self.skinID = partnerInfo.skin_id
	else
		self.skinID = partner:getSkinId()
	end

	self:setStartShow(true)

	if star_num < 10 then
		self.commonStars:SetActive(true)
		self.orangeStar:SetActive(false)
		NGUITools.DestroyChildren(self.commonStars.transform)

		local frontend_star = star_num > 5 and star_num - 5 or star_num

		for i = 1, frontend_star do
			local star = NGUITools.AddChild(self.commonStars, "star_" .. i)
			local sp = star:AddComponent(typeof(UISprite))
			local spriteName = star_num > 5 and self.redStar or self.yellowStar

			xyd.setUISprite(sp, "partner", spriteName)

			sp.width = self.starSize
			sp.height = self.starSize
			sp.depth = self.stars:GetComponent(typeof(UIWidget)).depth + 2
		end

		local starGride = self.commonStars:GetComponent(typeof(UIGrid))

		starGride:Reposition()
	else
		self.commonStars:SetActive(false)
		self.orangeStar:SetActive(true)

		self.labelStar.text = star_num == 10 and "" or star_num - 10

		local src = "star_orange"

		if group and group > 0 then
			src = xyd.checkPartnerGroupImgStr(group, src)
		end

		self.imgStar:MakePixelPerfect()

		if star_num > 10 then
			src = "potentiality_card_star"

			if group and group > 0 then
				src = xyd.checkPartnerGroupImgStr(group, src)
			end
		end

		xyd.setUISpriteAsync(self.imgStar, nil, src, function()
			self.imgStar:MakePixelPerfect()
		end)
	end

	self:setVisibleEase(self.stars, true)

	self.levNum.text = lev == nil and "" or lev

	xyd.setUISprite(self.groupIcon, nil, "img_group" .. group)

	if tableID then
		self.heroBg.spriteName = nil
	end

	if self.skinID and self.skinID ~= 0 then
		self.heroSource = xyd.tables.partnerPictureTable:getPartnerCard(self.skinID)
	else
		self.heroSource = xyd.tables.partnerPictureTable:getPartnerCard(tableID)
	end

	if tableID then
		self.heroBg:SetActive(true)
	else
		self.heroBg:SetActive(false)
	end

	self.heroBg_slider.value = partnerInfo and partnerInfo.heroBg_slider or 1

	self:setHeroSource(self.heroSource)
end

function PartnerCardLarge:setNameVisible(bool, ease)
	if ease == nil then
		ease = false
	end

	if not ease then
		if self.groupName then
			self.groupName:SetActive(bool)
		end
	elseif self.groupName then
		self.groupName:SetActive(bool)
		self:setVisibleEase(self.groupName, bool)
	end
end

function PartnerCardLarge:setUIItemsVisible(visible, ease, groupVisible)
	if groupVisible and self.groupID then
		xyd.setUISprite(self.groupIcon, nil, "img_group" .. self.groupID)
	else
		xyd.setUISprite(self.groupIcon, nil, "prophet_icon11")
	end

	if not ease then
		self:setStartShow(visible)
		self.levNum:SetActive(visible)
	else
		if visible ~= self.stars.activeSelf then
			self:setStartShow(visible)
			self:setVisibleEase(self.stars, visible)
		end

		if visible ~= self.levNum.gameObject.activeSelf then
			self.levNum:SetActive(visible)
			self:setVisibleEase(self.levNum, visible)
		end
	end
end

function PartnerCardLarge:setDefaultCardVisible(visible)
	self.defaultCard:SetActive(visible)
end

function PartnerCardLarge:setHeroCardVisible(visible)
	self.heroBg:SetActive(visible)
end

function PartnerCardLarge:setVisibleEase(obj, visible)
	local action = self:getSequence()
	local from = visible and 0.01 or 1
	local w = obj:GetComponent(typeof(UIWidget))

	w.alpha = from

	local to = visible and 1 or 0.01
	local getter, setter = xyd.getTweenAlphaGeterSeter(w)

	action:Append(DG.Tweening.DOTween.ToAlpha(getter, setter, to, 0.3))
end

function PartnerCardLarge:setLvVisible(status)
	self.levNum:SetActive(status)
end

function PartnerCardLarge:setStartShow(visible)
	self.stars:SetActive(visible)
end

function PartnerCardLarge:setBg3Visible(status)
	self.cardBg3:SetActive(status)
end

return PartnerCardLarge
