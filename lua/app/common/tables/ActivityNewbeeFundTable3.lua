-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityNewbeeFundTable3.lua

local ActivityNewbeeFundTable3 = class("ActivityNewbeeFundTable3", import("app.common.tables.BaseTable"))

function ActivityNewbeeFundTable3:ctor()
	ActivityNewbeeFundTable3.super.ctor(self, "activity_newbee_fund3")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityNewbeeFundTable3:getIds()
	return self.ids_
end

function ActivityNewbeeFundTable3:getAwards(id)
	return self:split2num(id, "awards", "#")
end

function ActivityNewbeeFundTable3:getCost(id)
	return self:split2num(id, "cost", "#")
end

function ActivityNewbeeFundTable3:isPreview(id)
	return self:getNumber(id, "preview")
end

function ActivityNewbeeFundTable3:hasEffect(id)
	return self:getNumber(id, "effect") == 1
end

function ActivityNewbeeFundTable3:isNew(id)
	return self:getNumber(id, "new_show") == 1
end

return ActivityNewbeeFundTable3
