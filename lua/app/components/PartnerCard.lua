-- chunkname: @../../../Product/Bundles/Android/src/app/components/PartnerCard.lua

local PartnerCard = class("PartnerCard", import(".BaseComponent"))

function PartnerCard:ctor(parentGo, renderPanel)
	PartnerCard.super.ctor(self, parentGo)

	self.starSize = 24
	self.redStar = "partner_star_red"
	self.yellowStar = "partner_star_yellow"
	self.resInQueen = 0
	self.renderPanel = renderPanel
	self.stars_ = {}
end

function PartnerCard:getPrefabPath()
	return "Prefabs/Components/partner_card"
end

function PartnerCard:initUI()
	PartnerCard.super.initUI(self)

	local root = self.go

	self.groupMain_ = root:NodeByName("groupMain_").gameObject
	self.partnerNameGroup = self.groupMain_:NodeByName("e:Group").gameObject
	self.partnerName = self.groupMain_:ComponentByName("e:Group/partnerName", typeof(UILabel))
	self.rectName = self.groupMain_:NodeByName("e:Group/rectName").gameObject
	self.labelSkinName = self.groupMain_:ComponentByName("labelSkinName", typeof(UILabel))
	self.imgSkinCollect = self.groupMain_:ComponentByName("imgSkinCollect", typeof(UISprite))
	self.stars = self.groupMain_:NodeByName("stars").gameObject
	self.levNum = self.groupMain_:ComponentByName("levNum", typeof(UILabel))
	self.orangeStar = self.groupMain_:NodeByName("orangeStar").gameObject
	self.labelStar = self.orangeStar:ComponentByName("labelStar", typeof(UILabel))
	self.imgStar = self.orangeStar:ComponentByName("imgStar", typeof(UISprite))
	self.groupIcon = self.groupMain_:ComponentByName("groupIcon", typeof(UISprite))
	self.heroBg = self.groupMain_:ComponentByName("heroBg", typeof(UISprite))
	self.maskImg = self.groupMain_:NodeByName("maskImg").gameObject
	self.gEffect = root:ComponentByName("gEffect", typeof(UISprite))
	self.groupPreLoad = root:NodeByName("groupPreLoad").gameObject
	self.imgBoder = self.groupMain_:ComponentByName("imgBoder", typeof(UISprite))
	self.starBg = self.groupMain_:ComponentByName("starBg", typeof(UISprite))
	self.labelLove = self.groupMain_:ComponentByName("labelLove", typeof(UILabel))
	self.datesIcon = self.groupMain_:NodeByName("datesIcon").gameObject
	self.redPoint = root:NodeByName("redPoint").gameObject
	self.newIcon = root:ComponentByName("newIcon", typeof(UISprite))
	self.partnerMarked = root:NodeByName("partnerMarked").gameObject
	self.upgradeEffectGroup = root:NodeByName("upgradeEffectGroup").gameObject
	self.qltGroup = self.groupMain_:ComponentByName("qltGroup", typeof(UISprite))
	self.labelQlt = self.qltGroup:ComponentByName("labelQlt", typeof(UILabel))
end

function PartnerCard:setInfo(partnerInfo, partner, onlySkin)
	local tableID = xyd.checkCondition(partnerInfo, partnerInfo and partnerInfo.tableID, partner and partner:getTableID())
	local star_num = xyd.checkCondition(partnerInfo, partnerInfo and partnerInfo.star, partner and partner:getStar())
	local lev = xyd.checkCondition(partnerInfo, partnerInfo and partnerInfo.lev, partner and partner:getLevel())
	local group = xyd.checkCondition(partnerInfo and partnerInfo.group, partnerInfo and partnerInfo.group, xyd.tables.partnerTable:getGroup(tableID))

	self.partnerName.text = xyd.tables.partnerTable:getName(tableID)
	self.skinID = xyd.checkCondition(partnerInfo, partnerInfo and partnerInfo.skin_id, partner and partner:getSkinId())
	self.playOpenAnimation = xyd.checkCondition(partnerInfo, partnerInfo and partnerInfo.playOpenAnimation, true)

	local isVowed = xyd.checkCondition(partnerInfo, partnerInfo and partnerInfo.is_vowed, partner and partner:isVowed())
	local showID = xyd.checkCondition(partnerInfo, partnerInfo and partnerInfo.show_id, partner and partner:getShowID())
	local isMark = xyd.checkCondition(partnerInfo, partnerInfo and partnerInfo.isMarked, partner and partner:isCollected())

	self.tableID = tableID

	self.partnerMarked:SetActive(isMark)
	self.labelSkinName:SetActive(false)
	self.imgSkinCollect:SetActive(false)
	self.levNum:SetActive(true)
	self:applyOrigin()

	if isVowed then
		self.currentState = "dates"
		self.imgBoder.spriteName = "dates_icon03"
	elseif star_num and star_num > 9 then
		self.currentState = "tenStar"
		self.imgBoder.spriteName = "partner_card_2"
		self.starBg.spriteName = "partner_card_star_bg2"
	else
		self.currentState = "default"
		self.imgBoder.spriteName = "partner_card"
		self.starBg.spriteName = "partner_card_star_bg"
	end

	if star_num and star_num > 9 then
		self.orangeStar:SetActive(true)
		self.stars:SetActive(false)
		self.gEffect:SetActive(true)

		self.labelStar.text = star_num == 10 and "" or star_num - 10

		local src = "star_orange"
		local isMaxStar = xyd.isMaxStarOrigin(partnerInfo, partner)

		if group and group > 0 then
			src = xyd.checkPartnerGroupImgStr(group, src, isMaxStar)
		end

		self.imgStar:MakePixelPerfect()

		if star_num > 10 then
			src = "potentiality_card_star"

			if group and group > 0 then
				src = xyd.checkPartnerGroupImgStr(group, src, isMaxStar)
			end
		end

		xyd.setUISpriteAsync(self.imgStar, nil, src, function()
			self.imgStar:MakePixelPerfect()
		end)

		local animation_name = star_num == 10 and "texiao01" or "texiao02"

		if group and group == xyd.PartnerGroup.TIANYI then
			if self.effect then
				self.effect:stop()
				self.effect:SetActive(false)
			end

			if self.effect_tianyi then
				self.effect_tianyi:SetActive(true)
				self.effect_tianyi:play(animation_name, 0)
			else
				self.effect_tianyi = xyd.Spine.new(self.gEffect.gameObject)

				self.effect_tianyi:setInfo("shiziui_kapai_tianyi", function()
					self.effect_tianyi:SetLocalPosition(0, 0, 0)
					self.effect_tianyi:SetLocalScale(1, 1, 1)

					if self.renderPanel then
						self.effect_tianyi:setRenderPanel(self.renderPanel)
					end

					self.effect_tianyi:setRenderTarget(self.gEffect:GetComponent(typeof(UIWidget)), 2)
					self.effect_tianyi:play(animation_name, 0)
				end)
			end
		else
			if self.effect_tianyi then
				self.effect_tianyi:stop()
				self.effect_tianyi:SetActive(false)
			end

			if self.effect then
				self.effect:SetActive(true)
				self.effect:play(animation_name, 0)
			else
				self.effect = xyd.Spine.new(self.gEffect.gameObject)

				self.effect:setInfo("shiziui_kapai", function()
					self.effect:SetLocalPosition(0, 0, 0)
					self.effect:SetLocalScale(1, 1, 1)

					if self.renderPanel then
						self.effect:setRenderPanel(self.renderPanel)
					end

					self.effect:setRenderTarget(self.gEffect:GetComponent(typeof(UIWidget)), 1)
					self.effect:play(animation_name, 0)
				end)
			end
		end
	else
		if self.effect then
			self.effect:stop()
			self.effect:SetActive(false)
		end

		if self.effect_tianyi then
			self.effect_tianyi:stop()
			self.effect_tianyi:SetActive(false)
		end

		self.orangeStar:SetActive(false)
		self.stars:SetActive(true)
		self:initStar(star_num)
	end

	self.levNum.text = lev == nil and "" or lev
	self.groupIcon.spriteName = "img_group" .. tostring(group) .. ""

	if tableID then
		self.heroBg.spriteName = nil
	end

	if showID and showID ~= 0 then
		self.heroSource = xyd.tables.partnerPictureTable:getPartnerCard(showID)
	elseif self.skinID and self.skinID ~= 0 then
		self.heroSource = xyd.tables.partnerPictureTable:getPartnerCard(self.skinID)
	else
		self.heroSource = xyd.tables.partnerPictureTable:getPartnerCard(tableID)
	end

	self:setHeroSource(self.heroSource)

	if xyd.isIosTest() then
		self:iosTestChangeUI1()
	end

	if onlySkin then
		self:setOnlySkin()
	end
end

function PartnerCard:setOnlySkin()
	self.levNum:SetActive(false)
	self.stars:SetActive(false)
	self.orangeStar:SetActive(false)
	self.rectName:SetActive(false)
	self.partnerName:SetActive(false)
end

function PartnerCard:initStar(star_num)
	local frontend_star = star_num > 5 and star_num - 5 or star_num
	local depth = self.stars:GetComponent(typeof(UIWidget)).depth

	for i = 1, frontend_star do
		if not self.stars_[i] then
			local star = NGUITools.AddChild(self.stars, "star_" .. i)
			local sp = star:AddComponent(typeof(UISprite))

			self.stars_[i] = sp
			sp.width = self.starSize
			sp.height = self.starSize
			sp.depth = depth + 2
		end

		local sp = self.stars_[i]
		local spriteName = star_num > 5 and self.redStar or self.yellowStar

		if sp.spriteName ~= spriteName then
			xyd.setUISprite(sp, "partner", spriteName)
		end

		sp:SetActive(true)
	end

	for i = frontend_star + 1, #self.stars_ do
		if self.stars_[i] then
			self.stars_[i]:SetActive(false)
		end
	end

	local starGride = self.stars:GetComponent(typeof(UIGrid))

	starGride:Reposition()
end

function PartnerCard:setHeroSource(source)
	self.cardSource_ = source

	local function loadFunc()
		xyd.setUISpriteAsync(self.heroBg, nil, source, function()
			if self.cardSource_ == source then
				self.heroBg.spriteName = self.cardSource_
			else
				self:setHeroSource(self.cardSource_)
			end
		end, true)
	end

	loadFunc()
end

function PartnerCard:setRedPoint(isShow)
	self.redPoint:SetActive(isShow)
end

function PartnerCard:setNewIcon(isShow)
	self.newIcon:SetActive(isShow)

	if isShow then
		self.newIcon:X(-52)
		xyd.setUISpriteAsync(self.newIcon, nil, "background_new", nil, nil, true)
	end
end

function PartnerCard:setUpIcon(isShow)
	self.newIcon:SetActive(isShow)

	if isShow then
		self.newIcon:X(-65)
		xyd.setUISpriteAsync(self.newIcon, nil, "background_up", nil, nil, true)
	end
end

function PartnerCard:setSkinCard(data)
	self.currentState = "skin"

	self.orangeStar:SetActive(false)
	self.stars:SetActive(false)

	local tableID = data.tableID
	local group = data.group

	self.skinID = data.skin_id
	self.partnerName.text = xyd.tables.partnerTable:getName(tableID)

	self.qltGroup:SetActive(false)

	if self.skinID and self.skinID > 0 then
		local qlt = data.qlt
		local TextArr = {
			__("COLLECTION_SKIN_TEXT13"),
			__("COLLECTION_SKIN_TEXT14"),
			__("COLLECTION_SKIN_TEXT15"),
			__("COLLECTION_SKIN_TEXT16")
		}

		if qlt and qlt > 0 then
			self.qltGroup:SetActive(true)

			self.labelQlt.text = TextArr[qlt]

			xyd.setUISpriteAsync(self.qltGroup, nil, "collection_dress_new_bg_" .. qlt)
		end
	end

	if self.effect then
		self.effect:stop()
		self.effect:SetActive(false)
	end

	if self.effect_tianyi then
		self.effect_tianyi:stop()
		self.effect_tianyi:SetActive(false)
	end

	self.groupIcon.spriteName = "img_group" .. tostring(group)
	self.heroBg.spriteName = ""
	self.heroSource = xyd.tables.partnerPictureTable:getPartnerCard(self.skinID)

	self:setHeroSource(self.heroSource)
	self.labelSkinName:SetActive(true)

	self.labelSkinName.text = xyd.tables.itemTextTable:getName(self.skinID)

	self.imgSkinCollect:SetActive(data.is_equip)
	xyd.setUISprite(self.imgBoder, "partner", "partner_card03")

	if data.is_gray then
		self:applyGrey()
	else
		self:applyOrigin()
	end
end

function PartnerCard:setDefaultSkinCard(partner, qlt)
	self.currentState = "skin"

	local tableID = partner:getTableID()
	local star_num = partner:getStar()

	self.stars:SetActive(false)
	self.orangeStar:SetActive(false)
	self.levNum:SetActive(false)

	local group = xyd.tables.partnerTable:getGroup(tableID)
	local tmpSkinName

	self.partnerName.text = xyd.tables.partnerTable:getName(tableID)

	if star_num == 5 then
		tmpSkinName = __("SKIN_TEXT12")
	elseif star_num == 6 then
		tmpSkinName = __("SKIN_TEXT13")
	elseif star_num == 10 then
		tmpSkinName = __("SKIN_TEXT14")
	else
		tmpSkinName = __("SKIN_TEXT15")
	end

	if partner:getGroup() == xyd.PartnerGroup.TIANYI and star_num == 10 then
		tmpSkinName = __("SKIN_TEXT12")
	end

	self.labelSkinName.text = tmpSkinName

	self.labelSkinName:SetActive(true)
	self.partnerName:SetActive(false)
	self.rectName:SetActive(false)
	NGUITools.DestroyChildren(self.stars.transform)

	self.groupIcon.spriteName = "img_group" .. tostring(group)
	self.heroBg.spriteName = nil
	self.heroSource = xyd.tables.partnerPictureTable:getPartnerCard(tableID)

	self:setHeroSource(self.heroSource)
	xyd.setUISprite(self.imgBoder, "partner", "partner_card03")
	self.starBg:SetActive(false)

	if qlt and qlt > 0 then
		local TextArr = {
			__("COLLECTION_SKIN_TEXT13"),
			__("COLLECTION_SKIN_TEXT14"),
			__("COLLECTION_SKIN_TEXT15"),
			__("COLLECTION_SKIN_TEXT16")
		}

		if qlt and qlt > 0 then
			self.qltGroup:SetActive(true)

			self.labelQlt.text = TextArr[qlt]

			xyd.setUISpriteAsync(self.qltGroup, nil, "collection_dress_new_bg_" .. qlt)
		end
	else
		self.qltGroup:SetActive(false)
	end
end

function PartnerCard:applyGrey()
	ResCache.SetMaterial(self.heroBg, "Materials/Common/fade_with_color")

	self.heroBg.color = Color.New(0, 0, 0, 1)

	self.maskImg:SetActive(true)
end

function PartnerCard:applyOrigin()
	self.heroBg.color = Color.New(1, 1, 1, 1)

	self.maskImg:SetActive(false)
end

function PartnerCard:setImgBoder()
	if self.skinID then
		xyd.setUISprite(self.imgBoder, "partner", "partner_card03")
	end

	self.imgBoder.width = 151

	self.starBg:SetActive(false)
end

function PartnerCard:setSkinCollect(bool)
	self.imgSkinCollect:SetActive(bool)
end

function PartnerCard:setGroupAlign()
	self.groupMain_.anchorOffsetX = self.width / 2
	self.groupPreLoad.anchorOffsetX = self.width / 2
	self.groupMain_.x = self.groupMain_.x + self.width / 2
	self.groupPreLoad.x = self.groupPreLoad.x + self.width / 2
	self.groupMain_.anchorOffsetY = self.height / 2
	self.groupPreLoad.anchorOffsetY = self.height / 2
	self.groupMain_.y = self.groupMain_.y + self.height / 2
	self.groupPreLoad.y = self.groupPreLoad.y + self.height / 2
end

function PartnerCard:setGroupScale(scale, ease)
	if ease == nil then
		ease = 0
	end

	if ease == 0 then
		self.groupMain_.transform:SetLocalScale(scale, scale, scale)
		self.groupPreLoad.transform:SetLocalScale(scale, scale, scale)

		if self.effect then
			self.effect:SetLocalScale(scale, scale, scale)
		end

		if self.effect_tianyi then
			self.effect_tianyi:SetLocalScale(scale, scale, scale)
		end
	else
		local sequence = self:getSequence()

		sequence:Append(self.groupMain_.transform:DOScale(scale, ease))
		sequence:AppendCallback(function()
			sequence:Kill(false)

			sequence = nil

			if self.effect then
				self.effect:SetLocalScale(scale, scale, scale)
			end

			if self.effect_tianyi then
				self.effect_tianyi:SetLocalScale(scale, scale, scale)
			end
		end)
	end
end

function PartnerCard:showSkinNum()
	if not self.skinID then
		return
	end

	self.partnerName.text = __("SKIN_TEXT11", xyd.models.backpack:getItemNumByID(self.skinID))
end

function PartnerCard:hideSkinNum()
	if not self.skinID then
		return
	end

	self.partnerName.text = ""
end

function PartnerCard:setDisplay()
	self.rectName:SetActive(false)

	self.partnerName.color = Color.New2(960513791)
	self.partnerName.effectColor = Color.New2(4294967295)
end

function PartnerCard:setDatesCard(partnerInfo, partner)
	self:setInfo(partnerInfo, partner)

	local lovePoint = partnerInfo and partnerInfo.lovePoint or partner:getLovePoint()

	if lovePoint >= 100 then
		self.labelLove.text = math.floor(lovePoint / 100)

		self.labelLove:SetActive(true)
		self.datesIcon:SetActive(true)
	else
		self.labelLove:SetActive(false)
		self.datesIcon:SetActive(false)
	end
end

function PartnerCard:showRealSkinNum()
	if self.realNum == -1 then
		self.realNum = 0

		local partners = xyd.models.slot:getSortedPartners()["0_0"]

		for _, id in ipairs(partners) do
			local partnerData = xyd.models.slot:getPartner(id)

			if partnerData then
				local skinID = partnerData:getSkinID()

				if skinID == self.skinID then
					self.realNum = self.realNum + 1
				end
			end
		end

		self.partnerName.text = __("SKIN_TEXT11", xyd.models.backpack:getItemNumByID(self.skinID) + self.realNum)
	end
end

function PartnerCard:resetData()
	self.realNum = -1
end

function PartnerCard:setUpgradeEffect(status)
	if status == true and not xyd.tables.partnerTable:checkPuppetPartner(self.tableID) then
		if self.upgradeEffect == nil then
			self.upgradeEffectGroup:SetActive(false)

			self.upgradeEffect = xyd.Spine.new(self.upgradeEffectGroup)

			self.upgradeEffect:setInfo("fx_shengxing", function()
				self.upgradeEffect:setRenderTarget(self.upgradeEffectGroup:GetComponent(typeof(UITexture)), 1)
				self.upgradeEffect:play("texiao01", 0, 1)
			end, true)
		end

		self.upgradeEffectGroup:SetActive(true)
		self.upgradeEffect:play("texiao01", 0, 1)
	else
		if self.upgradeEffect ~= nil then
			self.upgradeEffect:stop()
		end

		self.upgradeEffectGroup:SetActive(false)
	end
end

function PartnerCard:iosTestChangeUI1()
	xyd.setUISprite(self.groupIcon, nil, self.groupIcon.spriteName .. "_ios_test")
	xyd.setUISprite(self.imgBoder, nil, self.imgBoder.spriteName .. "_ios_test")
end

function PartnerCard:setGEffectVisible(state)
	self.gEffect.gameObject:SetActive(state)
end

function PartnerCard:setSkinName(tmpSkinName)
	self.labelSkinName.text = tmpSkinName
end

function PartnerCard:setQltLowerThanPartnerName()
	self.qltGroup:Y(-69)
	self.partnerNameGroup:Y(-43)
end

return PartnerCard
