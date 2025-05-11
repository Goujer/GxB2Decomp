-- chunkname: @../../../Product/Bundles/Android/src/app/common/network/ErrorLogPoster.lua

local json = require("cjson")
local ErrorLogPoster = class("ErrorLogPoster")
local UPLOAD_INTERVAL = 30
local MAX_FAILED_TIMES = 3
local MAX_ERROR_LOG = 5

function ErrorLogPoster.get()
	if ErrorLogPoster.INSTANCE == nil then
		ErrorLogPoster.INSTANCE = ErrorLogPoster.new()
	end

	return ErrorLogPoster.INSTANCE
end

function ErrorLogPoster:ctor()
	self.crashLogFailedTimes = {}
	self.enabled = false
end

function ErrorLogPoster:run()
	self:scheduleErrorLogUpload()
end

function ErrorLogPoster:scheduleErrorLogUpload()
	if self.errorLogTimer then
		self.errorLogTimer:Stop()

		self.errorLogTimer = nil
	end

	self.errorLogTimer = Timer.New(function()
		if not self.enabled then
			return
		end

		local logs = xyd.db.errorLog:getAll(MAX_ERROR_LOG)

		if logs == nil or #logs <= 0 then
			return self:scheduleErrorLogUpload()
		end

		for _, log in ipairs(logs) do
			if log ~= nil then
				log.player_id = xyd.Global.playerID
			end
		end

		local logString = json.encode(logs)

		xyd.Backend.get():errorLog(0, logString, function(success)
			if success then
				xyd.db.errorLog:delete(logs)
			end

			self:scheduleErrorLogUpload()
		end)
	end, UPLOAD_INTERVAL, 0, false)

	self.errorLogTimer:Start()
end

function ErrorLogPoster:scheduleCrashLogUpload()
	if self.crashLogTimer then
		self.crashLogTimer:Stop()

		self.crashLogTimer = nil
	end

	self.crashLogTimer = Timer.New(function()
		local files = json.decode(FileUtils.ListFiles("Crashes"))
		local fileNames = {}

		for _, file in ipairs(files) do
			if file:match("%.dmp$") ~= nil then
				table.insert(fileNames, file)
			end
		end

		if #fileNames <= 0 then
			return self:scheduleCrashLogUpload()
		end

		local function upload(index)
			local fileName = fileNames[index]

			xyd.Backend.get():errorLog(1, {
				fileName = fileName
			}, function(success)
				if success then
					self.crashLogFailedTimes[fileName] = nil

					FileUtils.DeleteFile("Crashes/" .. fileName)
				else
					local failedTimes = self.crashLogFailedTimes[fileName] or 0

					self.crashLogFailedTimes[fileName] = failedTimes + 1

					if self.crashLogFailedTimes[fileName] >= MAX_FAILED_TIMES then
						self.crashLogFailedTimes[fileName] = nil

						FileUtils.DeleteFile("Crashes/" .. fileName)
					end
				end

				self:scheduleCrashLogUpload()
			end)
		end

		upload(1)
	end, UPLOAD_INTERVAL, 0, false)

	self.crashLogTimer:Start()
end

function ErrorLogPoster:runtimeLogUpload()
	local fileNames = json.decode(FileUtils.ListFiles("Logs"))

	if #fileNames <= 0 then
		return
	end

	local function upload(index)
		local fileName = fileNames[index]

		xyd.Backend.get():errorLog(2, {
			fileName = fileName
		}, function(success)
			if success then
				-- block empty
			end

			if index < #fileNames then
				upload(index + 1)
			end
		end)
	end

	upload(1)
end

return ErrorLogPoster
