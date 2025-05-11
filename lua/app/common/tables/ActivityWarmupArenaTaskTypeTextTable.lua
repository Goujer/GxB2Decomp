-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWarmupArenaTaskTypeTextTable.lua

local BaseTable = import(".BaseTable")
local ActivityWarmupArenaTaskTypeTextTable = class("ActivityWarmupArenaTaskTypeTextTable", BaseTable)

function ActivityWarmupArenaTaskTypeTextTable:ctor()
	BaseTable.ctor(self, "activity_warmup_arena_task_type_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityWarmupArenaTaskTypeTextTable:getIDs()
	return self.ids_
end

function ActivityWarmupArenaTaskTypeTextTable:getText(id)
	return self:getString(id, "text")
end

return ActivityWarmupArenaTaskTypeTextTable
