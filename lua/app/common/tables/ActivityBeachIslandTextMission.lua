-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBeachIslandTextMission.lua

local ActivityBeachIslandTextMission = class("ActivityBeachIslandTextMission", import("app.common.tables.BaseTable"))

function ActivityBeachIslandTextMission:ctor()
	ActivityBeachIslandTextMission.super.ctor(self, "activity_beach_mission_text_" .. string.lower(xyd.lang))
end

function ActivityBeachIslandTextMission:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityBeachIslandTextMission
