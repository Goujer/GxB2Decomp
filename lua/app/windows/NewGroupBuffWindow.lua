﻿-- chunkname: @../../../Product/Bundles/Android/src/app/windows/NewGroupBuffWindow.lua

local GroupBuffDetailWindow = import(".GroupBuffDetailWindow")
local NewGroupBuffWindow = class("NewGroupBuffWindow", GroupBuffDetailWindow)

function NewGroupBuffWindow:ctor(name, params)
	NewGroupBuffWindow.super.ctor(self, name, params)
end

return NewGroupBuffWindow
