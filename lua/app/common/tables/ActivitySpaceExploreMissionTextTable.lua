-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpaceExploreMissionTextTable.lua

local BaseTable = import(".BaseTable")
local ActivitySpaceExploreMissionTextTable = class("ActivitySpaceExploreMissionTextTable", BaseTable)

function ActivitySpaceExploreMissionTextTable:ctor()
	BaseTable.ctor(self, "activity_space_explore_mission_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySpaceExploreMissionTextTable:getIds()
	return self.ids_
end

function ActivitySpaceExploreMissionTextTable:getDescription(id)
	return self:getString(id, "desc")
end

return ActivitySpaceExploreMissionTextTable
