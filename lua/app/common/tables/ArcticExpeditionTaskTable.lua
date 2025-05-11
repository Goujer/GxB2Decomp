-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionTaskTable.lua

local ArcticExpeditionTaskTable = class("ArcticExpeditionTaskTable", import("app.common.tables.BaseTable"))

function ArcticExpeditionTaskTable:ctor()
	ArcticExpeditionTaskTable.super.ctor(self, "activity_ept_task")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ArcticExpeditionTaskTable:getIDs()
	return self.ids_
end

function ArcticExpeditionTaskTable:getCompleteValue(id)
	return self:getNumber(id, "complete")
end

function ArcticExpeditionTaskTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ArcticExpeditionTaskTable:getLimitTime(id)
	return self:getNumber(id, "limit")
end

function ArcticExpeditionTaskTable:getMissionType(id)
	return self:getNumber(id, "type")
end

function ArcticExpeditionTaskTable:getDesc(id)
	local type = self:getMissionType(id)
	local compValue = self:getCompleteValue(id)

	return xyd.tables.arcticExpeditionTaskTextTable:getDesc(type, compValue)
end

return ArcticExpeditionTaskTable
