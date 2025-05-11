-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySandMissionTextTable.lua

local ActivitySandMissionTextTable = class("ActivitySandMissionTextTable", import("app.common.tables.BaseTable"))

function ActivitySandMissionTextTable:ctor()
	ActivitySandMissionTextTable.super.ctor(self, "activity_sand_mission_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySandMissionTextTable:getIDs()
	return self.ids_
end

function ActivitySandMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivitySandMissionTextTable
