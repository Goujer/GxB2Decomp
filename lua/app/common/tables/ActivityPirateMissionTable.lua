-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPirateMissionTable.lua

local ActivityPirateMissionTable = class("ActivityPirateMissionTable", import("app.common.tables.BaseTable"))

function ActivityPirateMissionTable:ctor()
	ActivityPirateMissionTable.super.ctor(self, "activity_pirate_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityPirateMissionTable:awards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityPirateMissionTable:getComplete(id)
	return self:getNumber(id)
end

function ActivityPirateMissionTable:getNeedItem(id)
	return self:getNumber(id, "item_id")
end

function ActivityPirateMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityPirateMissionTable:getIDs()
	return self.ids_
end

function ActivityPirateMissionTable:checkIsCool(item_id)
	for _, id in ipairs(self.ids_) do
		local needID = self:getNeedItem(id)

		if needID == item_id then
			return 1
		end
	end

	return -1
end

return ActivityPirateMissionTable
