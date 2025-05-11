-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PubConditionTable.lua

local PubConditionTable = class("PubConditionTable", import("app.common.tables.BaseTable"))

function PubConditionTable:ctor()
	PubConditionTable.super.ctor(self, "pub_mission_condition")
end

function PubConditionTable:getJob(id)
	return self:getNumber(id, "job")
end

function PubConditionTable:getGroup(id)
	return self:getNumber(id, "group")
end

return PubConditionTable
