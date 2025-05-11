-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySproutsHeightAwardTable.lua

local BaseTable = import(".BaseTable")
local ActivitySproutsHeightAwardTable = class("ActivitySproutsHeightAwardTable", BaseTable)

function ActivitySproutsHeightAwardTable:ctor()
	BaseTable.ctor(self, "activity_sprouts_height_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySproutsHeightAwardTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivitySproutsHeightAwardTable:getIDs()
	return self.ids_
end

function ActivitySproutsHeightAwardTable:getHeight(id)
	return self:getNumber(id, "height")
end

function ActivitySproutsHeightAwardTable:getSelect(id)
	return self:getNumber(id, "is_select")
end

return ActivitySproutsHeightAwardTable
