-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBeachIslandMission.lua

local ActivityBeachIslandMission = class("ActivityBeachIslandMission", import("app.common.tables.BaseTable"))

function ActivityBeachIslandMission:ctor()
	ActivityBeachIslandMission.super.ctor(self, "activity_beach_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityBeachIslandMission:getIDs()
	return self.ids_
end

function ActivityBeachIslandMission:getCompleteValue(id)
	return self:getNumber(id, "complete")
end

function ActivityBeachIslandMission:getLinkActivity(id)
	return self:getNumber(id, "activity_id")
end

function ActivityBeachIslandMission:getJumpID(id)
	return self:getNumber(id, "getway")
end

function ActivityBeachIslandMission:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityBeachIslandMission:getDesc(id)
	return xyd.tables.activityBeachIslandTextMission:getDesc(id)
end

return ActivityBeachIslandMission
