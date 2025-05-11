-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityStudyScoreTable.lua

local ActivityStudyScoreTable = class("ActivityStudyScoreTable", import("app.common.tables.BaseTable"))

function ActivityStudyScoreTable:ctor()
	ActivityStudyScoreTable.super.ctor(self, "activity_study_score")

	self.ids = {}

	for id, v in pairs(self.TableLua.rows) do
		table.insert(self.ids, tonumber(id))
	end

	table.sort(self.ids)
end

function ActivityStudyScoreTable:getPartnerID(id)
	return self:getNumber(id, "partner_id")
end

function ActivityStudyScoreTable:getOffest(id)
	return self:split2num(id, "unity_offset", "|")
end

function ActivityStudyScoreTable:getScale(id)
	return self:getNumber(id, "scale")
end

function ActivityStudyScoreTable:isInUse(id)
	return self:getNumber(id, "in_use")
end

function ActivityStudyScoreTable:getScore(id)
	return self:getNumber(id, "score")
end

function ActivityStudyScoreTable:getPartnerIDByScore(score)
	local partnerID, selectID

	for index, id in ipairs(self.ids) do
		local isInUse = self:isInUse(id)

		if isInUse and isInUse == 1 then
			local scoreNeed = self:getScore(id)

			if score < scoreNeed then
				break
			else
				selectID = id
				partnerID = self:getPartnerID(id)
			end
		end
	end

	return partnerID, self:getScale(selectID), self:getOffest(selectID), selectID
end

function ActivityStudyScoreTable:getWrongText(id)
	return xyd.tables.activityStudyScoreTextTable:getWrongText(id)
end

function ActivityStudyScoreTable:getRightText(id)
	return xyd.tables.activityStudyScoreTextTable:getRightText(id)
end

return ActivityStudyScoreTable
