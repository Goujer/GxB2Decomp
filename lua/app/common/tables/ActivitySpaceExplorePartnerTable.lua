-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySpaceExplorePartnerTable.lua

local ActivitySpaceExplorePartnerTable = class("ActivitySpaceExplorePartnerTable", import("app.common.tables.BaseTable"))

function ActivitySpaceExplorePartnerTable:ctor()
	ActivitySpaceExplorePartnerTable.super.ctor(self, "activity_space_explore_partner")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivitySpaceExplorePartnerTable:getIDs()
	return self.ids_
end

function ActivitySpaceExplorePartnerTable:getAvatar(id)
	return self:getString(id, "avatar")
end

function ActivitySpaceExplorePartnerTable:getNameId(id)
	return self:getNumber(id, "name1")
end

function ActivitySpaceExplorePartnerTable:getPartnerModel(id)
	return self:getNumber(id, "partner_model")
end

function ActivitySpaceExplorePartnerTable:getShowIds(id)
	return self:getNumber(id, "show_ids")
end

function ActivitySpaceExplorePartnerTable:getAtkId(id)
	return self:getNumber(id, "atk_id")
end

function ActivitySpaceExplorePartnerTable:getGrade(id)
	return self:getNumber(id, "grade")
end

function ActivitySpaceExplorePartnerTable:getMinLv(id)
	return self:getNumber(id, "min_lv")
end

function ActivitySpaceExplorePartnerTable:getMaxLv(id)
	return self:getNumber(id, "max_lv")
end

function ActivitySpaceExplorePartnerTable:getBaseAtk(id)
	return self:getNumber(id, "base_atk")
end

function ActivitySpaceExplorePartnerTable:getBaseHp(id)
	return self:getNumber(id, "base_hp")
end

function ActivitySpaceExplorePartnerTable:getBaseArm(id)
	return self:getNumber(id, "base_arm")
end

function ActivitySpaceExplorePartnerTable:getGrowAtk(id)
	return self:getNumber(id, "grow_atk")
end

function ActivitySpaceExplorePartnerTable:getGrowHp(id)
	return self:getNumber(id, "grow_hp")
end

function ActivitySpaceExplorePartnerTable:getGrowArm(id)
	return self:getNumber(id, "grow_arm")
end

function ActivitySpaceExplorePartnerTable:getCombineCost(id)
	return self:split2Cost(id, "combine_cost", "|#", true)
end

function ActivitySpaceExplorePartnerTable:getLvCost1(id)
	return self:split2Cost(id, "lv_cost1", "#", true)
end

function ActivitySpaceExplorePartnerTable:getLvCost2(id)
	return self:split2Cost(id, "lv_cost2", "#", true)
end

function ActivitySpaceExplorePartnerTable:getSkillId(id)
	return self:split2Cost(id, "skill_id", "|", true)
end

function ActivitySpaceExplorePartnerTable:getSkillLv(id)
	return self:split2Cost(id, "skill_lv", "|", true)
end

function ActivitySpaceExplorePartnerTable:getDecompose(id)
	return self:split2Cost(id, "decompose", "|#", true)
end

function ActivitySpaceExplorePartnerTable:getSkillTextId(id)
	return self:getNumber(id, "skill_desc_id")
end

function ActivitySpaceExplorePartnerTable:notShow(id)
	return self:getNumber(id, "not_show")
end

return ActivitySpaceExplorePartnerTable
