-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityGraduateGiftbagTable.lua

local ActivityGraduateGiftbagTable = class("ActivityGraduateGiftbagTable", import(".BaseTable"))

function ActivityGraduateGiftbagTable:ctor()
	ActivityGraduateGiftbagTable.super.ctor(self, "activity_graduate_gift")

	self.ids = {}
	self.maxStar = 5

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityGraduateGiftbagTable:getIds()
	return self.ids
end

function ActivityGraduateGiftbagTable:getItemsList()
	local list = {}

	for _, id in ipairs(self.ids) do
		local star = self:getStar(id)

		self.maxStar = star > self.maxStar and star or self.maxStar

		if not list[star] then
			list[star] = {}
		end

		list[star].star = star
		list[star].giftBagId = self:getGiftbagId(id)

		local cost = self:getCost(id)

		if next(cost) ~= nil then
			list[star].costId = id
		else
			list[star].freeId = id
		end
	end

	return list
end

function ActivityGraduateGiftbagTable:getStar(id)
	return self:getNumber(id, "star")
end

function ActivityGraduateGiftbagTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityGraduateGiftbagTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityGraduateGiftbagTable:getGiftbagId(id)
	return self:getNumber(id, "giftbag_id")
end

function ActivityGraduateGiftbagTable:getLimitTimes(id)
	return self:getNumber(id, "limit_times")
end

function ActivityGraduateGiftbagTable:getMaxStar()
	return self.maxStar
end

return ActivityGraduateGiftbagTable
