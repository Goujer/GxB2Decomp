-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CostTotalTreasureTable.lua

local CostTotalTreasureTable = class("CostTotalTreasureTable", import(".BaseTable"))
local slotModel = xyd.models.slot

function CostTotalTreasureTable:ctor()
	CostTotalTreasureTable.super.ctor(self, "cost_total_treasure")
end

function CostTotalTreasureTable:getCost(lev)
	return self:split2Cost(lev, "cost", "|#")
end

return CostTotalTreasureTable
