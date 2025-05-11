-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLostSpaceAwardsTable.lua

local ActivityLostSpaceAwardsTable = class("ActivityLostSpaceAwardsTable", import("app.common.tables.BaseTable"))

function ActivityLostSpaceAwardsTable:ctor()
	ActivityLostSpaceAwardsTable.super.ctor(self, "activity_lost_space_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLostSpaceAwardsTable:getIDs()
	return self.ids_
end

function ActivityLostSpaceAwardsTable:getAward(id)
	return self:split2Cost(id, "award", "|#", true)
end

function ActivityLostSpaceAwardsTable:getExtraAward(id)
	return self:split2Cost(id, "extra_award", "#", true)
end

function ActivityLostSpaceAwardsTable:getIfTreasure(id)
	return self:getNumber(id, "if_treasure")
end

return ActivityLostSpaceAwardsTable
