-- chunkname: @../../../Product/Bundles/Android/src/UpdateController.lua

xyd = xyd or {}
xyd.db = xyd.db or {}

local json = require("cjson")
local Application = UnityEngine.Application
local PlayerPrefs = UnityEngine.PlayerPrefs
local GameObject = UnityEngine.GameObject
local LoadSceneMode = UnityEngine.SceneManagement.LoadSceneMode
local VERSION_FILE = "version.json"
local VERSION_FILE_32 = "version_32.json"
local OS_ANDROID = 1
local OS_IOS = 2
local add_counter = 0
local DOWNLOAD_THREADS_NUM = 8
local UNITY_APP_V = 1
local BACKEND_URLS = {
	"http://xuemeih5back.carolgames.com/api/v1",
	"http://xuemeih5back.carolgames.com/api/v1"
}

xyd.package2Language = {
	["com.moemoe.battle"] = {
		"en_en"
	},
	["com.summoner.sama"] = {
		"en_en"
	},
	["com.carolgames.moemoegirls"] = {
		"en_en"
	},
	["com.carolgames.moemoegirls.jp"] = {
		"ja_jp"
	}
}
xyd.package2LineID = {
	["com.moemoe.battle"] = "@bellavilla"
}
xyd.package2UnityID = {
	["com.summoner.sama"] = 1,
	["com.carolgames.moemoegirls"] = 2,
	["com.carolgames.moemoegirls.jp"] = 2
}

local sqlite3 = require("sqlite3")
local DownloadInfo = class("DownloadInfo")

function DownloadInfo:ctor()
	return
end

function DownloadInfo:createTable()
	self.db:exec("        CREATE TABLE IF NOT EXISTS downloadinfo (\n            path TEXT NOT NULL PRIMARY KEY,\n            version TEXT NOT NULL,\n            size INT NOT NULL DEFAULT 0,\n            downloadedSize INT NOT NULL DEFAULT 0\n        );\n    ")
end

function DownloadInfo:openDB(dbName)
	if self.dbName ~= dbName and self.db then
		self:close()
	end

	if self.db == nil or not self.db:isopen() then
		self.dbName = dbName

		local dbfile = XYDDef.DatabasePath .. dbName

		self.db = sqlite3.open(dbfile)

		if self.db == nil then
			os.remove(dbfile)

			self.db = sqlite3.open(dbfile)
		end

		self.db:exec("            PRAGMA synchronous=OFF;\n            PRAGMA temp_store = 2;\n        ")
		self:createTable()
	end
end

function DownloadInfo:getAll()
	local stmt = self.db:prepare("SELECT * FROM downloadinfo")
	local downloads = {}

	for row in stmt:nrows() do
		local path = row.path

		downloads[path] = row
	end

	stmt:finalize()

	return downloads
end

function DownloadInfo:add(downloadInfo)
	if downloadInfo == nil then
		return
	end

	local db = self.db

	if self.addStmt == nil then
		self.addStmt = db:prepare("            INSERT OR REPLACE INTO downloadinfo (path, version, size, downloadedSize) VALUES (?, ?, ?, ?)\n        ")
	end

	local stmt = self.addStmt

	stmt:bind_values(downloadInfo.path, downloadInfo.version, downloadInfo.size, downloadInfo.downloadedSize)

	local res = stmt:step()

	if db:errcode() ~= 101 then
		print(db:errcode())
		print(db:errmsg())
	end

	stmt:reset()
end

function DownloadInfo:begin()
	self.db:exec("        BEGIN;\n    ")

	self.inTransaction = true
end

function DownloadInfo:commit()
	if not self.inTransaction then
		return
	end

	self.db:exec("        COMMIT;\n    ")

	self.inTransaction = false
end

function DownloadInfo:truncate()
	self.db:exec("        DROP TABLE downloadinfo;\n    ")
	self:createTable()
end

function DownloadInfo:close()
	if self.addStmt ~= nil then
		self.addStmt:finalize()

		self.addStmt = nil
	end

	if self.db and self.db:isopen() then
		self.db:close()
	end

	self.db = nil
end

local UpdateController = {}

function UpdateController:run()
	xyd.isLoadingFinish = false

	self:initTranslation()
	self:getLastAccountInfo()

	self.failedTimes = 0

	if xyd.db.downloadInfo == nil then
		xyd.db.downloadInfo = DownloadInfo.new()
		xyd.db.backDownloadInfo = DownloadInfo.new()

		print("xyd.db.backDownloadInfo is nil?:", xyd.db.backDownloadInfo == nil)
	end

	xyd.backendInfo = {}

	self:checkUpdate()
end

function UpdateController:roundNum(value)
	value = tonumber(value) or 0

	return math.floor(value + 0.5)
end

function UpdateController:checkUpdate()
	if not UNITY_ANDROID or XYDUtils.CompVersion(Application.version, "1.0.84") >= 0 then
		UIManager.ShowProgrssBar(true)
	end

	UIManager.SetLoadingProgress(0.3, 0.05, false)
	UIManager.SetLoadingProgress("LOADING")
	self:setLoadingMessage("check_update")

	local displayVersion = self:getResourceVersion()

	if displayVersion == "" then
		displayVersion = Application.version
	end

	UIManager.SetLoadingVersion(displayVersion)
	self:checkResVersion(function(response)
		local payload = response.payload or {}
		local payloadVersionInfo = {}

		if UNITY_ANDROID then
			payloadVersionInfo = json.decode(payload.unity_android_version or "{}")
		elseif UNITY_IOS then
			payloadVersionInfo = json.decode(payload.unity_ios_version or "{}")
		end

		local serverVersion = payloadVersionInfo.curr_version or "0.1.0"
		local minPkgVersion = payloadVersionInfo.min_version or "0.1.0"
		local minHotVersion = payloadVersionInfo.min_hot_version or "0.1.0"
		local isMaintenance = payloadVersionInfo.is_maintenance or 0
		local isHttps = false
		local webProtocol = "http://"
		local port = payload.port

		if isHttps then
			port = payload.port_s
			webProtocol = "https://"
		end

		xyd.backendurl = payload.host .. ":" .. port
		xyd.backendInfo = payload

		print("backendurl", xyd.backendurl)

		self.updateTitle = payload.title or ""
		self.updateContent = payload.content or ""
		xyd.isReview = payload.is_review

		if not UNITY_ANDROID and not UNITY_IOS then
			xyd.isLoadingFinish = true
			xyd.res_version = "0.1.0"
			xyd.backendurl = "xuemeih5back.twwebgame.com"

			self:startGame(false)

			return
		end

		if xyd.isReview == 1 then
			self:setReviewLang()
		end

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

		local currentVersion = self:getVersion()
		local pkgVersion = Application.version

		print("currentVersion: " .. currentVersion .. ",  serverVersion: " .. serverVersion .. ", pkgVersion: " .. pkgVersion .. ", minPkgVersion: " .. minPkgVersion .. ", minHotVersion: " .. minHotVersion .. ", versionUrl: " .. versionUrl)

		local function getUpdateVersionInfos(newVersionInfos)
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
					elseif type == 4 then
						PlayerPrefs.SetString(XYDDef.LazyWebDownloadPrefix .. path, json.encode(downloadInfo))
					end
				end
			end

			return updatedVersionInfos
		end

		local function setLazyDownloadInfo()
			local currentVersionStr

			if jit.arch == "arm" then
				currentVersionStr = FileUtils.ReadResStringInApp(VERSION_FILE_32)
			else
				currentVersionStr = FileUtils.ReadResStringInApp(VERSION_FILE)
			end

			local currentVersionInfos = json.decode(currentVersionStr)

			for _, versionInfo in pairs(currentVersionInfos.resources) do
				local path = versionInfo.path
				local type = versionInfo.type
				local downloadInfo = {
					path = versionInfo.path,
					res = versionInfo.res,
					type = versionInfo.type,
					md5 = versionInfo.md5,
					size = versionInfo.size,
					version = currentVersionInfos.version
				}

				if type == 2 then
					PlayerPrefs.SetString(XYDDef.LazyLuaDownloadPrefix .. path, json.encode(downloadInfo))
				elseif type == 3 then
					PlayerPrefs.SetString(XYDDef.LazyLz4DownloadPrefix .. path, json.encode(downloadInfo))
				elseif type == 4 then
					PlayerPrefs.SetString(XYDDef.LazyWebDownloadPrefix .. path, json.encode(downloadInfo))
				end
			end

			FileUtils.WriteRes(VERSION_FILE, currentVersionStr)
		end

		local function complete(needRestart)
			local function onLanguageLoaded(restart, reloadLang)
				local function onInitResLoad()
					if isMaintenance == 1 then
						if self.updateTitle == "" or self.updateContent == "" or XYDUtils.CompVersion(pkgVersion, "0.1.0") <= 0 then
							UIManager.ShowConfirmAlert(__("TIPS"), __("SERVER_ERROR"), __("SURE"), false, function()
								XYDUtils.QuitGame()
							end)
						else
							self:showAnnounce(function()
								XYDUtils.QuitGame()
							end)
						end
					elseif restart then
						self:restartGame()
					else
						print("start preloadAbs")
						ResManager.PreloadABsAsync(function(success, obj)
							xyd.isLoadingFinish = true

							print("finish preloadAbs")

							if xyd.Global.isLoginInfoReceived then
								xyd.EventDispatcher.inner():dispatchEvent({
									name = xyd.event.GAME_START
								})
							end
						end)
						self:startGame(reloadLang)
					end
				end

				local function completeFunc(isSuccess)
					onInitResLoad()
				end

				local function progressFunc(progress)
					UIManager.SetLoadingProgress(progress, 0.2, false)
					UIManager.SetLoadingProgress("load init res " .. self:roundNum(progress * 100) .. "%")
				end

				ResManager.LoadInitRes(completeFunc, progressFunc, 0.1)
			end

			local pkgName = XYDDef.PkgName
			local languages = xyd.package2Language[pkgName]
			local languageKey = XYDDef.LazyLuaDownloadPrefix .. "src/data/tables/" .. xyd.lang .. "/translation_" .. xyd.lang .. ".lua"

			if languages[1] ~= xyd.lang and PlayerPrefs.HasKey(languageKey) then
				local updateVersions = {}
				local languageVersionStr = PlayerPrefs.GetString(languageKey, "")

				if languageVersionStr ~= "" then
					local downloadInfo = json.decode(languageVersionStr)

					table.insert(updateVersions, downloadInfo)
				end

				self:downloadTranslation(updateVersions, function()
					onLanguageLoaded(false, true)
				end)
			else
				onLanguageLoaded(needRestart, false)
			end
		end

		local function backUpdate()
			xyd.needBackUpdate = true
			xyd.backUpdateParams = {
				need_restart = 1,
				curr_version = serverVersion,
				min_version = minPkgVersion
			}

			complete(false)
		end

		local function downloadVersionFile()
			print("downloadVersionFile")
			self:setLoadingMessage("download version file " .. serverVersion)
			ResManager.DownloadString(versionUrl, function(status, response)
				if status == DownloadStatus.Success then
					PlayerPrefs.SetInt("__IS__UPDATING__", 1)
					self:updateRes(getUpdateVersionInfos(json.decode(response)), __("UPDATING"), function()
						FileUtils.WriteRes(VERSION_FILE, response)
						self:setResourceVersion(serverVersion)
						UIManager.SetLoadingVersion(serverVersion)
						PlayerPrefs.SetInt("__IS__UPDATING__", 0)
						complete(true)
					end)
				elseif status == DownloadStatus.Failed then
					print("===Update Error===: download version json failed(e:002) -- " .. versionUrl)
					complete(false)
				end
			end)
		end

		if currentVersion == "" then
			setLazyDownloadInfo()

			currentVersion = pkgVersion

			self:setResourceVersion(currentVersion)
		end

		local isFirstOpen = PlayerPrefs.GetInt("__IS__FIRST_OPEN__", 0) == 0

		if isFirstOpen then
			PlayerPrefs.SetInt("__IS__FIRST_OPEN__", 1)
		end

		if XYDUtils.CompVersion(currentVersion, serverVersion) >= 0 or xyd.isReview == 1 then
			complete(false)
		elseif XYDUtils.CompVersion(minPkgVersion, pkgVersion) > 0 then
			UIManager.ShowConfirmAlert(__("TIPS"), __("NEED_GO_APPSTORE"), __("SURE"), false, function()
				Application.OpenURL(xyd.pkgUpdateURL)
			end)
		else
			local tmpVersion = PlayerPrefs.GetString("__tmp__version__", "")
			local tmpVersionPath = "__tmp__res__/" .. VERSION_FILE
			local isTmpVersionExist = FileUtils.IsFileInData(tmpVersionPath)

			if XYDUtils.CompVersion(tmpVersion, currentVersion) > 0 and isTmpVersionExist then
				PlayerPrefs.SetInt("__IS__UPDATING__", 1)

				local jsonStr = FileUtils.ReadFileStringInData(tmpVersionPath)

				self:updateTmpRes(getUpdateVersionInfos(json.decode(jsonStr)), function()
					FileUtils.CopyFile2Res(tmpVersionPath, VERSION_FILE)
					self:setResourceVersion(tmpVersion)
					self:clearTmpVersionFiles()
					UIManager.SetLoadingVersion(tmpVersion)
					PlayerPrefs.SetInt("__IS__UPDATING__", 0)
					complete(true)
				end)
			elseif isFirstOpen or XYDUtils.CompVersion(currentVersion, minHotVersion) >= 0 then
				backUpdate()
			else
				downloadVersionFile()
			end
		end
	end)
end

function UpdateController:setReviewLang()
	local pkgName = XYDDef.PkgName
	local languages = xyd.package2Language[pkgName]

	if xyd.lang == languages[1] then
		return
	end

	xyd.lang = languages[1]
	XYDCore.GameLang = languages[1]

	if package.loaded["app.xinyoudi"] then
		package.loaded["app.xinyoudi"] = nil

		require("app.xinyoudi")
	elseif __ then
		__ = nil

		self:initTranslation()
	end
end

function UpdateController:setLoadingMessage(msg)
	if UNITY_ANDROID and XYDUtils.CompVersion(UnityEngine.Application.version, "1.2.56") <= 0 or UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "1.1.66") <= 0 then
		return
	end

	UIManager.SetLoadingMessage(msg)
end

function UpdateController:clearTmpVersionFiles()
	PlayerPrefs.DeleteKey("__tmp__version__")
	PlayerPrefs.Save()
	FileUtils.DeleteFileDirectory("__tmp__res__")
end

function UpdateController:checkResVersion(callback)
	local function retrieveVersionInfo()
		local os_id, device_id = OS_ANDROID, XYDSDK.Instance:GetDeviceID()
		local osStr = ""

		if UNITY_ANDROID then
			os_id = OS_ANDROID
			osStr = "android"
		elseif UNITY_IOS then
			os_id = OS_IOS
			osStr = "ios"
		end

		xyd.os_id = os_id

		print(os_id, device_id)

		local checkUrl = self:versionCheckURL()

		print("checkUrl=", checkUrl)

		local pkgName = XYDDef.PkgName
		local languages = xyd.package2Language[pkgName]
		local params = {
			is_unity = 1,
			mid = 1044,
			os = osStr,
			device_id = device_id,
			app_v = UNITY_APP_V,
			lang = languages[1]
		}

		if UNITY_IOS and XYDUtils.CompVersion(UnityEngine.Application.version, "1.1.32") >= 0 then
			params.app_v = XYDDef.GetGameVersion()

			local unityID = xyd.package2UnityID[pkgName]

			params.is_unity = unityID
		end

		local function onError()
			self.failedTimes = self.failedTimes + 1

			print("===Update Error===: check version failed(e:001), failed times: " .. self.failedTimes .. ", url: " .. checkUrl)

			if self.failedTimes >= 2 then
				UIManager.ShowAlert(__("TIPS"), __("CONNECT_EXCEPTION") .. "(e:001)", __("RETRY"), __("CANCEL_2"), false, function(yes)
					if yes then
						retrieveVersionInfo()
					else
						XYDUtils.QuitGame()
					end
				end)
			else
				retrieveVersionInfo()
			end
		end

		self:webRequest(checkUrl, params, function(response, success)
			if success then
				local payload = response.payload
				local errorCode = payload.error_code

				if errorCode ~= nil then
					print("error_code: " .. errorCode)
					onError()

					return
				end

				if callback ~= nil then
					callback(response)
				end
			else
				onError()
			end
		end)
	end

	retrieveVersionInfo()
end

function UpdateController:getLastAccountInfo()
	self.lastPlayerID = PlayerPrefs.GetInt("__player_id_key__", -1)
	self.lastPlayerName = PlayerPrefs.GetString("__player_name_key__", "")
	self.lastPlayerLevel = PlayerPrefs.GetInt("__player_level_key__", 1)
	self.lastKingdomID = PlayerPrefs.GetInt("__kingdom_id_key__", 1)
	self.lastCastleLevel = PlayerPrefs.GetInt("__castle_level_key__", 1)
end

function UpdateController:getLineID()
	local res = "mafiacitycs"
	local packageName = Application.identifier

	if packageName == "com.yottagames.gameofmafia" then
		if xyd.lang == "de_de" then
			res = "mafiasekretrin"
		elseif xyd.lang == "fr_fr" then
			res = "secretairemafia"
		elseif xyd.lang == "ja_jp" then
			res = "mafiajpgm"
		elseif xyd.lang == "ko_kr" then
			res = "mafiacitygm"
		elseif xyd.lang == "ru_ru" then
			res = "mafiacityrus"
		elseif xyd.lang == "es_es" then
			res = "mafiacityes"
		elseif xyd.lang == "tr_tr" then
			res = "mafya_sehri"
		else
			res = xyd.package2LineID[packageName]
		end
	else
		res = xyd.package2LineID[packageName]
	end

	return res or "mafiacitycs"
end

function UpdateController:versionCheckURL()
	if UNITY_EDITOR or UNITY_STANDALONE or XYDUtils.IsTest() then
		return XYDUtils.VersionCheckUrl()
	else
		return BACKEND_URLS[1]
	end
end

function UpdateController:webRequest(url, params, callback)
	local function complete(response, success)
		if callback ~= nil then
			callback(response or {}, success)
		end
	end

	local payload = json.encode(params or {})
	local request = HttpRequest.Request(url, "POST")

	request:AddField("payload", payload)
	print(string.format("Request web %s, post data %s", url, payload))
	request:SetTimeout(10)
	request:AddCallback(function(response)
		if not response.IsSuccess then
			local state = response.ReqState

			print(state)
			complete({}, false)

			return
		end

		local code = response.StatusCode
		local text = response.DataAsText

		print(string.format("Received from web code(%d) -- %s", code, text))

		if code ~= 200 then
			complete(nil, false)

			return
		end

		complete(json.decode(text), true)
	end)
	request:Send()
end

function UpdateController:clearDownloadInfos()
	self.downloadInfos = {}

	xyd.db.downloadInfo:commit()
	xyd.db.downloadInfo:truncate()
end

function UpdateController:saveDownloadInfo(downloadInfo)
	if add_counter % 10 == 0 then
		xyd.db.downloadInfo:commit()
		xyd.db.downloadInfo:begin()
	end

	add_counter = add_counter + 1

	xyd.db.downloadInfo:add(downloadInfo)
end

function UpdateController:isDownloadFinished(downloadInfo)
	return downloadInfo ~= nil and downloadInfo.downloadedSize == downloadInfo.size
end

function UpdateController:isDownloaded(downloadInfo, versionInfo)
	return downloadInfo ~= nil and versionInfo ~= nil and downloadInfo.version == versionInfo.version and downloadInfo.size == versionInfo.size
end

function UpdateController:recoverDownloadProgress(versionInfos)
	if self.downloadInfos == nil then
		xyd.db.downloadInfo:openDB("download.db")

		self.downloadInfos = xyd.db.downloadInfo:getAll()
	end

	local totalBytes = 0
	local totalDownloadBytes = 0

	for _, versionInfo in ipairs(versionInfos) do
		local path = versionInfo.path
		local md5 = versionInfo.md5
		local size = versionInfo.size

		totalBytes = totalBytes + size

		local downloadInfo = self.downloadInfos[path]

		if self:isDownloaded(downloadInfo, versionInfo) then
			totalDownloadBytes = totalDownloadBytes + (downloadInfo.downloadedSize or 0)
		end
	end

	return totalDownloadBytes, totalBytes
end

function UpdateController:getDownloadInfo(versionInfo)
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

function UpdateController:downloadVersion(downloadInfo, versionInfo, callback)
	local path = downloadInfo.path

	local function download()
		ResManager.DownloadRes(XYDUtils.CdnUrl() .. versionInfo.res .. "." .. versionInfo.md5, versionInfo.md5, path, function(status)
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

function UpdateController:checkLazyDownload(path, type)
	if type == 2 then
		PlayerPrefs.DeleteKey(XYDDef.LazyLuaDownloadPrefix .. path)
	elseif type == 3 then
		PlayerPrefs.DeleteKey(XYDDef.LazyLz4DownloadPrefix .. path)
	end
end

function UpdateController:downloadTranslation(versionInfos, callback)
	self:updateRes(versionInfos, __("LOADING"), callback)
end

function UpdateController:updateRes(versionInfos, desc, callback)
	if #versionInfos <= 0 then
		return callback()
	end

	local totalDownloadBytes, totalBytes = self:recoverDownloadProgress(versionInfos)

	local function complete()
		local versionInfo = versionInfos[#versionInfos]
		local version = versionInfo.version

		self:clearDownloadInfos()
		xyd.db.downloadInfo:close()
		XYDCo.WaitForFrame(60, function()
			UIManager.SetLoadingProgress(0, false)
			UIManager.SetLoadingProgress("")
			callback()
		end, nil)
	end

	local gindex = 0
	local complete_count = 0

	local function download(index)
		if index > #versionInfos then
			complete_count = complete_count + 1

			if complete_count >= DOWNLOAD_THREADS_NUM then
				UIManager.SetLoadingProgress(1, 0.4, false)
				UIManager.SetLoadingProgress(desc .. " 100%")

				return complete()
			end

			return
		end

		local versionInfo = versionInfos[index]
		local downloadInfo = self:getDownloadInfo(versionInfo)
		local progress = totalDownloadBytes / totalBytes * 0.6 + 0.4

		UIManager.SetLoadingProgress(progress, 0.2, false)
		UIManager.SetLoadingProgress(desc .. " " .. self:roundNum(progress * 100) .. "%")

		if self:isDownloadFinished(downloadInfo) then
			gindex = gindex + 1

			return download(gindex)
		end

		local tmpDownloadBytes = 0

		self:downloadVersion(downloadInfo, versionInfo, function(status, progress)
			if status == DownloadStatus.Success then
				totalDownloadBytes = totalDownloadBytes - tmpDownloadBytes
				totalDownloadBytes = totalDownloadBytes + versionInfo.size
				gindex = gindex + 1

				download(gindex)
			elseif status == DownloadStatus.Progress then
				totalDownloadBytes = totalDownloadBytes - tmpDownloadBytes
				tmpDownloadBytes = versionInfo.size * progress
				totalDownloadBytes = totalDownloadBytes + tmpDownloadBytes

				local progress2 = totalDownloadBytes / totalBytes * 0.6 + 0.4

				UIManager.SetLoadingProgress(progress2, 0.2, false)
				UIManager.SetLoadingProgress(desc .. " " .. self:roundNum(progress2 * 100) .. "%")
			elseif status == DownloadStatus.Failed then
				local function onDownloadFailed()
					totalDownloadBytes = totalDownloadBytes - tmpDownloadBytes

					download(index)
				end

				print("===Update Error===: download resource failed(e:003) -- version:" .. versionInfo.version .. ", res:" .. versionInfo.res .. "." .. versionInfo.md5)
				UIManager.ShowConfirmAlert(__("TIPS"), __("CONNECT_EXCEPTION") .. "(e:003)", __("RETRY"), false, function()
					onDownloadFailed()
				end)
			end
		end)
	end

	for i = 1, DOWNLOAD_THREADS_NUM do
		gindex = gindex + 1

		download(gindex)
	end
end

function UpdateController:updateTmpRes(versionInfos, callback)
	if #versionInfos <= 0 then
		return callback()
	end

	local function complete()
		XYDCo.WaitForFrame(60, function()
			UIManager.SetLoadingProgress(0, false)
			UIManager.SetLoadingProgress("")
			callback()
		end, nil)
	end

	local function copyFile(index)
		if index > #versionInfos then
			UIManager.SetLoadingProgress(1, 0.4, false)
			UIManager.SetLoadingProgress(__("LOADING") .. " 100%")

			return complete()
		end

		local versionInfo = versionInfos[index]
		local progress = index / #versionInfos * 0.6 + 0.4

		UIManager.SetLoadingProgress(progress, 0.2, false)
		UIManager.SetLoadingProgress(__("LOADING") .. " " .. self:roundNum(progress * 100) .. "%")

		local path = versionInfo.path

		FileUtils.CopyFile2Res("__tmp__res__/" .. path, path)
		self:checkLazyDownload(path, versionInfo.type)

		if index % 10 == 0 then
			XYDCo.WaitForEndOfFrame(function()
				copyFile(index + 1)
			end, "")
		else
			copyFile(index + 1)
		end
	end

	copyFile(1)
end

function UpdateController:initTranslation()
	print("===initTranslation")

	if not __ then
		print("===not __")

		local infos = {}
		local data = require("data.tables." .. xyd.lang .. ".translation_" .. xyd.lang)

		print("===data.tables.translation_" .. xyd.lang)

		for _, row in pairs(data.rows) do
			local key = row[1]
			local value = string.gsub(row[2], "|", "\n")
			local ordinals = {}

			for num in value:gmatch("{(%d+)}") do
				table.insert(ordinals, tonumber(num))
			end

			infos[key] = {
				format = value:gsub("{%d+}", "%%s"),
				ordinals = ordinals
			}
		end

		function __(name, ...)
			name = tostring(name)

			local info = infos[name]

			if info == nil then
				return name
			end

			local inargs = {
				...
			}
			local args = {}

			for _, index in ipairs(info.ordinals) do
				table.insert(args, inargs[index] or "")
			end

			return string.format(info.format, unpack(args))
		end
	end
end

function UpdateController:showAnnounce(callback)
	local message = self.updateTitle .. "\n\n"

	for _, content in ipairs(self.updateContent) do
		message = message .. content .. "\n"
	end

	UIManager.ShowUpdateAnnounce(__("UPDATE_ANNOUNCE"), message, "Textures/Banner_web/update_banner", __("CONFIRM_EXIT"), callback)
end

function UpdateController:getVersion()
	if self.version == nil then
		self.version = PlayerPrefs.GetString("__version__") or ""
		xyd.res_version = self.version
	end

	return self.version
end

function UpdateController:getResourceVersion()
	return PlayerPrefs.GetString("__version__", "")
end

function UpdateController:setResourceVersion(version)
	PlayerPrefs.SetString("__version__", version)
	PlayerPrefs.Save()

	self.version = version
	xyd.res_version = version
end

function UpdateController:startGame(reloadLang)
	UIManager.SetLoadingProgress(0.9, 1, false)
	self:cleanUp()
	print("=-=-=-=-=-=-=-=-=-=start Game-=-=-=-=-=-=-=-=-=-=-=")
	print("reload lang: " .. tostring(reloadLang))
	print("=-=-=-=-=-=-=-=-=-=start loadScene-=-=-=-=-=-=-=-=-=-=-=")
	SceneUtils.LoadScene("GuiScene", LoadSceneMode.Additive, function(scene, mode)
		print("=-=-=-=-=-=-=-=-=-=complete loadScene-=-=-=-=-=-=-=-=-=-=-=")

		if scene.name == "GuiScene" then
			require("app.Game").new():run(reloadLang)
		end
	end)
end

function UpdateController:restartGame()
	XYDApp.NeedRestart = true
end

function UpdateController:cleanUp()
	package.loaded["data.tables." .. xyd.lang .. ".translation_" .. xyd.lang] = nil
	package.loaded.UpdateController = nil
end

return UpdateController
