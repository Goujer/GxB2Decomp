-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityOldBuildingTable.lua

local ActivityOldBuildingTable = class("ActivityOldBuildingTable", import("app.common.tables.BaseTable"))

function ActivityOldBuildingTable:ctor()
	ActivityOldBuildingTable.super.ctor(self, "activity_old_building")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityOldBuildingTable:getIDs()
	return self.ids_
end

function ActivityOldBuildingTable:getArea(id)
	return self:getNumber(id, "area")
end

function ActivityOldBuildingTable:getStage(id)
	return self:split2Cost(id, "stage", "|")
end

function ActivityOldBuildingTable:getAwards(id)
	return self:split2Cost(id, "awards", "@|#")
end

function ActivityOldBuildingTable:split2Cost(rowKey, colKey, delimiter, toNumber)
	rowKey = tostring(rowKey)

	if toNumber == nil then
		toNumber = true
	end

	local colIndex = self.TableLua.keys[colKey]

	if self.TableLua.rows[rowKey] == nil then
		return nil
	end

	if delimiter == "#" or delimiter == "|" then
		return xyd.split(self.TableLua.rows[rowKey][colIndex], delimiter, true)
	end

	if delimiter == "|#" then
		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "|")
		local cost = {}

		for i = 1, #sp do
			cost[i] = xyd.split(sp[i], "#", toNumber)
		end

		return cost
	end

	if delimiter == "@|#" then
		local sp = xyd.split(self.TableLua.rows[rowKey][colIndex], "@")
		local cost = {}

		for i = 1, #sp do
			cost[i] = xyd.split(sp[i], "|")

			for j in pairs(cost[i]) do
				cost[i][j] = xyd.split(sp[i], "#", tonumber)
			end
		end

		return cost
	end
end

return ActivityOldBuildingTable
