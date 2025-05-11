-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerChallengeTable.lua

local PartnerChallengeTable = class("PartnerChallengeTable", import("app.common.tables.BaseTable"))

function PartnerChallengeTable:ctor(tableName)
	local table_ = tableName or "partner_challenge"

	PartnerChallengeTable.super.ctor(self, table_)

	self.ids = {}
	self.fortIds = {}
	self.fort_2_activity = {}
	self.activity_2_fort = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, self:Number(id))

		local row = self.TableLua.rows[id]
		local fortID = self:Number(row[colIndexTable.fort_id])

		if not self.fortIds[fortID] then
			self.fortIds[fortID] = {}
		end

		table.insert(self.fortIds[fortID], self:Number(id))

		local activity_id = self:getIsActivity(id)

		if activity_id then
			self.fort_2_activity[fortID] = self:getIsActivity(id)
			self.activity_2_fort[activity_id] = fortID
		end
	end

	table.sort(self.ids)

	for _, v in pairs(self.fortIds) do
		table.sort(v)
	end
end

function PartnerChallengeTable:getIDs()
	return self.ids
end

function PartnerChallengeTable:getFortIds()
	return self.fortIds
end

function PartnerChallengeTable:getIdsByFort(fortID)
	return self.fortIds[fortID] or {}
end

function PartnerChallengeTable:getIndex(fortID, id)
	local ids = self:getIdsByFort(fortID)
	local index = -1

	for i = 1, #ids do
		if ids[i] == id then
			index = i

			break
		end
	end

	return index
end

function PartnerChallengeTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function PartnerChallengeTable:isPuzzle(id)
	return self:getNumber(id, "is_puzzle") == 1
end

function PartnerChallengeTable:getType(id)
	local fortID = self:getFortID(id)
	local ids = self:getIdsByFort(fortID)

	return self:getNumber(ids[1], "type")
end

function PartnerChallengeTable:getReward1(id)
	return self:split2Cost(id, "reward1", "|#")
end

function PartnerChallengeTable:getReward2(id)
	return self:split2Cost(id, "reward2", "|#")
end

function PartnerChallengeTable:getMap(id)
	return self:getString(id, "map")
end

function PartnerChallengeTable:plotId(id)
	return self:split2num(id, "plot_id", "#")
end

function PartnerChallengeTable:memoryPlotId(id)
	return self:split2num(id, "memory_plot_id", "|")
end

function PartnerChallengeTable:chapterIcon(id)
	return self:getString(id, "chapter_icon")
end

function PartnerChallengeTable:fortName(id)
	return xyd.tables.partnerChallengeTextTable:fortName(id)
end

function PartnerChallengeTable:fortName2(id)
	return xyd.tables.partnerChallengeTextTable:fortName2(id)
end

function PartnerChallengeTable:name(id)
	return xyd.tables.partnerChallengeTextTable:name(id)
end

function PartnerChallengeTable:description(id)
	return xyd.tables.partnerChallengeTextTable:description(id)
end

function PartnerChallengeTable:getFortID(id)
	return self:getNumber(id, "fort_id")
end

function PartnerChallengeTable:getFortImg(id)
	return self:getString(self.fortIds[id][1], "fort_img")
end

function PartnerChallengeTable:initialPartner(id)
	return self:split2num(id, "initial_partner", "|")
end

function PartnerChallengeTable:getIsActivity(id)
	return self:getNumber(id, "is_activity")
end

function PartnerChallengeTable:getActivityByFortId(fort_id)
	return self:getNumber(fort_id, "fort_2_activity")
end

function PartnerChallengeTable:getFortIdByActivityId(activity_id)
	return self:getNumber(activity_id, "activity_2_fort")
end

function PartnerChallengeTable:getSkillIds(id)
	return self:split2num(id, "skill_ids", "|")
end

function PartnerChallengeTable:getSkillDesc(id)
	return xyd.tables.partnerChallengeTextTable:getSkillDesc(id)
end

function PartnerChallengeTable:getIsFirst(id)
	return self:getNumber(id, "fort_first")
end

function PartnerChallengeTable:getPageNum()
	local num = 0

	for _, id in ipairs(self.ids) do
		if self:getIsFirst(id) == 1 then
			num = num + 1
		end
	end

	return num
end

return PartnerChallengeTable
