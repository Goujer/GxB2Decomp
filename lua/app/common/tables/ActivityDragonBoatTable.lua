-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityDragonBoatTable.lua

local ActivityDragonBoatTable = class("ActivityDragonBoatTable", import("app.common.tables.BaseTable"))

function ActivityDragonBoatTable:ctor()
	ActivityDragonBoatTable.super.ctor(self, "activity_chose_gift")
end

function ActivityDragonBoatTable:getIds()
	local ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(ids, tonumber(id))
	end

	ids.sort()

	return ids
end

function ActivityDragonBoatTable:getAward(id)
	return xyd.tables.giftTable:getAwards(id)
end

function ActivityDragonBoatTable:getExAward(id, index)
	return self:split2Cost(id, "awards" .. index, "|#")
end

function ActivityDragonBoatTable:getExAwardNum(id)
	return self:getNumber(id, "num")
end

function ActivityDragonBoatTable:getLimit(id)
	return xyd.tables.giftBagTable:getBuyLimit(id)
end

return ActivityDragonBoatTable
