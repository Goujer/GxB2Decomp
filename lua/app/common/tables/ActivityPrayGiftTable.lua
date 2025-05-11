-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPrayGiftTable.lua

local ActivityPrayGiftTable = class("ItemTable", import("app.common.tables.BaseTable"))

function ActivityPrayGiftTable:ctor()
	ActivityPrayGiftTable.super.ctor(self, "activity_pray_gift")

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityPrayGiftTable:getIDs()
	return self.ids_
end

function ActivityPrayGiftTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityPrayGiftTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityPrayGiftTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityPrayGiftTable
