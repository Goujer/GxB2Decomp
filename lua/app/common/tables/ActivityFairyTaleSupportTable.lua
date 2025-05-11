-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFairyTaleSupportTable.lua

local ActivityFairyTaleSupportTable = class("ActivityFairyTaleSupportTable", import(".BaseTable"))

function ActivityFairyTaleSupportTable:ctor()
	ActivityFairyTaleSupportTable.super.ctor(self, "activity_fairytale_support")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFairyTaleSupportTable:getAvatarId(id)
	return self:getNumber(id, "avatar_id")
end

function ActivityFairyTaleSupportTable:getTotalHp(id)
	return self:getNumber(id, "hp")
end

return ActivityFairyTaleSupportTable
