-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopConfigTextTable.lua

local ShopConfigTextTable = class("ShopConfigTextTable", import("app.common.tables.BaseTable"))

function ShopConfigTextTable:ctor()
	ShopConfigTextTable.super.ctor(self, "shop_config_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function ShopConfigTextTable:getName(id)
	return self:getString(id, "name")
end

return ShopConfigTextTable
