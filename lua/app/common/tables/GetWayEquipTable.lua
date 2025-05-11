-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GetWayEquipTable.lua

local GetWayEquipTable = class("GetWayEquipTable", import("app.common.tables.BaseTable"))

function GetWayEquipTable:ctor()
	GetWayEquipTable.super.ctor(self, "getway_equip")

	self.items_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]
		local equipID = row[colIndexTable.equip_id]
		local stageID = row[colIndexTable.stage_id]

		self.items_[equipID] = self.items_[equipID] or {}

		table.insert(self.items_[equipID], stageID)
	end
end

function GetWayEquipTable:getStagesByEuqipID(id, lev)
	local items = self.items_[id] or {}

	table.sort(items, function(a, b)
		return b < a
	end)

	local tmpItems = {}

	for i = 1, #items do
		local stageID = items[i]

		if lev >= xyd.tables.stageTable:getLv(stageID) then
			table.insert(tmpItems, stageID)
		end

		if #tmpItems >= 3 then
			break
		end
	end

	if #items >= 3 and #tmpItems < 3 then
		for i = #tmpItems + 1, 3 do
			table.insert(tmpItems, items[i])
		end
	end

	self:reverse(tmpItems)

	return tmpItems
end

return GetWayEquipTable
