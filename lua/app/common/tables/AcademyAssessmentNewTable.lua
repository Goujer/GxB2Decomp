-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AcademyAssessmentNewTable.lua

local BaseTable = import(".BaseTable")
local AcademyAssessmentNewTable = class("AcademyAssessmentNewTable", BaseTable)

function AcademyAssessmentNewTable:ctor()
	AcademyAssessmentNewTable.super.ctor(self, "school_practise_new")

	self.ids = {}
	self.fortIds = {}
	self.firstIds = {}
	self.lastIds = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))

		local row = self.TableLua.rows[id]
		local fortID = tonumber(row[colIndexTable.fort_id])

		if not self.fortIds[fortID] then
			self.fortIds[fortID] = {}
		end

		table.insert(self.fortIds[fortID], tonumber(id))

		if self:checkIfFirst(tonumber(id)) then
			self.firstIds[fortID] = id
		end

		if self:getNext(tonumber(id)) == -1 then
			self.lastIds[fortID] = id
		end
	end

	table.sort(self.ids)

	for _, ids in pairs(self.fortIds) do
		table.sort(ids)
	end
end

function AcademyAssessmentNewTable:getFirstId(fortId)
	return self.firstIds[fortId]
end

function AcademyAssessmentNewTable:checkIfFirst(id)
	return self:getNumber(id, "fort_first") == 1
end

function AcademyAssessmentNewTable:getIDs()
	return self.ids
end

function AcademyAssessmentNewTable:getFortIds()
	return self.fortIds
end

function AcademyAssessmentNewTable:getIdsByFort(fortID)
	return self.fortIds[fortID] or {}
end

function AcademyAssessmentNewTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function AcademyAssessmentNewTable:getLen(fortId)
	return self.lastIds[fortId] - self.firstIds[fortId] + 1
end

function AcademyAssessmentNewTable:getIndex(fortID, id)
	local ids = self:getIdsByFort(fortID)
	local index = -1

	for i = 1, #ids do
		if ids[i] == id then
			index = i

			break
		end

		i = i + 1
	end

	return index
end

function AcademyAssessmentNewTable:getBattleId(id, groupId)
	return self:getNumber(id, "battle_id" .. groupId)
end

function AcademyAssessmentNewTable:getReward(id)
	return self:split2Cost(id, "first_reward", "|#")
end

function AcademyAssessmentNewTable:getSweepReward(id)
	return self:split2Cost(id, "sweep_reward", "|#")
end

function AcademyAssessmentNewTable:getNotFirstPassReward(id)
	return self:split2Cost(id, "non_first_reward", "|#")
end

function AcademyAssessmentNewTable:fortName(fortId)
	return xyd.tables.academyAssessmentTextTable:fortName(fortId)
end

function AcademyAssessmentNewTable:description(fortId)
	return xyd.tables.academyAssessmentTextTable:description(fortId)
end

function AcademyAssessmentNewTable:getFortID(id)
	return self:getNumber(id, "fort_id")
end

function AcademyAssessmentNewTable:getFortImg(fortId)
	return self:getString(self.fortIds[fortId][0], "fort_img")
end

function AcademyAssessmentNewTable:getPower(id)
	return self:getString(id, "power")
end

function AcademyAssessmentNewTable:getSchoolSort(id)
	return self:getNumber(id, "school_sort")
end

return AcademyAssessmentNewTable
