-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/AlphaChangeTimer.lua

local AlphaChangeTimer = class("AlphaChangeTimer", import(".ChangeTimer"))

function AlphaChangeTimer:ctor(callback)
	AlphaChangeTimer.super.ctor(self, 1, 0, 1.5, 0.166, 3.833, callback)
end

return AlphaChangeTimer
