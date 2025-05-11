-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPrayCostTable.lua

local ActivityPrayCostTable = class("ItemTable", import("app.common.tables.BaseTable"))

function ActivityPrayCostTable:ctor()
	ActivityPrayCostTable.super.ctor(self, "activity_pray_cost")

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityPrayCostTable:getIDs()
	return self.ids_
end

function ActivityPrayCostTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivityPrayCostTable:getMerge(id)
	return self:split2Cost(id, "merge", "#")
end

function ActivityPrayCostTable:getOmniFragment(id)
	return self:split2Cost(id, "omni_get", "#")
end

function ActivityPrayCostTable:getGroupFragment(id)
	return self:split2Cost(id, "get", "#")
end

return ActivityPrayCostTable
