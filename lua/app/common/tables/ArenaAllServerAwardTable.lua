-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/ArenaAllServerAwardTable.lua

local ArenaAllServerAwardTable = class("ArenaAllServerAwardTable", import("app.common.tables.BaseTable"))

function ArenaAllServerAwardTable:ctor()
	ArenaAllServerAwardTable.super.ctor(self, "arena_all_server_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_, function(a, b)
		if a ~= b then
			return a < b
		end

		return false
	end)
end

function ArenaAllServerAwardTable:getIDs()
	return self.ids_
end

function ArenaAllServerAwardTable:getRank(id)
	return self:getNumber(id, "rank")
end

function ArenaAllServerAwardTable:getCount(id)
	return self:getString(id, "count")
end

function ArenaAllServerAwardTable:getAward(id)
	return self:split2num(id, "award", "#")
end

function ArenaAllServerAwardTable:getAwards(id)
	return self:split2Cost(id, "award", "|#")
end

function ArenaAllServerAwardTable:getDesc(id)
	return xyd.tables.arenaAllServerAwardTextTable:getDesc(id)
end

return ArenaAllServerAwardTable
