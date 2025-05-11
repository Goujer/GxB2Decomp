-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityHw2022GambleTable.lua

local ActivityHw2022GambleTable = class("ActivityHw2022GambleTable", import("app.common.tables.BaseTable"))

function ActivityHw2022GambleTable:ctor()
	ActivityHw2022GambleTable.super.ctor(self, "activity_halloween2022_gamble")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityHw2022GambleTable:getIDs()
	return self.ids_
end

function ActivityHw2022GambleTable:getCost(id)
	return self:split2Cost(id, "cost", "|#")
end

function ActivityHw2022GambleTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

function ActivityHw2022GambleTable:getWeight(id)
	return self:split2Cost(id, "weight", "|")
end

function ActivityHw2022GambleTable:getDropboxID(id)
	return self:getNumber(id, "dropbox")
end

return ActivityHw2022GambleTable
