-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPirateShopAwardTable.lua

local ActivityPirateShopAwardTable = class("ActivityPirateShopAwardTable", import("app.common.tables.BaseTable"))

function ActivityPirateShopAwardTable:ctor()
	ActivityPirateShopAwardTable.super.ctor(self, "activity_pirate_shop_awards")

	self.ids_ = {}
	self.idsByUnlockValue_ = {}
	self.unLockList_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local unlockValue = self:getUnlock(id)

		if not self.idsByUnlockValue_[unlockValue] then
			self.idsByUnlockValue_[unlockValue] = {}
		end

		if xyd.arrayIndexOf(self.unLockList_, unlockValue) < 0 then
			table.insert(self.unLockList_, unlockValue)
		end

		table.insert(self.idsByUnlockValue_[unlockValue], tonumber(id))
	end

	table.sort(self.unLockList_)
	table.sort(self.ids_)
end

function ActivityPirateShopAwardTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivityPirateShopAwardTable:getAward(id)
	return self:split2num(id, "awards", "#")
end

function ActivityPirateShopAwardTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityPirateShopAwardTable:getUnlock(id)
	return self:getNumber(id, "unlock")
end

function ActivityPirateShopAwardTable:getUnlockList()
	return self.idsByUnlockValue_, self.unLockList_
end

return ActivityPirateShopAwardTable
