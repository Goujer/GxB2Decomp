-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleShopTable.lua

local ActivityFairyTaleShopTable = class("ActivityFairyTaleShopTable", import(".BaseTable"))

function ActivityFairyTaleShopTable:ctor()
	ActivityFairyTaleShopTable.super.ctor(self, "activity_fairytale_shop")

	self.ids_ = {}
	self.idsByType_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local type_ = self:getType(id)

		if not self.idsByType_[type_] then
			self.idsByType_[type_] = {}
		end

		table.insert(self.idsByType_[type_], tonumber(id))
	end

	table.sort(self.ids_)

	for i = 1, 3 do
		table.sort(self.idsByType_[i])
	end
end

function ActivityFairyTaleShopTable:getUnlockById(id)
	return self:getNumber(id, "unlock")
end

function ActivityFairyTaleShopTable:getIds()
	return self.idsByType_
end

function ActivityFairyTaleShopTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function ActivityFairyTaleShopTable:getType(id)
	return self:getNumber(id, "level")
end

function ActivityFairyTaleShopTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityFairyTaleShopTable:getAward(id)
	return self:split2Cost(id, "awards", "#")
end

function ActivityFairyTaleShopTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityFairyTaleShopTable:getDesc(id)
	return self:getString(id, "desc")
end

function ActivityFairyTaleShopTable:getTypeList()
	return self.typeList_
end

return ActivityFairyTaleShopTable
