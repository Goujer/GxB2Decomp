-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/NewTrialBattlePassAwardsTable.lua

local NewTrialBattlePassAwardsTable = class("NewTrialBattlePassAwardsTable", import("app.common.tables.BaseTable"))

function NewTrialBattlePassAwardsTable:ctor()
	NewTrialBattlePassAwardsTable.super.ctor(self, "new_trial_battlepass_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function NewTrialBattlePassAwardsTable:getIDs()
	return self.ids_
end

function NewTrialBattlePassAwardsTable:getExp(id)
	return self:getNumber(id, "exp")
end

function NewTrialBattlePassAwardsTable:getFreeAwards(id)
	return self:split2Cost(id, "free_award", "#")
end

function NewTrialBattlePassAwardsTable:getFreeOptionalAwards(id)
	return self:split2Cost(id, "free_optional_award", "|#")
end

function NewTrialBattlePassAwardsTable:getPaidAwards(id)
	return self:split2Cost(id, "paid_award", "|#")
end

function NewTrialBattlePassAwardsTable:getPaidOptionalAwards(id)
	return self:split2Cost(id, "paid_optional_award", "|#")
end

return NewTrialBattlePassAwardsTable
