-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFishingAwardTable.lua

local ActivityFishingAwardTable = class("ActivityFishingAwardTable", import("app.common.tables.BaseTable"))

function ActivityFishingAwardTable:ctor()
	ActivityFishingAwardTable.super.ctor(self, "activity_fish_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFishingAwardTable:getIDs()
	return self.ids_
end

function ActivityFishingAwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityFishingAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityFishingAwardTable
