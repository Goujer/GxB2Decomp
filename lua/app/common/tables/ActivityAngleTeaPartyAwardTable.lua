-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityAngleTeaPartyAwardTable.lua

local ActivityAngleTeaPartyAwardTable = class("ActivityAngleTeaPartyAwardTable", import("app.common.tables.BaseTable"))

function ActivityAngleTeaPartyAwardTable:ctor()
	ActivityAngleTeaPartyAwardTable.super.ctor(self, "activity_angelteaparty_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivityAngleTeaPartyAwardTable:getIDs()
	return self.ids_
end

function ActivityAngleTeaPartyAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

function ActivityAngleTeaPartyAwardTable:getPoint(id)
	return self:getNumber(id, "point")
end

function ActivityAngleTeaPartyAwardTable:getPlotID(id)
	return self:getNumber(id, "plot_id")
end

function ActivityAngleTeaPartyAwardTable:getBattleID(id)
	return self:split2Cost(id, "battle_id", "|")
end

return ActivityAngleTeaPartyAwardTable
