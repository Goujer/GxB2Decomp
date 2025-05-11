-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AcademyAssessmentCostTable.lua

local BaseTable = import(".BaseTable")
local AcademyAssessmentCostTable = class("AcademyAssessmentCostTable", BaseTable)

function AcademyAssessmentCostTable:ctor()
	AcademyAssessmentCostTable.super.ctor(self, "school_practise_ticket_buy")

	self.ids = {}
	self.costs = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, id)
	end

	table.sort(self.ids)
end

function AcademyAssessmentCostTable:getIDs()
	return #self.ids
end

function AcademyAssessmentCostTable:getCost(num)
	if #self.costs <= 0 then
		self:initCost()
	end

	return self.costs[num + 1]
end

function AcademyAssessmentCostTable:initCost()
	local cost = 0

	for i = 1, #self.ids do
		cost = cost + tonumber(self:getSingleCost(i)[2])
		self.costs[i + 1] = cost
	end
end

function AcademyAssessmentCostTable:getSingleCost(id)
	return self:split(id, "cost", "#")
end

return AcademyAssessmentCostTable
