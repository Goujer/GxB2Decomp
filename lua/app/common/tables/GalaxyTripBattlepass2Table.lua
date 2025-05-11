-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripBattlepass2Table.lua

local GalaxyTripBattlepass2Table = class("GalaxyTripBattlepass2Table", import("app.common.tables.BaseTable"))

function GalaxyTripBattlepass2Table:ctor()
	GalaxyTripBattlepass2Table.super.ctor(self, "galaxy_trip_battlepass2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripBattlepass2Table:getIDs(curSeason)
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

function GalaxyTripBattlepass2Table:getPointLimit(id)
	return self:getNumber(id, "point_limit")
end

function GalaxyTripBattlepass2Table:getFreeAwards(id)
	return self:split2Cost(id, "free_awards", "|#", true)
end

function GalaxyTripBattlepass2Table:getPayAwards(id)
	return self:split2Cost(id, "pay_awards", "|#", true)
end

function GalaxyTripBattlepass2Table:getBeginSeason(id)
	return self:getNumber(id, "begin_season")
end

return GalaxyTripBattlepass2Table
