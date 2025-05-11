-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendTeamBossWeatherTable.lua

local FriendTeamBossWeatherTable = class("FriendTeamBossWeatherTable", import("app.common.tables.BaseTable"))

function FriendTeamBossWeatherTable:ctor()
	FriendTeamBossWeatherTable.super.ctor(self, "govern_team_weather")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end
end

function FriendTeamBossWeatherTable:getIDs()
	return self.ids_
end

function FriendTeamBossWeatherTable:getWeatherIcon(id)
	return self:getString(id, "weather_icon")
end

function FriendTeamBossWeatherTable:getWeatherName(id)
	return xyd.tables.friendTeamBossWeatherTextTable:getWeatherName(id)
end

function FriendTeamBossWeatherTable:getWeatherDesc(id)
	return xyd.tables.friendTeamBossWeatherTextTable:getWeatherDesc(id)
end

return FriendTeamBossWeatherTable
