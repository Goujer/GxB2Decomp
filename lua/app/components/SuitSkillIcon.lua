-- chunkname: @../../../Product/Bundles/Android/src/app/components/SuitSkillIcon.lua

local SuitSkillIcon = class("SuitSkillIcon", import(".BaseComponent"))

function SuitSkillIcon:ctor(parentGo)
	SuitSkillIcon.super.ctor(self, parentGo)
end

function SuitSkillIcon:getPrefabPath()
	return "Prefabs/Components/suit_skill_icon"
end

function SuitSkillIcon:initUI()
	SuitSkillIcon.super.initUI(self)
	self:getComponent()
end

function SuitSkillIcon:getComponent()
	local goTrans = self.go.transform

	self.bg_ = goTrans:ComponentByName("bg", typeof(UISprite))
	self.img_ = goTrans:ComponentByName("img", typeof(UISprite))
	self.activeImg_ = goTrans:NodeByName("activeImg").gameObject
	self.groupPreLoad_ = goTrans:NodeByName("groupPreLoad").gameObject
	self.imgCircle_ = goTrans:NodeByName("groupPreLoad/imgCircle_").gameObject
	self.skillLev = goTrans:ComponentByName("groupLev/skillLev", typeof(UILabel))
end

function SuitSkillIcon:setInfo(id, levelUp)
	self.id_ = id

	self:setIconSource(xyd.tables.skillTable:getSkillIcon(id))

	if levelUp then
		self.skillLev.text = levelUp
	else
		self.skillLev.text = xyd.tables.skillTable:getSkillLev(id)
	end
end

function SuitSkillIcon:active(flag)
	self.activeImg_:SetActive(flag)
end

function SuitSkillIcon:setIconSource(source)
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

function SuitSkillIcon:skillID()
	return self.id_
end

return SuitSkillIcon
