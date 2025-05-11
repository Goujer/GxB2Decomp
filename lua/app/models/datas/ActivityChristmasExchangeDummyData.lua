-- chunkname: @../../../Product/Bundles/Android/src/app/models/datas/ActivityChristmasExchangeDummyData.lua

local json = require("cjson")
local ActivityData = import("app.models.ActivityData")
local ActivityChristmasExchangeDummyData = class("ActivityChristmasExchangeDummyData", ActivityData, true)

function ActivityChristmasExchangeDummyData:getUpdateTime()
	return self:getEndTime()
end

return ActivityChristmasExchangeDummyData
