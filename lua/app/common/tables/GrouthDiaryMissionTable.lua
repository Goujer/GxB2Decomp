-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GrouthDiaryMissionTable.lua

local GrouthDiaryMissionTable = class("GrouthDiaryMissionTable", import("app.common.tables.BaseTable"))

function GrouthDiaryMissionTable:ctor()
	GrouthDiaryMissionTable.super.ctor(self, "growth_diary_mission")

	self.ids_ = {}
	self.idsByChapter_ = {}
	self.chapterAward_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local chapter = self:getChapterID(id)

		if not self.idsByChapter_[chapter] then
			self.idsByChapter_[chapter] = {}

			local chapterAwards = self:getChapterAward(id)

			self.chapterAward_[chapter] = chapterAwards
		end

		table.insert(self.idsByChapter_[chapter], tonumber(id))
	end

	table.sort(self.ids_)
end

function GrouthDiaryMissionTable:getChapterAwards(chapter)
	return self.chapterAward_[chapter]
end

function GrouthDiaryMissionTable:getChapterLong()
	return #self.chapterAward_
end

function GrouthDiaryMissionTable:getIds()
	return self.ids_
end

function GrouthDiaryMissionTable:getIDsByChapter(chapter)
	if not chapter then
		return self.idsByChapter_
	end

	return self.idsByChapter_[chapter]
end

function GrouthDiaryMissionTable:getChapterID(id)
	return self:getNumber(id, "chapter_id")
end

function GrouthDiaryMissionTable:getGetWay(id)
	return self:getNumber(id, "getway")
end

function GrouthDiaryMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function GrouthDiaryMissionTable:getSpecial(id)
	return self:getNumber(id, "special_mission")
end

function GrouthDiaryMissionTable:getAward(id)
	return self:split2Cost(id, "awards", "#")
end

function GrouthDiaryMissionTable:getChapterAward(id)
	return self:split2Cost(id, "chapter_awards", "|#")
end

function GrouthDiaryMissionTable:getDesc(id)
	return xyd.tables.grouthDiaryMissionTextTable:getDesc(id)
end

return GrouthDiaryMissionTable
