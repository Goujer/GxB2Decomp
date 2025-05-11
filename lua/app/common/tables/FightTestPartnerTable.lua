-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FightTestPartnerTable.lua

local FightTestPartnerTable = class("FightTestPartnerTable", import("app.common.tables.BaseTable"))

function FightTestPartnerTable:ctor()
	FightTestPartnerTable.super.ctor(self, "fight_test_partner")
end

function FightTestPartnerTable:getInfo(id)
	return {
		show_skin = false,
		table_id = self:getNumber(id, "table_id"),
		grade = self:getNumber(id, "grade"),
		level = self:getNumber(id, "level"),
		awake = self:getNumber(id, "awake"),
		equips = self:split2num(id, "equips", "|"),
		love_point = self:getNumber(id, "love_point"),
		is_vowed = self:getNumber(id, "is_vowed"),
		potentials = self:split2num(id, "potentials", "|"),
		skin_id = self:split2num(id, "equips", "|")[6],
		ex_skills = self:split2num(id, "exskill", "|"),
		star_origin = self:split2num(id, "star_origin", "|"),
		travel = self:getNumber(id, "travel_info"),
		skill_index = self:getNumber(id, "skill_index")
	}
end

return FightTestPartnerTable
