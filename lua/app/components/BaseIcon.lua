-- chunkname: @../../../Product/Bundles/Android/src/app/components/BaseIcon.lua

local BaseIcon = class("BaseIcon", import(".BaseComponent"))
local Destroy = UnityEngine.Object.Destroy

function BaseIcon:ctor(parentGo)
	BaseIcon.super.ctor(self, parentGo)
end

function BaseIcon:setRedMark(bool)
	return
end

function BaseIcon:initUI()
	BaseIcon.super.initUI(self)

	self.defalImgIconDepth = self.go:GetComponent(typeof(UIWidget)).depth
end

function BaseIcon:setDepth(depth)
	BaseIcon.super.setDepth(self, depth)
end

function BaseIcon:addPartObj(itemName, partInfo, objParent)
	objParent = objParent or self.go

	local path = partInfo.name

	if partInfo.path then
		path = partInfo.path
	end

	local obj = xyd.getItemIconPreAll(itemName):NodeByName(path).gameObject
	local initUIWidget = obj:GetComponent(typeof(UIWidget))
	local initDepth = 0

	if initUIWidget then
		initDepth = initUIWidget.depth
	end

	obj = NGUITools.AddChild(objParent.gameObject, obj)

	obj:SetLocalPosition(partInfo.pos[1], partInfo.pos[2], partInfo.pos[3])

	obj.name = partInfo.name

	local UIWidget_Con = obj:GetComponent(typeof(UIWidget))

	if UIWidget_Con then
		local newDepth = initDepth + self.go:GetComponent(typeof(UIWidget)).depth - self.defalImgIconDepth

		obj:GetComponent(typeof(UIWidget)).depth = newDepth

		self:setChildrenDepth(obj, self.go:GetComponent(typeof(UIWidget)).depth - self.defalImgIconDepth)
	end

	return obj
end

return BaseIcon
