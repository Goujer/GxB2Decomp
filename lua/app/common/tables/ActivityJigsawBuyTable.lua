-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityJigsawBuyTable.lua

local ActivityJigsawBuyTable = class("ActivityJigsawBuyTable", import("app.common.tables.BaseTable"))

function ActivityJigsawBuyTable:ctor()
	ActivityJigsawBuyTable.super.ctor(self, "activity_jigsaw_buy")

	self.ids_ = {}
	self.preSum_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	local ma = 0

	table.sort(self.ids_)

	for i = 1, #self.ids_ do
		local id = self.ids_[i]
		local data = self:getCost(id)

		self.preSum_[id] = data[2]
		ma = math.max(id, ma)
	end

	for j = 2, ma do
		self.preSum_[j] = self.preSum_[j] + self.preSum_[j - 1]
	end
end

function ActivityJigsawBuyTable:getItem(id)
	return self:split2Cost(id, "item", "#")
end

function ActivityJigsawBuyTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityJigsawBuyTable:getPresum(id)
	return self.preSum_[id] or 0
end

return ActivityJigsawBuyTable
