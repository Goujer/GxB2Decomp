-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GuildCompetitionMissionTextTable.lua

local GuildCompetitionMissionTextTable = class("GuildCompetitionMissionTextTable", import("app.common.tables.BaseTable"))

function GuildCompetitionMissionTextTable:ctor()
	GuildCompetitionMissionTextTable.super.ctor(self, "guild_competition_mission_text" .. "_" .. xyd.Global.lang)

	self.ids_ = {}

	for id, _ in pairs(self.TableLua.rows) do
		table.insert(self.ids_, tonumber(id))
	end

	table.sort(self.ids_)
end

function GuildCompetitionMissionTextTable:getIDs()
	return self.ids_
end

function GuildCompetitionMissionTextTable:getDesc(id)
	return self:getString(id, "desc")
end

return GuildCompetitionMissionTextTable
