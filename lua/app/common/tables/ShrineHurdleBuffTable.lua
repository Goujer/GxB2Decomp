-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineHurdleBuffTable.lua

local ShrineHurdleBuffTable = class("ShrineHurdleBuffTable", import("app.common.tables.BaseTable"))

function ShrineHurdleBuffTable:ctor()
	ShrineHurdleBuffTable.super.ctor(self, "shrine_hurdle_buff")
end

function ShrineHurdleBuffTable:getCost(id)
	return self:split2Cost(id, "cost", "#")
end

function ShrineHurdleBuffTable:getUpgrade1(id)
	return self:split2Cost(id, "upgrade_1", "#")
end

function ShrineHurdleBuffTable:getUpgrade2(id)
	return self:split2Cost(id, "upgrade_2", "#")
end

function ShrineHurdleBuffTable:getSkillIcon(id)
	return self:getString(id, "image")
end

function ShrineHurdleBuffTable:getSkillNum(id)
	return self:split2num(id, "value", "|")
end

return ShrineHurdleBuffTable
