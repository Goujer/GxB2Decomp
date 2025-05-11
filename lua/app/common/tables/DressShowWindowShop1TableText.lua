-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/DressShowWindowShop1TableText.lua

local DressShowWindowShop1TableText = class("DressShowWindowShop1TableText", import("app.common.tables.BaseTable"))

function DressShowWindowShop1TableText:ctor()
	DressShowWindowShop1TableText.super.ctor(self, "show_window_shop1_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function DressShowWindowShop1TableText:getIds()
	return self.ids_
end

function DressShowWindowShop1TableText:getName(id)
	return self:getString(id, "name")
end

function DressShowWindowShop1TableText:getDesc1(id)
	return self:getString(id, "desc1")
end

function DressShowWindowShop1TableText:getDesc2(id)
	return self:getString(id, "desc2")
end

return DressShowWindowShop1TableText
