-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionEraTaskTextTable.lua

local ArcticExpeditionEraTaskTextTable = class("ArcticExpeditionEraTaskTextTable", import(".BaseTable"))

function ArcticExpeditionEraTaskTextTable:ctor()
	ArcticExpeditionEraTaskTextTable.super.ctor(self, "activity_ept_era_task_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ArcticExpeditionEraTaskTextTable:getDesc(id, ...)
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

return ArcticExpeditionEraTaskTextTable
