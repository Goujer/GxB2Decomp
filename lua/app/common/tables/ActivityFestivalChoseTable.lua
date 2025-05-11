-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFestivalChoseTable.lua

local ActivityFestivalChoseTable = class("ActivityFestivalChoseTable", import("app.common.tables.BaseTable"))

function ActivityFestivalChoseTable:ctor()
	ActivityFestivalChoseTable.super.ctor(self, "activity_festival_chose")
	self:parseTable(nil, true)
end

function ActivityFestivalChoseTable:getIDs()
	return self.ids_
end

function ActivityFestivalChoseTable:getChooseAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityFestivalChoseTable:getGiftbagData(id)
	local giftbagId = id
	local data = {}

	if giftbagId then
		local giftbagTable = xyd.tables.giftBagTable
		local vipExp = giftbagTable:getVipExp(giftbagId)
		local limitTimes = giftbagTable:getBuyLimit(giftbagId)
		local giftId = giftbagTable:getGiftID(giftbagId)
		local awards = xyd.tables.giftTable:getAwards(giftId)

		data = {
			vip_exp = vipExp,
			limit_times = limitTimes,
			awards = awards
		}
	end

	return data
end

return ActivityFestivalChoseTable
