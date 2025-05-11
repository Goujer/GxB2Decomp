-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySportsMissionTextTable.lua

local ActivitySportsMissionTextTable = class("ActivitySportsMissionTextTable", import(".BaseTable"))

function ActivitySportsMissionTextTable:ctor()
	ActivitySportsMissionTextTable.super.ctor(self, "activity_sports_mission_text_" .. xyd.Global.lang)
end

function ActivitySportsMissionTextTable:getDesc(id)
	return self:getString(id, "mission_des")
end

return ActivitySportsMissionTextTable
