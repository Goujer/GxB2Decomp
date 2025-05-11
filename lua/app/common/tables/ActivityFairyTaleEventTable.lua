-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleEventTable.lua

local ActivityFairyTaleEventTable = class("ActivitiyFairyTaleEventTable", import(".BaseTable"))

function ActivityFairyTaleEventTable:ctor()
	ActivityFairyTaleEventTable.super.ctor(self, "activity_fairytale_event")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local mapId = self:getMapId(id)

		if not self.ids_[mapId] then
			self.ids_[mapId] = {}
		end

		local day = self:getDay(id)

		self.ids_[mapId][day] = tonumber(id)
	end
end

function ActivityFairyTaleEventTable:getMapId(id)
	return self:getNumber(id, "map_id")
end

function ActivityFairyTaleEventTable:getDay(id)
	return self:getNumber(id, "day")
end

function ActivityFairyTaleEventTable:getEventId(map_id, day)
	return self.ids_[map_id][day]
end

function ActivityFairyTaleEventTable:getConditionType(id)
	return self:getNumber(id, "condition_type")
end

return ActivityFairyTaleEventTable
