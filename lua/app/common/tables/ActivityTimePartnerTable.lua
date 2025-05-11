-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTimePartnerTable.lua

local ActivityTimePartnerTable = class("ActivityTimePartnerTable", import(".BaseTable"))

function ActivityTimePartnerTable:ctor()
	ActivityTimePartnerTable.super.ctor(self, "activity_time_partner_award")

	self.ids = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityTimePartnerTable:getIds()
	return self.ids
end

function ActivityTimePartnerTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityTimePartnerTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

return ActivityTimePartnerTable
