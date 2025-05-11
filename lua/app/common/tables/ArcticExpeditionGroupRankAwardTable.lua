-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionGroupRankAwardTable.lua

local ArcticExpeditionGroupRankAwardTable = class("ArcticExpeditionGroupRankAwardTable", import("app.common.tables.BaseTable"))

function ArcticExpeditionGroupRankAwardTable:ctor()
	ArcticExpeditionGroupRankAwardTable.super.ctor(self, "activity_ept_gruop_rank_award")
	self:parseTable(nil, true)
end

function ArcticExpeditionGroupRankAwardTable:getIDs()
	return self.ids_
end

function ArcticExpeditionGroupRankAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return ArcticExpeditionGroupRankAwardTable
