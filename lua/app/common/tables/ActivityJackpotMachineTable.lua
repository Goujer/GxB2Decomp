-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJackpotMachineTable.lua

local ActivityJackpotMachineTable = class("ActivityJackpotMachineTable", import("app.common.tables.BaseTable"))

function ActivityJackpotMachineTable:ctor()
	ActivityJackpotMachineTable.super.ctor(self, "activity_jackpot_machine")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivityJackpotMachineTable:getIDs()
	return self.ids_
end

function ActivityJackpotMachineTable:getPositions(id)
	local positions = {}

	for i = 1, 3 do
		local pos = self:getNumber(id, "position_" .. tostring(i))

		table.insert(positions, pos)
	end

	return positions
end

function ActivityJackpotMachineTable:getAnimationType(id)
	return self:getNumber(id, "animation_type")
end

function ActivityJackpotMachineTable:getAwards(id)
	return self:split2num(id, "awards", "#")
end

function ActivityJackpotMachineTable:getAwardsUpdated(id)
	return self:split2num(id, "awards_updated", "#")
end

return ActivityJackpotMachineTable
