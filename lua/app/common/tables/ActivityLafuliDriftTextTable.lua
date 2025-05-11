-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLafuliDriftTextTable.lua

local BaseTable = import(".BaseTable")
local ActivityLafuliDriftTextTable = class("ActivityLafuliDriftTextTable", BaseTable)

function ActivityLafuliDriftTextTable:ctor()
	BaseTable.ctor(self, "activity_lafuli_drift_text_" .. tostring(xyd.Global.lang))
end

function ActivityLafuliDriftTextTable:getTitle(id)
	id = tostring(id)

	return self:getString(id, "title")
end

function ActivityLafuliDriftTextTable:getDesc(id)
	id = tostring(id)

	return self:getString(id, "desc")
end

return ActivityLafuliDriftTextTable
