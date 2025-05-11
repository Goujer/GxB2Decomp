-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityEntranceTestMonsterTable.lua

local ActivityEntranceTestMonsterTable = class("ActivityEntranceTestMonsterTable", import(".BaseTable"))
local testPartnerTable = xyd.tables.activityWarmupArenaPartnerTable

function ActivityEntranceTestMonsterTable:ctor()
	ActivityEntranceTestMonsterTable.super.ctor(self, "activity_warmup_guess_monster")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityEntranceTestMonsterTable:getPartnerId(id)
	return self:getNumber(id, "partner_id")
end

function ActivityEntranceTestMonsterTable:getCrystal(id)
	return self:getNumber(id, "crystal")
end

function ActivityEntranceTestMonsterTable:getAntique(id)
	return self:getNumber(id, "antique")
end

function ActivityEntranceTestMonsterTable:getSuitIndex(id)
	return self:getNumber(id, "equip_skill")
end

function ActivityEntranceTestMonsterTable:getPotential(id)
	return self:split2num(id, "potentials", "|")
end

function ActivityEntranceTestMonsterTable:getPartnerData(id)
	local table_id = self:getPartnerId(id)
	local targetPartner = testPartnerTable:getPartnerId(table_id)
	local PartnerNew = import("app.models.Partner")
	local partner = PartnerNew.new()
	local equips = xyd.tables.activityWarmupArenaPartnerTable:getEquips(table_id)

	equips[5] = self:getCrystal(table_id)
	equips[6] = self:getAntique(table_id)

	partner:populate({
		partner_id = 0,
		isUpdateAttrs = false,
		awake = 5,
		tableID = targetPartner,
		star = xyd.tables.partnerTable:getStar(targetPartner),
		lev = xyd.tables.partnerTable:getMaxlev(targetPartner, 5),
		grade = xyd.tables.partnerTable:getMaxGrade(targetPartner),
		equips = equips,
		potentials = self:getPotential(table_id),
		ex_skills = {
			5,
			5,
			5,
			5
		},
		skill_index = self:getSuitIndex(id)
	})

	partner.lev = partner:getMaxLev(partner:getGrade(), partner:getAwake())

	return partner
end

function ActivityEntranceTestMonsterTable:getIds()
	return self.ids_
end

return ActivityEntranceTestMonsterTable
