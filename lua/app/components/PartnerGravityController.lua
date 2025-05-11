-- chunkname: @../../../Product/Bundles/Android/src/app/components/PartnerGravityController.lua

local PartnerGravityController = class("PartnerGravityController", import(".BaseComponent"))

function PartnerGravityController:ctor(parentGo, offsetDepth)
	self.offsetDepth = offsetDepth

	PartnerGravityController.super.ctor(self, parentGo)

	self.isShowSetting_ = false
end

function PartnerGravityController:getPrefabPath()
	return "Prefabs/Components/gravity_controll_backpack"
end

function PartnerGravityController:initUI()
	PartnerGravityController.super.initUI(self)

	local go = self.go

	self.setBtn1 = go:NodeByName("setBtn1").gameObject
	self.gravityControl = go:GetComponent(typeof(GravityControl))
	self.settingPart = go:NodeByName("settpart").gameObject

	for i = 0, 20 do
		self["input" .. i] = self.settingPart:ComponentByName("setting" .. i .. "/input", typeof(UIInput))
	end

	self.gravityX = self.settingPart:ComponentByName("gravitySetting/input1", typeof(UIInput))
	self.gravityY = self.settingPart:ComponentByName("gravitySetting/input2", typeof(UIInput))
	self.gravityZ = self.settingPart:ComponentByName("gravitySetting/input3", typeof(UIInput))

	if UNITY_EDITOR or UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.4.30") >= 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "71.2.94") >= 0 then
		self.setBtn1:SetActive(false)
	else
		self.setBtn1:SetActive(true)
	end

	UIEventListener.Get(self.setBtn1).onClick = function()
		self.isShowSetting_ = not self.isShowSetting_

		self.settingPart:SetActive(self.isShowSetting_)

		if self.isShowSetting_ then
			self.gravityX.value = self.gravityControl.gravity.x
			self.gravityY.value = self.gravityControl.gravity.y
			self.gravityZ.value = self.gravityControl.gravity.z
			self.input17.value = self.gravityControl.sensitivity
			self.input18.value = self.gravityControl.fiedX
			self.input19.value = self.gravityControl.fiedY
			self.input20.value = self.gravityControl.fiedZ

			for i = 0, 16 do
				self["input" .. i].value = self.gravityControl.partsSpd[i]
			end
		else
			self.gravityControl.gravity.x = self.gravityX.value
			self.gravityControl.gravity.y = self.gravityY.value
			self.gravityControl.gravity.z = self.gravityZ.value
			self.gravityControl.sensitivity = self.input17.value
			self.gravityControl.fiedX = self.input18.value
			self.gravityControl.fiedY = self.input19.value
			self.gravityControl.fiedZ = self.input20.value

			for i = 0, 16 do
				self.gravityControl.partsSpd[i] = self["input" .. i].value
			end
		end
	end
end

return PartnerGravityController
