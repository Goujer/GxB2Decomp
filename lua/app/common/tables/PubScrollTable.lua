-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PubScrollTable.lua

local PubScrollTable = class("PubScrollTable", import("app.common.tables.BaseTable"))

function PubScrollTable:ctor()
	PubScrollTable.super.ctor(self, "pub_scroll")
end

function PubScrollTable:getCost(id)
	return xyd.split(self:getString(id, "cost"), "#")
end

return PubScrollTable
