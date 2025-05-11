-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/HouseFurnitureEffectTable.lua

local HouseFurnitureEffectTable = class("HouseFurnitureEffectTable", import("app.common.tables.BaseTable"))

function HouseFurnitureEffectTable:ctor()
	HouseFurnitureEffectTable.super.ctor(self, "house_furniture_effect")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function HouseFurnitureEffectTable:getIDs()
	return self.ids_
end

function HouseFurnitureEffectTable:getName(id)
	return self:getString(id, "name")
end

function HouseFurnitureEffectTable:effectName(id)
	return self:getString(id, "effect_name")
end

function HouseFurnitureEffectTable:action(id)
	return self:getString(id, "action")
end

function HouseFurnitureEffectTable:scale(id)
	return self:getNumber(id, "scale")
end

function HouseFurnitureEffectTable:count(id)
	return self:getNumber(id, "count")
end

function HouseFurnitureEffectTable:pos(id)
	return self:split2num(id, "pos", "|")
end

function HouseFurnitureEffectTable:heroPos(id)
	return self:split2num(id, "hero_pos", "|")
end

function HouseFurnitureEffectTable:clipPos(id)
	return self:split2num(id, "clip_pos", "|")
end

function HouseFurnitureEffectTable:type(id)
	return self:getNumber(id, "type")
end

function HouseFurnitureEffectTable:event(id)
	return self:getString(id, "event")
end

function HouseFurnitureEffectTable:slotName(id)
	return self:getString(id, "slot_name")
end

function HouseFurnitureEffectTable:isClip(id)
	return self:getNumber(id, "is_clip") == 1
end

function HouseFurnitureEffectTable:clipImg(id)
	return self:getString(id, "clip_img")
end

function HouseFurnitureEffectTable:eventIsClip(id)
	return self:getNumber(id, "event_is_clip") == 1
end

function HouseFurnitureEffectTable:eventHeroAction(id)
	return self:getString(id, "event_hero_action")
end

function HouseFurnitureEffectTable:eventHeroPos(id)
	return self:split2num(id, "event_hero_pos", "|")
end

function HouseFurnitureEffectTable:isHideImg(id)
	return self:getNumber(id, "is_hide_img") == 1
end

function HouseFurnitureEffectTable:nextAction(id)
	return self:getNumber(id, "next_action") or 0
end

function HouseFurnitureEffectTable:triggerRate(id)
	return self:split2num(id, "trigger_rate", "|") or {}
end

function HouseFurnitureEffectTable:triggerIDs(id)
	return self:split2num(id, "trigger_ids", "|") or {}
end

function HouseFurnitureEffectTable:gapTime(id)
	return self:getNumber(id, "gap_time") or 0
end

return HouseFurnitureEffectTable
