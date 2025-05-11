-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/PartnerAchievementTextTable.lua

local PartnerAchievementTextTable = class("PartnerAchievementTextTable", import("app.common.tables.BaseTable"))

function PartnerAchievementTextTable:ctor()
	PartnerAchievementTextTable.super.ctor(self, "partner_achievement_text_" .. tostring(xyd.Global.lang))

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, self:Number(id))
	end
end

function PartnerAchievementTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return PartnerAchievementTextTable
