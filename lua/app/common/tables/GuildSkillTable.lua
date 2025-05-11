-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildSkillTable.lua

local GuildSkillTable = class("GuildSkillTable", import("app.common.tables.BaseTable"))
local NO_JOB_ID = 6

function GuildSkillTable:ctor()
	GuildSkillTable.super.ctor(self, "guild_skill")

	self.baseEffectsArr = {}
	self.baseEffectsLittleArr = {}
	self.growEffectArr = {}
	self.growEffectLittleArr = {}
	self.buffsArr = {}
	self.jobs = {}

	local colIndexTable = self.TableLua.keys

	for id in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]
		local job = row[colIndexTable.job]

		self.jobs[job] = self.jobs[job] or {}

		table.insert(self.jobs[job], tonumber(id))
	end

	for i, j in pairs(self.jobs) do
		table.sort(self.jobs[i], function(a, b)
			return a < b
		end)
	end
end

function GuildSkillTable:getName(id)
	return xyd.tables.guildSkillTextTable:getName(id)
end

function GuildSkillTable:getLevMax(id)
	return self:getNumber(id, "lv_max")
end

function GuildSkillTable:getJob(id)
	return self:getNumber(id, "job")
end

function GuildSkillTable:getPreSkill(id)
	return self:split2num(id, "pre_skill", "|")
end

function GuildSkillTable:getNextSkill(id)
	return self:getNumber(id, "next_skill")
end

function GuildSkillTable:getLvReq(id)
	return self:split2num(id, "lv_req", "|")
end

function GuildSkillTable:getBaseGold(id)
	return self:split2num(id, "base_gold", "#")
end

function GuildSkillTable:getGrowGold(id)
	return self:getNumber(id, "grow_gold")
end

function GuildSkillTable:getBaseGuildCoin(id)
	return self:split2num(id, "base_guild_coin", "#")
end

function GuildSkillTable:getGrowGuildCoin(id)
	return self:getNumber(id, "grow_guild_coin")
end

function GuildSkillTable:getBaseEffect(id)
	if not self.baseEffectsArr[id] then
		self.baseEffectsArr[id] = self:split(id, "base_effect", "|")
	end

	return self.baseEffectsArr[id]
end

function GuildSkillTable:getGrowEffect(id)
	if not self.growEffectArr[id] then
		self.growEffectArr[id] = self:split(id, "grow_effect", "|")
	end

	return self.growEffectArr[id]
end

function GuildSkillTable:getIcon(id)
	return self:getString(id, "icon")
end

function GuildSkillTable:getJobSkills(type)
	return self.jobs[type] or {}
end

function GuildSkillTable:getSkillBuffs(id, lev)
	local baseEffects = self:getBaseEffect(id)
	local growEffects = self:getGrowEffect(id)

	if self.buffsArr[id .. "_" .. lev] then
		return xyd.cloneTable(self.buffsArr[id .. "_" .. lev])
	end

	local buffs = {}

	for i = 1, #baseEffects do
		if not self.baseEffectsLittleArr[id] then
			self.baseEffectsLittleArr[id] = {}
		end

		if not self.baseEffectsLittleArr[id][i] then
			self.baseEffectsLittleArr[id][i] = xyd.split(baseEffects[i], "#")
		end

		local base = self.baseEffectsLittleArr[id][i]

		if not self.growEffectLittleArr[id] then
			self.growEffectLittleArr[id] = {}
		end

		if not self.growEffectLittleArr[id][i] then
			self.growEffectLittleArr[id][i] = xyd.split(growEffects[i], "#")
		end

		local grow = self.growEffectLittleArr[id][i]
		local buffName = base[1]
		local num = tonumber(base[2]) + (lev - 1) * tonumber(grow[2])

		table.insert(buffs, {
			type = buffName,
			num = num
		})
	end

	self.buffsArr[id .. "_" .. lev] = buffs

	return buffs
end

function GuildSkillTable:getReset(id)
	return self:getNumber(id, "reset")
end

return GuildSkillTable
