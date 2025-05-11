-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/BackUpdateController.lua

local BackUpdateController = class("BackUpdateController", import("app.controllers.BaseController"))
local json = require("cjson")
local Application = UnityEngine.Application
local PlayerPrefs = UnityEngine.PlayerPrefs
local add_counter = 0
local VERSION_FILE = "version.json"

function BackUpdateController.get()
	if BackUpdateController.INSTANCE == nil then
		BackUpdateController.INSTANCE = BackUpdateController.new()
	end

	return BackUpdateController.INSTANCE
end

function BackUpdateController:ctor()
	self.isUpdating = false
end

function BackUpdateController:getVersion()
	if self.version == nil then
		self.version = PlayerPrefs.GetString("__version__") or ""
	end

	return self.version
end

function BackUpdateController:getVersionUrl(serverVersion)
	local versionUrl = ""

	if UNITY_IOS then
		if jit.arch == "arm" then
			versionUrl = XYDUtils.CdnUrl() .. "iOS/version_ios" .. serverVersion .. "_32.json"
		else
			versionUrl = XYDUtils.CdnUrl() .. "iOS/version_ios" .. serverVersion .. ".json"
		end
	elseif UNITY_ANDROID then
		if jit.arch == "arm" then
			versionUrl = XYDUtils.CdnUrl() .. "Android/version_android" .. serverVersion .. "_32.json"
		else
			versionUrl = XYDUtils.CdnUrl() .. "Android/version_android" .. serverVersion .. ".json"
		end
	end

	return versionUrl
end

function BackUpdateController:getUpdateVersionInfos(newVersionInfos)
	local currentVersionInfos = json.decode(FileUtils.ReadResStringInData(VERSION_FILE))
	local updatedVersionInfos = {}
	local currentVersionTable = {}

	for _, versionInfo in pairs(currentVersionInfos.resources) do
		local path = versionInfo.path
		local md5 = versionInfo.md5

		currentVersionTable[path .. md5] = versionInfo
	end

	for _, versionInfo in pairs(newVersionInfos.resources) do
		local path = versionInfo.path
		local type = versionInfo.type
		local md5 = versionInfo.md5

		if currentVersionTable[path .. md5] == nil then
			local downloadInfo = {
				path = versionInfo.path,
				res = versionInfo.res,
				type = versionInfo.type,
				md5 = versionInfo.md5,
				size = versionInfo.size,
				version = newVersionInfos.version
			}

			if type == 1 or type == 2 or type == 3 then
				table.insert(updatedVersionInfos, downloadInfo)
			end
		end
	end

	return updatedVersionInfos
end

function BackUpdateController:delayBackUpdate(params)
	XYDCo.WaitForTime(60, function()
		self:backUpdate(params)
	end, "__BACK__UPDATE__")
end

function BackUpdateController:backUpdate(params)
	if self.isUpdating then
		return
	end

	if params == nil then
		return
	end

	local serverVersion = params.curr_version
	local minPkgVersion = params.min_version
	local needRestart = params.need_restart or 0
	local currentVersion = self:getVersion()
	local pkgVersion = Application.version
	local versionUrl = self:getVersionUrl(serverVersion)

	print("currentVersion: " .. currentVersion .. ",  serverVersion: " .. serverVersion .. ", pkgVersion: " .. pkgVersion .. ", minPkgVersion: " .. minPkgVersion .. ", versionUrl: " .. versionUrl)

	local function complete()
		self.isUpdating = false

		if needRestart == 1 then
			print("new game resource loaded")

			if xyd.GuideController.get():isPlayGuide() then
				xyd.MainController.get():setNewGameResLoaded()

				return
			end

			UIManager.ShowConfirmAlert(__("TIPS"), __("NEW_GAME_RESOURCE_LOADED"), __("OK"), false, function()
				xyd.MainController.get():restartGame()
			end)
		else
			xyd.DownloadController.get():silenceDownload()
		end
	end

	local function downloadVersionFile()
		ResManager.DownloadString(versionUrl, function(status, response)
			if status == DownloadStatus.Success then
				print("=========== Download Back Update Version Success At " .. versionUrl .. " ===========")
				self:updateRes(self:getUpdateVersionInfos(json.decode(response)), function()
					print("=========== BackUpdateController Done! ===========")
					FileUtils.WriteFile("__tmp__res__/" .. VERSION_FILE, response)
					PlayerPrefs.SetString("__tmp__version__", serverVersion)
					PlayerPrefs.Save()
					complete()
				end)
			elseif status == DownloadStatus.Failed then
				print("=========== Download Back Update Version Failed At " .. versionUrl .. ", Retry ===========")
				XYDCo.WaitForFrame(2, function()
					downloadVersionFile()
				end, "")
			end
		end)
	end

	if XYDUtils.CompVersion(currentVersion, serverVersion) < 0 and XYDUtils.CompVersion(minPkgVersion, pkgVersion) <= 0 then
		self.isUpdating = true

		print("=========== Start Silence Download ===========")

		if self.downloadInfos == nil then
			xyd.db.backDownloadInfo:openDB("download_tmp.db")

			self.downloadInfos = xyd.db.backDownloadInfo:getAll()
		end

		downloadVersionFile()
	end
end

function BackUpdateController:checkLazyDownload(path, type)
	if type == 2 then
		PlayerPrefs.DeleteKey(XYDDef.LazyLuaDownloadPrefix .. path)
	elseif type == 3 then
		PlayerPrefs.DeleteKey(XYDDef.LazyLz4DownloadPrefix .. path)
	end
end

function BackUpdateController:updateRes(versionInfos, callback)
	if #versionInfos <= 0 then
		return callback()
	end

	local function complete()
		self:clearDownloadInfos()
		xyd.db.backDownloadInfo:close()
		callback()
	end

	local function download(index)
		if index > #versionInfos then
			return complete()
		end

		local versionInfo = versionInfos[index]
		local downloadInfo = self:getDownloadInfo(versionInfo)

		if self:isDownloadFinished(downloadInfo) then
			return download(index + 1)
		end

		print("download_resource " .. index)
		self:downloadVersion(downloadInfo, versionInfo, function(status, progress)
			if status == DownloadStatus.Success then
				download(index + 1)
			elseif status == DownloadStatus.Failed then
				print("===BACKUPDATE Error===: -- version:" .. versionInfo.version .. ", resource:" .. versionInfo.res .. "." .. versionInfo.md5)
				XYDCo.WaitForFrame(2, function()
					download(index)
				end, "")
			end
		end, 0.5)
	end

	download(1)
end

function BackUpdateController:downloadVersion(downloadInfo, versionInfo, callback, interval)
	local path = downloadInfo.path

	local function download()
		ResManager.DownloadFile(XYDUtils.CdnUrl() .. versionInfo.res .. "." .. versionInfo.md5, versionInfo.md5, "__tmp__res__/" .. path, function(status)
			if status == DownloadStatus.Success then
				self:checkLazyDownload(path, versionInfo.type)

				downloadInfo.downloadedSize = versionInfo.size

				self:saveDownloadInfo(downloadInfo)
			end

			callback(status)
		end, function(status, progress)
			callback(status, progress)
		end)
	end

	download()
end

function BackUpdateController:getDownloadInfo(versionInfo)
	local path = versionInfo.path
	local downloadInfo = self.downloadInfos[path]

	if downloadInfo == nil or not self:isDownloaded(downloadInfo, versionInfo) then
		downloadInfo = downloadInfo or {}
		downloadInfo.version = versionInfo.version
		downloadInfo.size = versionInfo.size
		downloadInfo.downloadedSize = 0
		downloadInfo.path = versionInfo.path
	end

	return downloadInfo
end

function BackUpdateController:clearDownloadInfos()
	self.downloadInfos = {}

	xyd.db.backDownloadInfo:commit()
	xyd.db.backDownloadInfo:truncate()
end

function BackUpdateController:saveDownloadInfo(downloadInfo)
	if add_counter % 10 == 0 then
		xyd.db.backDownloadInfo:commit()
		xyd.db.backDownloadInfo:begin()
	end

	add_counter = add_counter + 1

	xyd.db.backDownloadInfo:add(downloadInfo)
end

function BackUpdateController:isDownloaded(downloadInfo, versionInfo)
	return downloadInfo ~= nil and versionInfo ~= nil and downloadInfo.version == versionInfo.version and downloadInfo.size == versionInfo.size
end

function BackUpdateController:isDownloadFinished(downloadInfo)
	return downloadInfo ~= nil and downloadInfo.downloadedSize == downloadInfo.size
end

return BackUpdateController
