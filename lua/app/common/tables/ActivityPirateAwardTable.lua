-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPirateAwardTable.lua

local ActivityPirateAwardTable = class("ActivityPirateAwardTable", import("app.common.tables.BaseTable"))

function ActivityPirateAwardTable:ctor()
	ActivityPirateAwardTable.super.ctor(self, "activity_pirate_awards")

	self.ids_ = {}
	self.idsByUnlockValue_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local unlockValue = self:getUnlock(id)

		if not self.idsByUnlockValue_[unlockValue] then
			self.idsByUnlockValue_[unlockValue] = {}
		end

		table.insert(self.idsByUnlockValue_[unlockValue], tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityPirateAwardTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivityPirateAwardTable:getAward(id)
	return self:split2num(id, "awards", "#")
end

function ActivityPirateAwardTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityPirateAwardTable:getUnlock(id)
	return self:getNumber(id, "unlock")
end

function ActivityPirateAwardTable:getUnlockList()
	return self.idsByUnlockValue_
end

return ActivityPirateAwardTable
