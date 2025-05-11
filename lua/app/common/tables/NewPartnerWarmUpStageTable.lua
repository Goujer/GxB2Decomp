-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewPartnerWarmUpStageTable.lua

local NewPartnerWarmUpStageTable = class("OnlineTable", import("app.common.tables.BaseTable"))

function NewPartnerWarmUpStageTable:ctor()
	self.ids_ = {}

	NewPartnerWarmUpStageTable.super.ctor(self, "partner_warmup")

	self.ids_ = {}

	for id, __ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function NewPartnerWarmUpStageTable:getIds()
	return self.ids_
end

function NewPartnerWarmUpStageTable:getPlotIds(id)
	return self:split2num(id, "plot_id", "#")
end

function NewPartnerWarmUpStageTable:getReward(id)
	return self:split2Cost(id, "reward", "|#")
end

function NewPartnerWarmUpStageTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function NewPartnerWarmUpStageTable:getBattleID(id)
	return self:getNumber(id, "battle_id")
end

function NewPartnerWarmUpStageTable:getInitPartner(id)
	return self:split2num(id, "initial_partner", "|")
end

function NewPartnerWarmUpStageTable:getPoses(id)
	return self:split2num(id, "stands", "|")
end

function NewPartnerWarmUpStageTable:getUnlockDay(id)
	return self:getNumber(id, "unlock_day")
end

return NewPartnerWarmUpStageTable
