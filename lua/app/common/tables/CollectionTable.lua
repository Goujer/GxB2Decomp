-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CollectionTable.lua

local BaseTable = import(".BaseTable")
local CollectionTable = class("CollectionTable", BaseTable)

function CollectionTable:ctor()
	BaseTable.ctor(self, "collection")

	self.ids_ = {}
	self.item_list_by_type = {}

	for id in pairs(self.TableLua.rows) do
		if self:getShowTime(tonumber(id)) and xyd.getServerTime() >= self:getShowTime(tonumber(id)) then
			table.insert(self.ids_, tonumber(id))

			local type = self:getType(tonumber(id))

			if not self.item_list_by_type[type] then
				self.item_list_by_type[type] = {}
			end

			table.insert(self.item_list_by_type[type], tonumber(id))
		end
	end

	for _, list in ipairs(self.item_list_by_type) do
		table.sort(list)
	end
end

function CollectionTable:getIds()
	return self.ids_
end

function CollectionTable:getType(id)
	return self:getNumber(id, "type")
end

function CollectionTable:getType2(id)
	return self:getNumber(id, "type2")
end

function CollectionTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function CollectionTable:getItemId(id)
	return self:getNumber(id, "item_id")
end

function CollectionTable:getShowTime(id)
	return self:getNumber(id, "is_show")
end

function CollectionTable:getRank(id)
	return self:getNumber(id, "rank")
end

function CollectionTable:getCoin(id)
	if self:getAwards(id) and self:getAwards(id)[1] and self:getAwards(id)[2] then
		return self:getAwards(id)[2]
	else
		return 0
	end
end

function CollectionTable:getIdsListByType(type)
	return self.item_list_by_type[type]
end

function CollectionTable:getQlt(id)
	return self:getNumber(id, "qlt")
end

function CollectionTable:getGroup(id)
	return self:getNumber(id, "group")
end

function CollectionTable:getAwards(id)
	return self:split2Cost(id, "new_awards", "#", true)
end

function CollectionTable:getIsShow(id)
	return self:getNumber(id, "is_show")
end

return CollectionTable
