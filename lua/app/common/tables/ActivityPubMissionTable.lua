-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPubMissionTable.lua

local ActivityPubMissionTable = class("ActivityPubMissionTable", import("app.common.tables.BaseTable"))

function ActivityPubMissionTable:ctor()
	ActivityPubMissionTable.super.ctor(self, "activity_pub_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityPubMissionTable:getIDs()
	return self.ids_
end

function ActivityPubMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityPubMissionTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityPubMissionTable:getStar(id)
	return self:getNumber(id, "star")
end

function ActivityPubMissionTable:getPoint(id)
	return self:getNumber(id, "complete_value")
end

function ActivityPubMissionTable:getJumpWay(id)
	return self:getNumber(id, "getway")
end

return ActivityPubMissionTable
