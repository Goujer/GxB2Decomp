-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityRepairConsoleMissionTextTable.lua

local ActivityRepairConsoleMissionTextTable = class("ActivityRepairConsoleMissionTextTable", import("app.common.tables.BaseTable"))

function ActivityRepairConsoleMissionTextTable:ctor()
	ActivityRepairConsoleMissionTextTable.super.ctor(self, "activity_repair_console_mission_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityRepairConsoleMissionTextTable:getIDs()
	return self.ids_
end

function ActivityRepairConsoleMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityRepairConsoleMissionTextTable
