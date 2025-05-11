-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGiftbagOptionalTable.lua

local ActivityGiftbagOptionalTable = class("ActivityGiftbagOptionalTable", import("app.common.tables.BaseTable"))

function ActivityGiftbagOptionalTable:ctor()
	ActivityGiftbagOptionalTable.super.ctor(self, "activity_giftbag_optional")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityGiftbagOptionalTable:getGiftBagIDs()
	return self.ids_
end

function ActivityGiftbagOptionalTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityGiftbagOptionalTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityGiftbagOptionalTable
