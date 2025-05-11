-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ItemExchangeTextTable.lua

local ItemExchangeTextTable = class("ItemExchangeTextTable", import("app.common.tables.BaseTable"))

function ItemExchangeTextTable:ctor()
	ItemExchangeTextTable.super.ctor(self, "item_exchange_text_" .. tostring(xyd.Global.lang))
end

function ItemExchangeTextTable:getTitle(id)
	return self:getString(id, "title")
end

return ItemExchangeTextTable
