-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ResourceEffectTable.lua

local ResourceEffectTable = class("ResourceEffectTable", import("app.common.tables.BaseTable"))

function ResourceEffectTable:ctor()
	ResourceEffectTable.super.ctor(self, "resource_effect")
end

function ResourceEffectTable:getResNames(name)
	return self:split(name, "res_name", "|")
end

return ResourceEffectTable
