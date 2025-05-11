-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ItemTable.lua

local ItemTable = class("ItemTable", import("app.common.tables.BaseTable"))
local ItemTextTable = xyd.tables.itemTextTable

function ItemTable:ctor()
	ItemTable.super.ctor(self, "item")

	self.item_list_by_type = {}
	self.partnerCostArr = {}
	self.treasureCostArr = {}
	self.puppet_debris_id_ = {}

	self:parseTable(function(id, row)
		local type = self:getType(id)

		if not self.item_list_by_type[type] then
			self.item_list_by_type[type] = {}
		end

		table.insert(self.item_list_by_type[type], id)
	end)

	local puppet_list = xyd.tables.miscTable:split2num("puppet_debris_id", "value", "|")

	for _, data in pairs(puppet_list) do
		self.puppet_debris_id_[tonumber(data)] = 1
	end
end

function ItemTable:getIDs()
	return self.ids_
end

function ItemTable:getName(id)
	return ItemTextTable:getName(id)
end

function ItemTable:isShowInBag(id)
	return self:getNumber(id, "show_in_bag") == 1
end

function ItemTable:showInBagType(id)
	return self:getNumber(id, "show_bag_type")
end

function ItemTable:getQuality(id)
	return self:getNumber(id, "qlt")
end

function ItemTable:getType(id)
	return self:getNumber(id, "type")
end

function ItemTable:isSell(id)
	return self:getNumber(id, "is_sell") == 1
end

function ItemTable:getWays(id)
	local results = self:split2Cost(id, "get_ways", "|", true)

	return results
end

function ItemTable:getActivtyWays(id)
	local results = self:split2Cost(id, "getway_item", "|", true)

	return results
end

function ItemTable:getDesc(id)
	return ItemTextTable:getDesc(id)
end

function ItemTable:getBrief(id)
	return ItemTextTable:getBrief(id)
end

function ItemTable:sellPrice(id)
	local strSplit = self:split2Cost(id, "sell_price", "#", true)

	return strSplit
end

function ItemTable:goWindow(id)
	return self:getNumber(id, "go_window")
end

function ItemTable:partnerCost(id)
	if self.partnerCostArr[id] == nil then
		self.partnerCostArr[id] = self:split2Cost(id, "partner_cost", "#", true)
	end

	return self.partnerCostArr[id]
end

function ItemTable:treasureCost(id)
	if self.treasureCostArr[id] == nil then
		self.treasureCostArr[id] = self:split2Cost(id, "treasure_cost", "#", true)
	end

	return self.treasureCostArr[id]
end

function ItemTable:stackLimit(id)
	return self:getNumber(id, "stack_limit")
end

function ItemTable:getIcon(id)
	return self:getString(id, "icon")
end

function ItemTable:getSmallIcon(id)
	return self:getString(id, "icon")
end

function ItemTable:getSmallIconNew(id)
	return self:getString(id, "icon") .. "_small"
end

function ItemTable:getSummonID(id)
	return self:getNumber(id, "summon_id")
end

function ItemTable:getGroup(id)
	return self:getNumber(id, "group")
end

function ItemTable:getSkinID(id)
	return self:getNumber(id, "skin_id")
end

function ItemTable:lightEffect(id)
	return self:getNumber(id, "light_effect")
end

function ItemTable:getGiftID(id)
	return self:getNumber(id, "gift_id")
end

function ItemTable:getItemListByType(type)
	return self.item_list_by_type[type]
end

function ItemTable:getCollectionId(id)
	return self:getNumber(id, "collection_id")
end

function ItemTable:getDropBoxShow(id)
	return self:getNumber(id, "dropbox_show")
end

function ItemTable:getFilterType(id)
	return self:getNumber(id, "filter_type")
end

function ItemTable:getFrameEffect(id)
	return self:getString(id, "avatar_frame_effect")
end

function ItemTable:checkPuppetDebris(id)
	if self.puppet_debris_id_[tonumber(id)] then
		return true
	else
		return false
	end
end

function ItemTable:getSearchId(name, isAllCharSearch)
	local serchIds = {}
	local TableLua = require("data.tables." .. "zh_tw" .. "." .. "item_text_zh_tw")

	for id, _ in pairs(TableLua.rows) do
		local row = TableLua.rows[id]
		local has_incluede = string.find(row[2], name)

		if row[2] == name or isAllCharSearch == "true" and has_incluede and has_incluede > 0 then
			table.insert(serchIds, row[2] .. ":" .. id)
		end
	end

	return serchIds
end

function ItemTable:getNameByZhTw(id)
	local TableLua = require("data.tables." .. "zh_tw" .. "." .. "item_text_zh_tw")

	if TableLua.rows[tostring(id)] then
		return TableLua.rows[tostring(id)][2]
	else
		return "錯誤搜索"
	end
end

function ItemTable:getDressId(id)
	return self:getNumber(id, "dress_id")
end

function ItemTable:getIsChangeBorder(id)
	return self:getNumber(id, "is_change_border")
end

function ItemTable:checkJobBoxID(id)
	return self:getNumber(id, "jobGiftBoxID") == 1
end

function ItemTable:getSortForward(id)
	return self:getNumber(id, "sort_forward")
end

function ItemTable:isSoulEquipBox(id)
	local flag = self:getNumber(id, "is_soul_equip_box")

	if flag and flag > 0 then
		return true
	end

	return false
end

return ItemTable
