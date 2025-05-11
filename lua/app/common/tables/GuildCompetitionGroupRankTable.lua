-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildCompetitionGroupRankTable.lua

local GuildCompetitionGroupRankTable = class("GuildCompetitionGroupRankTable", import("app.common.tables.BaseTable"))

function GuildCompetitionGroupRankTable:ctor()
	GuildCompetitionGroupRankTable.super.ctor(self, "guild_competition_group_rank")
end

function GuildCompetitionGroupRankTable:getIds()
	if not self.ids then
		self.ids = {}

		for key, _ in pairs(self.TableLua.rows) do
			table.insert(self.ids, self:getNumber(key, "id"))
		end

		table.sort(self.ids)
	end

	return self.ids
end

function GuildCompetitionGroupRankTable:getItems(id)
	return self:split2Cost(id, "awards", "|#")
end

function GuildCompetitionGroupRankTable:getFrame(id)
	return self:split2Cost(id, "frame", "|#")
end

function GuildCompetitionGroupRankTable:getRank(id)
	return self:getNumber(id, "rank")
end

function GuildCompetitionGroupRankTable:getIsPercentage(id)
	return self:getNumber(id, "is_percentage")
end

function GuildCompetitionGroupRankTable:getShow(id)
	return self:getString(id, "show")
end

return GuildCompetitionGroupRankTable
