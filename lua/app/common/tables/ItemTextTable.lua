-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ItemTextTable.lua

local ItemTextTable = class("ItemTextTable", import("app.common.tables.BaseTable"))

function ItemTextTable:ctor()
	ItemTextTable.super.ctor(self, "item_text_" .. string.lower(xyd.lang))
end

function ItemTextTable:getDesc(id)
	return self:getString(id, "desc")
end

function ItemTextTable:getName(id)
	return self:getString(id, "name")
end

function ItemTextTable:getBrief(id)
	return self:getString(id, "brief")
end

return ItemTextTable
