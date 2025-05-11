-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBlindBoxBattlePassTable.lua

local ActivityBlindBoxBattlePassTable = class("ActivityBlindBoxBattlePassTable", import("app.common.tables.BaseTable"))

function ActivityBlindBoxBattlePassTable:ctor()
	ActivityBlindBoxBattlePassTable.super.ctor(self, "activity_blind_box_battlepass")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_, function(a, b)
		return a < b
	end)
end

function ActivityBlindBoxBattlePassTable:getIDs()
	return self.ids_
end

function ActivityBlindBoxBattlePassTable:getDay(id)
	return self:getNumber(id, "awards")
end

function ActivityBlindBoxBattlePassTable:getAwards1(id)
	return self:split2Cost(id, "awards1", "|#")
end

function ActivityBlindBoxBattlePassTable:getAwards2(id)
	return self:split2Cost(id, "awards2", "|#")
end

function ActivityBlindBoxBattlePassTable:getAwards3(id)
	return self:split2Cost(id, "awards3", "|#")
end

function ActivityBlindBoxBattlePassTable:getGiftBag1Award1()
	local awardsMerge = {}

	for i, id in pairs(self.ids_) do
		local temp = self:getAwards2(id)

		for j, award in pairs(temp) do
			if not awardsMerge[award[1]] then
				awardsMerge[award[1]] = award[2]
			else
				awardsMerge[award[1]] = awardsMerge[award[1]] + award[2]
			end
		end
	end

	local result = {}

	for index, num in pairs(awardsMerge) do
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

function ActivityBlindBoxBattlePassTable:getGiftBag2Award1()
	local awardsMerge = {}

	for i, id in pairs(self.ids_) do
		local temp = self:getAwards3(id)

		for j, award in pairs(temp) do
			if not awardsMerge[award[1]] then
				awardsMerge[award[1]] = award[2]
			else
				awardsMerge[award[1]] = awardsMerge[award[1]] + award[2]
			end
		end
	end

	local result = {}

	for index, num in pairs(awardsMerge) do
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

return ActivityBlindBoxBattlePassTable
