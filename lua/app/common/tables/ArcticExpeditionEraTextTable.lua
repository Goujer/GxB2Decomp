-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionEraTextTable.lua

local ArcticExpeditionEraTextTable = class("ArcticExpeditionEraTextTable", import(".BaseTable"))

function ArcticExpeditionEraTextTable:ctor()
	ArcticExpeditionEraTextTable.super.ctor(self, "activity_ept_era_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ArcticExpeditionEraTextTable:getName(id)
	return self:getString(id, "name")
end

function ArcticExpeditionEraTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ArcticExpeditionEraTextTable
