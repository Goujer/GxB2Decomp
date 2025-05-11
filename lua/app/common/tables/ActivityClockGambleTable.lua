-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityClockGambleTable.lua

local ActivityClockGambleTable = class("ActivityClockGambleTable", import("app.common.tables.BaseTable"))

function ActivityClockGambleTable:ctor()
	ActivityClockGambleTable.super.ctor(self, "activity_clock_gamble")

	self.ids_ = {}
	self.idsByRound = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local round = self:getRound(tonumber(id)) or 0

		if not self.idsByRound[round] then
			self.idsByRound[round] = {}
		end

		table.insert(self.idsByRound[round], tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityClockGambleTable:getIDs()
	return self.ids_
end

function ActivityClockGambleTable:getRound(id)
	return self:getNumber(id, "round")
end

function ActivityClockGambleTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivityClockGambleTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityClockGambleTable:getWeight(id)
	return self:getNumber(id, "weight")
end

function ActivityClockGambleTable:getIDsByRound(round)
	return self.idsByRound[round]
end

function ActivityClockGambleTable:getIDsByRound()
	return self.idsByRound
end

return ActivityClockGambleTable
