-- chunkname: @../../../Product/Bundles/Android/src/app/models/datas/ActivityFreeRevertData.lua

local ActivityData = import("app.models.ActivityData")
local ActivityFreeRevertData = class("ActivityFreeRevertData", ActivityData, true)

function ActivityFreeRevertData:getUpdateTime()
	return self:getEndTime()
end

function ActivityFreeRevertData:getRedMarkState()
	if not self:isFunctionOnOpen() then
		return false
	end

	local flag = false

	return flag
end

function ActivityFreeRevertData:onAward(data)
	if data.activity_id == xyd.ActivityID.ACTIVITY_FREE_REVERGE then
		-- block empty
	end
end

return ActivityFreeRevertData
