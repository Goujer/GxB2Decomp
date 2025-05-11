-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityReturnGiftOptionalTable.lua

local ActivityReturnGiftOptionalTable = class("ActivityReturnGiftOptionalTable", import(".BaseTable"))

function ActivityReturnGiftOptionalTable:ctor()
	ActivityReturnGiftOptionalTable.super.ctor(self, "activity_return2_gift_optional")
end

function ActivityReturnGiftOptionalTable:getGiftBagID(id)
	return self:getNumber(id, "giftbag_id")
end

function ActivityReturnGiftOptionalTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityReturnGiftOptionalTable:getAwards(id, index)
	index = index or 1

	return self:split2Cost(id, "awards" .. index, "|#", true)
end

return ActivityReturnGiftOptionalTable
