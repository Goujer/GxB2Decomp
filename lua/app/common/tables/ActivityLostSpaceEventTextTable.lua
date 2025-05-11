-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLostSpaceEventTextTable.lua

local ActivityLostSpaceEventTextTable = class("ActivityLostSpaceEventTextTable", import("app.common.tables.BaseTable"))

function ActivityLostSpaceEventTextTable:ctor()
	ActivityLostSpaceEventTextTable.super.ctor(self, "activity_lost_space_event_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLostSpaceEventTextTable:getIDs()
	return self.ids_
end

function ActivityLostSpaceEventTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function ActivityLostSpaceEventTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityLostSpaceEventTextTable:getIcon(id)
	return self:getString(id, "picture")
end

return ActivityLostSpaceEventTextTable
