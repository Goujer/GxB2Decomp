-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityOldBuildingLouTextTable.lua

local ActivityOldBuildingLouTextTable = class("ActivityOldBuildingLouTextTable", import("app.common.tables.BaseTable"))

function ActivityOldBuildingLouTextTable:ctor()
	ActivityOldBuildingLouTextTable.super.ctor(self, "activity_old_building_lou_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end

	table.sort(self.ids_)
end

function ActivityOldBuildingLouTextTable:getIDs()
	return self.ids_
end

function ActivityOldBuildingLouTextTable:getName(id)
	return self:getString(id, "name")
end

return ActivityOldBuildingLouTextTable
