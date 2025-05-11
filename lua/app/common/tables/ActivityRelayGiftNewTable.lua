-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityRelayGiftNewTable.lua

local ActivityRelayGiftNewTable = class("ActivityRelayGiftNewTable", import("app.common.tables.BaseTable"))

function ActivityRelayGiftNewTable:ctor()
	ActivityRelayGiftNewTable.super.ctor(self, "activity_5week_giftbag")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityRelayGiftNewTable:getIDs()
	return self.ids_
end

function ActivityRelayGiftNewTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivityRelayGiftNewTable:getPreGiftbagId(id)
	return self:getNumber(id, "pre_giftbag_id")
end

function ActivityRelayGiftNewTable:getPreAwardId(id)
	return self:getNumber(id, "pre_award_id")
end

return ActivityRelayGiftNewTable
