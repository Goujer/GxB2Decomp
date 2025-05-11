-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/SkillResonateEffectTable.lua

local SkillResonateEffectTable = class("SkillResonateEffectTable", import("app.common.tables.BaseTable"))

function SkillResonateEffectTable:ctor()
	SkillResonateEffectTable.super.ctor(self, "skill_resonate_effect")

	self.ids_ = {}
	self.prs_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, tonumber(id))

		local prTableId = self:getPrTableId(id)

		if not self.prs_[prTableId] then
			self.prs_[prTableId] = {}
		end

		table.insert(self.prs_[prTableId], {
			lev = self:getLevel(id),
			effect = self:getEffect(id),
			effect_show = self:getEffectShow(id),
			id = tonumber(id)
		})
	end

	for k, v in pairs(self.prs_) do
		table.sort(v, function(a, b)
			return a.lev < b.lev
		end)
	end

	table.sort(self.ids_)
end

function SkillResonateEffectTable:getEffect(id)
	return self:split2Cost(id, "effect", "|#", false)
end

function SkillResonateEffectTable:getEffectShow(id)
	return self:split2Cost(id, "effect_show", "#", false)
end

function SkillResonateEffectTable:getPrTableId(id)
	return self:getNumber(id, "pr_table_id")
end

function SkillResonateEffectTable:getLevel(id)
	return self:getNumber(id, "level")
end

function SkillResonateEffectTable:getEffectByLevel(tableId, lev)
	local result = {}

	if lev <= 0 or not self.prs_[tableId] then
		return result
	end

	for i = #self.prs_[tableId], 1, -1 do
		if lev >= self.prs_[tableId][i].lev then
			result = self.prs_[tableId][i].effect

			break
		end
	end

	return result
end

function SkillResonateEffectTable:getEffectInfo(tableId, lev)
	local result = {}

	for i = #self.prs_[tableId], 1, -1 do
		if lev >= self.prs_[tableId][i].lev then
			result = self.prs_[tableId][i]

			break
		end
	end

	return result
end

function SkillResonateEffectTable:getNextEffectInfo(tableId, lev)
	local result = {}

	for i = #self.prs_[tableId], 1, -1 do
		if lev == self.prs_[tableId][i].lev - 1 then
			result = self.prs_[tableId][i]

			break
		end
	end

	return result
end

return SkillResonateEffectTable
