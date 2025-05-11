-- chunkname: @../../../Product/Bundles/Android/src/app/windows/AwardItemTipsWindow.lua

local AwardItemTipsWindow = class("AwardItemTipsWindow", import(".ItemTipsWindow"))

function AwardItemTipsWindow:ctor(name, params)
	AwardItemTipsWindow.super.ctor(self, name, params)
end

return AwardItemTipsWindow
