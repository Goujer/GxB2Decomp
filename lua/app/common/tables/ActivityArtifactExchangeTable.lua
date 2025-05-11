-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityArtifactExchangeTable.lua

local ActivityArtifactExchangeTable = class("ActivityArtifactExchangeTable", import("app.common.tables.BaseTable"))

function ActivityArtifactExchangeTable:ctor()
	ActivityArtifactExchangeTable.super.ctor(self, "activity_equip_exchange")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityArtifactExchangeTable:getIDs()
	return self.ids_
end

function ActivityArtifactExchangeTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityArtifactExchangeTable:getCost(id)
	return self:split2Cost(id, "cost", "|#")
end

function ActivityArtifactExchangeTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityArtifactExchangeTable
