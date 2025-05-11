-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildExpTable.lua

local GuildExpTable = class("GuildExpTable", import("app.common.tables.BaseTable"))

function GuildExpTable:ctor()
	GuildExpTable.super.ctor(self, "guild_exp")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end

	table.sort(self.ids_)
end

function GuildExpTable:getIDs()
	return self.ids_
end

function GuildExpTable:getAllExp(id)
	return self:getNumber(id, "all_exp")
end

function GuildExpTable:getMember(id)
	return self:getNumber(id, "member")
end

function GuildExpTable:getAssistant(id)
	return self:getNumber(id, "assistant")
end

function GuildExpTable:getLev(exp)
	if not exp or exp == 0 then
		return 1
	end

	do
		local i = 1

		while i <= #self.ids_ do
			local lev = self.ids_[i]

			if exp < self:getNumber(lev, "all_exp") then
				return self.ids_[i - 1]
			end

			i = i + 1
		end
	end

	return self.ids_[#self.ids_]
end

return GuildExpTable
