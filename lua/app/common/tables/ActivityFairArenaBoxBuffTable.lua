-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairArenaBoxBuffTable.lua

local ActivityFairArenaBoxBuffTable = class("ActivityFairArenaBoxBuffTable", import("app.common.tables.BaseTable"))

function ActivityFairArenaBoxBuffTable:ctor()
	ActivityFairArenaBoxBuffTable.super.ctor(self, "activity_fair_arena_box_buff")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairArenaBoxBuffTable:getIDs()
	return self.ids_
end

function ActivityFairArenaBoxBuffTable:getName(id)
	return xyd.tables.activityFairArenaBoxBuffTextTable:getName(id)
end

function ActivityFairArenaBoxBuffTable:getDesc(id)
	return xyd.tables.activityFairArenaBoxBuffTextTable:getDesc(id)
end

function ActivityFairArenaBoxBuffTable:getIcon(id)
	return self:getString(id, "icon")
end

return ActivityFairArenaBoxBuffTable
