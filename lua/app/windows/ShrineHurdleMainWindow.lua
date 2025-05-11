-- chunkname: @../../../Product/Bundles/Android/src/app/windows/ShrineHurdleMainWindow.lua

local ShrineHurdleMainWindow = class("TowerWindow", import("app.components.BaseComponent"))

function ShrineHurdleMainWindow:ctor(name, params)
	ShrineHurdleMainWindow.super.ctor(self, name, params)
end

function ShrineHurdleMainWindow:initWindow()
	self:getUIComponent()
	self:updateState()
end

function ShrineHurdleMainWindow:getUIComponent()
	return
end

function ShrineHurdleMainWindow:updateState()
	return
end

function ShrineHurdleMainWindow:updateShow()
	return
end

return ShrineHurdleMainWindow
