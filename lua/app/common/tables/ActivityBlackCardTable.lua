-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBlackCardTable.lua

local BaseTable = import(".BaseTable")
local activityBlackCardTable = class("activityBlackCardTable", BaseTable)

function activityBlackCardTable:ctor()
	BaseTable.ctor(self, "activity_black_card")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function activityBlackCardTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function activityBlackCardTable:getIDs()
	return self.ids_
end

function activityBlackCardTable:getType(id)
	return self:getNumber(id, "multiply_type")
end

return activityBlackCardTable
