﻿-- chunkname: @../../../Product/Bundles/Android/src/app/models/datas/ActivityLimitedTaskData.lua

local json = require("cjson")
local ActivityData = import("app.models.ActivityData")
local ActivityLimitedTaskData = class("ActivityLimitedTaskData", ActivityData, true)

function ActivityLimitedTaskData:getUpdateTime()
	return self:getEndTime()
end

return ActivityLimitedTaskData
