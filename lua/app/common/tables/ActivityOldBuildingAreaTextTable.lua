-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityOldBuildingAreaTextTable.lua

local ActivityOldBuildingAreaTextTable = class("ActivityOldBuildingAreaTextTable", import("app.common.tables.BaseTable"))

function ActivityOldBuildingAreaTextTable:ctor()
	ActivityOldBuildingAreaTextTable.super.ctor(self, "activity_old_building_area_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityOldBuildingAreaTextTable:getIDs()
	return self.ids_
end

function ActivityOldBuildingAreaTextTable:getName(id)
	return self:getString(id, "name")
end

return ActivityOldBuildingAreaTextTable
