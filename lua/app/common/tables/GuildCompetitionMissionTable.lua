-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildCompetitionMissionTable.lua

local GuildCompetitionMissionTable = class("GuildCompetitionMissionTable", import("app.common.tables.BaseTable"))

function GuildCompetitionMissionTable:ctor()
	GuildCompetitionMissionTable.super.ctor(self, "guild_competition_mission")

	self.ids_ = {}
	self.idsWithType = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)

	for i, id in pairs(self.ids_) do
		local type = self:getType(id)

		if not self.idsWithType[type] then
			self.idsWithType[type] = {}
		end

		table.insert(self.idsWithType[type], id)
	end
end

function GuildCompetitionMissionTable:getIDs()
	return self.ids_
end

function GuildCompetitionMissionTable:getCompleteValue(id)
	return self:getNumber(id, "complete_value")
end

function GuildCompetitionMissionTable:getLimit(id)
	return self:getNumber(id, "limit")
end

function GuildCompetitionMissionTable:getAwards(id)
	return self:split2Cost(id, "awards", "|#", true)
end

function GuildCompetitionMissionTable:getActive(id)
	return self:getNumber(id, "active") or 0
end

function GuildCompetitionMissionTable:getType(id)
	return self:getNumber(id, "type")
end

function GuildCompetitionMissionTable:getIdsWithType(type)
	return self.idsWithType[type]
end

return GuildCompetitionMissionTable
