-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPartnerMiracleTable.lua

local ActivityPartnerMiracleTable = class("ActivityPartnerMiracleTable", import("app.common.tables.BaseTable"))

function ActivityPartnerMiracleTable:ctor()
	ActivityPartnerMiracleTable.super.ctor(self, "activity_partner_miracle")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityPartnerMiracleTable:getIDandRks()
	local res = {}

	for i = 1, #self.ids_ do
		table.insert(res, {
			id = tonumber(self.ids_[i]),
			rk = self:getRank(self.ids_[i])
		})
	end

	return res
end

function ActivityPartnerMiracleTable:getGroupType(id)
	return self:getNumber(id, "group_type")
end

function ActivityPartnerMiracleTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityPartnerMiracleTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityPartnerMiracleTable:getRank(id)
	return self:getNumber(id, "rank")
end

return ActivityPartnerMiracleTable
