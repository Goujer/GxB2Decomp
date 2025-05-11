-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineDifficultyTable.lua

local ShrineDifficultyTable = class("ShrineDifficultyTable", import("app.common.tables.BaseTable"))

function ShrineDifficultyTable:ctor()
	ShrineDifficultyTable.super.ctor(self, "shrine_difficulty")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ShrineDifficultyTable:getIDs()
	return self.ids_
end

function ShrineDifficultyTable:getScoreRatio(id)
	return self:getNumber(id, "score_ratio") or 1
end

function ShrineDifficultyTable:getBuffsById(id)
	local result = {}

	for k, v in pairs(self.TableLua.keys) do
		if k ~= "score_ratio" and k ~= "id" then
			result[k] = self:getNumber(id, k)
		end
	end

	return result
end

return ShrineDifficultyTable
