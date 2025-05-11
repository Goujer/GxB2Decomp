-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/TrialTable.lua

local TrialTable = class("TrialTable", import("app.common.tables.BaseTable"))

function TrialTable:ctor()
	TrialTable.super.ctor(self, "trial")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function TrialTable:getIDs()
	return self.ids_
end

function TrialTable:getMaxLevel(id)
	return self:getNumber(id, "lv_max")
end

function TrialTable:getMinLevel(id)
	return self:getNumber(id, "lv_min")
end

function TrialTable:getAward(level, stage_id)
	for _, id in ipairs(self.ids_) do
		local min = self:getMinLevel(id)
		local max = self:getMaxLevel(id)

		if min <= level and level <= max then
			return self:split2Cost(id, "awards_" .. stage_id, "|#")
		end
	end
end

return TrialTable
