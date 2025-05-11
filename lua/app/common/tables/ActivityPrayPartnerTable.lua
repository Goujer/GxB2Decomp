-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPrayPartnerTable.lua

local ActivityPrayPartnerTable = class("ActivityPrayPartnerTable", import("app.common.tables.BaseTable"))

function ActivityPrayPartnerTable:ctor()
	ActivityPrayPartnerTable.super.ctor(self, "activity_pray_partner")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityPrayPartnerTable:getIDs()
	return self.ids_
end

function ActivityPrayPartnerTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityPrayPartnerTable:getPartnerIds(id)
	return xyd.split(self:getString(id, "partner_ids"), "|")
end

return ActivityPrayPartnerTable
