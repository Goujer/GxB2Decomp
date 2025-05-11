-- chunkname: @../../../Product/Bundles/Android/src/app/components/TestInput.lua

local TestInput = class("TestInput", import(".BaseComponent"))

function TestInput:ctor(parentGo, callback)
	TestInput.super.ctor(self, parentGo)

	self.callback = callback
end

function TestInput:getPrefabPath()
	return "Prefabs/TestPrefabs/test_input_component"
end

function TestInput:initUI()
	TestInput.super.initUI(self)

	local main = self.go:NodeByName("main").gameObject

	self.input = main:ComponentByName("input", typeof(UIInput))
	self.btnSure = main:NodeByName("btnSure").gameObject
end

function TestInput:onRegister()
	UIEventListener.Get(self.btnSure).onClick = function()
		if self.callback then
			self.callback(self.input.value)
		end
	end
end

return TestInput
