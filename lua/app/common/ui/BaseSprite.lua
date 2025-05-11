-- chunkname: @../../../Product/Bundles/Android/src/app/common/ui/BaseSprite.lua

local BaseSprite = class("BaseSprite")

function BaseSprite:ctor(go)
	self.go_ = go
	self.nguiSprite_ = go:GetComponent(typeof(UISprite))
	self.defaultAtlas_ = self.nguiSprite_.atlas
	self.defaultSpriteName_ = self.nguiSprite_.spriteName
	self.curAtlasName_ = nil
	self.curSpriteName_ = nil
	self.cachedAtlas_ = {}
end

function BaseSprite:loadImgAsync(atlasName, spriteName, callback)
	local function onFinish(prefab)
		local result = false

		if prefab ~= nil and not tolua.isnull(prefab) and not tolua.isnull(self.go_) then
			self.nguiSprite_.atlas = prefab
			self.nguiSprite_.spriteName = spriteName
			self.curAtlasName_ = atlasName
			self.curSpriteName_ = spriteName
			self.cachedAtlas_[atlasName] = 1
			result = true
		end

		if callback ~= nil then
			callback(result)
		end
	end

	if not XYDUtils.IsResourceInPackage("Atlases/" .. atlasName) then
		if self.curAtlasName_ == atlasName then
			if self.curSpriteName_ ~= spriteName then
				self.curSpriteName_ = spriteName
				self.nguiSprite_.spriteName = spriteName
			end

			if callback ~= nil then
				callback(true)
			end

			return
		end

		if self.cachedAtlas_[atlasName] == nil then
			self:reset()
		end

		xyd.AssetsLoader.get():loadUIAtlasAsync(atlasName, onFinish)
	else
		local atlas = xyd.AssetsLoader.get():loadUIAtlas(atlasName)

		if not atlas then
			xyd.AssetsLoader.get():loadUIAtlasAsync(atlasName, onFinish)

			return
		else
			xyd.Coroutines.WaitForEndOfFrame(function()
				onFinish(atlas)
			end, nil)
		end
	end
end

function BaseSprite:setHeadIconByURL(urlName)
	if self.curAtlasName_ == urlName then
		return
	end

	self.nextUrlName_ = urlName

	xyd.setHeadIconByURL(urlName, self.nguiSprite_, function(filePath, spriteName)
		if self.nextUrlName_ == urlName then
			self.curAtlasName_ = filePath
			self.curSpriteName_ = spriteName
		end
	end, function(loadUrlName)
		return self.nextUrlName_ == loadUrlName
	end)
end

function BaseSprite:setHeadIconByURL2(atlasName, spriteName, urlName)
	if self.curAtlasName_ ~= nil and self.curAtlasName_ == urlName then
		return
	end

	self:loadImgAsync(atlasName, spriteName, function()
		if urlName ~= nil then
			self:setHeadIconByURL(urlName)
		end
	end)
end

function BaseSprite:setHeadIconByFbURL(urlName, width, height)
	if self.curAtlasName_ == urlName then
		return
	end

	self.nextUrlName_ = urlName

	xyd.setHeadIconByFbURL(urlName, self.nguiSprite_, width, height, function(filePath, spriteName)
		self.curAtlasName_ = filePath
		self.curSpriteName_ = spriteName
	end, function(loadUrlName)
		return self.nextUrlName_ == loadUrlName
	end)
end

function BaseSprite:loadImgImmediate(atlasName, spriteName)
	if atlasName == nil or spriteName == nil then
		return
	end

	if self.curAtlasName_ == atlasName then
		if self.curSpriteName_ ~= spriteName then
			self.curSpriteName_ = spriteName
			self.nguiSprite_.spriteName = spriteName
		end

		return
	end

	local prefab = xyd.AssetsLoader.get():loadUIAtlas(atlasName)

	self.nguiSprite_.atlas = prefab
	self.nguiSprite_.spriteName = spriteName
	self.curAtlasName_ = atlasName
	self.curSpriteName_ = spriteName
end

function BaseSprite:getScript()
	return self.nguiSprite_
end

function BaseSprite:setActive(value)
	self.go_:SetActive(value)
end

function BaseSprite:reset()
	self.nguiSprite_.atlas = self.defaultAtlas_
	self.nguiSprite_.spriteName = self.defaultSpriteName_
end

function BaseSprite:MakePixelPerfect()
	local oldW = self.nguiSprite_.width

	self.nguiSprite_:MakePixelPerfect()

	local newW = self.nguiSprite_.width

	self.nguiSprite_.height = oldW / newW * self.nguiSprite_.height
	self.nguiSprite_.width = oldW
end

return BaseSprite
