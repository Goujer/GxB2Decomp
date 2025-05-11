-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHw2022GiftbagTable.lua

local ActivityHw2022GiftbagTable = class("ActivityHw2022GiftbagTable", import("app.common.tables.BaseTable"))

function ActivityHw2022GiftbagTable:ctor()
	ActivityHw2022GiftbagTable.super.ctor(self, "activity_halloween2022_giftbag")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityHw2022GiftbagTable:getIDs()
	return self.ids_
end

function ActivityHw2022GiftbagTable:getPoint(id)
	return self:getNumber(id, "num")
end

function ActivityHw2022GiftbagTable:getAwards(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityHw2022GiftbagTable:getOpenTime(id)
	return self:getNumber(id, "open_time")
end

function ActivityHw2022GiftbagTable:getGiftbagID(id)
	return self:getNumber(id, "giftbag")
end

return ActivityHw2022GiftbagTable
