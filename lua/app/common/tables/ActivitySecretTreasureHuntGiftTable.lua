-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySecretTreasureHuntGiftTable.lua

local BaseTable = import(".BaseTable")
local ActivitySecretTreasureHuntGiftTable = class("ActivitySecretTreasureHuntGiftTable", BaseTable)

function ActivitySecretTreasureHuntGiftTable:ctor()
	BaseTable.ctor(self, "activity_secrettreasure_gift")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function ActivitySecretTreasureHuntGiftTable:getIds()
	return self.ids_
end

function ActivitySecretTreasureHuntGiftTable:getAward(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivitySecretTreasureHuntGiftTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ActivitySecretTreasureHuntGiftTable:getLimit(id)
	return self:getNumber(id, "limit")
end

return ActivitySecretTreasureHuntGiftTable
