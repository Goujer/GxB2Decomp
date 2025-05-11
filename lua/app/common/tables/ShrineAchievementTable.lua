-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ShrineAchievementTable.lua

local ShrineAchievementTable = class("ShrineAchievementTable", import("app.common.tables.BaseTable"))

function ShrineAchievementTable:ctor()
	ShrineAchievementTable.super.ctor(self, "shrine_achievement")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ShrineAchievementTable:getAward(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function ShrineAchievementTable:hasID(id)
	if self.TableLua.rows[tostring(id)] then
		return true
	else
		return false
	end
end

function ShrineAchievementTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

return ShrineAchievementTable
