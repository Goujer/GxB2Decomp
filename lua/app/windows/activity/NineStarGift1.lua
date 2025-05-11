-- chunkname: @../../../Product/Bundles/Android/src/app/windows/activity/NineStarGift1.lua

local SevenStarGift = import(".SevenStarGift")
local NineStarGift1 = class("NineStarGift1", SevenStarGift)

function NineStarGift1:ctor(parentGO, params, parent)
	SevenStarGift.ctor(self, parentGO, params, parent)
end

return NineStarGift1
