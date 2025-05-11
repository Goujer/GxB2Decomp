-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityIceSummerStoryTable.lua

local BaseTable = import(".BaseTable")
local ActivityIceSummerStoryTable = class("ActivityIceSummerStoryTable", BaseTable)

function ActivityIceSummerStoryTable:ctor()
	BaseTable.ctor(self, "activity_swimsuit_storyaward")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityIceSummerStoryTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityIceSummerStoryTable:getIDs()
	return self.ids_
end

function ActivityIceSummerStoryTable:getPlot(id)
	return self:getNumber(id, "plot")
end

function ActivityIceSummerStoryTable:getCost(id)
	return self:getNumber(id, "cost")
end

function ActivityIceSummerStoryTable:getStoryNum()
	return #self.ids_ - 1
end

return ActivityIceSummerStoryTable
