-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleMissionTable.lua

local ActivityFairyTaleMissionTable = class("ActivityFairyTaleMissionTable", import(".BaseTable"))

function ActivityFairyTaleMissionTable:ctor()
	ActivityFairyTaleMissionTable.super.ctor(self, "activity_fairytale_mission")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairyTaleMissionTable:getName(id)
	return xyd.tables.activityFairyTaleMissionTextTable:getName(id)
end

function ActivityFairyTaleMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityFairyTaleMissionTable:getMissionType(id)
	return self:getNumber(id, "type")
end

return ActivityFairyTaleMissionTable
