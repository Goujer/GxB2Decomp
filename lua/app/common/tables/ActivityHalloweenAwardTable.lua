-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHalloweenAwardTable.lua

local BaseTable = import("app.common.tables.BaseTable")
local ActivityHalloweenAwardTable = class("ActivityHalloweenAwardTable", BaseTable)

function ActivityHalloweenAwardTable:ctor()
	BaseTable.ctor(self, "activity_halloween_award")

	self.ids_ = {}
	self.commonAwardIds_ = {}
	self.finalAwardIds_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)

	for i in pairs(self.ids_) do
		local timeVlue = self:getNumber(self.ids_[i], "times")

		if timeVlue and timeVlue >= 1 then
			table.insert(self.finalAwardIds_, self.ids_[i])
		else
			table.insert(self.commonAwardIds_, self.ids_[i])
		end
	end
end

function ActivityHalloweenAwardTable:getIDs()
	return self.ids_
end

function ActivityHalloweenAwardTable:commonAwardIds()
	return self.commonAwardIds_
end

function ActivityHalloweenAwardTable:finalAwardIds()
	return self.finalAwardIds_
end

function ActivityHalloweenAwardTable:getAwards(id)
	return self:split2Cost(id, "award", "|#", true)
end

function ActivityHalloweenAwardTable:getWeight(id)
	return self:split2Cost(id, "weight", "|", true)
end

return ActivityHalloweenAwardTable
