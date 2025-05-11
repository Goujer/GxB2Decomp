-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLimitPartnerAwards.lua

local ActivityLimitPartnerAwards = class("ActivityLimitPointAwards", import("app.common.tables.BaseTable"))

function ActivityLimitPartnerAwards:ctor()
	ActivityLimitPartnerAwards.super.ctor(self, "activity_limit_partner_awards")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLimitPartnerAwards:getIds()
	return self.ids_
end

function ActivityLimitPartnerAwards:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityLimitPartnerAwards:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

return ActivityLimitPartnerAwards
