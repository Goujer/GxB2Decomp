-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildBossRankTable.lua

local GuildBossRankTable = class("GuildBossRankTable", import("app.common.tables.BaseTable"))

function GuildBossRankTable:ctor()
	GuildBossRankTable.super.ctor(self, "guild_boss_rank")

	self.datas_ = {}
	self.maxID_ = 0

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		self.datas_[id] = {}

		for key, _ in pairs(colIndexTable) do
			self.datas_[id][key] = row[colIndexTable[key]]
		end

		self.maxID_ = self.maxID_ + 1
	end
end

function GuildBossRankTable:getData(id)
	return self.datas_[id]
end

function GuildBossRankTable:getName(id)
	return self:getString(id, "name")
end

function GuildBossRankTable:getNameByRank(rank)
	local id = 1

	while id <= self.maxID_ do
		if rank <= self:getRank(id) then
			return self:getName(id)
		end

		id = id + 1
	end
end

function GuildBossRankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function GuildBossRankTable:getMaxID()
	return self.maxID_
end

function GuildBossRankTable:getShow(id)
	return self:getString(id, "show")
end

function GuildBossRankTable:getShowByRank(rank)
	for id = 1, self.maxID_ do
		if rank <= self:getRank(id) then
			return self:getShow(id)
		end
	end
end

return GuildBossRankTable
