-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityPartnerJackpotTable.lua

local BaseTable = import(".BaseTable")
local ActivityPartnerJackpotTable = class("ActivityPartnerJackpotTable", BaseTable)

function ActivityPartnerJackpotTable:ctor()
	ActivityPartnerJackpotTable.super.ctor(self, "activity_partner_jackpot")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, id)
	end

	table.sort(self.ids_, function(a, b)
		return a < b
	end)
end

function ActivityPartnerJackpotTable:get()
	if not ActivityPartnerJackpotTable.INSTANCE then
		ActivityPartnerJackpotTable.INSTANCE = ActivityPartnerJackpotTable.new()
	end

	return ActivityPartnerJackpotTable.INSTANCE
end

function ActivityPartnerJackpotTable:getIds()
	return self.ids_
end

function ActivityPartnerJackpotTable:getPartnerIds(id)
	return self:split2Cost(id, "partner_id", "|")
end

function ActivityPartnerJackpotTable:getPartnerXY(id)
	return self:split2Cost(id, "partner_xy", "|")
end

function ActivityPartnerJackpotTable:getPartnerScale(id)
	return self:split2Cost(id, "partner_scale", "|")
end

function ActivityPartnerJackpotTable:getNewIds(id)
	local partnerIds = self:getPartnerIds(id)
	local ifNew = self:shopNew(id)
	local result = {}

	for i, id in ipairs(partnerIds) do
		if ifNew[i] then
			table.insert(result, id)
		end
	end

	return result
end

function ActivityPartnerJackpotTable:shopNew(id)
	return self:split2num(id, "shop_new", "|")
end

return ActivityPartnerJackpotTable
