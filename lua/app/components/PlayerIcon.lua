-- chunkname: @../../../Product/Bundles/Android/src/app/components/PlayerIcon.lua

local PlayerIcon = class("PlayerIcon", import(".BaseComponent"))
local Object = UnityEngine.Object

function PlayerIcon:ctor(go, renderPanel)
	PlayerIcon.super.ctor(self, go)

	self.palyerInfo = {}
	self.avatarID = 0
	self.lev = 0
	self.avatarFrameID = 0
	self.locked = false
	self.selected = false
	self.grey = false
	self.renderPanel = renderPanel
	self.callback = nil
	self.effectIndex = 1
	self.noClick = true
	self.activeStates = {}
	self.needFrameGrey = false
end

function PlayerIcon:getPrefabPath()
	return "Prefabs/Components/player_icon"
end

function PlayerIcon:initUI()
	PlayerIcon.super.initUI(self)

	local goTrans = self.go.transform

	self.mainGroupTrans = goTrans:Find("main_group")
	self.selectGroupTrans = goTrans:Find("select_group")
	self.levGroupTrans = self.mainGroupTrans:Find("lev_group")
	self.effectGroup = self.mainGroupTrans:Find("effect_group")
	self.lockImgTrans = self.mainGroupTrans:Find("lock_img")
	self.captainImgTrans = self.mainGroupTrans:Find("captain_img")
	self.redImgTrans = self.mainGroupTrans:Find("red_img")
	self.avatarTrans = self.mainGroupTrans:Find("avatar_img")
	self.avatarTransUIWidget = self.mainGroupTrans:ComponentByName("avatar_img", typeof(UIWidget))
	self.circleImgTrans = self.mainGroupTrans:Find("load_circle_img")
	self.avatarSprite = self.mainGroupTrans:ComponentByName("avatar_img", typeof(UISprite))
	self.circleImg = self.mainGroupTrans:ComponentByName("load_circle_img", typeof(UISprite))
	self.frameSprite = self.mainGroupTrans:ComponentByName("frame_img", typeof(UISprite))
	self.frameWidget = self.mainGroupTrans:ComponentByName("frame_img", typeof(UIWidget))
	self.levLabel = self.levGroupTrans:ComponentByName("lev_label", typeof(UILabel))
	self.lockImgSprite = self.mainGroupTrans:ComponentByName("lock_img", typeof(UISprite))
	self.frameEffectCon = self.mainGroupTrans:NodeByName("frameEffectCon").gameObject
	self.imgMask_ = self.mainGroupTrans:ComponentByName("imgMask_", typeof(UISprite))
	self.imgMaskUIWidget = self.mainGroupTrans:ComponentByName("imgMask_", typeof(UIWidget))
	self.imgChoose_ = self.mainGroupTrans:ComponentByName("imgChoose_", typeof(UISprite))
	self.imgChooseUIWidget = self.mainGroupTrans:ComponentByName("imgChoose_", typeof(UIWidget))

	self.selectGroupTrans.gameObject:SetActive(false)
	self.redImgTrans.gameObject:SetActive(false)
	self.captainImgTrans.gameObject:SetActive(false)
	self.lockImgTrans.gameObject:SetActive(false)
	self.circleImgTrans.gameObject:SetActive(false)
end

function PlayerIcon:onRegister()
	PlayerIcon.super.onRegister(self)
end

function PlayerIcon:setInfo(playerInfo)
	self.palyerInfo = playerInfo
	self.avatarID = playerInfo.avatarID or 0
	self.avatarID = playerInfo.avatar_id or self.avatarID
	self.lev = playerInfo.lev
	self.avatarFrameID = playerInfo.avatar_frame_id or 8007
	self.locked = playerInfo.lock or false
	self.selected = playerInfo.select or false
	self.grey = playerInfo.grey or false
	self.isActiveFrameEffect = playerInfo.isActiveFrameEffect
	self.callback = playerInfo.callback

	if self.callback then
		self.noClick = false
	end

	if playerInfo.noClick ~= nil then
		self.noClick = playerInfo.noClick
	end

	if playerInfo.scale then
		if type(playerInfo.scale) == "number" then
			self:setScale(playerInfo.scale)
		elseif playerInfo.scale and playerInfo.scale.x then
			self:setScale(playerInfo.scale.x)
		end
	end

	self.effectLoadCallBck = playerInfo.effectLoadCallBck

	if playerInfo.dragScrollView then
		local drag = self.go:GetComponent(typeof(UIDragScrollView))

		drag = drag or self.go:AddComponent(typeof(UIDragScrollView))
		drag.scrollView = playerInfo.dragScrollView
	end

	if playerInfo.labelNumScale then
		self:setLabelNumScale(playerInfo.labelNumScale)
	end

	self:initAvatar()
	self:initAvatarFrame()
	self:initLev()
	self:showEffect()
	self:setTouchEnable(not self.noClick)

	if not self.noClick then
		UIEventListener.Get(self.go).onClick = handler(self, self.onClickIcon)
	end
end

function PlayerIcon:initAvatar()
	if self.avatarID and self.avatarID > 0 then
		local iconName = ""
		local iconType = xyd.tables.itemTable:getType(self.avatarID)

		if iconType == xyd.ItemType.HERO_DEBRIS then
			local partnerCost = xyd.tables.itemTable:partnerCost(self.avatarID)

			iconName = xyd.tables.partnerTable:getAvatar(partnerCost[1])
		elseif iconType == xyd.ItemType.HERO then
			iconName = xyd.tables.partnerTable:getAvatar(self.avatarID)
		elseif iconType == xyd.ItemType.SKIN then
			iconName = xyd.tables.equipTable:getSkinAvatar(self.avatarID)
		else
			iconName = xyd.tables.itemTable:getIcon(self.avatarID)
		end

		local atlasName = xyd.Sprites2Atlas.table_index[xyd.Sprites2Atlas.table_map[iconName]]

		if atlasName then
			xyd.setUISpriteAsync(self.avatarSprite, atlasName, iconName, nil, true)
		end

		self.avatarTrans:SetActive(true)
	else
		self.avatarTrans:SetActive(false)
	end

	self:setGrey(self.grey)
end

function PlayerIcon:initAvatarFrame()
	local path = "avator_bg"

	if self.avatarFrameID and self.avatarFrameID > 0 and self.avatarFrameID ~= 8007 then
		path = xyd.tables.itemTable:getIcon(self.avatarFrameID)

		if self.isActiveFrameEffect == nil and self.grey ~= nil then
			self.isActiveFrameEffect = not self.grey
		end
	end

	xyd.setUISpriteAsync(self.frameSprite, nil, path, function()
		self.frameSprite:MakePixelPerfect()

		if self.avatarFrameID == 0 or self.avatarFrameID == 8007 then
			self.frameWidget:SetRect(-57, -57, 114, 114)
		end
	end, false)

	local frameEffectName = xyd.tables.itemTable:getFrameEffect(self.avatarFrameID)

	if self.avatarFrameID and self.avatarFrameID == 8050 and (UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.2.88") <= 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "1.1.88") <= 0) then
		frameEffectName = nil
	end

	if frameEffectName and frameEffectName ~= "" then
		if not self["frameEffect_" .. self.effectIndex] or self["frameEffect_" .. self.effectIndex] and frameEffectName ~= self["frameEffect_" .. self.effectIndex]:getName() then
			if self["frameEffect_" .. self.effectIndex] then
				self["frameEffect_" .. self.effectIndex]:destroy()

				self["frameEffect_" .. self.effectIndex] = nil

				self.frameSprite:SetActive(true)
			end

			self.effectIndex = self.effectIndex + 1
			self["frameEffect_" .. self.effectIndex] = xyd.Spine.new(self.frameEffectCon.gameObject)

			self["frameEffect_" .. self.effectIndex]:setInfo(frameEffectName, function()
				if frameEffectName == "frame_qianhezi" then
					self["frameEffect_" .. self.effectIndex]:SetLocalScale(0.9, 0.9, 0.9)
				else
					self["frameEffect_" .. self.effectIndex]:SetLocalScale(1, 1, 1)
				end

				self["frameEffect_" .. self.effectIndex]:play("texiao01", 0)

				if self.renderPanel then
					self["frameEffect_" .. self.effectIndex]:setRenderPanel(self.renderPanel)
				end

				self["frameEffect_" .. self.effectIndex]:setRenderTarget(self.frameEffectCon:GetComponent(typeof(UITexture)), 1)
				self:setFrameEffectVisible(self.isActiveFrameEffect)

				if self.needFrameGrey then
					self["frameEffect_" .. self.effectIndex]:setGrey()
				end
			end)
		end
	elseif self["frameEffect_" .. self.effectIndex] then
		self["frameEffect_" .. self.effectIndex]:destroy()

		self["frameEffect_" .. self.effectIndex] = nil
		self.effectIndex = self.effectIndex + 1

		self.frameSprite:SetActive(true)
	end

	self:setGreyFarme(self.grey)
end

function PlayerIcon:initLev()
	if self.lev and self.lev > 0 then
		self.levLabel.text = tostring(self.lev)

		self.levGroupTrans.gameObject:SetActive(true)
	else
		self.levGroupTrans.gameObject:SetActive(false)
	end
end

function PlayerIcon:setNoClick(flag)
	self.noClick = flag

	xyd.setTouchEnable(self.go, not flag)
end

function PlayerIcon:setLev(lev)
	self.lev = lev or nil

	self:initLev()
end

function PlayerIcon:setAvatarFrame(avatarFrameID)
	self.avatarFrameID = avatarFrameID or nil

	self:initAvatarFrame()
end

function PlayerIcon:setGrey(flag)
	if self.mainGroupTrans then
		if flag then
			xyd.applyGrey(self.avatarSprite)
			xyd.applyGrey(self.frameSprite)
			self:setFrameEffectVisible(false)
		else
			xyd.applyOrigin(self.avatarSprite)
			xyd.applyOrigin(self.frameSprite)
			self:setFrameEffectVisible(true)
		end
	end
end

function PlayerIcon:setGreyFarme(flag)
	if self.mainGroupTrans then
		if flag then
			xyd.applyGrey(self.frameSprite)
			xyd.applyGrey(self.lockImgSprite)
			self:setFrameEffectVisible(false)
		else
			xyd.applyOrigin(self.frameSprite)
			xyd.applyOrigin(self.lockImgSprite)
			self:setFrameEffectVisible(true)
		end
	end
end

function PlayerIcon:setAvatar(avatarID)
	self.avatarID = avatarID or nil

	self:initAvatar()
end

function PlayerIcon:setAvatarPath(iconName)
	self.avatarTrans:SetActive(true)
	xyd.setUISpriteAsync(self.avatarSprite, nil, iconName, nil, true)
end

function PlayerIcon:setScale(scale)
	self.go.transform.localScale = Vector3(scale, scale, scale)
end

function PlayerIcon:setSelected(flag)
	if self.selectGroupTrans then
		self.selectGroupTrans.gameObject:SetActive(flag)
	end
end

function PlayerIcon:setRedIcon(flag)
	if self.redImgTrans then
		self.redImgTrans.gameObject:SetActive(flag)
	end
end

function PlayerIcon:setLocked(flag)
	if self.lockImgTrans then
		self.lockImgTrans.gameObject:SetActive(flag)
	end
end

function PlayerIcon:showEffect()
	local num = xyd.tables.itemTable:lightEffect(self.avatarID)

	if num == 1 then
		if self.effect_ then
			return
		end

		local effect = xyd.Spine.new(self.effectGroup.gameObject)

		effect:setInfo("fx_ui_txsaoguang", function()
			effect:SetLocalScale(0.85, 0.85, 1)
			effect:play("texiao01", 0, 1, nil, true, true)

			if self.renderPanel then
				effect:setRenderPanel(self.renderPanel)
			end
		end, true)

		self.effect_ = effect
	elseif self.effect_ then
		self.effect_:destroy()

		self.effect_ = nil
	end
end

function PlayerIcon:setCaptain(value)
	self.captainImgTrans:SetActive(value)
end

function PlayerIcon:onClickIcon()
	xyd.SoundManager.get():playSound(xyd.SoundID.BUTTON)

	local changeParams = {}

	if self.params and self.params.noClickSelected then
		changeParams.groupSelect_ = false
	end

	if self.callback then
		self.callback()
	else
		local params = {
			itemID = self.avatarFrameID,
			itemNum = self.itemNum_,
			wndType = self.itemWndType_,
			callback = function()
				self:setSelected(false)
			end,
			smallTips = self.smallTips_,
			hideText = self.hideText,
			show_has_num = self.showHasNum
		}

		xyd.WindowManager.get():openWindow("item_tips_window", params)
	end

	if self.attach_callback then
		self.attach_callback()
	end
end

function PlayerIcon:setTouchEnable(flag)
	xyd.setTouchEnable(self.go, flag)
end

function PlayerIcon:setFrameEffectVisible(flag)
	if flag == nil then
		flag = true
	end

	if self["frameEffect_" .. self.effectIndex] then
		self["frameEffect_" .. self.effectIndex]:SetActive(flag)
		self.frameSprite:SetActive(not flag)
	end
end

function PlayerIcon:setChoose(flag)
	local changeParams = {}

	if flag then
		if self.avatarFrameID > 0 and self.avatarFrameID ~= 8007 then
			self:setGrey(true)

			if self["frameEffect_" .. self.effectIndex] then
				self:setFrameEffectVisible(false)
			end

			self.imgMaskUIWidget.depth = self.avatarTransUIWidget.depth - 1
		else
			self.imgMaskUIWidget.depth = self.imgChooseUIWidget.depth - 1
		end

		changeParams.imgMask_ = true
		changeParams.imgChoose_ = true
	else
		self:setGrey(false)

		if self.avatarFrameID > 0 and self["frameEffect_" .. self.effectIndex] then
			self:setFrameEffectVisible(true)
		end

		changeParams.imgMask_ = false
		changeParams.imgChoose_ = false
	end

	self:updateActive(changeParams)
end

function PlayerIcon:updateActive(params)
	for k, v in pairs(params) do
		local curActive = self.activeStates[k]

		if curActive ~= v then
			self[k]:SetActive(v)

			self.activeStates[k] = v
		end
	end
end

function PlayerIcon:AddUIDragScrollView(scrollView)
	if not self.go:GetComponent(typeof(UIDragScrollView)) then
		self.go:AddComponent(typeof(UIDragScrollView))
	end
end

function PlayerIcon:setLabelNumScale(scale)
	if type(scale) == "number" then
		if not self.labelNumDefaultSize then
			self.labelNumDefaultSize = 16
		end

		self.labelNumDefaultSize = self.labelNumDefaultSize or 16
		self.levLabel.fontSize = self.labelNumDefaultSize * scale
	elseif type(scale) == "table" then
		self.levLabel:SetLocalScale(scale.x, scale.y, scale.z)
	end
end

function PlayerIcon:setLabelNumColor(color)
	self.levLabel.color = color
end

function PlayerIcon:getIconRoot()
	return self.go
end

return PlayerIcon
