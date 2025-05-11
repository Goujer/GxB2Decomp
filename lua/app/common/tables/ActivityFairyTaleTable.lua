-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleTable.lua

local ActivityFairyTaleTable = class("ActivityFairyTaleTable", import(".BaseTable"))

function ActivityFairyTaleTable:ctor()
	ActivityFairyTaleTable.super.ctor(self, "activity_fairytale")
end

function ActivityFairyTaleTable:getNpc(id)
	return self:getNumber(id, "npc_id")
end

return ActivityFairyTaleTable
