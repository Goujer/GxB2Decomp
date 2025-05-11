-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildBossTable.lua

local GuildBossTable = class("GuildBossTable", import("app.common.tables.BaseTable"))

function GuildBossTable:ctor()
	GuildBossTable.super.ctor(self, "guild_boss")

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

function GuildBossTable:getData(id)
	return self.datas_[id]
end

function GuildBossTable:getShow(id)
	return self:getString(id, "show")
end

function GuildBossTable:getPower(id)
	return self:getNumber(id, "power")
end

function GuildBossTable:getGuildExp(id)
	return self:getNumber(id, "guild_exp")
end

function GuildBossTable:getLv(id)
	return self:getNumber(id, "lv")
end

function GuildBossTable:getMaxID()
	return self.maxID_ - 1
end

function GuildBossTable:getTotalHp(id)
	return self:getNumber(id, "hp")
end

function GuildBossTable:getBattleID(id)
	return self:getNumber(id, "battle_id")
end

function GuildBossTable:getBattleAwards(id)
	return self:split2Cost(id, "battle_awards", "|#")
end

function GuildBossTable:getKillAwards(id, name)
	return self:split2Cost(id, name, "|#")
end

return GuildBossTable
