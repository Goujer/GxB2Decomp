-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AdventureBoxTable.lua

local AdventureBoxTable = class("AdventureBoxTable", import(".BaseTable"))

function AdventureBoxTable:ctor()
	AdventureBoxTable.super.ctor(self, "travel_box")

	self.ids = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function AdventureBoxTable:getIDs()
	return self.ids
end

function AdventureBoxTable:getTimeCost(id)
	return self:getNumber(id, "time_consume")
end

function AdventureBoxTable:getFixAward(id)
	return self:split2Cost(id, "award1", "|#", true)
end

function AdventureBoxTable:getRandAwardId1(id)
	return self:getNumber(id, "dropbox_id1")
end

function AdventureBoxTable:getRandAwardId2(id)
	return self:getNumber(id, "dropbox_id2")
end

function AdventureBoxTable:getCost(id)
	return self:split(id, "pay_consume", "#")
end

return AdventureBoxTable
