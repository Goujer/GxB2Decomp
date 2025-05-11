-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmBuildingTextTable.lua

local ActivitySpfarmBuildingTextTable = class("ActivitySpfarmBuildingTextTable", import("app.common.tables.BaseTable"))

function ActivitySpfarmBuildingTextTable:ctor()
	ActivitySpfarmBuildingTextTable.super.ctor(self, "activity_spfarm_building_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySpfarmBuildingTextTable:getIDs()
	return self.ids_
end

function ActivitySpfarmBuildingTextTable:getName(id)
	return self:getString(id, "name")
end

return ActivitySpfarmBuildingTextTable
