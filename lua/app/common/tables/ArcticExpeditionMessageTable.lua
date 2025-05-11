-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionMessageTable.lua

local ArcticExpeditionMessageTable = class("ArcticExpeditionMessageTable", import("app.common.tables.BaseTable"))

function ArcticExpeditionMessageTable:ctor()
	ArcticExpeditionMessageTable.super.ctor(self, "activity_ept_message")
end

function ArcticExpeditionMessageTable:getConnectType(id)
	return self:split2Cost(id, "connect_type", "|#", false)
end

function ArcticExpeditionMessageTable:getRange(id)
	return self:getNumber(id, "range")
end

function ArcticExpeditionMessageTable:getChannel(id)
	return self:getNumber(id, "channel")
end

function ArcticExpeditionMessageTable:getText(id, ...)
	local args = {
		...
	}

	return xyd.tables.arcticExpeditionMessageTextTable:getDesc(id, unpack(args))
end

return ArcticExpeditionMessageTable
