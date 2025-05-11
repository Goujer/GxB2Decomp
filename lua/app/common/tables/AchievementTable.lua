-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/AchievementTable.lua

local AchievementTable = class("AchievementTable", import("app.common.tables.BaseTable"))

function AchievementTable:ctor()
	AchievementTable.super.ctor(self, "achievement")

	self.ids_ = {}
	self.campaignIds_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)

		if self:getIsShowStage(id) == 1 then
			table.insert(self.campaignIds_, id)
		end
	end

	table.sort(self.campaignIds_)
end

function AchievementTable:getAward(id)
	local awards = xyd.split(self:getString(id, "awards"), "|")
	local res = {}

	for idx in pairs(awards) do
		local award = xyd.split(awards[idx], "#", true)

		table.insert(res, award)
	end

	return res
end

function AchievementTable:getAward2(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function AchievementTable:hasID(id)
	if self.TableLua.rows[tostring(id)] then
		return true
	else
		return false
	end
end

function AchievementTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function AchievementTable:getType(id)
	return self:getNumber(id, "achievement_type")
end

function AchievementTable:getIsShowStage(id)
	return self:getNumber(id, "is_show_stage")
end

function AchievementTable:getCampaignIds()
	return self.campaignIds_
end

return AchievementTable
