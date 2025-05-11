-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowShopTextTable.lua

local DressShowShopTextTable = class("DressShowShopTextTable", import("app.common.tables.BaseTable"))

function DressShowShopTextTable:ctor()
	DressShowShopTextTable.super.ctor(self, "show_window_shop1_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function DressShowShopTextTable:getName(id)
	return self:getString(id, "name")
end

function DressShowShopTextTable:getDesc1(id)
	return self:getString(id, "desc1")
end

function DressShowShopTextTable:getDesc2(id)
	return self:getString(id, "desc2")
end

return DressShowShopTextTable
