-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerAchievementTable.lua

local PartnerAchievementTable = class("PartnerAchievementTable", import("app.common.tables.BaseTable"))

function PartnerAchievementTable:ctor()
	PartnerAchievementTable.super.ctor(self, "partner_achievement")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end
end

function PartnerAchievementTable:getPartnerTableIDs(id)
	return self:split2num(id, "partner_id", "|")
end

function PartnerAchievementTable:getPlotID(id)
	return self:getNumber(id, "plot_id")
end

function PartnerAchievementTable:getCompleteValue(id)
	local value = self:split2Cost(id, "complete_value", "#")

	if #value == 0 then
		return 0
	end

	return value[#value]
end

function PartnerAchievementTable:getIcon(id)
	return self:getString(id, "bg_icon")
end

function PartnerAchievementTable:getType(id)
	return self:getNumber(id, "type")
end

function PartnerAchievementTable:getLastID(id)
	return self:getNumber(id, "last_id")
end

return PartnerAchievementTable
