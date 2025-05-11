-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDressGachaAwardTable.lua

local ActivityDressGachaAwardTable = class("ActivityDressGachaAwardTable", import("app.common.tables.BaseTable"))

function ActivityDressGachaAwardTable:ctor()
	ActivityDressGachaAwardTable.super.ctor(self, "activity_dress_gacha_award")

	self.ids_ = {}
	self.rank_ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
		table.insert(self.rank_ids_, tonumber(id))
	end

	table.sort(self.ids_)
	table.sort(self.rank_ids_, function(a, b)
		return self:getRank(a) < self:getRank(b)
	end)
end

function ActivityDressGachaAwardTable:getIDs()
	return self.ids_
end

function ActivityDressGachaAwardTable:getRankIDs()
	return self.rank_ids_
end

function ActivityDressGachaAwardTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ActivityDressGachaAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityDressGachaAwardTable:getAward(id)
	return self:split2Cost(id, "award", "|#")
end

return ActivityDressGachaAwardTable
