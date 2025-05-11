-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityChimeMissionTextTable.lua

local ActivityChimeMissionTextTable = class("ActivityChimeMissionTextTable", import("app.common.tables.BaseTable"))

function ActivityChimeMissionTextTable:ctor()
	ActivityChimeMissionTextTable.super.ctor(self, "activity_chime_mission_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityChimeMissionTextTable:getIDs()
	return self.ids_
end

function ActivityChimeMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ActivityChimeMissionTextTable
