-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStudyAwardTable.lua

local ActivityStudyAwardTable = class("ActivityStudyAwardTable", import("app.common.tables.BaseTable"))

function ActivityStudyAwardTable:ctor()
	ActivityStudyAwardTable.super.ctor(self, "activity_study_award")

	self.ids = {}
	self.idsToAward = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))

		local needList = self:getNeedQue(tonumber(id))

		for _, queid in ipairs(needList) do
			if not self.idsToAward[tonumber(queid)] then
				self.idsToAward[tonumber(queid)] = {}
			end

			table.insert(self.idsToAward[tonumber(queid)], tonumber(id))
		end
	end

	table.sort(self.ids)
end

function ActivityStudyAwardTable:getIds()
	return self.ids
end

function ActivityStudyAwardTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityStudyAwardTable:getNeedQue(id)
	local queList = self:split2Cost(id, "quest", "|")

	return queList
end

function ActivityStudyAwardTable:getAwardIDSlotID(slotID)
	return self.idsToAward[slotID]
end

return ActivityStudyAwardTable
