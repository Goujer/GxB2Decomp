-- chunkname: @../../../Product/Bundles/Android/src/app/components/PartnerNameTag.lua

local BaseComponent = import("app.components.BaseComponent")
local PartnerNameTag = class("PartnerNameTag", BaseComponent)
local GroupIconTips = import("app.components.GroupIconTips")

function PartnerNameTag:ctor(parentGo)
	PartnerNameTag.super.ctor(self, parentGo)

	self.effect = nil
end

function PartnerNameTag:getPrefabPath()
	return "Prefabs/Components/partner_name_tag"
end

function PartnerNameTag:initUI()
	PartnerNameTag.super.initUI(self)

	local winTrans = self.go.transform

	self.bg = winTrans:ComponentByName("e:Image", typeof(UISprite))
	self.partnerName = winTrans:ComponentByName("partnerName", typeof(UILabel))
	self.labelSkinName = winTrans:ComponentByName("labelSkinName", typeof(UILabel))
	self.partnerGroup = winTrans:ComponentByName("partnerGroup", typeof(UISprite))
	self.tipsPos = winTrans:NodeByName("tipsPos").gameObject
	self.stars = winTrans:NodeByName("stars").gameObject
	self.starsWidget = self.stars:GetComponent(typeof(UIWidget))
	self.starsGride = self.stars:GetComponent(typeof(UIGrid))
	self.labelNotation = winTrans:ComponentByName("labelNotation", typeof(UILabel))
	self.potentiality = winTrans:NodeByName("potentiality").gameObject
	self.potentialityCardStar = self.potentiality:ComponentByName("potentialityCardStar", typeof(UISprite))
	self.labelStar = self.potentiality:ComponentByName("labelStar", typeof(UILabel))
	self.depthObjs_ = {
		self.bg,
		self.partnerName,
		self.partnerGroup,
		self.starsWidget,
		self.potentialityCardStar,
		self.labelStar
	}
end

function PartnerNameTag:setCardStarImg(imgName)
	xyd.setUISpriteAsync(self.potentialityCardStar, nil, imgName, nil, nil, true)
end

function PartnerNameTag:setInfo(partner)
	self.partner = partner
	self.currentStar = partner:getStar()
	self.partnerName.text = partner:getName()
	self.partnerGroup.spriteName = "img_group" .. partner:getGroup()

	if xyd.Global.lang == "ja_jp" then
		self.labelNotation.text = partner:getNotation()
	end

	self:changePotentialityCardStarImg(partner:getGroup())
	self.potentiality:SetActive(false)
	self:setStars(partner:getStar(), partner:getGroup())
end

function PartnerNameTag:setStars(star, group)
	if star <= 10 then
		self.stars:SetActive(true)

		local starSize = 28
		local spriteName, atlas

		if star == 10 then
			star = 1
			starSize = 32
			atlas = xyd.Atlas.COMMON_UI
			spriteName = "star_orange"

			if group and group > 0 then
				spriteName = xyd.checkPartnerGroupImgStr(group, spriteName)
			end
		elseif star > 5 then
			star = star - 5
			starSize = 28
			atlas = "partner"
			spriteName = "partner_star_red"
		else
			atlas = "partner"
			spriteName = "partner_star_yellow"
		end

		local depth = self.starsWidget.depth + 2

		NGUITools.DestroyChildren(self.stars.transform)

		for i = 1, star do
			local starNode = NGUITools.AddChild(self.stars, "star_" .. i)
			local sp = starNode:AddComponent(typeof(UISprite))

			xyd.setUISprite(sp, atlas, spriteName)

			sp.width = starSize
			sp.height = starSize
			sp.depth = depth
		end

		self.starsGride:Reposition()
	else
		self.stars:SetActive(false)
		self.potentiality:SetActive(true)

		self.labelStar.text = star - 10
	end
end

function PartnerNameTag:paramsSetInfo(params)
	self:setStars(params.star, params.group)

	self.partnerName.text = params.name
	self.partnerGroup.spriteName = "img_group" .. params.group

	self:changePotentialityCardStarImg(params.group)

	if xyd.Global.lang == "ja_jp" then
		self.labelNotation.text = xyd.tables.partnerNotationTextTable:getNotation(params.tableID)
	end
end

function PartnerNameTag:setSkinName(name, partnerName, group, tableID, params)
	self.partnerName.text = partnerName
	self.partnerGroup.spriteName = "img_group" .. group

	self:changePotentialityCardStarImg(group)

	self.labelSkinName.text = name

	self.labelSkinName:SetActive(true)

	if xyd.Global.lang == "ja_jp" then
		self.labelNotation.text = xyd.tables.partnerNotationTextTable:getNotation(tableID)
	end

	if params and params.effectColor then
		self.partnerName.effectColor = Color.New2(params.effectColor)
	end
end

function PartnerNameTag:setOnlySkinName(name)
	self.labelSkinName:SetActive(true)

	self.labelSkinName.text = name
end

function PartnerNameTag:getSelfObj()
	return self.go
end

function PartnerNameTag:enableGroupTipsPart(GroupID, x, y)
	self.GroupID = GroupID
	self.groupTipsX = x
	self.groupTipsY = y

	if not self.initGroupTips then
		self.initGroupTips = true
		UIEventListener.Get(self.partnerGroup.gameObject).onClick = function()
			if not self.groupTips then
				self.groupTips = GroupIconTips.new(self.tipsPos.gameObject)

				self.groupTips:setInfo(self.GroupID)
				self.groupTips:setClickMask(function()
					self.groupTipsIsActive = not self.groupTipsIsActive

					self.tipsPos.gameObject:SetActive(self.groupTipsIsActive)
				end)
				self.tipsPos.gameObject:X(self.groupTipsX)
				self.tipsPos.gameObject:Y(self.groupTipsY)

				self.groupTipsIsActive = true
			else
				self.tipsPos.gameObject:X(self.groupTipsX)
				self.tipsPos.gameObject:Y(self.groupTipsY)

				self.groupTipsIsActive = not self.groupTipsIsActive

				self.tipsPos.gameObject:SetActive(self.groupTipsIsActive)
			end
		end
	elseif self.groupTips then
		self.groupTips:setInfo(self.GroupID)
	end
end

function PartnerNameTag:changePotentialityCardStarImg(group)
	local isMaxStar = false
	local str = "potentiality_card_star"

	if group and group > 0 then
		str = xyd.checkPartnerGroupImgStr(group, str, isMaxStar)
	end

	xyd.setUISpriteAsync(self.potentialityCardStar, nil, str, nil, nil, true)
end

return PartnerNameTag
