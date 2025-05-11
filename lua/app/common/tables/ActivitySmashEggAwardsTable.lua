-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySmashEggAwardsTable.lua

local ActivitySmashEggAwardsTable = class("ActivitySmashEggAwardsTable", import("app.common.tables.BaseTable"))

function ActivitySmashEggAwardsTable:ctor()
	ActivitySmashEggAwardsTable.super.ctor(self, "activity_smash_egg_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySmashEggAwardsTable:getIDs()
	return self.ids_
end

function ActivitySmashEggAwardsTable:getValue(id)
	return self:split2num(id, "complete_value", "#")
end

function ActivitySmashEggAwardsTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivitySmashEggAwardsTable
