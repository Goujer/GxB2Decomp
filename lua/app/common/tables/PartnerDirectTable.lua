-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerDirectTable.lua

local BaseTable = import(".BaseTable")
local PartnerDirectTable = class("PartnerDirectTable", BaseTable)

function PartnerDirectTable:ctor()
	PartnerDirectTable.super.ctor(self, "direct")

	self.ids = {}

	for id in pairs(self.TableLua.rows) do
		table.insert(self.ids, id)
	end

	table.sort(self.ids)
end

function PartnerDirectTable:getTableIds(id)
	return self:split2num(id, "table_ids", "|")
end

function PartnerDirectTable:getName(id)
	return xyd.tables.partnerDirectTextTable:getName(id)
end

function PartnerDirectTable:getGroup(id)
	return self:getNumber(id, "group")
end

function PartnerDirectTable:getBrief(id)
	return xyd.tables.partnerDirectTextTable:getBrief(id)
end

function PartnerDirectTable:getDesc(id)
	return xyd.tables.partnerDirectTextTable:getDesc(id)
end

function PartnerDirectTable:getPointAtk(id)
	return self:getNumber(id, "point_atk")
end

function PartnerDirectTable:getPointArm(id)
	return self:getNumber(id, "point_arm")
end

function PartnerDirectTable:getPointSpd(id)
	return self:getNumber(id, "point_spd")
end

function PartnerDirectTable:getPointCtrl(id)
	return self:getNumber(id, "point_ctrl")
end

function PartnerDirectTable:getPointSup(id)
	return self:getNumber(id, "point_hp")
end

function PartnerDirectTable:getPartnerType(id)
	return self:split2num(id, "partner_type", "|")
end

function PartnerDirectTable:getLabelId(id, index)
	return self:getNumber(id, "label_id" .. tostring(index))
end

function PartnerDirectTable:getRankDungeon(id)
	return self:getNumber(id, "rank_dungeon")
end

function PartnerDirectTable:getRankTower(id)
	return self:getNumber(id, "rank_tower")
end

function PartnerDirectTable:getRankArena(id)
	return self:getNumber(id, "rank_arena")
end

function PartnerDirectTable:getRankGuild(id)
	return self:getNumber(id, "rank_guild")
end

function PartnerDirectTable:getSkillId(id, index)
	return self:getNumber(id, "skill_id" .. tostring(index))
end

function PartnerDirectTable:getSkillName(id, index)
	return xyd.tables.partnerDirectTextTable:getSkillName(id, index)
end

function PartnerDirectTable:getSkillDesc(id, index)
	return xyd.tables.partnerDirectTextTable:getSkillDesc(id, index)
end

function PartnerDirectTable:getSkillIcon(id, index)
	return self:getString(id, "skill_icon" .. tostring(index))
end

function PartnerDirectTable:getArtifactId(id, index)
	return self:getNumber(id, "artifact_id" .. tostring(index))
end

function PartnerDirectTable:getArtifactName(id, index)
	return xyd.tables.partnerDirectTextTable:getArtifactName(id, index)
end

function PartnerDirectTable:getArtifactDesc(id, index)
	return xyd.tables.partnerDirectTextTable:getArtifactDesc(id, index)
end

function PartnerDirectTable:getArtifactIcon(id, index)
	return self:getString(id, "artifact_id" .. tostring(index))
end

return PartnerDirectTable
