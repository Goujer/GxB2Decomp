-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStarAltarMissionTextTable.lua

local ActivityStarAltarMissionTextTable = class("ActivityStarAltarMissionTextTable", import("app.common.tables.BaseTable"))

function ActivityStarAltarMissionTextTable:ctor()
	ActivityStarAltarMissionTextTable.super.ctor(self, "activity_star_altar_mission_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityStarAltarMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityStarAltarMissionTextTable
