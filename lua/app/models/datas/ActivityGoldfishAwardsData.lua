-- chunkname: @../../../Product/Bundles/Android/src/app/models/datas/ActivityGoldfishAwardsData.lua

local json = require("cjson")
local ActivityData = import("app.models.ActivityData")
local ActivityGoldfishAwardsData = class("ActivityGoldfishAwardsData", ActivityData, true)

function ActivityGoldfishAwardsData:getUpdateTime()
	return self:getEndTime()
end

return ActivityGoldfishAwardsData
