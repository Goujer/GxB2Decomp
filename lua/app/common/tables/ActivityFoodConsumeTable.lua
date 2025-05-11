-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFoodConsumeTable.lua

local ActivityFoodConsumeTable = class("ActivityFoodConsumeTable", import("app.common.tables.BaseTable"))

function ActivityFoodConsumeTable:ctor()
	ActivityFoodConsumeTable.super.ctor(self, "activity_food_consume")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFoodConsumeTable:getIDs()
	return self.ids_
end

function ActivityFoodConsumeTable:getIDsByType(type)
	if not self.idsByType_ then
		self.idsByType_ = {}

		for _, id in ipairs(self.ids_) do
			local type1 = self:getType(tonumber(id))

			if not self.idsByType_[type1] then
				self.idsByType_[type1] = {}
			end

			table.insert(self.idsByType_[type1], tonumber(id))
		end
	end

	return self.idsByType_[type]
end

function ActivityFoodConsumeTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityFoodConsumeTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function ActivityFoodConsumeTable:getAward(id)
	return self:split2Cost(id, "award", "|#", true)
end

function ActivityFoodConsumeTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivityFoodConsumeTable
