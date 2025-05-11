-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SkillBuffTextTable.lua

local SkillBuffTextTable = class("SkillBuffTextTable", import("app.common.tables.BaseTable"))

function SkillBuffTextTable:ctor()
	SkillBuffTextTable.super.ctor(self, "skill_buff_text_" .. tostring(xyd.Global.lang))
	self:initData()
end

function SkillBuffTextTable:initData()
	self.plusBuffs = {}
	self.minusBuffs = {}

	for id, _ in pairs(self.TableLua.rows) do
		local idNum = tonumber(id)
		local needTable = self.plusBuffs

		if self:getPlusMinus(idNum) == 2 then
			needTable = self.minusBuffs
		end

		local buffs = self:getBuffId(id)

		for k, v in ipairs(buffs) do
			needTable[v] = idNum
		end
	end
end

function SkillBuffTextTable:getDetailByBuff(buff, value)
	local needTable = self.plusBuffs
	local value_ = tonumber(value)

	if value_ and value_ < 0 and self.minusBuffs[buff] then
		needTable = self.minusBuffs
	end

	if not needTable[buff] then
		return {}
	end

	return {
		name = self:getName(needTable[buff]),
		desc = self:getSec(needTable[buff])
	}
end

function SkillBuffTextTable:getBuffId(id)
	return xyd.split(self:getString(id, "buff_id"), "|")
end

function SkillBuffTextTable:getPlusMinus(id)
	return self:getNumber(id, "plus_minus")
end

function SkillBuffTextTable:getName(id)
	return self:getString(id, "name")
end

function SkillBuffTextTable:getSec(id)
	return self:getString(id, "sec")
end

return SkillBuffTextTable
