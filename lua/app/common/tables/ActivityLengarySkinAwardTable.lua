-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLengarySkinAwardTable.lua

local ActivityLengarySkinAwardTable = class("ActivityLengarySkinAwardTable", import("app.common.tables.BaseTable"))

function ActivityLengarySkinAwardTable:ctor()
	ActivityLengarySkinAwardTable.super.ctor(self, "activity_legendary_skin_award")

	self.ids_ = {}
	self.totalWeight_ = {}
	self.idsByType_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local type = self:getType(id)

		if not self.idsByType_[type] then
			self.idsByType_[type] = {}
		end

		table.insert(self.idsByType_[type], tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityLengarySkinAwardTable:getAward(id)
	return self:split2Cost(id, "award", "#")
end

function ActivityLengarySkinAwardTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityLengarySkinAwardTable:getWeight(id)
	return self:getNumber(id, "weight")
end

function ActivityLengarySkinAwardTable:getIsSpecial(id)
	return self:getNumber(id, "is_special")
end

function ActivityLengarySkinAwardTable:getShowWeight(id)
	local type = self:getType(id)
	local totalWeight = self.totalWeight_[type] or 1
	local showRate = math.floor(self:getWeight(id) / totalWeight * 1000000) / 10000

	return showRate .. "%"
end

function ActivityLengarySkinAwardTable:getBasicAward(type)
	local ids = self.idsByType_[type]

	table.sort(ids)

	local awardList = {}
	local totalWeight = 0

	for index, id in ipairs(ids) do
		local weight = self:getWeight(id)

		totalWeight = totalWeight + weight

		local award = self:getAward(id)

		awardList[index] = {
			itemData = award
		}
	end

	for index, id in ipairs(ids) do
		local weight = self:getWeight(id)

		awardList[index].prob = math.floor(weight / totalWeight * 1000000) / 1000000
	end

	return awardList
end

return ActivityLengarySkinAwardTable
