-- chunkname: @../../../Product/Bundles/Android/src/app/components/NewSkillIconWayAlert.lua

local NewSkillIconWayAlert = class("NewSkillIconWayAlert", import(".BaseComponent"))
local NewSkillIcon = import("app.components.NewSkillIcon")

function NewSkillIconWayAlert:ctor(parentGo, params)
	self.params = params
	self.buffId_ = params.id

	NewSkillIconWayAlert.super.ctor(self, parentGo, params)
end

function NewSkillIconWayAlert:initUI()
	NewSkillIconWayAlert.super.initUI(self)
	self:getUIComponent()
	self:updateInfo()
end

function NewSkillIconWayAlert:getPrefabPath()
	return "Prefabs/Components/new_skill_icon_way_alert"
end

function NewSkillIconWayAlert:getUIComponent()
	local winTrans = self.go:NodeByName("groupAction")

	self.groupAction_widget = winTrans:GetComponent(typeof(UIWidget))
	self.groupAction = self.go:NodeByName("groupAction").gameObject
	self.bg = self.groupAction:ComponentByName("bg", typeof(UISprite))
	self.lineBg = self.groupAction:ComponentByName("lineBg", typeof(UISprite))
	self.skillIconCon = self.groupAction:NodeByName("skillIconCon").gameObject
	self.skillName = self.groupAction:ComponentByName("skillName", typeof(UILabel))
	self.skillDesc = self.groupAction:ComponentByName("skillDesc", typeof(UILabel))
	self.lineBg2 = self.groupAction:ComponentByName("lineBg2", typeof(UISprite))
	self.extraLabel = self.groupAction:ComponentByName("extraLabel", typeof(UILabel))
	self.skillIcon = NewSkillIcon.new(self.skillIconCon.gameObject)
end

function NewSkillIconWayAlert:setInfo(params)
	self.buffId_ = params.id

	self:updateInfo()
end

function NewSkillIconWayAlert:updateInfo()
	print("self.buffId_", self.buffId_)

	local buffTable = xyd.tables.skillTable
	local params = {}

	self.skillIcon:setInfo(self.buffId_, params)

	local skillName = buffTable:getName(self.buffId_)
	local skillDesc = buffTable:getDesc(self.buffId_)

	self.skillName.text = skillName
	self.skillDesc.text = skillDesc
	self.extraLabel.text = " "
end

function NewSkillIconWayAlert:getActionHeight()
	return self.bg.height
end

function NewSkillIconWayAlert:getBuffId()
	return self.buffId_
end

return NewSkillIconWayAlert
