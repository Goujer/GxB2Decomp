-- chunkname: @../../../Product/Bundles/Android/src/app/components/SkillIcon.lua

local SkillIcon = class("SkillIcon", import(".BaseComponent"))
local SkillIconTips = class("SkillIconTips", import(".BaseComponent"))

SkillIcon.SkillIconTips = SkillIconTips

function SkillIcon:ctor(parentGo)
	SkillIcon.super.ctor(self, parentGo)

	self.params = {}
end

function SkillIcon:getPrefabPath()
	return "Prefabs/Components/skill_icon"
end

function SkillIcon:initUI()
	SkillIcon.super.initUI(self)

	local go = self.go

	self.bg = go:ComponentByName("bg", typeof(UISprite))
	self.exBg = go:NodeByName("exBg").gameObject
	self.img = go:ComponentByName("img", typeof(UITexture))
	self.groupLev = go:NodeByName("groupLev").gameObject
	self.levBg = self.groupLev:ComponentByName("bg", typeof(UISprite))
	self.skillLev = self.groupLev:ComponentByName("skillLev", typeof(UILabel))
	self.skillLevBg = self.groupLev:ComponentByName("bg", typeof(UISprite))
	self.selectedBg = go:ComponentByName("selected_bg", typeof(UISprite))
end

function SkillIcon:getSkillID()
	return self.id
end

function SkillIcon:setIconSource(source)
	xyd.setUITextureAsync(self.img, "Textures/skill_web/" .. source, nil, true)
end

function SkillIcon:setScale(scale)
	local transform = self.go.transform

	transform:SetLocalScale(scale, scale, 0)
end

function SkillIcon:setSelected(selected)
	self.selectedBg:SetActive(selected)
end

function SkillIcon:setInfo(id, params)
	params = params or {}
	self.params = params
	self.notShowEx = params.notShowEx

	self:setIconSource(xyd.tables.skillTable:getSkillIcon(id))

	local isEx = xyd.tables.skillTable:getIsEx(id)

	if isEx == 1 then
		xyd.setUISpriteAsync(self.skillLevBg, nil, "advanced_skill_level")

		self.skillLevBg.width = 44
		self.skillLevBg.height = 44
	else
		xyd.setUISpriteAsync(self.skillLevBg, nil, "skill_lev_bg")

		self.skillLevBg.width = 36
		self.skillLevBg.height = 36
	end

	if params and params.unlocked == false then
		xyd.applyGrey(self.img)

		self.unlockGrade = params.unlockGrade
		self.bg.spriteName = "skill_icon_lock_bg"

		self.exBg:SetActive(false)
		self.bg:SetActive(true)
	else
		xyd.applyOrigin(self.img)

		if isEx and isEx == 1 then
			self.exBg:SetActive(true)

			if not self.notShowEx then
				if not self.exEffext then
					self.exEffext = xyd.Spine.new(self.exBg:NodeByName("effect").gameObject)

					self.exEffext:setInfo("partner_exskill_ui", function()
						self.exEffext:play("texiao01", 0, 1)
					end)
				else
					self.exEffext:play("texiao01", 0, 1)
				end
			end

			self.bg:SetActive(false)
		else
			self.bg.spriteName = "skill_icon_bg"

			self.exBg:SetActive(false)
			self.bg:SetActive(true)
		end
	end

	if params and params.scale then
		self.scale = params.scale

		self:setScale(self.scale)
	end

	local skillLev = xyd.tables.skillTable:getSkillLev(id)

	if skillLev == 0 then
		params.showLev = false
	end

	if params and params.showLev or skillLev > 1 and isEx ~= 1 or isEx == 1 then
		self.skillLev.text = skillLev

		self.groupLev:SetActive(true)
	else
		self.groupLev:SetActive(false)
	end

	if params and params.hideLev then
		self.groupLev:SetActive(false)
	end

	self.id = id

	if params.unlocked ~= nil then
		self.unlocked = params.unlocked
	else
		self.unlocked = true
	end

	self.showGroup = params.showGroup and params.showGroup or nil

	if params.callback then
		self:setTouchListener(params.callback)
	end

	if params.pressCallback then
		self:setPressListener(params.pressCallback)
	end
end

function SkillIcon:showTips(show, container, limitHeight, width, direct, callback)
	if not container then
		return
	end

	if not show then
		self.tips = nil

		NGUITools.DestroyChildren(container.transform)
		container:SetActive(false)

		return
	end

	container:SetActive(true)

	if self.tips == nil then
		self.tips = SkillIconTips.new(container, width, limitHeight)

		self.tips:setInfo(self.id, self.unlocked, self.unlockGrade, direct)
	else
		self.tips:setInfo(self.id, self.unlocked, self.unlockGrade, direct)
	end

	if callback then
		callback()
	end
end

function SkillIcon:getDescHeight()
	if self.tips then
		return self.tips.desc.height
	else
		return 0
	end
end

function SkillIconTips:ctor(parentGo, width, limitHeight)
	self.width = width

	if limitHeight and tonumber(limitHeight) then
		self.limitHeight = limitHeight
	end

	SkillIconTips.super.ctor(self, parentGo)

	self.icon = SkillIcon.new(self.iconContainer)
end

function SkillIconTips:getPrefabPath()
	return "Prefabs/Components/skill_icon_tips"
end

function SkillIconTips:initUI()
	SkillIconTips.super.initUI(self)
	self:getComponent()
end

function SkillIconTips:getComponent()
	local go = self.go
	local top = go:NodeByName("top").gameObject

	self.lineImg = top:ComponentByName("lineImage", typeof(UISprite))
	self.skillName = top:ComponentByName("skillName", typeof(UILabel))
	self.skillAttrName = top:ComponentByName("skillAttrName", typeof(UILabel))
	self.iconContainer = top:NodeByName("icon").gameObject
	self.descScoller = go:NodeByName("descScoller").gameObject
	self.descScollerLayout = go:ComponentByName("descScoller", typeof(UIPanel))
	self.scroller = go:ComponentByName("descScoller", typeof(UIScrollView))
	self.desc = self.descScoller:ComponentByName("desc", typeof(UILabel))
	self.descLayout = self.descScoller:ComponentByName("desc", typeof(UIWidget))
	self.unlockDesc = top:ComponentByName("unlockDesc", typeof(UILabel))
	self.bg = go:ComponentByName("bg", typeof(UISprite))

	if xyd.Global.lang == "de_de" then
		self.go:GetComponent(typeof(UIWidget)).width = 600
	elseif xyd.Global.lang == "en_en" or xyd.Global.lang == "fr_fr" then
		self.go:GetComponent(typeof(UIWidget)).width = 640
	elseif xyd.Global.lang == "ja_jp" then
		self.go:GetComponent(typeof(UIWidget)).width = 615
	end

	if self.width then
		self.go:GetComponent(typeof(UIWidget)).width = self.width
	end
end

function SkillIconTips:setInfo(id, unlocked, unlockGrade, direct)
	local direct_ = direct or 1
	local st = xyd.tables.skillTable

	self.icon:setInfo(id, {
		scale = 0.7
	})
	self:setPanelDepth()

	self.skillName.text = __(st:getName(id))

	if self.skillName.width > 350 and xyd.Global.lang == "fr_fr" then
		self.skillName.fontSize = 26
	end

	if self.skillAttrName then
		local isPass = st:isPass(id)
		local str = __("SKILL_TEXT_ZHUDONG")

		if isPass and isPass == 1 then
			str = __("SKILL_TEXT_BEIDONG")
		end

		self.skillAttrName.text = str
	end

	self.desc.text = __(st:getDesc(id))

	if unlocked then
		self.unlockDesc:SetActive(false)
	elseif unlockGrade and self.unlockDesc then
		self.unlockDesc:SetActive(true)

		self.unlockDesc.text = __("SKILL_UNLOCK_DESC", unlockGrade)
	end

	self:waitForFrame(1, function()
		if self.descLayout then
			local descHeight = self.descLayout.height

			if self.limitHeight and descHeight + 150 > self.limitHeight then
				descHeight = self.limitHeight - 150
			end

			local totalHeight = descHeight + 150

			self.descScollerLayout:SetRect(0, 0, self.go:GetComponent(typeof(UIWidget)).width, descHeight + 10)
			self.descScoller:SetLocalPosition(0, -120 - descHeight / 2, 0)
			self:SetLocalPosition(0, totalHeight * direct_, 0)

			local activity_entrance_test_partner_wd = xyd.WindowManager.get():getWindow("activity_entrance_test_partner_window")

			if activity_entrance_test_partner_wd and totalHeight * direct_ > 640 then
				self:SetLocalPosition(0, 640, 0)
			end

			self:changePosY()
			self.scroller:ResetPosition()
		else
			self:SetLocalPosition(0, self.bg.height * direct_, 0)

			local activity_entrance_test_partner_wd = xyd.WindowManager.get():getWindow("activity_entrance_test_partner_window")

			if activity_entrance_test_partner_wd and self.bg.height * direct_ > 640 then
				self:SetLocalPosition(0, 640, 0)
			end

			self:changePosY()
		end
	end)
	self:changePosY()

	if xyd.Global.lang == "ko_kr" and id == 75201402 then
		self.desc.considerEast = false
	end
end

function SkillIconTips:changePosY()
	local skill_resonate_wd = xyd.WindowManager.get():getWindow("skill_resonate_window")

	if skill_resonate_wd then
		self:SetLocalPosition(0, 170, 0)
	end
end

return SkillIcon
