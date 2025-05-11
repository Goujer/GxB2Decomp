-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGoldfishShopTable.lua

local ActivityGoldfishShopTable = class("ActivityGoldfishShopTable", import(".BaseTable"))

function ActivityGoldfishShopTable:ctor()
	ActivityGoldfishShopTable.super.ctor(self, "activity_goldfish_shop")

	self.ids_ = {}
	self.limitList_ = {}
	self.idsByLimitNum_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local limitNum = self:getLimitNum(id)
		local index = xyd.arrayIndexOf(self.limitList_, limitNum)

		if not index or index < 0 then
			table.insert(self.limitList_, limitNum)
		end

		if not self.idsByLimitNum_[limitNum] then
			self.idsByLimitNum_[limitNum] = {}
		end

		table.insert(self.idsByLimitNum_[limitNum], tonumber(id))
	end

	table.sort(self.ids_)
	table.sort(self.limitList_)
end

function ActivityGoldfishShopTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

function ActivityGoldfishShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function ActivityGoldfishShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityGoldfishShopTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityGoldfishShopTable:getLimitNum(id)
	return self:getNumber(id, "num")
end

function ActivityGoldfishShopTable:getLimitNumByIndex(index)
	return self.limitList_[index] or 0
end

function ActivityGoldfishShopTable:getIDsByLimitNum(index)
	local limit_num = self:getLimitNumByIndex(index)

	return self.idsByLimitNum_[limit_num] or {}
end

return ActivityGoldfishShopTable
