-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/BattlePassMissionTextTable.lua

local BattlePassMissionTextTable = class("MissionTextTable", import("app.common.tables.BaseTable"))

function BattlePassMissionTextTable:ctor()
	BattlePassMissionTextTable.super.ctor(self, "battlepass_mission_text_" .. tostring(xyd.Global.lang))
end

function BattlePassMissionTextTable:getDesc(id)
	return self:getString(id, "mission_des")
end

return BattlePassMissionTextTable
