-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionTaskTextTable.lua

local ArcticExpeditionTaskTextTable = class("ArcticExpeditionTaskTextTable", import("app.common.tables.BaseTable"))

function ArcticExpeditionTaskTextTable:ctor()
	ArcticExpeditionTaskTextTable.super.ctor(self, "activity_ept_task_type_text_" .. xyd.Global.lang)
end

function ArcticExpeditionTaskTextTable:getDesc(id, ...)
	local formatStr = self:getString(id, "desc")
	local __args = {
		...
	}

	if not formatStr then
		return id
	end

	local newargs = __TS__ArraySlice(__args, 0, #__args)
	local result = xyd.stringFormat(formatStr, unpack(newargs))

	result = string.gsub(result, "undefined", "")

	return result
end

return ArcticExpeditionTaskTextTable
