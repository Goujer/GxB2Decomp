-- chunkname: @../../../Product/Bundles/Android/src/app/components/PotentialIcon.lua

local effect_name_ = "fx_ui_13xing_active"
local active_effect_name_ = "fx_ui_13xing_active"
local next_effect_name_ = "fx_ui_13xing_next"
local unlocking_effect_name_ = "qiannengjiesuo"
local PotentialIcon = class("PotentialIcon", import(".BaseComponent"))
local PotentialIconTips = class("PotentialIconTips", import(".SkillIcon").SkillIconTips)

function PotentialIcon:ctor(parentGo, isGuest)
	self.is_guest = isGuest

	PotentialIcon.super.ctor(self, parentGo)
end

function PotentialIcon:getPrefabPath()
	return "Prefabs/Components/potential_icon"
end

function PotentialIcon:initUI()
	PotentialIcon.super.initUI(self)
	self:getComponent()
end

function PotentialIcon:getComponent()
	local goTrans = self.go.transform

	self.bg_ = goTrans:ComponentByName("bg", typeof(UISprite))
	self.img_ = goTrans:ComponentByName("img", typeof(UISprite))
	self.mask_ = goTrans:NodeByName("mask").gameObject
	self.effectGroup_ = goTrans:NodeByName("effectGroup").gameObject
	self.lockImg_ = goTrans:NodeByName("lockImg").gameObject
	self.activeImg_ = goTrans:NodeByName("activeImg").gameObject
	self.groupPreLoad_ = goTrans:NodeByName("groupPreLoad").gameObject
	self.imgCircle_ = goTrans:NodeByName("groupPreLoad/imgCircle_").gameObject
	self.redMark_ = goTrans:NodeByName("redMark").gameObject
end

function PotentialIcon:setDragScrollView(scrollView)
	local widget = self.go:GetComponent(typeof(UIWidget))

	if not widget then
		return
	end

	if not self.go:GetComponent(typeof(UnityEngine.BoxCollider)) then
		local boxCollider = self.go:AddComponent(typeof(UnityEngine.BoxCollider))

		boxCollider.size = Vector3(widget.width, widget.height, 0)
	end

	local dragScrollView = self.go:GetComponent(typeof(UIDragScrollView))

	dragScrollView = dragScrollView or self.go:AddComponent(typeof(UIDragScrollView))
	dragScrollView.scrollView = scrollView
end

function PotentialIcon:setInfo(id, params)
	self.id_ = id
	self.unlockGrade_ = params.unlockGrade

	if id == -1 then
		self:setIconSource("potentiality_unknow")
	elseif not params.type or params.type == "default" or params.type == "potentials_bak" then
		self:setIconSource(xyd.tables.skillTable:getSkillIcon(id))
	elseif params.type == xyd.ActivityID.FAIRY_TALE then
		self:setIconSource(xyd.tables.activityFairyTaleBuffTable:getFx(id))
	end

	self.lockImg_:SetActive(params.is_lock)
	self.activeImg_:SetActive(params.is_active)
	self.mask_:SetActive(params.is_mask)

	if params.show_effect then
		self.effect_name_ = active_effect_name_

		self:showEffect()
	end

	if params.is_next then
		self.effect_name_ = next_effect_name_

		self:showEffect()
	end

	if not params.show_effect and not params.is_next then
		self:hideEffect()
	end

	if params and params.scale then
		local transform = self.go.transform

		transform:SetLocalScale(params.scale, params.scale, 0)
	end

	self.redMark_:SetActive(params.show_red and not self.is_guest)

	if params and params.is_unlocking then
		self:showUnlockingEffect(params)
	end
end

function PotentialIcon:showUnlockingEffect(params)
	self.effectGroup_:SetActive(true)

	if self.effect and self.effect:getName() ~= unlocking_effect_name_ then
		self.effect:destroy()
		NGUITools.DestroyChildren(self.effectGroup_.transform)

		self.effect_ = nil
	end

	if not self.effect then
		self.effect_ = xyd.Spine.new(self.effectGroup_)

		self.effect_:setInfo(unlocking_effect_name_, function()
			if params.scale then
				self.effect_:SetLocalScale(params.scale - 0.03, params.scale - 0.03, 1)
			end

			self.effect_:play("texiao01", 1, 1, function()
				self.effect_:play("texiao02", 0)
			end)
		end)
	else
		self.effect:play("texiao02", 0)
	end
end

function PotentialIcon:active(flag)
	self.activeImg_:SetActive(flag)
end

function PotentialIcon:setIconSource(source)
	local function action()
		if not self.imgCircle_ then
			self.loadTimer_:Stop()

			return
		end

		local angles = self.imgCircle_.transform.localEulerAngles + Vector3(0, 0, -5)

		self.imgCircle_.transform.localEulerAngles = angles
	end

	self.groupPreLoad_:SetActive(true)

	self.loadTimer_ = self:getTimer(action, 0.1, -1)

	self.loadTimer_:Start()
	xyd.setUISpriteAsync(self.img_, nil, source, function()
		self.groupPreLoad_:SetActive(false)
		self.loadTimer_:Stop()
	end)
end

function PotentialIcon:showEffect()
	self.effectGroup_:SetActive(true)

	if self.effect_ and self.effect_:getName() ~= self.effect_name_ then
		NGUITools.DestroyChildren(self.effectGroup_.transform)

		self.effect_ = nil
	end

	if not self.effect_ then
		self.effect_ = xyd.Spine.new(self.effectGroup_)

		self.effect_:setInfo(self.effect_name_, function()
			self.effect_:play("texiao01", 0, 1)
		end, true)
	else
		self.effect_:play("texiao01", 0, 1)
	end
end

function PotentialIcon:hideEffect()
	self.effectGroup_:SetActive(false)

	if self.effect_ then
		self.effect_:stop()
	end
end

function PotentialIcon:skillID()
	return self.id_
end

function PotentialIcon:showTips(show, container, update)
	if not container then
		return
	end

	NGUITools.DestroyChildren(container.transform)

	self.tips = PotentialIconTips.new(container)

	if update then
		self.tips:setInfo(self.id_, self.unlocked, self.unlockGrade_)
	end

	container:SetActive(show)
end

function PotentialIconTips:getPrefabPath()
	return "Prefabs/Components/potential_icon_tips"
end

function PotentialIconTips:initUI()
	PotentialIconTips.super.initUI(self)

	if not self.touchBG then
		self.touchBG = self.go:NodeByName("touchBG").gameObject
	end

	UIEventListener.Get(self.touchBG).onClick = function()
		self.parentGo:SetActive(false)
	end
end

function PotentialIconTips:getComponent()
	local go = self.go
	local top = go:NodeByName("top").gameObject

	self.lineImg = top:ComponentByName("lineImage", typeof(UISprite))
	self.skillName = top:ComponentByName("skillName", typeof(UILabel))
	self.iconContainer = top:NodeByName("icon").gameObject
	self.desc = go:ComponentByName("descGroup/desc", typeof(UILabel))
	self.unlockDesc = go:ComponentByName("descGroup/unlockDesc", typeof(UILabel))
	self.bg = go:ComponentByName("bg", typeof(UISprite))
end

return PotentialIcon
