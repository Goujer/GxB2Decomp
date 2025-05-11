-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCupidGiftAwardTable.lua

local ActivityCupidGiftAwardTable = class("ActivityCupidGiftAwardTable", import("app.common.tables.BaseTable"))

function ActivityCupidGiftAwardTable:ctor()
	ActivityCupidGiftAwardTable.super.ctor(self, "activity_cupid_gift_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityCupidGiftAwardTable:getIDs()
	return self.ids_
end

function ActivityCupidGiftAwardTable:getGiftId(id)
	return self:getNumber(id, "gift_id")
end

function ActivityCupidGiftAwardTable:getAward(id)
	return self:split2Cost(id, "award", "|#", true)
end

function ActivityCupidGiftAwardTable:getDrawTimes(id)
	return self:getNumber(id, "draw_times")
end

return ActivityCupidGiftAwardTable
