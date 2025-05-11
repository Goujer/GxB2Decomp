-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityBeachBossTable.lua

local ActivityBeachBossTable = class("ActivityBeachBossTable", import("app.common.tables.BaseTable"))

function ActivityBeachBossTable:ctor()
	ActivityBeachBossTable.super.ctor(self, "activity_beach_boss")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityBeachBossTable:getIDs()
	return self.ids
end

function ActivityBeachBossTable:getHp(id)
	return self:getNumber(id, "hp")
end

function ActivityBeachBossTable:getModle(id)
	return self:getString(id, "modle")
end

function ActivityBeachBossTable:getSkin(id)
	return self:getNumber(id, "is_skin")
end

function ActivityBeachBossTable:getPoint(id)
	return self:getNumber(id, "point")
end

return ActivityBeachBossTable
