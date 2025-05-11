-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/GovernTeamWeather.lua

local GovernTeamWeather = class("GovernTeamWeather", import("app.common.tables.BaseTable"))

function GovernTeamWeather:ctor()
	GovernTeamWeather.super.ctor(self, "govern_team_weather")
end

function GovernTeamWeather:effect(id)
	return self:split2num(id, "effect", "|")
end

function GovernTeamWeather:type(id)
	return self:getNumber(id, "type")
end

return GovernTeamWeather
