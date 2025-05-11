-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleOptionTable.lua

local ActivityFairyTaleOptionTable = class("ActivityFairyTaleOptionTable", import("app.common.tables.BaseTable"))

function ActivityFairyTaleOptionTable:ctor()
	ActivityFairyTaleOptionTable.super.ctor(self, "activity_fairytale_option")
end

function ActivityFairyTaleOptionTable:getAvatarId(id)
	return self:getNumber(id, "avatar_id")
end

function ActivityFairyTaleOptionTable:getDecisionId(id)
	return self:split2Cost(id, "decision_id", "|#")
end

function ActivityFairyTaleOptionTable:getHp(id)
	return self:getNumber(id, "hp")
end

return ActivityFairyTaleOptionTable
