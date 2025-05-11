-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArcticExpeditionCellsTypeTable.lua

local ArcticExpeditionCellsTypeTable = class("ArcticExpeditionCellsTypeTable", import(".BaseTable"))

function ArcticExpeditionCellsTypeTable:ctor()
	ArcticExpeditionCellsTypeTable.super.ctor(self, "activity_ept_cell_type")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ArcticExpeditionCellsTypeTable:getFunctionID(id)
	return self:getNumber(id, "function_id")
end

function ArcticExpeditionCellsTypeTable:getBattleCount(id)
	return self:getNumber(id, "battle_count")
end

function ArcticExpeditionCellsTypeTable:getBattleCount2(id)
	return self:getNumber(id, "battle_count_2")
end

function ArcticExpeditionCellsTypeTable:getBattleIDs(id)
	return self:split2Cost(id, "battle_ids", "|", false)
end

function ArcticExpeditionCellsTypeTable:getNeutralChange(id)
	return self:getNumber(id, "neutral_change")
end

function ArcticExpeditionCellsTypeTable:getThirdShrink(id)
	return self:getNumber(id, "third_shrink")
end

function ArcticExpeditionCellsTypeTable:getIconImg(id)
	return self:getString(id, "icon")
end

function ArcticExpeditionCellsTypeTable:getBuildingIcon(id)
	return self:getString(id, "building_icon")
end

function ArcticExpeditionCellsTypeTable:getBuildingEffect(id)
	return self:split2Cost(id, "building_fx", "|#", false)
end

function ArcticExpeditionCellsTypeTable:getCellPower(id)
	return self:getNumber(id, "power")
end

function ArcticExpeditionCellsTypeTable:getScoreShrink(id)
	return self:getNumber(id, "score_shrink")
end

function ArcticExpeditionCellsTypeTable:getScoreFirst(id)
	return self:getNumber(id, "score_first")
end

function ArcticExpeditionCellsTypeTable:getContribution(id)
	return self:getNumber(id, "contribution")
end

function ArcticExpeditionCellsTypeTable:getScorePeriod(id)
	return self:getNumber(id, "score_period")
end

function ArcticExpeditionCellsTypeTable:getMapBuffs(id)
	return self:split2Cost(id, "map_buffs", "|", true)
end

function ArcticExpeditionCellsTypeTable:getTruceTime(id)
	return self:getNumber(id, "truce")
end

function ArcticExpeditionCellsTypeTable:getCellName(id)
	return xyd.tables.arcticExpeditionCellsTypeTextTable:getName(id)
end

function ArcticExpeditionCellsTypeTable:getCellDesc(id)
	return xyd.tables.arcticExpeditionCellsTypeTextTable:getDesc(id)
end

function ArcticExpeditionCellsTypeTable:getIds()
	return self.ids_
end

return ArcticExpeditionCellsTypeTable
