-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AcademyAssessmentTable.lua

local BaseTable = import(".BaseTable")
local AcademyAssessmentTable = class("AcademyAssessmentTable", BaseTable)

function AcademyAssessmentTable:ctor()
	AcademyAssessmentTable.super.ctor(self, "school_practise")

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

function AcademyAssessmentTable:getFirstId(fortId)
	return self.firstIds[fortId]
end

function AcademyAssessmentTable:checkIfFirst(id)
	return self:getNumber(id, "fort_first") == 1
end

function AcademyAssessmentTable:getIDs()
	return self.ids
end

function AcademyAssessmentTable:getFortIds()
	return self.fortIds
end

function AcademyAssessmentTable:getIdsByFort(fortID)
	return self.fortIds[fortID] or {}
end

function AcademyAssessmentTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function AcademyAssessmentTable:getLen(fortId)
	return self.lastIds[fortId] - self.firstIds[fortId] + 1
end

function AcademyAssessmentTable:getIndex(fortID, id)
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

function AcademyAssessmentTable:getBattleId(id)
	return self:getNumber(id, "battle_id")
end

function AcademyAssessmentTable:getReward(id)
	return self:split2Cost(id, "first_reward", "|#")
end

function AcademyAssessmentTable:getSweepReward(id)
	return self:split2Cost(id, "sweep_reward", "|#")
end

function AcademyAssessmentTable:fortName(fortId)
	return xyd.tables.academyAssessmentTextTable:fortName(fortId)
end

function AcademyAssessmentTable:description(fortId)
	return xyd.tables.academyAssessmentTextTable:description(fortId)
end

function AcademyAssessmentTable:getFortID(id)
	return self:getNumber(id, "fort_id")
end

function AcademyAssessmentTable:getFortImg(fortId)
	return self:getString(self.fortIds[fortId][0], "fort_img")
end

function AcademyAssessmentTable:getPower(id)
	return self:getString(id, "power")
end

return AcademyAssessmentTable
