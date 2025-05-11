-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityResidentReturnRewardTable.lua

local ActivityResidentReturnRewardTable = class("ActivityResidentReturnRewardTable", import("app.common.tables.BaseTable"))

function ActivityResidentReturnRewardTable:ctor()
	ActivityResidentReturnRewardTable.super.ctor(self, "activity_return2_reward")

	self.ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityResidentReturnRewardTable:getIds()
	return self.ids
end

function ActivityResidentReturnRewardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityResidentReturnRewardTable:getTotalPoint()
	return self:getPoint(self.ids[#self.ids])
end

function ActivityResidentReturnRewardTable:getBaseAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityResidentReturnRewardTable:hasEffect1(id)
	return self:split2num(id, "effect", "|")
end

function ActivityResidentReturnRewardTable:getExtraAwards(id)
	return self:split2Cost(id, "awards2", "|#")
end

function ActivityResidentReturnRewardTable:hasEffect2(id)
	return self:split2num(id, "effect2", "|")
end

return ActivityResidentReturnRewardTable
