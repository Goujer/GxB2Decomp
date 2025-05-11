-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewbeeFundTable2.lua

local ActivityNewbeeFundTable2 = class("ActivityNewbeeFundTable2", import("app.common.tables.BaseTable"))

function ActivityNewbeeFundTable2:ctor()
	ActivityNewbeeFundTable2.super.ctor(self, "activity_newbee_fund2")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityNewbeeFundTable2:getIds()
	return self.ids_
end

function ActivityNewbeeFundTable2:getAwards(id)
	return self:split2num(id, "awards", "#")
end

function ActivityNewbeeFundTable2:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivityNewbeeFundTable2:isPreview(id)
	return self:getNumber(id, "preview")
end

function ActivityNewbeeFundTable2:hasEffect(id)
	return self:getNumber(id, "effect") == 1
end

function ActivityNewbeeFundTable2:isNew(id)
	return self:getNumber(id, "new_show") == 1
end

return ActivityNewbeeFundTable2
