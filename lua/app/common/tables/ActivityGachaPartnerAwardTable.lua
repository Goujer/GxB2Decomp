-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGachaPartnerAwardTable.lua

local ActivityGachaPartnerAwardTable = class("ActivityGachaPartnerAwardTable", import("app.common.tables.BaseTable"))

function ActivityGachaPartnerAwardTable:ctor()
	ActivityGachaPartnerAwardTable.super.ctor(self, "activity_gacha_partner_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityGachaPartnerAwardTable:getIDs()
	return self.ids_
end

function ActivityGachaPartnerAwardTable:getLevel(id)
	return self:getNumber(id, "point")
end

function ActivityGachaPartnerAwardTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityGachaPartnerAwardTable:getMaxLevel()
	local id = self.ids_[#self.ids_ - 1]

	return self:getLevel(id)
end

return ActivityGachaPartnerAwardTable
