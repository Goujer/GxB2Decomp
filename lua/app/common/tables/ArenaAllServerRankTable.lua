-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaAllServerRankTable.lua

local ArenaAllServerRankTable = class("ArenaAllServerRankTable", import("app.common.tables.BaseTable"))

function ArenaAllServerRankTable:ctor()
	ArenaAllServerRankTable.super.ctor(self, "arena_all_server_rank")

	self.ids_ = {}
	self.ids_sort_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
		table.insert(self.ids_sort_, tonumber(id))
	end

	table.sort(self.ids_)
	table.sort(self.ids_sort_, function(a, b)
		return b < a
	end)
end

function ArenaAllServerRankTable:getIDs()
	return self.ids_
end

function ArenaAllServerRankTable:getIdsSort()
	return self.ids_sort_
end

function ArenaAllServerRankTable:getLevel(id)
	return self:getNumber(id, "level")
end

function ArenaAllServerRankTable:getLevelNum(id)
	return self:getString(id, "level_num")
end

function ArenaAllServerRankTable:getFrontNum(id)
	return self:getNumber(id, "front_num") or 0
end

function ArenaAllServerRankTable:getBackNum(id)
	return self:getNumber(id, "back_num") or 0
end

function ArenaAllServerRankTable:getPoint(id)
	return self:getNumber(id, "point") or 0
end

function ArenaAllServerRankTable:getPetNum(id)
	return self:getNumber(id, "pet_num")
end

function ArenaAllServerRankTable:getHideNum(id)
	return self:getNumber(id, "hide_num")
end

function ArenaAllServerRankTable:getSubsitNum(id)
	local frontNum = self:getFrontNum(id)

	return frontNum / 2
end

function ArenaAllServerRankTable:getInheritPoint(id)
	return self:getNumber(id, "inherit_point")
end

function ArenaAllServerRankTable:getSeasonAwards(id)
	return self:split2Cost(id, "season_awards", "|#")
end

function ArenaAllServerRankTable:getRankType(score, rank)
	local rankType = 1
	local rankLevel = self:getRankLevel(score, rank)

	rankType = self:getLevel(rankLevel) or 1

	return rankType
end

function ArenaAllServerRankTable:getRankLevel(score, rank)
	score = score or 0

	if score >= self:getPoint(self.ids_[#self.ids_]) then
		if not rank or rank and tonumber(rank) > 320 then
			return self.ids_[#self.ids_ - 1]
		else
			return self.ids_[#self.ids_]
		end
	end

	for i = 1, #self.ids_ do
		local id = self.ids_[i]

		if score < self:getPoint(id) then
			return id - 1
		end
	end

	return self.ids_[#self.ids_]
end

return ArenaAllServerRankTable
