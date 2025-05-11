-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityWarmupArenaTaskAwardTable.lua

local BaseTable = import(".BaseTable")
local ActivityWarmupArenaTaskAwardTable = class("ActivityWarmupArenaTaskAwardTable", BaseTable)

function ActivityWarmupArenaTaskAwardTable:ctor()
	BaseTable.ctor(self, "activity_warmup_arena_taskaward")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityWarmupArenaTaskAwardTable:getPlotID(id)
	return self:getNumber(id, "plot_id")
end

function ActivityWarmupArenaTaskAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityWarmupArenaTaskAwardTable:getPackAwards(id)
	return self:split2Cost(id, "pack_awards", "|#")
end

function ActivityWarmupArenaTaskAwardTable:getEnergy(id)
	return self:getNumber(id, "energy")
end

function ActivityWarmupArenaTaskAwardTable:getIDs()
	return self.ids_
end

return ActivityWarmupArenaTaskAwardTable
