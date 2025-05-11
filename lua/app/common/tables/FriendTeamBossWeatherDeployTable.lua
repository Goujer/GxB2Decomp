-- chunkname: @../../../Product/Bundles/Android/src/app/common/tables/FriendTeamBossWeatherDeployTable.lua

local FriendTeamBossWeatherDeployTable = class("FriendTeamBossWeatherDeployTable", import("app.common.tables.BaseTable"))

function FriendTeamBossWeatherDeployTable:ctor()
	FriendTeamBossWeatherDeployTable.super.ctor(self, "govern_team_weather_deploy")

	self.ids_ = {}

	local colIndexTable = self.TableLua.keys

	for id, _ in pairs(self.TableLua.rows) do
		local row = self.TableLua.rows[id]

		table.insert(self.ids_, self:Number(id))
	end
end

function FriendTeamBossWeatherDeployTable:getIDs()
	return self.ids_
end

function FriendTeamBossWeatherDeployTable:getWeatherID(bossID, index)
	for i = 1, #self.ids_ do
		if bossID >= self:getNumber(i, "lv_low") and bossID <= self:getNumber(i, "lv_high") then
			return self:getNumber(i, "weather" .. index)
		end
	end
end

return FriendTeamBossWeatherDeployTable
