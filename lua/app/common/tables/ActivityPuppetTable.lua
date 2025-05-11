-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPuppetTable.lua

local BaseTable = import(".BaseTable")
local ActivityPuppetTable = class("ActivityPuppetTable", BaseTable)

function ActivityPuppetTable:ctor()
	ActivityPuppetTable.super.ctor(self, "activity_puppet_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivityPuppetTable:getIds()
	return self.ids_
end

function ActivityPuppetTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityPuppetTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityPuppetTable:getIsNew(id)
	return self:getNumber(id, "is_new")
end

return ActivityPuppetTable
