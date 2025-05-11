-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/CustomBackgroundTable.lua

local CustomBackgroundTable = class("CustomBackgroundTable", import("app.common.tables.BaseTable"))

function CustomBackgroundTable:ctor()
	CustomBackgroundTable.super.ctor(self, "custom_background")

	self.ids = {}
	self.id_by_item_id = {}
	self.background_item_list = {}
	self.gallery_item_list = {}
	self.background_list_by_group = {}
	self.gallery_list_by_group = {}

	for id, _ in pairs(self.TableLua.rows) do
		local id = tonumber(id)

		table.insert(self.ids, id)

		local item_id = self:getItemId(id)
		local type = self:getType(id)
		local group_id = self:getGroup(id)

		self.id_by_item_id[item_id] = tonumber(id)

		if type == xyd.BackgroundType.BACKGROUND then
			table.insert(self.background_item_list, id)

			if not self.background_list_by_group[group_id] then
				self.background_list_by_group[group_id] = {}
			end

			table.insert(self.background_list_by_group[group_id], id)
		else
			table.insert(self.gallery_item_list, id)

			if not self.gallery_list_by_group[group_id] then
				self.gallery_list_by_group[group_id] = {}
			end

			table.insert(self.gallery_list_by_group[group_id], id)
		end
	end

	local group_ids = xyd.tables.customBackgroundGroupTable:getIDs()

	for i = 1, #group_ids do
		if not self.gallery_list_by_group[i] then
			self.gallery_list_by_group[i] = {}
		end
	end

	table.sort(self.id_by_item_id)
	table.sort(self.background_item_list)
	table.sort(self.gallery_item_list)

	for k, v in pairs(self.background_list_by_group) do
		table.sort(self.background_list_by_group[k])
	end

	for k, v in pairs(self.gallery_list_by_group) do
		table.sort(self.gallery_list_by_group[k])
	end
end

function CustomBackgroundTable:getIds()
	return self.ids
end

function CustomBackgroundTable:getItemIDList()
	return self.id_by_item_id
end

function CustomBackgroundTable:getBackGroundList()
	return self.background_item_list
end

function CustomBackgroundTable:getGalleryList()
	return self.gallery_item_list
end

function CustomBackgroundTable:getListByGroup(type, group_id)
	group_id = tonumber(group_id)

	if type == 1 then
		return self.background_list_by_group[group_id]
	else
		return self.gallery_list_by_group[group_id]
	end
end

function CustomBackgroundTable:getIdByItemId(item_id)
	return self.id_by_item_id_[item_id]
end

function CustomBackgroundTable:getType(id)
	return self:getNumber(id, "type")
end

function CustomBackgroundTable:getItemId(id)
	return self:getNumber(id, "item_id")
end

function CustomBackgroundTable:getPicture(id)
	return self:getString(id, "picture")
end

function CustomBackgroundTable:getPrice(id)
	return self:split2num(id, "price", "#")
end

function CustomBackgroundTable:getEffect(id)
	return self:getString(id, "effect")
end

function CustomBackgroundTable:getGroup(id)
	return self:getNumber(id, "group")
end

function CustomBackgroundTable:getSmallPicture(id)
	return self:getString(id, "picture_small_size")
end

function CustomBackgroundTable:getAnimation(id)
	return self:getString(id, "animation")
end

function CustomBackgroundTable:getEffectBackground(id)
	return self:getString(id, "effect_background")
end

function CustomBackgroundTable:getOffset(id)
	return self:split2num(id, "offset", "|")
end

function CustomBackgroundTable:getPictureOffset(id)
	return self:split2num(id, "picture_offset", "|")
end

function CustomBackgroundTable:getEffectOffsetUnity(id)
	return self:split2num(id, "offset_for_unity", "|")
end

function CustomBackgroundTable:getLockType(id)
	return self:getNumber(id, "unlock_type")
end

function CustomBackgroundTable:getUnclockValue(id)
	return self:getString(id, "unlock_value")
end

function CustomBackgroundTable:getRedMarkTime(id)
	return self:getNumber(id, "redmark_time")
end

return CustomBackgroundTable
