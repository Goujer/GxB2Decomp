-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityTowerFundGiftBagTable.lua

local ActivityTowerFundGiftBagTable = class("ActivityTowerFundGiftBagTable", import("app.common.tables.BaseTable"))

function ActivityTowerFundGiftBagTable:ctor()
	ActivityTowerFundGiftBagTable.super.ctor(self, "activity_tower_fund_giftbag")

	self.ids_ = {}
	self.idsByLevel_ = {}
	self.giftBagIdByLev_ = {}
	self.totalAwards_ = {}
	self.giftbagID2Lev = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local level = self:getLevel(id)

		if not self.idsByLevel_[level] then
			self.idsByLevel_[level] = {}
		end

		if not self.totalAwards_[level] then
			self.totalAwards_[level] = {}
		end

		self:addItems(self.totalAwards_[level], self:getRewards(id))

		local giftBagIdById = self:getGiftBagID(id)

		self.giftBagIdByLev_[level] = giftBagIdById
		self.giftbagID2Lev[tostring(giftBagIdById)] = level

		table.insert(self.idsByLevel_[level], tonumber(id))
	end

	table.sort(self.ids_)

	for _, list in pairs(self.idsByLevel_) do
		table.sort(list)
	end
end

function ActivityTowerFundGiftBagTable:getMaxTowerIDByGiftbagID(giftbagID)
	local maxTowerID = 0

	for i, id in pairs(self.ids_) do
		if self:getGiftBagID(id) == giftbagID then
			maxTowerID = math.max(maxTowerID, self:getTowerId(id))
		end
	end

	return maxTowerID
end

function ActivityTowerFundGiftBagTable:getLevel(id)
	return self:getNumber(id, "level")
end

function ActivityTowerFundGiftBagTable:getGiftBagIDByLevel(level)
	return self.giftBagIdByLev_[level]
end

function ActivityTowerFundGiftBagTable:addItems(array, items)
	for _, item in ipairs(items) do
		local itemID = item[1]

		if array[itemID] == nil then
			array[itemID] = 0
		end

		array[itemID] = array[item[1]] + item[2]
	end
end

function ActivityTowerFundGiftBagTable:getTotalAwards(level)
	return self.totalAwards_[level]
end

function ActivityTowerFundGiftBagTable:getRewards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityTowerFundGiftBagTable:getIds()
	return self.ids_
end

function ActivityTowerFundGiftBagTable:getTowerId(id)
	return self:getNumber(id, "tower_id")
end

function ActivityTowerFundGiftBagTable:getGiftBagID(id)
	return self:getNumber(id, "giftbag_id")
end

function ActivityTowerFundGiftBagTable:getIdsByLevel(level)
	return self.idsByLevel_[level]
end

function ActivityTowerFundGiftBagTable:getLevelByGiftbagID(giftbagID)
	return tonumber(self.giftbagID2Lev[tostring(giftbagID)]) or 1
end

return ActivityTowerFundGiftBagTable
