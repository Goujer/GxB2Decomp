-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFanPaiTable.lua

local ActivityFanPaiTable = class("ActivityFanPaiTable", import("app.common.tables.BaseTable"))

function ActivityFanPaiTable:ctor()
	ActivityFanPaiTable.super.ctor(self, "activity_card")
end

function ActivityFanPaiTable:getIds()
	local ids = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(ids, tonumber(id))
	end

	table.sort(ids)

	return ids
end

function ActivityFanPaiTable:getAward(id)
	return self:split2num(id, "award", "#")
end

function ActivityFanPaiTable:getType(id)
	return self:getNumber(id, "is_big")
end

function ActivityFanPaiTable:getLimit(id)
	return self:getNumber(id, "num")
end

function ActivityFanPaiTable:getBigAwardID()
	local BigAwardID = 1
	local ids = self:getIds()

	for i = 1, #ids do
		if self:getType(i) == 1 then
			BigAwardID = i

			break
		end
	end

	return BigAwardID
end

return ActivityFanPaiTable
