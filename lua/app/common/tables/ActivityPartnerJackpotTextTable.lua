-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPartnerJackpotTextTable.lua

local BaseTable = import(".BaseTable")
local ActivityPartnerJackpotTextTable = class("ActivityPartnerJackpotTextTable", BaseTable)

function ActivityPartnerJackpotTextTable:ctor()
	ActivityPartnerJackpotTextTable.super.ctor(self, "activity_partner_jackpot_text_" .. tostring(xyd.Global.lang))
end

function ActivityPartnerJackpotTextTable:get()
	if not ActivityPartnerJackpotTextTable.INSTANCE then
		ActivityPartnerJackpotTextTable.INSTANCE = ActivityPartnerJackpotTextTable.new()
	end

	return ActivityPartnerJackpotTextTable.INSTANCE
end

function ActivityPartnerJackpotTextTable:reset()
	ActivityPartnerJackpotTextTable.INSTANCE = nil
end

function ActivityPartnerJackpotTextTable:getDesc(id)
	return self:getString(id, "desc")
end

ActivityPartnerJackpotTextTable.INSTANCE = nil

return ActivityPartnerJackpotTextTable
