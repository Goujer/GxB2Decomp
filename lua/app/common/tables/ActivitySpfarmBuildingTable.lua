-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpfarmBuildingTable.lua

local ActivitySpfarmBuildingTable = class("ActivitySpfarmBuildingTable", import("app.common.tables.BaseTable"))

function ActivitySpfarmBuildingTable:ctor()
	ActivitySpfarmBuildingTable.super.ctor(self, "activity_spfarm_building")

	self.ids_ = {}
	self.commonBuildArr = {}
	self.highBuildArr = {}
	self.specialBuildArr = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local buildType = self:getType(id)

		if buildType == 1 then
			table.insert(self.commonBuildArr, tonumber(id))
		elseif buildType == 2 then
			table.insert(self.highBuildArr, tonumber(id))
		elseif buildType == 3 or buildType == 4 then
			table.insert(self.specialBuildArr, tonumber(id))
		end
	end

	table.sort(self.ids_)
	table.sort(self.commonBuildArr)
	table.sort(self.highBuildArr)
	table.sort(self.specialBuildArr)
end

function ActivitySpfarmBuildingTable:getIDs()
	return self.ids_
end

function ActivitySpfarmBuildingTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivitySpfarmBuildingTable:getIcon(id)
	return self:getString(id, "icon")
end

function ActivitySpfarmBuildingTable:getOutcome(id)
	return self:split2Cost(id, "outcome", "#", true)
end

function ActivitySpfarmBuildingTable:getDefense(id)
	return self:getNumber(id, "defense")
end

function ActivitySpfarmBuildingTable:getCost(id)
	return self:split2Cost(id, "cost", "#", true)
end

function ActivitySpfarmBuildingTable:getCostExchange(id)
	return self:split2Cost(id, "cost_exchange", "#", true)
end

function ActivitySpfarmBuildingTable:getCostFast(id)
	return self:split2Cost(id, "cost_fast", "#", true)
end

function ActivitySpfarmBuildingTable:getCommonBuildIds()
	return self.commonBuildArr
end

function ActivitySpfarmBuildingTable:getHighBuildArr()
	return self.highBuildArr
end

function ActivitySpfarmBuildingTable:getSpecialBuildArr()
	return self.specialBuildArr
end

return ActivitySpfarmBuildingTable
