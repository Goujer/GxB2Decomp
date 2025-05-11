-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJackpotGambleTable.lua

local ActivityJackpotGambleTable = class("ActivityJackpotGambleTable", import("app.common.tables.BaseTable"))

function ActivityJackpotGambleTable:ctor()
	ActivityJackpotGambleTable.super.ctor(self, "activity_jackpot_gamble")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityJackpotGambleTable:getIDs()
	return self.ids_
end

function ActivityJackpotGambleTable:getByType(type)
	if not self.ids_by_type then
		self.ids_by_type = {}

		for _, id in pairs(self.ids_) do
			if not self.ids_by_type[self:getType(id)] then
				self.ids_by_type[self:getType(id)] = {}
			end

			table.insert(self.ids_by_type[self:getType(id)], id)
		end

		for i, _ in pairs(self.ids_by_type) do
			table.sort(self.ids_by_type[i])
		end
	end

	return self.ids_by_type[type]
end

function ActivityJackpotGambleTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityJackpotGambleTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityJackpotGambleTable:getNum(id)
	return self:getNumber(id, "num")
end

return ActivityJackpotGambleTable
