-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/Activity4birthdayGambleTable.lua

local Activity4birthdayGambleTable = class("Activity4birthdayGambleTable", import("app.common.tables.BaseTable"))

function Activity4birthdayGambleTable:ctor()
	Activity4birthdayGambleTable.super.ctor(self, "activity_4birthday_gamble")

	self.ids_ = {}
	self.allInfos = {}
	self.typeWithSorts = {}
	self.sortPartnerGroupArr = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local type = self:getType(id)

		if not self.allInfos[type] then
			self.allInfos[type] = {}
		end

		local sort = self:getSort(id)

		if not self.allInfos[type][sort] then
			self.allInfos[type][sort] = {}
		end

		self.allInfos[type][sort].award = self:getAwards(id)
		self.allInfos[type][sort].id = tonumber(id)
	end

	table.sort(self.ids_)

	for i, id in pairs(self.ids_) do
		local type = self:getType(id)
		local sort = self:getSort(id)

		if sort == xyd.Activity4BirthdayMusicSortType.SKIN or sort == xyd.Activity4BirthdayMusicSortType.PARTNER then
			if not self.sortPartnerGroupArr[type] then
				self.sortPartnerGroupArr[type] = {}
			end

			if not self.sortPartnerGroupArr[type][sort] then
				self.sortPartnerGroupArr[type][sort] = {}

				for j = 0, xyd.GROUP_NUM do
					self.sortPartnerGroupArr[type][sort][j] = {
						award = {},
						id = id
					}
				end
			end

			self.sortPartnerGroupArr[type][sort][0] = self:getInfos(type, sort)

			for k, info in pairs(self.sortPartnerGroupArr[type][sort][0].award) do
				local itemId = info.item[1]
				local group = xyd.tables.itemTable:getGroup(itemId)

				table.insert(self.sortPartnerGroupArr[type][sort][group].award, info)
			end
		end

		if not self.typeWithSorts[type] then
			self.typeWithSorts[type] = {}
		end

		if xyd.arrayIndexOf(self.typeWithSorts[type], sort) < 0 then
			table.insert(self.typeWithSorts[type], sort)
		end
	end
end

function Activity4birthdayGambleTable:getIDs()
	return self.ids_
end

function Activity4birthdayGambleTable:getAwards(id)
	if not self.allAwards then
		self.allAwards = {}
	end

	if not self.allAwards[id] then
		self.allAwards[id] = {}

		local awards = self:split2Cost(id, "awards", "|#", true)

		for i in pairs(awards) do
			table.insert(self.allAwards[id], {
				item = awards[i],
				index = i,
				sort = self:getSort(id)
			})
		end
	end

	return self.allAwards[id]
end

function Activity4birthdayGambleTable:getSort(id)
	return self:getNumber(id, "sort")
end

function Activity4birthdayGambleTable:getType(id)
	return self:getNumber(id, "type")
end

function Activity4birthdayGambleTable:getInfos(type, sort)
	if self.allInfos[type] and self.allInfos[type][sort] then
		return self.allInfos[type][sort]
	end
end

function Activity4birthdayGambleTable:getTypeWithSorts(type)
	return self.typeWithSorts[type]
end

function Activity4birthdayGambleTable:getSortPartnerGroupArr(type, sort, group)
	return self.sortPartnerGroupArr[type][sort][group]
end

function Activity4birthdayGambleTable:getItemWithIndex(type, sort, index)
	if not self.itemsWithTypeSort then
		self.itemsWithTypeSort = {}
	end

	if not self.itemsWithTypeSort[type] then
		self.itemsWithTypeSort[type] = {}
	end

	if not self.itemsWithTypeSort[type][sort] then
		self.itemsWithTypeSort[type][sort] = {}
	end

	if self.itemsWithTypeSort[type][sort][index] then
		return self.itemsWithTypeSort[type][sort][index]
	end

	for i, id in pairs(self.ids_) do
		if type == self:getType(id) and sort == self:getSort(id) then
			self.itemsWithTypeSort[type][sort][index] = self:getAwards(id)[index].item
		end
	end

	return self.itemsWithTypeSort[type][sort][index]
end

function Activity4birthdayGambleTable:getIdWithIndex(type, sort)
	for i, id in pairs(self.ids_) do
		if type == self:getType(id) and sort == self:getSort(id) then
			return id
		end
	end
end

function Activity4birthdayGambleTable:getShowViewInfos(needType)
	if not self.showViewArr then
		self.showViewArr = {}

		for i, id in pairs(self.ids_) do
			local type = self:getType(id)

			if not self.showViewArr[type] then
				self.showViewArr[type] = {}
			end

			local sort = self:getSort(id)

			if sort == xyd.Activity4BirthdayMusicSortType.SKIN then
				if type == 1 then
					table.insert(self.showViewArr[type], {
						381,
						0
					})
				elseif type == 2 then
					table.insert(self.showViewArr[type], {
						382,
						0
					})
				end
			else
				local awards = self:getAwards(id)

				for j in pairs(awards) do
					table.insert(self.showViewArr[type], awards[j].item)
				end
			end
		end
	end

	return self.showViewArr[needType]
end

return Activity4birthdayGambleTable
