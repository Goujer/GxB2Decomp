-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJungleAwardsTable.lua

local BaseTable = import(".BaseTable")
local ActivityJungleAwardsTable = class("ActivityJungleAwardsTable", BaseTable)

function ActivityJungleAwardsTable:ctor()
	BaseTable.ctor(self, "activity_jungle_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityJungleAwardsTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityJungleAwardsTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityJungleAwardsTable:getIDs()
	return self.ids_
end

function ActivityJungleAwardsTable:getArea(id)
	return self:getNumber(id, "area")
end

return ActivityJungleAwardsTable
