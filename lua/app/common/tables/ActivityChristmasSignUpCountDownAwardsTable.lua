-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChristmasSignUpCountDownAwardsTable.lua

local ActivityChristmasSignUpCountDownAwardsTable = class("ActivityChristmasSignUpCountDownAwardsTable", import("app.common.tables.BaseTable"))

function ActivityChristmasSignUpCountDownAwardsTable:ctor()
	ActivityChristmasSignUpCountDownAwardsTable.super.ctor(self, "activity_countdown_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityChristmasSignUpCountDownAwardsTable:getIDs()
	return self.ids_
end

function ActivityChristmasSignUpCountDownAwardsTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityChristmasSignUpCountDownAwardsTable:getGiftbagID(id)
	return self:getNumber(id, "giftbag_id")
end

return ActivityChristmasSignUpCountDownAwardsTable
