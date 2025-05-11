-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPrayAwardTable.lua

local ActivityPrayAwardTable = class("ItemTable", import("app.common.tables.BaseTable"))

function ActivityPrayAwardTable:ctor()
	ActivityPrayAwardTable.super.ctor(self, "activity_pray_award")

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityPrayAwardTable:getIDs()
	return self.ids_
end

function ActivityPrayAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityPrayAwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

return ActivityPrayAwardTable
