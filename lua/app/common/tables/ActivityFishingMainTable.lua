-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFishingMainTable.lua

local ActivityFishingMainTable = class("ActivityFishingMainTable", import("app.common.tables.BaseTable"))

function ActivityFishingMainTable:ctor()
	ActivityFishingMainTable.super.ctor(self, "activity_fish_main")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFishingMainTable:getIDs()
	return self.ids_
end

function ActivityFishingMainTable:getPic(id)
	return self:getString(id, "pic")
end

function ActivityFishingMainTable:getName(id)
	return self:getString(id, "name")
end

function ActivityFishingMainTable:getEffect(id)
	return self:getString(id, "effect")
end

function ActivityFishingMainTable:getAwards(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityFishingMainTable:getLength(id)
	return self:split2Cost(id, "length", "|")
end

function ActivityFishingMainTable:getRange1(id)
	return self:split2Cost(id, "range1", "|#")
end

function ActivityFishingMainTable:getRange2(id)
	return self:split2Cost(id, "range2", "|#")
end

function ActivityFishingMainTable:split2Cost(rowKey, colKey, delimiter, toNumber)
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
		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "#")
		local cost = {}

		for i = 1, #sp do
			cost[i] = xyd.split(sp[i], "|", toNumber)
		end

		return cost
	end

	if delimiter == "@|#" then
		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "@")
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

return ActivityFishingMainTable
