-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivitySakuraDateAwardTable.lua

local ActivitySakuraDateAwardTable = class("ActivitySakuraDateAwardTable", import("app.common.tables.BaseTable"))

function ActivitySakuraDateAwardTable:ctor()
	ActivitySakuraDateAwardTable.super.ctor(self, "activity_sakura_date_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end
end

function ActivitySakuraDateAwardTable:getAwards(id)
	return self:split2Cost(id + 1, "awards", "|#")
end

function ActivitySakuraDateAwardTable:getComplete(id)
	return self:getNumber(id, "complete")
end

function ActivitySakuraDateAwardTable:getIds()
	return self.ids_
end

return ActivitySakuraDateAwardTable
