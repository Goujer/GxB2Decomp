-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SoulLandBattlePassAwardsTable.lua

local SoulLandBattlePassAwardsTable = class("SoulLandBattlePassAwardsTable", import("app.common.tables.BaseTable"))

function SoulLandBattlePassAwardsTable:ctor()
	SoulLandBattlePassAwardsTable.super.ctor(self, "soul_land_battlepass_awards")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function SoulLandBattlePassAwardsTable:getIDs()
	return self.ids_
end

function SoulLandBattlePassAwardsTable:getExp(id)
	return self:getNumber(id, "exp")
end

function SoulLandBattlePassAwardsTable:getFreeAwards(id)
	return self:split2Cost(id, "free_award", "|#")
end

function SoulLandBattlePassAwardsTable:getPaidAwards(id)
	return self:split2Cost(id, "paid_award", "|#")
end

function SoulLandBattlePassAwardsTable:getMaxScoreCanHold()
	return self:getExp(#self.ids_)
end

function SoulLandBattlePassAwardsTable:getMergePaidAwards()
	local paidAwards = {}

	for i, id in pairs(self.ids_) do
		local temp = self:getPaidAwards(id)

		for j, award in pairs(temp) do
			if not paidAwards[award[1]] then
				paidAwards[award[1]] = award[2]
			else
				paidAwards[award[1]] = paidAwards[award[1]] + award[2]
			end
		end
	end

	local result = {}

	for index, num in pairs(paidAwards) do
		local award = {}

		table.insert(award, index)
		table.insert(award, num)
		table.insert(result, award)
	end

	table.sort(result, function(a, b)
		return a[1] < b[1]
	end)

	return result
end

return SoulLandBattlePassAwardsTable
