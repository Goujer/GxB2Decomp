-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionMessageTextTable.lua

local ArcticExpeditionMessageTextTable = class("ArcticExpeditionMessageTextTable", import("app.common.tables.BaseTable"))

function ArcticExpeditionMessageTextTable:ctor()
	ArcticExpeditionMessageTextTable.super.ctor(self, "activity_ept_message_text_" .. xyd.Global.lang)
end

function ArcticExpeditionMessageTextTable:getDesc(id, ...)
	local formatStr = self:getString(id, "string")

	if not formatStr then
		return id
	end

	local args = {
		...
	}
	local result = xyd.stringFormat(formatStr, unpack(args))

	result = string.gsub(result, "undefined", "")

	return result
end

return ArcticExpeditionMessageTextTable
