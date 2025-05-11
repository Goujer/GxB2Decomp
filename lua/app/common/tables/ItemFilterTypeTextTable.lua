-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ItemFilterTypeTextTable.lua

local ItemFilterTypeTextTable = class("ItemFilterTypeTextTable", import("app.common.tables.BaseTable"))

function ItemFilterTypeTextTable:ctor()
	ItemFilterTypeTextTable.super.ctor(self, "item_filter_type_text_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ItemFilterTypeTextTable:getIDs()
	return self.ids_
end

function ItemFilterTypeTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return ItemFilterTypeTextTable
