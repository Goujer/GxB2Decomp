-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPromotionTestTable.lua

local ActivityPromotionTestTable = class("ActivityPromotionTestTable", import("app.common.tables.BaseTable"))

function ActivityPromotionTestTable:ctor()
	ActivityPromotionTestTable.super.ctor(self, "activity_promotion_test")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityPromotionTestTable:getIDs()
	return self.ids_
end

function ActivityPromotionTestTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityPromotionTestTable:getFreeAwards(id)
	return self:split2Cost(id, "free_awards", "#")
end

function ActivityPromotionTestTable:getExtraAwards(id)
	return self:split2Cost(id, "extra_awards", "#")
end

function ActivityPromotionTestTable:getCondition(id)
	return self:split2Cost(id, "condition", "#")
end

return ActivityPromotionTestTable
