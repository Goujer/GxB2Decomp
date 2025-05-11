-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNsshaftAward1Table.lua

local ActivityNsshaftAward1Table = class("ActivityNsshaftAward1Table", import("app.common.tables.BaseTable"))

function ActivityNsshaftAward1Table:ctor()
	ActivityNsshaftAward1Table.super.ctor(self, "activity_nsshaft_award1")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityNsshaftAward1Table:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivityNsshaftAward1Table:getAward(id)
	return self:split2num(id, "awards", "#")
end

function ActivityNsshaftAward1Table:getIds()
	return self.ids_
end

return ActivityNsshaftAward1Table
