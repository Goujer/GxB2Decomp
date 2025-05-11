-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExploreMarketTable.lua

local ExploreMarketTable = class("ExploreMarketTable", import(".BaseTable"))

function ExploreMarketTable:ctor()
	ExploreMarketTable.super.ctor(self, "travel_building1")

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ExploreMarketTable:getIds()
	return self.ids_
end

function ExploreMarketTable:getOutput(id)
	return self:split(id, "out_put", "#")
end

function ExploreMarketTable:getStayMax(id)
	return self:getNumber(id, "stay_max")
end

function ExploreMarketTable:getLevelUpCost(id)
	return self:split2Cost(id, "update", "|#")
end

return ExploreMarketTable
