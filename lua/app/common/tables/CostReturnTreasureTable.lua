-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CostReturnTreasureTable.lua

local CostReturnTreasureTable = class("CostReturnTreasureTable", import(".BaseTable"))
local slotModel = xyd.models.slot

function CostReturnTreasureTable:ctor()
	CostReturnTreasureTable.super.ctor(self, "cost_return_treasure")
end

function CostReturnTreasureTable:getCost(lev)
	return self:split2Cost(lev, "cost", "|#")
end

return CostReturnTreasureTable
