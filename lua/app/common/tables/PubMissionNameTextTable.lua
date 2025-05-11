-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PubMissionNameTextTable.lua

local PubMissionNameTextTable = class("PubMissionNameTextTable", import("app.common.tables.BaseTable"))

function PubMissionNameTextTable:ctor()
	PubMissionNameTextTable.super.ctor(self, "pub_mission_name_text_" .. tostring(xyd.Global.lang))
end

function PubMissionNameTextTable:getName(id)
	return self:getString(id, "mission_name")
end

return PubMissionNameTextTable
