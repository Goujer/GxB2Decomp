-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewPartnerWarmUpAwardTable.lua

local NewPartnerWarmUpAwardTable = class("OnlineTable", import("app.common.tables.BaseTable"))

function NewPartnerWarmUpAwardTable:ctor()
	NewPartnerWarmUpAwardTable.super.ctor(self, "partner_warmup_award")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function NewPartnerWarmUpAwardTable:getIds()
	return self.ids_
end

function NewPartnerWarmUpAwardTable:getAmount(id)
	return self:getNumber(id, "amount")
end

function NewPartnerWarmUpAwardTable:getAwards(id)
	return self:split2num(id, "awards", "#")
end

return NewPartnerWarmUpAwardTable
