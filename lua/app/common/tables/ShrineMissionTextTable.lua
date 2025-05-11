-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineMissionTextTable.lua

local ShrineMissionTextTable = class("ShrineMissionTextTable", import("app.common.tables.BaseTable"))

function ShrineMissionTextTable:ctor()
	ShrineMissionTextTable.super.ctor(self, "shrine_mission_text_" .. tostring(xyd.Global.lang))
end

function ShrineMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ShrineMissionTextTable
