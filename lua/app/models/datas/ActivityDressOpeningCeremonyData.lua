﻿-- chunkname: @../../../Product/Bundles/Android/src/app/models/datas/ActivityDressOpeningCeremonyData.lua

local json = require("cjson")
local ActivityData = import("app.models.ActivityData")
local ActivityDressOpeningCeremonyData = class("ActivityDressOpeningCeremonyData", ActivityData, true)

function ActivityDressOpeningCeremonyData:getUpdateTime()
	return self:getEndTime()
end

return ActivityDressOpeningCeremonyData
