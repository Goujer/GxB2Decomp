-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpaceExplorePlaceTable.lua

local ActivitySpaceExplorePlaceTable = class("ActivitySpaceExplorePlaceTable", import("app.common.tables.BaseTable"))

function ActivitySpaceExplorePlaceTable:ctor()
	ActivitySpaceExplorePlaceTable.super.ctor(self, "activity_space_explore_place")
end

function ActivitySpaceExplorePlaceTable:getDoor(id)
	return self:getNumber(id, "door")
end

function ActivitySpaceExplorePlaceTable:getBoss(id)
	return self:getNumber(id, "boss")
end

function ActivitySpaceExplorePlaceTable:getAward(id)
	return self:split2Cost(id, "award", "|", true)
end

function ActivitySpaceExplorePlaceTable:getMonster(id)
	return self:split2Cost(id, "monster", "|", true)
end

return ActivitySpaceExplorePlaceTable
