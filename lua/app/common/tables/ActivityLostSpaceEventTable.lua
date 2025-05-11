-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLostSpaceEventTable.lua

local ActivityLostSpaceEventTable = class("ActivityLostSpaceEventTable", import("app.common.tables.BaseTable"))

function ActivityLostSpaceEventTable:ctor()
	ActivityLostSpaceEventTable.super.ctor(self, "activity_lost_space_event")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLostSpaceEventTable:getIDs()
	return self.ids_
end

function ActivityLostSpaceEventTable:getEnergyNum(id)
	return self:getNumber(id, "energy_num")
end

function ActivityLostSpaceEventTable:getDesc(id)
	return xyd.tables.activityLostSpaceEventTextTable:getDesc(id)
end

function ActivityLostSpaceEventTable:getName(id)
	return xyd.tables.activityLostSpaceEventTextTable:getName(id)
end

function ActivityLostSpaceEventTable:getIcon(id)
	return xyd.tables.activityLostSpaceEventTextTable:getIcon(id)
end

function ActivityLostSpaceEventTable:getItemId(id)
	return self:getNumber(id, "item_id")
end

return ActivityLostSpaceEventTable
