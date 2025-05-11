-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityCompose10Table.lua

local ActivityCompose10Table = class("ActivityCompose10Table", import("app.common.tables.BaseTable"))

function ActivityCompose10Table:ctor()
	ActivityCompose10Table.super.ctor(self, "activity_compose_10")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityCompose10Table:getIDs()
	return self.ids_
end

function ActivityCompose10Table:getStar(id)
	return self:getNumber(id, "star")
end

function ActivityCompose10Table:getLimit(id)
	return self:getNumber(id, "limit")
end

function ActivityCompose10Table:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityCompose10Table
