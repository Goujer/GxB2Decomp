-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ExploreWishingTreeTable.lua

local ExploreWishingTreeTable = class("ExploreWishingTreeTable", import(".BaseTable"))

function ExploreWishingTreeTable:ctor()
	ExploreWishingTreeTable.super.ctor(self, "travel_building2")

	self.ids_ = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ExploreWishingTreeTable:getIds()
	return self.ids_
end

function ExploreWishingTreeTable:getOutput(id)
	return self:split(id, "out_put", "#")
end

function ExploreWishingTreeTable:getStayMax(id)
	return self:getNumber(id, "stay_max")
end

function ExploreWishingTreeTable:getLevelUpCost(id)
	return self:split2Cost(id, "update", "|#")
end

return ExploreWishingTreeTable
