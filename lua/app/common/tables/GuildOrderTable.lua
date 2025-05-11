-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildOrderTable.lua

local GuildOrderTable = class("GuildOrderTable", import("app.common.tables.BaseTable"))

function GuildOrderTable:ctor()
	GuildOrderTable.super.ctor(self, "guild_order")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildOrderTable:getIDs()
	return self.ids_
end

function GuildOrderTable:getNext(id)
	return self:getNumber(id, "next_id")
end

function GuildOrderTable:getTime(id)
	return self:getNumber(id, "time")
end

function GuildOrderTable:getAwards(id)
	local awards = self:split2Cost(id, "awards", "|#")
	local res = {}

	for i, v in ipairs(awards) do
		res[i] = {
			itemID = v[1],
			num = v[2]
		}
	end

	return res
end

function GuildOrderTable:getUpCost(id)
	local arr = self:split2num(id, "up_cost", "#")

	if arr[1] == 0 then
		return
	end

	return {
		itemID = arr[1],
		num = arr[2]
	}
end

function GuildOrderTable:getPic(id)
	return self:getString(id, "picture")
end

return GuildOrderTable
