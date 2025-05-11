-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionEraTaskTable.lua

local ArcticExpeditionEraTaskTable = class("ArcticExpeditionEraTaskTable", import(".BaseTable"))

function ArcticExpeditionEraTaskTable:ctor()
	ArcticExpeditionEraTaskTable.super.ctor(self, "activity_ept_era_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ArcticExpeditionEraTaskTable:getIDs()
	return self.ids_
end

function ArcticExpeditionEraTaskTable:getEraID(id)
	return self:getNumber(id, "era_id")
end

function ArcticExpeditionEraTaskTable:getLimitTime(id)
	return self:getNumber(id, "limit")
end

function ArcticExpeditionEraTaskTable:getScore(id)
	return self:getNumber(id, "score")
end

function ArcticExpeditionEraTaskTable:getCompleteValue(id)
	return self:getNumber(id, "complete")
end

function ArcticExpeditionEraTaskTable:getIDsByEraID(era_id)
	local ids = {}

	for _, id in ipairs(self.ids_) do
		if self:getEraID(id) == era_id then
			table.insert(ids, id)
		end
	end

	table.sort(ids, function(a, b)
		local limitA = self:getLimitTime(a)
		local limitB = self:getLimitTime(b)

		if limitA > 1 and limitB == 1 then
			return true
		else
			return false
		end
	end)

	return ids
end

function ArcticExpeditionEraTaskTable:getTotalComVal(era_id)
	local ids = self:getIDsByEraID(era_id)
	local totalScore = 0

	for _, id in ipairs(ids) do
		local score = self:getScore(id)
		local limitTime = self:getLimitTime(id)

		totalScore = score * limitTime + totalScore
	end

	if era_id - 1 > 0 then
		local ids2 = self:getIDsByEraID(era_id - 1)

		for _, id in ipairs(ids2) do
			local score = self:getScore(id)
			local limitTime = self:getLimitTime(id)

			totalScore = -score * limitTime + totalScore
		end
	end

	if era_id - 2 > 0 then
		local ids3 = self:getIDsByEraID(era_id - 2)

		for _, id in ipairs(ids3) do
			local score = self:getScore(id)
			local limitTime = self:getLimitTime(id)

			totalScore = -score * limitTime + totalScore
		end
	end

	return totalScore
end

function ArcticExpeditionEraTaskTable:getDesc(id)
	local completeValue = self:getCompleteValue(id)
	local desc = xyd.tables.arcticExpeditionEraTaskTextTable:getDesc(id, completeValue)

	return desc
end

return ArcticExpeditionEraTaskTable
