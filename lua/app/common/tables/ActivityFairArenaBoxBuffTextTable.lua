-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairArenaBoxBuffTextTable.lua

local ActivityFairArenaBoxBuffTextTable = class("ActivityFairArenaBoxBuffTextTable", import("app.common.tables.BaseTable"))

function ActivityFairArenaBoxBuffTextTable:ctor()
	ActivityFairArenaBoxBuffTextTable.super.ctor(self, "activity_fair_arena_box_buff_text_" .. tostring(xyd.Global.lang))
end

function ActivityFairArenaBoxBuffTextTable:getName(id)
	return self:getString(id, "name")
end

function ActivityFairArenaBoxBuffTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityFairArenaBoxBuffTextTable
