-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildCompetitionActiveAwardTable.lua

local GuildCompetitionActiveAwardTable = class("GuildCompetitionActiveAwardTable", import("app.common.tables.BaseTable"))

function GuildCompetitionActiveAwardTable:ctor()
	GuildCompetitionActiveAwardTable.super.ctor(self, "guild_competition_active_award")

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildCompetitionActiveAwardTable:getIDs()
	return self.ids_
end

function GuildCompetitionActiveAwardTable:getAwards(id)
	return self:split2Cost(id, "awards", "#", true)
end

function GuildCompetitionActiveAwardTable:getValue(id)
	return self:getNumber(id, "value")
end

return GuildCompetitionActiveAwardTable
