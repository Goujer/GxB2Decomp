-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleMissionTextTable.lua

local ActivityFairyTaleMissionTextTable = class("ActivityFairyTaleMissionTextTable", import(".BaseTable"))

function ActivityFairyTaleMissionTextTable:ctor()
	ActivityFairyTaleMissionTextTable.super.ctor(self, "activity_fairytale_mission_text_" .. xyd.Global.lang)
end

function ActivityFairyTaleMissionTextTable:getName(id)
	return self:getString(id, "mission_des")
end

return ActivityFairyTaleMissionTextTable
