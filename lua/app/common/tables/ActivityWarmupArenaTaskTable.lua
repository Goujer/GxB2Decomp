-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWarmupArenaTaskTable.lua

local BaseTable = import(".BaseTable")
local ActivityWarmupArenaTaskTable = class("ActivityWarmupArenaTaskTable", BaseTable)

function ActivityWarmupArenaTaskTable:ctor()
	BaseTable.ctor(self, "activity_warmup_arena_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityWarmupArenaTaskTable:getType(id)
	return self:getNumber(id, "type_1")
end

function ActivityWarmupArenaTaskTable:getEnergy(id)
	return self:getNumber(id, "energy")
end

function ActivityWarmupArenaTaskTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityWarmupArenaTaskTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityWarmupArenaTaskTable:getIDs()
	return self.ids_
end

function ActivityWarmupArenaTaskTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityWarmupArenaTaskTable
