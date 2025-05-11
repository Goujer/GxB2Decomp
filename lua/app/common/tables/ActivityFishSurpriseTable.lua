-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFishSurpriseTable.lua

local ActivityFishSurpriseTable = class("ActivityFishSurpriseTable", import("app.common.tables.BaseTable"))

function ActivityFishSurpriseTable:ctor()
	ActivityFishSurpriseTable.super.ctor(self, "activity_fish_surprise")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFishSurpriseTable:getIDs()
	return self.ids_
end

function ActivityFishSurpriseTable:getLength(id)
	return self:split2Cost(id, "length", "|")
end

function ActivityFishSurpriseTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityFishSurpriseTable
