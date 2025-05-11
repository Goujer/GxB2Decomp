-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJigsawAwardTable.lua

local ActivityJigsawAwardTable = class("ActivityJigsawAwardTable", import("app.common.tables.BaseTable"))

function ActivityJigsawAwardTable:ctor()
	ActivityJigsawAwardTable.super.ctor(self, "activity_jigsaw_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityJigsawAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityJigsawAwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityJigsawAwardTable:getIds()
	return self.ids_
end

function ActivityJigsawAwardTable:getAwardAarray()
	if self.awards == nil then
		self.awards = {}

		for i = 1, #self.ids_ do
			local id = self.ids_[i]

			self.awards[self:getComplete(id)] = self:getAwards(id)
		end
	end

	return self.awards
end

return ActivityJigsawAwardTable
