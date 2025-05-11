-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/MissionTextTable.lua

local MissionTextTable = class("MissionTextTable", import("app.common.tables.BaseTable"))

function MissionTextTable:ctor()
	MissionTextTable.super.ctor(self, "daily_mission_text_" .. tostring(xyd.Global.lang))
end

function MissionTextTable:getDesc(id)
	return self:getString(id, "mission_des")
end

return MissionTextTable
