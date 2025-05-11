-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityRepairConsoleAwardTable.lua

local ActivityRepairConsoleAwardTable = class("ActivityRepairConsoleAwardTable", import("app.common.tables.BaseTable"))

function ActivityRepairConsoleAwardTable:ctor()
	ActivityRepairConsoleAwardTable.super.ctor(self, "activity_repair_console_awards")

	self.ids_ = {}
	self.idsByType = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local type = self:getType(tonumber(id))

		if not self.idsByType[type] then
			self.idsByType[type] = {}
		end

		table.insert(self.idsByType[type], tonumber(id))
	end

	table.sort(self.ids_)

	for key, value in pairs(self.idsByType) do
		table.sort(value)
	end
end

function ActivityRepairConsoleAwardTable:getIDs()
	return self.ids_
end

function ActivityRepairConsoleAwardTable:getIDsByType(type)
	return self.idsByType[type]
end

function ActivityRepairConsoleAwardTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityRepairConsoleAwardTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityRepairConsoleAwardTable:getShowAwardType(id)
	return self:getNumber(id, "show_award_type")
end

function ActivityRepairConsoleAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

function ActivityRepairConsoleAwardTable:getTarget(id)
	return self:split2num(id, "target", "|")
end

function ActivityRepairConsoleAwardTable:getAwardsByRound(round)
	self.awards = {}

	for i, id in pairs(self.ids_) do
		if self:getType(id) == round then
			local award = self:getAwards(id)

			table.insert(self.awards, award)
		end
	end

	return self.awards
end

function ActivityRepairConsoleAwardTable:getAwardsByRound(round)
	self.awards = {}

	for i, id in pairs(self.ids_) do
		if self:getType(id) == round then
			local award = self:getAwards(id)

			table.insert(self.awards, award)
		end
	end

	return self.awards
end

function ActivityRepairConsoleAwardTable:getShowViewInfos(needType)
	self.showViewArr = {}

	if needType == 1 then
		for i, id in pairs(self.ids_) do
			if self:getRank(id) == 11 then
				local award = self:getAwards(id)

				table.insert(self.showViewArr, award)
			end
		end
	end

	if needType == 2 then
		for i, id in pairs(self.ids_) do
			local type = self:getShowAwardType(id)

			if type ~= nil and self:getRank(id) < 11 then
				local award = self:getAwards(id)

				if not self.showViewArr[type] then
					self.showViewArr[type] = {}
				end

				table.insert(self.showViewArr[type], award)
			end
		end
	end

	dump(self.showViewArr)

	return self.showViewArr
end

return ActivityRepairConsoleAwardTable
