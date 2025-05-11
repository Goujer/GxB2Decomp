-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GovenTeamTextTable.lua

local GovernTeamTextTable = class("GovernTeamTextTable", import("app.common.tables.BaseTable"))

function GovernTeamTextTable:ctor()
	GovernTeamTextTable.super.ctor(self, "govern_team_text_" .. tostring(xyd.Global.lang))
end

function GovernTeamTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GovernTeamTextTable
