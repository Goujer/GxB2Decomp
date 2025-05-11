-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDemoFightTable.lua

local ActivityDemoFightTable = class("ActivityDemoFightTable", import(".BaseTable"))

function ActivityDemoFightTable:ctor()
	ActivityDemoFightTable.super.ctor(self, "activity_demo_fight")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityDemoFightTable:getMonster2(id)
	return self:split2num(id, "monster2", "|")
end

function ActivityDemoFightTable:getMonster1(id)
	return self:split2num(id, "monster1", "|")
end

function ActivityDemoFightTable:getIds()
	return self.ids_
end

return ActivityDemoFightTable
