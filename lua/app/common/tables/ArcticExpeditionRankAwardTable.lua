-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionRankAwardTable.lua

local ArcticExpeditionRankAwardTable = class("ArcticExpeditionRankAwardTable", import("app.common.tables.BaseTable"))

function ArcticExpeditionRankAwardTable:ctor()
	ArcticExpeditionRankAwardTable.super.ctor(self, "activity_ept_rank_award")
	self:parseTable(nil, true)
end

function ArcticExpeditionRankAwardTable:getIDs()
	return self.ids_
end

function ArcticExpeditionRankAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ArcticExpeditionRankAwardTable:getRankLimit1(id)
	return self:getNumber(id, "rank1")
end

function ArcticExpeditionRankAwardTable:getRankLimit2(id)
	return self:getNumber(id, "rank2")
end

function ArcticExpeditionRankAwardTable:getRankLimit3(id)
	return self:getNumber(id, "rank3")
end

function ArcticExpeditionRankAwardTable:getShowIndex(id, index)
	return self:getString(id, "string" .. index)
end

function ArcticExpeditionRankAwardTable:getAwardByRank(rank, groupRankIndex)
	table.sort(self.ids_)

	if rank and rank + 1 > 0 then
		for _, id in ipairs(self.ids_) do
			local rankLimit = self:getNumber(id, "rank" .. groupRankIndex)

			if rank <= rankLimit then
				return self:getAwards(id)
			end
		end

		return self:getAwards(self.ids_[#self.ids_])
	else
		return {}
	end
end

return ArcticExpeditionRankAwardTable
