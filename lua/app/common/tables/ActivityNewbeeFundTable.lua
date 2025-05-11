-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewbeeFundTable.lua

local ActivityNewbeeFundTable = class("ActivityNewbeeFundTable", import("app.common.tables.BaseTable"))

function ActivityNewbeeFundTable:ctor()
	ActivityNewbeeFundTable.super.ctor(self, "activity_newbee_fund")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityNewbeeFundTable:getIds()
	return self.ids_
end

function ActivityNewbeeFundTable:getAwards(id)
	return self:split2num(id, "awards", "#")
end

function ActivityNewbeeFundTable:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivityNewbeeFundTable:isPreview(id)
	return self:getNumber(id, "preview")
end

function ActivityNewbeeFundTable:hasEffect(id)
	return self:getNumber(id, "effect") == 1
end

function ActivityNewbeeFundTable:isNew(id)
	return self:getNumber(id, "new_show") == 1
end

return ActivityNewbeeFundTable
