-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CostTotalGradeTable.lua

local CostTotalGradeTable = class("CostTotalGradeTable", import(".BaseTable"))
local slotModel = xyd.models.slot

function CostTotalGradeTable:ctor()
	CostTotalGradeTable.super.ctor(self, "cost_total_grade")
end

function CostTotalGradeTable:getCost(lev)
	return self:split2Cost(lev, "cost", "#")
end

function CostTotalGradeTable:getGold(lev)
	return self:split2Cost(lev, "gold", "#")
end

return CostTotalGradeTable
