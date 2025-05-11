-- chunkname: @../../../Product/Bundles/Android/src/app/common/network/WebPictureManager.lua

local WebPictureManager = class("WebPictureManager")
local md5 = require("md5")
local DefaultPath = "Download/"

function WebPictureManager:ctor()
	self.dataPaths_ = {}
end

function WebPictureManager.get()
	if WebPictureManager.INSTANCE == nil then
		WebPictureManager.INSTANCE = WebPictureManager.new()
	end

	return WebPictureManager.INSTANCE
end

function WebPictureManager:addDataByUrl(url, fileName)
	self.dataPaths_[url] = fileName
end

function WebPictureManager:getDataByUrl(url, callback, savePath, fileName)
	savePath = savePath or DefaultPath

	if not BinaryUtils.Instance:ExistFile(savePath .. "ios_download") then
		BinaryUtils.Instance:WriteFile(savePath .. "ios_download", "for download dir")
	end

	local filePath

	if fileName then
		filePath = savePath .. fileName
	else
		filePath = savePath .. md5.sumhexa(url)
	end

	if not self.dataPaths_[url] and BinaryUtils.Instance:ExistFile(filePath) then
		self.dataPaths_[url] = filePath
	end

	if self.dataPaths_[url] then
		local data = NGUITools.Load(self.dataPaths_[url])

		if not tolua.isnull(data) then
			callback(true, data)
		else
			callback(false, data)
		end
	else
		local function onWebResponse(status)
			if status == DownloadStatus.Success then
				self.dataPaths_[url] = filePath

				local data = NGUITools.Load(filePath)

				callback(true, data)
			else
				callback(false)
			end
		end

		ResManager.DownloadFile(url, nil, filePath, onWebResponse)
	end
end

function WebPictureManager:checkHasFile(url, savePath, fileName)
	savePath = savePath or DefaultPath

	local filePath

	if fileName then
		filePath = savePath .. fileName
	else
		filePath = savePath .. md5.sumhexa(url)
	end

	if BinaryUtils.Instance:ExistFile(filePath) then
		return true
	else
		return false
	end
end

function WebPictureManager:setUITexture(url, uiTexture, width, height, callback, checkFunc, savePath, fileName)
	if url == nil then
		return
	end

	local function complete(res, data)
		if res then
			if tolua.isnull(uiTexture) then
				return
			end

			if checkFunc and checkFunc(url) == false then
				return
			end

			local texture = XYDUtils.CreateTexture2D(width or 128, height or 128, 4, false)

			if not XYDUtils.Texture2DLoadImg(texture, data) then
				return
			end

			uiTexture.mainTexture = texture

			if callback then
				callback(url, "texture")
			end
		end
	end

	self:getDataByUrl(url, complete, savePath, fileName)
end

function WebPictureManager:setGMUITexture(url, fileName, uiTexture, width, height, callback, checkFunc)
	return self:setUITexture(url, uiTexture, width, height, callback, checkFunc, xyd.GM_IMG_SAVE_PATH, fileName)
end

return WebPictureManager
