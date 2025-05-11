-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEaster2022MissionTextTable.lua

local ActivityEaster2022MissionTextTable = class("ActivityEaster2022MissionTextTable", import("app.common.tables.BaseTable"))

function ActivityEaster2022MissionTextTable:ctor()
	ActivityEaster2022MissionTextTable.super.ctor(self, "activity_easter2022_mission_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityEaster2022MissionTextTable:getIDs()
	return self.ids_
end

function ActivityEaster2022MissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityEaster2022MissionTextTable
