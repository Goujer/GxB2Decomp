-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AdventureEventTable.lua

local AdventureEventTable = class("AdventureEventTable", import(".BaseTable"))

function AdventureEventTable:ctor()
	AdventureEventTable.super.ctor(self, "travel_event")
end

function AdventureEventTable:getType(id)
	return self:getNumber(id, "type")
end

function AdventureEventTable:getBattleId(id)
	return self:split2Cost(id, "battle_id", "|#", true)
end

function AdventureEventTable:getMap(id)
	return self:getNumber(id, "map")
end

function AdventureEventTable:getModelIndex(id)
	return self:getNumber(id, "model")
end

function AdventureEventTable:getCost(id)
	return self:split(id, "consume", "#")
end

function AdventureEventTable:getRewards(id, lv)
	return self:split2Cost(id, "dropbox_ids", "|", true)[lv]
end

function AdventureEventTable:getDialogText(id)
	return self:getString(id, "text")
end

return AdventureEventTable
