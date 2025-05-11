-- chunkname: @../../../Product/Bundles/Android/src/app/controllers/DownloadController.lua

local DownloadController = class("DownloadController", import("app.controllers.BaseController"))
local json = require("cjson.safe")
local PlayerPrefs = UnityEngine.PlayerPrefs
local VERSION_FILE = "version.json"
local guide_res = {}
local first5Star = {
	51001,
	51003,
	51004,
	51005,
	51007,
	51009,
	51010,
	52002,
	52003,
	52005,
	52006,
	52008,
	52009,
	52010,
	53002,
	53003,
	53005,
	53006,
	53008,
	53009,
	53010,
	54001,
	54002,
	54003,
	54004,
	54005,
	54006,
	54009
}
local partnerCardSheetNums = {
	7,
	8,
	7,
	7,
	4,
	4
}
local priority_res = {
	{
		"atlases/icon_image_web.bytes",
		"atlases/icon_image2_web.bytes",
		"atlases/campaign_02_web.bytes",
		"Spine/checkin_web/guanggao02_lihui01.bytes",
		"Spine/checkin_web/fx_login_finish.bytes",
		"Spine/checkin_web/fx_login_circle.bytes",
		"textures/activity_web/check_in_pop_up/check_in_pop_up_background.bytes",
		"spine/shop_web/shangdianjie.bytes",
		"textures/shop_web/market_bg.bytes",
		"textures/scenes_web/market_scene.bytes",
		"spine/shop_web/shangdian3.bytes",
		"atlases/main_win_text_" .. xyd.lang .. "_web.bytes",
		"atlases/function_text_" .. xyd.lang .. "_web.bytes"
	},
	{
		"atlases/battle_choose_web.bytes",
		"atlases/person_info_web.bytes",
		"atlases/house_web.bytes",
		"atlases/guild_flag_web.bytes",
		"atlases/guild_territory_web.bytes",
		"atlases/guild_web.bytes"
	},
	{},
	{}
}
local preload_tex = {
	"summon_scene",
	"battle_loading_2"
}

function DownloadController.get()
	if DownloadController.INSTANCE == nil then
		DownloadController.INSTANCE = DownloadController.new()
	end

	return DownloadController.INSTANCE
end

function DownloadController:ctor()
	self.groupIndex = 0

	self:init()
end

function DownloadController:init()
	for i = 1, #first5Star do
		local picPath = xyd.getPicturePath(first5Star[i])

		if picPath and picPath ~= "" then
			local truePath = string.lower(picPath) .. ".bytes"

			table.insert(priority_res[1], truePath)
		end
	end

	for i = 1, 6 do
		local sheetName = string.format("atlases/partner_avatar_%d_web.bytes", i)

		table.insert(priority_res[3], sheetName)
	end

	for i = 1, #partnerCardSheetNums do
		for j = 1, partnerCardSheetNums[i] do
			local sheetName = string.format("atlases/partner_card_group_%d_sheet_%d_web.bytes", i, j)

			table.insert(priority_res[4], sheetName)
		end
	end
end

function DownloadController:getNextGroup()
	self.groupIndex = self.groupIndex + 1

	return "__silence_download__" .. self.groupIndex
end

function DownloadController:silenceDownload()
	if UNITY_ANDROID or UNITY_IOS then
		XYDCo.WaitForTime(2, function()
			print("================== START SILENCE DOWNLOAD WEB ==================")

			local silenceVersions = self:getSilenceVersions()

			self.silenceVersions_ = silenceVersions

			local function complete()
				print("================== FINISH SILENCE DOWNLOAD WEB ==================")
			end

			self.completeCallback = complete

			self:downloadFiles(silenceVersions, complete)
		end, "__silence_download__")
	end

	self:preloadTex()
end

function DownloadController:getSilenceVersions()
	local silenceVersions = {}
	local dict = {}

	for _, path in pairs(guide_res) do
		dict[path] = true

		table.insert(silenceVersions, {
			priority = -1,
			paths = {
				path
			}
		})
	end

	for p, paths in ipairs(priority_res) do
		for _, path in ipairs(paths) do
			dict[path] = true

			table.insert(silenceVersions, {
				priority = p,
				paths = {
					path
				}
			})
		end
	end

	if not xyd.needBackUpdate then
		local currentVersionInfos = json.decode(FileUtils.ReadResStringInData(VERSION_FILE))

		if not currentVersionInfos then
			return silenceVersions
		end

		local spineRes = {}

		for _, versionInfo in pairs(currentVersionInfos.resources) do
			local path = versionInfo.path
			local type = versionInfo.type

			if dict[path] or type == 3 then
				-- block empty
			elseif type == 4 then
				if string.sub(path, 1, 5) == "spine" then
					table.insert(spineRes, {
						priority = 10000,
						paths = {
							path
						}
					})
				else
					table.insert(silenceVersions, {
						priority = 9999,
						paths = {
							path
						}
					})
				end
			end
		end

		for i = 1, #spineRes do
			table.insert(silenceVersions, spineRes[i])
		end
	end

	print("##### BACK DOWNLOAD WEB FILES")

	return silenceVersions
end

function DownloadController:downloadFiles(versionInfos, callback, startIndex)
	if #versionInfos <= 0 then
		return callback()
	end

	local function download(index)
		if self.isStopLoad_ then
			self.needResume_ = true

			return
		end

		self.needResume_ = false

		if index > #versionInfos then
			self.curLoadIndex_ = -1

			return callback()
		end

		self.curLoadIndex_ = index

		local paths = versionInfos[index].paths
		local group = self:getNextGroup()

		ResCache.DownloadABs(group, paths, function(status)
			download(index + 1)
		end, nil)
	end

	if startIndex and startIndex > 0 then
		download(startIndex)
	else
		download(1)
	end
end

function DownloadController:stopDownload()
	self.isStopLoad_ = true
end

function DownloadController:resumeDownload()
	self.isStopLoad_ = false

	if self.curLoadIndex_ and self.curLoadIndex_ > 0 and self.needResume_ then
		self:downloadFiles(self.silenceVersions_, self.completeCallback, self.curLoadIndex_ + 1)
	end
end

function DownloadController:preloadTex()
	local paths = {}

	for i = 1, #preload_tex do
		local path = xyd.getTexturePath(preload_tex[i])

		table.insert(paths, path)
	end

	ResManager.PreloadABsByPathAsync("preload_tex" .. xyd.getServerTime(), paths, function()
		return
	end, function(progress)
		return
	end)
end

return DownloadController
