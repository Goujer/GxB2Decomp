-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GiftBoxOptionalTable.lua

local GiftBoxOptionalTable = class("GiftBoxOptionalTable", import("app.common.tables.BaseTable"))

function GiftBoxOptionalTable:ctor()
	GiftBoxOptionalTable.super.ctor(self, "giftbox_optional")

	self.ids_ = {}

	for id, _ in ipairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function GiftBoxOptionalTable:getIDs()
	return self.ids_
end

function GiftBoxOptionalTable:getName(id)
	return xyd.tables.itemTextTable:getName(id)
end

function GiftBoxOptionalTable:getItems(id)
	local items = {}
	local itemArr = xyd.split(self:getString(id, "item"), "|")

	for _, itemStr in ipairs(itemArr) do
		local itemTemp = xyd.split(itemStr, "#", true)
		local item = {
			itemID = itemTemp[1],
			itemNum = itemTemp[2]
		}

		table.insert(items, item)
	end

	return items
end

function GiftBoxOptionalTable:getStars(id)
	return self:getNumber(id, "stars")
end

return GiftBoxOptionalTable
