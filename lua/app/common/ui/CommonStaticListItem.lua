-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/CommonStaticListItem.lua

local CommonStaticListItem = class("CommonStaticListItem", import("app.components.CopyComponent"))

function CommonStaticListItem:ctor(go, parent)
	CommonStaticListItem.super.ctor(self, go)

	self.parent = parent
end

function CommonStaticListItem:initUI()
	self:getUIComponent()
	CommonStaticListItem.super.initUI(self)
end

function CommonStaticListItem:getUIComponent()
	return
end

function CommonStaticListItem:update(info)
	return
end

return CommonStaticListItem
