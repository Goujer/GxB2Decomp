-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleRankTable.lua

local ShrineHurdleRankTable = class("ShrineHurdleRankTable", import("app.common.tables.BaseTable"))

function ShrineHurdleRankTable:ctor()
	ShrineHurdleRankTable.super.ctor(self, "shrine_hurdle_rank")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ShrineHurdleRankTable:getIDs()
	return self.ids_
end

function ShrineHurdleRankTable:getAwards(type, id)
	return self:split2Cost(id, "awards_" .. type, "|#")
end

function ShrineHurdleRankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ShrineHurdleRankTable:getIsPercentage(id)
	return self:getNumber(id, "is_percentage") or 0
end

function ShrineHurdleRankTable:getShow(id)
	return self:getString(id, "show")
end

return ShrineHurdleRankTable
