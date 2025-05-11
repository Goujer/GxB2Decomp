-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ActivityFreebuyAwardTable.lua

local ActivityFreebuyAwardTable = class("ActivityFreebuyAwardTable", import("app.common.tables.BaseTable"))

function ActivityFreebuyAwardTable:ctor()
	ActivityFreebuyAwardTable.super.ctor(self, "activity_freebuy_awards")

	self.ids_ = {}
	self.idsByType_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))

		local type = self:getType(id)

		if not self.idsByType_[type] then
			self.idsByType_[type] = {}
		end

		table.insert(self.idsByType_[type], tonumber(id))
	end

	table.sort(self.ids_)
end

function ActivityFreebuyAwardTable:getIds()
	return self.ids_
end

function ActivityFreebuyAwardTable:getIdsByType(type)
	local ids = self.idsByType_[type]

	table.sort(ids, function(a, b)
		local dayA = self:getDay(a)
		local dayB = self:getDay(b)

		return dayA < dayB
	end)

	return ids
end

function ActivityFreebuyAwardTable:getAwardIdByTypeAndDay(type, day_need)
	local ids = self.idsByType_[type]

	for _, id in ipairs(ids) do
		local day = self:getDay(id)

		if day == day_need then
			return id
		end
	end

	return 0
end

function ActivityFreebuyAwardTable:getType(id)
	return self:getNumber(id, "type")
end

function ActivityFreebuyAwardTable:getDay(id)
	return self:getNumber(id, "day")
end

function ActivityFreebuyAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#")
end

return ActivityFreebuyAwardTable
