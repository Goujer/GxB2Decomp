-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendTeamBossWeatherTextTable.lua

local FriendTeamBossWeatherTextTable = class("FriendTeamBossWeatherTextTable", import("app.common.tables.BaseTable"))

function FriendTeamBossWeatherTextTable:ctor()
	FriendTeamBossWeatherTextTable.super.ctor(self, "govern_team_weather_text_" .. tostring(xyd.Global.lang))
end

function FriendTeamBossWeatherTextTable:getWeatherName(id)
	return self:getString(id, "weather_name")
end

function FriendTeamBossWeatherTextTable:getWeatherDesc(id)
	return self:getString(id, "weather_desc")
end

return FriendTeamBossWeatherTextTable
