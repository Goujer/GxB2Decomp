-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripBattlepassTable.lua

local GalaxyTripBattlepassTable = class("GalaxyTripBattlepassTable", import("app.common.tables.BaseTable"))

function GalaxyTripBattlepassTable:ctor()
	GalaxyTripBattlepassTable.super.ctor(self, "galaxy_trip_battlepass")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripBattlepassTable:getIDs(curSeason)
	if not curSeason then
		return self.ids_
	else
		local realIDs = {}

		for i = 1, #self.ids_ do
			local id = self.ids_[i]
			local beginSeason = self:getBeginSeason(id)

			if beginSeason <= curSeason then
				table.insert(realIDs, id)
			end
		end

		return realIDs
	end
end

function GalaxyTripBattlepassTable:getPointLimit(id)
	return self:getNumber(id, "point_limit")
end

function GalaxyTripBattlepassTable:getFreeAwards(id)
	return self:split2Cost(id, "free_awards", "|#", true)
end

function GalaxyTripBattlepassTable:getPayAwards(id)
	return self:split2Cost(id, "pay_awards", "|#", true)
end

function GalaxyTripBattlepassTable:getBeginSeason(id)
	return self:getNumber(id, "begin_season")
end

return GalaxyTripBattlepassTable
