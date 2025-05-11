-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleRouteTextTable.lua

local ShrineHurdleRouteTextTable = class("ShrineHurdleRouteTextTable", import("app.common.tables.BaseTable"))

function ShrineHurdleRouteTextTable:ctor()
	ShrineHurdleRouteTextTable.super.ctor(self, "shrine_hurdle_route_text_" .. tostring(xyd.Global.lang))
end

function ShrineHurdleRouteTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function ShrineHurdleRouteTextTable:getName(id)
	return self:getString(id, "name")
end

function ShrineHurdleRouteTextTable:getTitle(id)
	return self:getString(id, "title")
end

return ShrineHurdleRouteTextTable
