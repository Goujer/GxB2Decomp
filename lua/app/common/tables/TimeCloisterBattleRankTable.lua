-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TimeCloisterBattleRankTable.lua

local TimeCloisterBattleRankTable = class("TimeCloisterBattleRankTable", import("app.common.tables.BaseTable"))

function TimeCloisterBattleRankTable:ctor()
	TimeCloisterBattleRankTable.super.ctor(self, "time_cloister_battle_rank")

	self.ids_ = {}
	self.groupIds_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local group = self:getGroup(id)

		if not self.groupIds_[tostring(group)] then
			self.groupIds_[tostring(group)] = {}
		end

		table.insert(self.groupIds_[tostring(group)], tonumber(id))
	end

	table.sort(self.ids_)

	for i in pairs(self.groupIds_) do
		table.sort(self.groupIds_[tostring(i)])
	end
end

function TimeCloisterBattleRankTable:getIDs()
	return self.ids_
end

function TimeCloisterBattleRankTable:getIDsWithGroup(group)
	return self.groupIds_[tostring(group)]
end

function TimeCloisterBattleRankTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function TimeCloisterBattleRankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function TimeCloisterBattleRankTable:getIsPercentage(id)
	return self:getNumber(id, "is_percentage") or 0
end

function TimeCloisterBattleRankTable:getRankFront(id)
	return self:getString(id, "rank_front")
end

function TimeCloisterBattleRankTable:getRankId(self_rank, num, group)
	local ids = self.groupIds_[tostring(group)]

	for _, id in ipairs(ids) do
		local is_per = self:getIsPercentage(id)
		local rank = self:getRank(id)

		if is_per == 0 and self_rank <= rank or is_per == 1 and self_rank / num <= rank / 100 then
			return id
		end
	end
end

function TimeCloisterBattleRankTable:getGroup(id)
	return self:getNumber(id, "group")
end

function TimeCloisterBattleRankTable:getRankSelfShowStr(self_rank, num, group)
	local ids = self.groupIds_[tostring(group)]

	for _, id in ipairs(ids) do
		local is_per = self:getIsPercentage(id)
		local rank = self:getRank(id)

		if is_per == 0 and self_rank <= rank then
			return self_rank
		elseif is_per == 1 and self_rank / num <= rank / 100 then
			return self:getRankFront(id)
		end
	end
end

return TimeCloisterBattleRankTable
