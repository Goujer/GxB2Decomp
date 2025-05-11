-- chunkname: @../../../Product/Bundles/Android/src/app/common/network/LogPoster.lua

local json = require("cjson")
local LogPoster = class("LogPoster")
local UPLOAD_INTERVAL = 5
local MAX_LOG = 5

function LogPoster:ctor()
	self.enabled = false
	self._timer = Timer.New(handler(self, self.timerCallback), UPLOAD_INTERVAL, -1, false)
	self._dbs = {
		logEconomy = xyd.db.logEconomy,
		logItem = xyd.db.logItem,
		logQuest = xyd.db.logQuest,
		logBuilding = xyd.db.logBuilding,
		logLevel = xyd.db.logLevel
	}
end

function LogPoster.get()
	if LogPoster.INSTANCE == nil then
		LogPoster.INSTANCE = LogPoster.new()
	end

	return LogPoster.INSTANCE
end

function LogPoster:run()
	self._timer:Start()
end

function LogPoster:stop()
	self._timer:Stop()
end

function LogPoster:timerCallback()
	if not self.enabled then
		return
	end

	for k, db in pairs(self._dbs) do
		self:tryPost(db)
	end
end

function LogPoster:tryPost(db)
	local logs = db:getAll(MAX_LOG)

	if logs == nil or #logs <= 0 then
		return
	end

	local logString = logs
	local info = {
		logs = logString
	}

	xyd.Backend.get():postLog(info, function(response, success)
		local data = response.payload

		xyd.db.playerInfo:addOrUpdate("last_log_time", data.last_log_time)

		if success and data and data.success then
			db:delete(MAX_LOG)
		end
	end)
end

return LogPoster
