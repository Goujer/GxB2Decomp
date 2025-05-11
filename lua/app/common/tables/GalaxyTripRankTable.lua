-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GalaxyTripRankTable.lua

local GalaxyTripRankTable = class("GalaxyTripRankTable", import("app.common.tables.BaseTable"))

function GalaxyTripRankTable:ctor()
	GalaxyTripRankTable.super.ctor(self, "galaxy_trip_rank")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GalaxyTripRankTable:getIDs()
	return self.ids_
end

function GalaxyTripRankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function GalaxyTripRankTable:getRankFront(id)
	return self:getString(id, "rank_front")
end

function GalaxyTripRankTable:getSeasonAwards(id)
	return self:split2Cost(id, "season_awards", "|#", true)
end

function GalaxyTripRankTable:getMailId(id)
	return self:getNumber(id, "mail_id")
end

return GalaxyTripRankTable
