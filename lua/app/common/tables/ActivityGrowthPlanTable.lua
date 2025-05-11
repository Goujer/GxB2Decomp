-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGrowthPlanTable.lua

local ActivityGrowthPlanTable = class("ActivityGrowthPlanTable", import("app.common.tables.BaseTable"))

function ActivityGrowthPlanTable:ctor()
	ActivityGrowthPlanTable.super.ctor(self, "activity_growth_plan")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityGrowthPlanTable:getIDs()
	return self.ids_
end

function ActivityGrowthPlanTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityGrowthPlanTable:getPartnerIDs()
	return self:split2Cost(1, "partner_id", "|")
end

function ActivityGrowthPlanTable:getFreeAward(id, partnerIndex)
	local allAwards = {}
	local stableAwards = self:getStableFreeAward(id)
	local unknownAwards = self:getUnknownFreeAward(id)[partnerIndex]

	if stableAwards then
		for i = 1, #stableAwards do
			table.insert(allAwards, stableAwards[i])
		end
	end

	local partnerNum = #xyd.tables.miscTable:split2Cost("activity_growth_plan_partner", "value", "|")

	if unknownAwards then
		for i = 1, #unknownAwards do
			table.insert(allAwards, unknownAwards[i])
		end
	end

	return allAwards
end

function ActivityGrowthPlanTable:getStableFreeAward(id)
	return self:split2Cost(id, "free_award", "|#")
end

function ActivityGrowthPlanTable:getUnknownFreeAward(id)
	return self:split2Cost(id, "sp_free_award", "&|#")
end

function ActivityGrowthPlanTable:getPaidAward(id, partnerIndex)
	local allAwards = {}
	local stableAwards = self:getStablePaidAward(id)
	local unknownAwards = self:getUnknownPaidAward(id)[partnerIndex]

	if stableAwards then
		for i = 1, #stableAwards do
			table.insert(allAwards, stableAwards[i])
		end
	end

	local partnerNum = #xyd.tables.miscTable:split2Cost("activity_growth_plan_partner", "value", "|")

	if unknownAwards then
		for i = 1, #unknownAwards do
			table.insert(allAwards, unknownAwards[i])
		end
	end

	return allAwards
end

function ActivityGrowthPlanTable:getStablePaidAward(id)
	return self:split2Cost(id, "paid_award", "|#")
end

function ActivityGrowthPlanTable:getUnknownPaidAward(id)
	return self:split2Cost(id, "sp_paid_award", "&|#")
end

function ActivityGrowthPlanTable:getLightShow(id)
	return self:split2Cost(id, "light_show", "|")
end

function ActivityGrowthPlanTable:getTotalPoint()
	return self:getPoint(self.ids_[#self.ids_])
end

function ActivityGrowthPlanTable:split2Cost(rowKey, colKey, delimiter, toNumber)
	rowKey = tostring(rowKey)

	if toNumber == nil then
		toNumber = true
	end

	local colIndex = self.TableLua.keys[colKey]

	if self.TableLua.rows[rowKey] == nil then
		return nil
	end

	if delimiter == "#" or delimiter == "|" then
		return xyd.split(self.TableLua.rows[rowKey][colIndex], delimiter, toNumber)
	end

	if delimiter == "|#" then
		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "|")
		local cost = {}

		for i = 1, #sp do
			cost[i] = xyd.split(sp[i], "#", toNumber)
		end

		return cost
	end

	if delimiter == "&#" then
		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "&")
		local cost = {}

		for i = 1, #sp do
			cost[i] = xyd.split(sp[i], "#", toNumber)
		end

		return cost
	end

	if delimiter == "&|#" then
		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "&")
		local tmp = {}
		local cost = {}

		for i = 1, #sp do
			cost[i] = {}
			tmp = xyd.split(sp[i], "|")

			for j = 1, #tmp do
				cost[i][j] = xyd.split(tmp[j], "#", toNumber)
			end
		end

		return cost
	end
end

return ActivityGrowthPlanTable
