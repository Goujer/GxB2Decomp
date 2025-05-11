-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHalloweenMissionTextTable.lua

local BaseTable = import(".BaseTable")
local ActivityHalloweenMissionTextTable = class("ActivityHalloweenMissionTextTable", BaseTable)

function ActivityHalloweenMissionTextTable:ctor()
	BaseTable.ctor(self, "activity_trickortreat_task_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivityHalloweenMissionTextTable:getIds()
	return self.ids_
end

function ActivityHalloweenMissionTextTable:getDescription(id)
	return self:getString(id, "desc")
end

return ActivityHalloweenMissionTextTable
