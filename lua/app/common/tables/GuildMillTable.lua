-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildMillTable.lua

local GuildMillTable = class("GuildMillTable", import("app.common.tables.BaseTable"))

function GuildMillTable:ctor()
	GuildMillTable.super.ctor(self, "guild_mill")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, id)
	end

	table.sort(self.ids_, function(a, b)
		return tonumber(a) < tonumber(b)
	end)
end

function GuildMillTable:getIDs()
	return self.ids_
end

function GuildMillTable:getOrderNum(id)
	return self:getNumber(id, "order_num")
end

function GuildMillTable:getGold(id)
	return self:getNumber(id, "gold")
end

function GuildMillTable:getAllGold(id)
	return self:getNumber(id, "all_gold")
end

function GuildMillTable:getFactor(id)
	return self:getNumber(id, "factor")
end

function GuildMillTable:getPic(id)
	return self:getString(id, "picture")
end

function GuildMillTable:getMaxLev()
	return tonumber(self.ids_[#self.ids_])
end

function GuildMillTable:getIdByGold(num)
	for i = 1, #self.ids_ do
		local gold = self:getAllGold(self.ids_[i])

		if num < gold then
			return tonumber(self.ids_[i - 1])
		end
	end

	return tonumber(self.ids_[#self.ids_])
end

return GuildMillTable
