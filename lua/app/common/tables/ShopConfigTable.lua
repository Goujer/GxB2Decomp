-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShopConfigTable.lua

local ShopConfigTable = class("ShopConfigTable", import("app.common.tables.BaseTable"))

function ShopConfigTable:ctor()
	ShopConfigTable.super.ctor(self, "shop_config")

	self.ids_ = {}

	for id, row in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end
end

function ShopConfigTable:getIDs()
	return self.ids_
end

function ShopConfigTable:getExcelTable(id)
	return self:getString(id, "excel_table")
end

function ShopConfigTable:getSlotNum(id)
	return self:getNumber(id, "slot_num")
end

function ShopConfigTable:getFunctionID(id)
	return self:getNumber(id, "function_id")
end

function ShopConfigTable:getSlotBuyTimes(id, slot)
	if slot ~= nil then
		return self:split2num(id, "slot_buy_time", "|")[slot]
	end

	return self:split2num(id, "slot_buy_time", "|")
end

function ShopConfigTable:isRefreshSave(id)
	return self:getNumber(id, "is_refresh_save")
end

function ShopConfigTable:isRefresh(id)
	return self:getNumber(id, "is_refresh")
end

function ShopConfigTable:getRefreshType(id)
	return self:getNumber(id, "refresh_type")
end

function ShopConfigTable:getRefreshFreeTime(id)
	return self:getNumber(id, "refresh_free_time")
end

function ShopConfigTable:getRefreshCost(id)
	return self:split2num(id, "refresh_cost", "#")
end

function ShopConfigTable:getEconomyShow(id)
	return self:split2num(id, "economy_show", "|")
end

function ShopConfigTable:getGirlsModel(id)
	return self:getNumber(id, "girls_model")
end

function ShopConfigTable:getBannerImg(id)
	local string = self:getString(id, "shop_banner")

	return string.sub(string, 1, -5)
end

function ShopConfigTable:rank(id)
	return self:getNumber(id, "rank")
end

function ShopConfigTable:limitLevel(id)
	return self:getNumber(id, "limit_level")
end

function ShopConfigTable:getOffest(id)
	return self:split2num(id, "offset", "|")
end

function ShopConfigTable:getScale(id)
	return self:getNumber(id, "scale")
end

function ShopConfigTable:getGirlsImg(id)
	return self:getNumber(id, "girls_img")
end

function ShopConfigTable:getBg(id)
	local string = self:getString(id, "shop_bg")

	return string.sub(string, 1, -2)
end

function ShopConfigTable:getIcon(id)
	return self:getString(id, "icon")
end

function ShopConfigTable:getName(id)
	return xyd.tables.shopConfigTextTable:getName(id)
end

function ShopConfigTable:getRedMarkId(id)
	return self:getNumber(id, "red_mark_id")
end

function ShopConfigTable:getRedMarkKey(id)
	return self:getString(id, "red_mark_key")
end

function ShopConfigTable:getShopTable(id)
	return xyd.trim(self:getString(id, "shop_table"))
end

return ShopConfigTable
