-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityLafuliRudderTable.lua

local ActivityLafuliRudderTable = class("ActivityLafuliRudderTable", import("app.common.tables.BaseTable"))

function ActivityLafuliRudderTable:ctor()
	ActivityLafuliRudderTable.super.ctor(self, "activity_lafuli_rudder")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityLafuliRudderTable:getIDs()
	return self.ids
end

function ActivityLafuliRudderTable:getNum(id)
	return self:getNumber(id, "num")
end

function ActivityLafuliRudderTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityLafuliRudderTable
