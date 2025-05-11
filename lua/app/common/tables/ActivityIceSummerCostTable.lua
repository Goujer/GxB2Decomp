-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityIceSummerCostTable.lua

local BaseTable = import(".BaseTable")
local ActivityIceSummerCostTable = class("ActivityIceSummerCostTable", BaseTable)

function ActivityIceSummerCostTable:ctor()
	BaseTable.ctor(self, "activity_swimsuit_costaward")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityIceSummerCostTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityIceSummerCostTable:getIDs()
	return self.ids_
end

function ActivityIceSummerCostTable:getWeight(id)
	return self:getNumber(id, "weight")
end

return ActivityIceSummerCostTable
