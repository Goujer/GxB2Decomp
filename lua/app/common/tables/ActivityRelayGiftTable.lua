-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityRelayGiftTable.lua

local ActivityRelayGiftTable = class("ActivityRelayGiftTable", import("app.common.tables.BaseTable"))

function ActivityRelayGiftTable:ctor()
	ActivityRelayGiftTable.super.ctor(self, "activity_relay_gift")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityRelayGiftTable:getIDs()
	return self.ids_
end

function ActivityRelayGiftTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ActivityRelayGiftTable:getPreGiftbagId(id)
	return self:getNumber(id, "pre_giftbag_id")
end

function ActivityRelayGiftTable:getPreAwardId(id)
	return self:getNumber(id, "pre_award_id")
end

return ActivityRelayGiftTable
