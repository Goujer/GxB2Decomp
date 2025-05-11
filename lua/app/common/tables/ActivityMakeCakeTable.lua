-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityMakeCakeTable.lua

local ActivityMakeCakeTable = class("ActivityMakeCakeTable", import("app.common.tables.BaseTable"))

function ActivityMakeCakeTable:ctor()
	ActivityMakeCakeTable.super.ctor(self, "activity_make_cake")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityMakeCakeTable:getIDs()
	return self.ids_
end

function ActivityMakeCakeTable:getExtraAward(id)
	return self:split2num(id, "extra_awawrds", "#")
end

function ActivityMakeCakeTable:getAwardInfo(id, item_id)
	local res = {}

	res.cost = self:split2num(id, "cost_" .. tostring(item_id), "#")

	if not res.cost or #res.cost == 0 then
		return nil
	end

	res.awards = self:split2Cost(id, "awards_" .. tostring(item_id), "|#")
	res.limit = self:getNumber(id, "limit_" .. tostring(item_id))

	return res
end

return ActivityMakeCakeTable
