-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/OldBuildingATable.lua

local OldBuildingATable = class("OldBuildingATable", import("app.common.tables.BaseTable"))

function OldBuildingATable:ctor()
	OldBuildingATable.super.ctor(self, "old_building_a")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function OldBuildingATable:getIDs()
	return self.ids_
end

function OldBuildingATable:getStage(id)
	return self:split2Cost(id, "stage", "|")
end

function OldBuildingATable:getAwards(id)
	return self:split2Cost(id, "awards", "@|#")
end

function OldBuildingATable:split2Cost(rowKey, colKey, delimiter, toNumber)
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

return OldBuildingATable
