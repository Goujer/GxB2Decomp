-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySproutsPartnerAwardTable.lua

local BaseTable = import(".BaseTable")
local ActivitySproutsPartnerAwardTable = class("ActivitySproutsPartnerAwardTable", BaseTable)

function ActivitySproutsPartnerAwardTable:ctor()
	BaseTable.ctor(self, "activity_sprouts_partner_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySproutsPartnerAwardTable:getIDs()
	return self.ids_
end

function ActivitySproutsPartnerAwardTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivitySproutsPartnerAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

return ActivitySproutsPartnerAwardTable
