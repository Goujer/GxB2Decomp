-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GoogleAchievementTable.lua

local GoogleAchievementTable = class("GoogleAchievementTable", import("app.common.tables.BaseTable"))

function GoogleAchievementTable:ctor()
	GoogleAchievementTable.super.ctor(self, "googleAchievement")

	self.achievementID_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		self.achievementID_[id] = row.achievementID
	end
end

function GoogleAchievementTable:getArchieveID(id)
	return self.achievementID_[id]
end

return GoogleAchievementTable
