-- chunkname: @../../../Product/Bundles/Android/src/app/common/AssetsLoader.lua

local AssetsLoader = class("AssetsLoader")
local UAtlas = import("app.common.UAtlas")
local Object = UnityEngine.Object
local GameObject = UnityEngine.GameObject
local Sprite = UnityEngine.Sprite
local Texture = UnityEngine.Texture
local RuntimeAnimatorController = UnityEngine.RuntimeAnimatorController
local AudioClip = UnityEngine.AudioClip

function AssetsLoader.get()
	if AssetsLoader.INSTANCE == nil then
		AssetsLoader.INSTANCE = AssetsLoader.new()
	end

	return AssetsLoader.INSTANCE
end

function AssetsLoader:ctor()
	self.uAtlases_ = {}
	self.model3Ds_ = {}
	self.instanceMaterials_ = {}
	self.ui2dMaterilas_ = {}
	self.maskMaterials_ = {}
	self.cityStencilMaterials_ = {}
end

function AssetsLoader:load(path, type)
	return xyd.ResourceLoader.Instance:Load(path, type)
end

function AssetsLoader:loadShaderAsync(path, callback)
	xyd.ResourceLoader.Instance:LoadAsync(path, typeof(UnityEngine.Material), function(mtrl)
		if callback ~= nil and not tolua.isnull(mtrl) then
			callback(mtrl.shader)
		end
	end)
end

function AssetsLoader:loadRenderTexture(path)
	local rt = ResManager.LoadRenderTexture(path)

	return rt
end

function AssetsLoader:loadSprite(path)
	local sprite = ResManager.LoadSprite(path, typeof(Sprite))

	return sprite
end

function AssetsLoader:loadSpriteAsync(path, callback)
	ResManager.LoadSpriteAsync(path, typeof(Sprite), function(isSuccess, sprite)
		if callback ~= nil then
			callback(sprite)
		end
	end)
end

function AssetsLoader:loadSprites(paths)
	local sprites = ResManager.LoadSprites(paths, typeof(Sprite))

	return sprites
end

function AssetsLoader:loadSpritesAsync(paths, callback)
	ResManager.LoadSpritesAsync(paths, typeof(Sprite), function(isSuccess, sprites)
		if callback ~= nil then
			callback(sprites)
		end
	end)
end

function AssetsLoader:loadTexture(path)
	return ResManager.LoadTexture(path)
end

function AssetsLoader:loadTextureAsync(path, callback)
	ResManager.LoadTextureAsync(path, function(isSuccess, texture)
		if callback ~= nil then
			callback(texture)
		end
	end)
end

function AssetsLoader:loadUIAtlas(atlasName)
	local atlas = ResManager.LoadUIAtlas(string.format("Atlases/%s/%s", atlasName, atlasName))

	return atlas
end

function AssetsLoader:loadUIAtlasAsync(atlasName, callback)
	ResManager.LoadUIAtlasAsync(string.format("Atlases/%s/%s", atlasName, atlasName), function(isSuccess, atlas)
		if callback ~= nil then
			callback(atlas)
		end
	end)
end

function AssetsLoader:loadPrefab(path)
	return ResManager.LoadPrefab(path)
end

function AssetsLoader:loadAnimCtrl(path)
	return ResManager.LoadAnimCtrl(path)
end

function AssetsLoader:loadAnimCtrlAsync(path, callback)
	ResManager.LoadAnimCtrlAsync(path, function(isSuccess, anim)
		if callback ~= nil then
			callback(anim)
		end
	end)
end

function AssetsLoader:loadAnimClip(path)
	return ResManager.LoadAnimClip(path)
end

function AssetsLoader:loadAnimClipAsync(path, callback)
	ResManager.LoadAnimClipAsync(path, function(isSuccess, anim)
		if callback ~= nil then
			callback(anim)
		end
	end)
end

function AssetsLoader:loadAudioClip(path)
	return ResManager.LoadAudioClip(path)
end

function AssetsLoader:loadAudioClipAsync(path, callback)
	ResManager.LoadAudioClipAsync(path, function(isSuccess, audioClip)
		if callback ~= nil then
			callback(audioClip)
		end
	end)
end

function AssetsLoader:loadPrefabAsync(path, callback)
	ResManager.LoadPrefabAsync(path, function(isSuccess, prefab)
		XYDCo.WaitForFrame(1, function()
			if callback ~= nil then
				callback(prefab)
			end
		end, nil)
	end)
end

function AssetsLoader:loadAsync(path, type, callback)
	xyd.ResourceLoader.Instance:LoadAsync(path, type, function(prefab)
		if callback ~= nil then
			callback(prefab, path)
		end
	end)
end

function AssetsLoader:loadWindow(resource, windowName)
	ResManager.LoadPrefab(string.format("Prefabs/Windows/%s", resource), function(isSuccess, window)
		xyd.EventDispatcher.loader():dispatchEvent({
			name = xyd.event.WINDOW_LOAD_COMPLETE,
			params = {
				key = windowName,
				asset = window
			}
		})
	end)
end

function AssetsLoader:loadPanel(panelName)
	ResManager.LoadPrefab(string.format("Prefabs/Panels/%s", panelName), typeof(GameObject), function(isSuccess, panel)
		XYDCo.WaitForEndOfFrame(function()
			xyd.EventDispatcher.loader():dispatchEvent({
				name = xyd.event.PANEL_LOAD_COMPLETE,
				params = {
					key = panelName,
					asset = panel
				}
			})
		end, nil)
	end)
end

function AssetsLoader:loadUAtlas(path, cache)
	local uAtlas = self.uAtlases_[path]

	if uAtlas then
		return uAtlas
	end

	local sprites = ResManager.LoadSprites(path)

	uAtlas = UAtlas.new(sprites)

	if cache then
		self.uAtlases_[path] = uAtlas
	end

	return uAtlas
end

function AssetsLoader:loadUAtlasAsync(path, cache, callback)
	if not path or path == "" then
		return
	end

	local uAtlas = self.uAtlases_[path]

	if uAtlas then
		if callback ~= nil then
			callback(uAtlas)
		end
	else
		ResManager.LoadSpritesAsync(path, function(isSuccess, sprites)
			uAtlas = UAtlas.new(sprites)

			if cache then
				self.uAtlases_[path] = uAtlas
			end

			if callback ~= nil then
				callback(uAtlas)
			end
		end)
	end
end

function AssetsLoader:loadModel3D(path, cache)
	local model3D = self.model3Ds_[path]

	if not tolua.isnull(model3D) then
		return model3D
	end

	model3D = self:load(path, typeof(GameObject))

	if cache then
		self.model3Ds_[path] = model3D
	end

	return model3D
end

function AssetsLoader:loadModel3DAsync(path, cache, callback)
	local model3D = self.model3Ds_[path]

	if not tolua.isnull(model3D) then
		callback(model3D)

		return
	end

	xyd.ResourceLoader.Instance:LoadAsync(path, typeof(GameObject), function(prefab)
		if not tolua.isnull(prefab) then
			if cache then
				self.model3Ds_[path] = prefab
			end

			callback(prefab)
		end
	end)
end

function AssetsLoader:loadCityBasicResources()
	return
end

function AssetsLoader:loadMaterial(path)
	return ResManager.LoadMaterial(path)
end

function AssetsLoader:loadWorldBasicUAtlases()
	return
end

function AssetsLoader:loadSceneData(path)
	return ResManager.LoadSceneData(path)
end

function AssetsLoader:getInstanceMaterial(texAlpha)
	if not self.instanceMaterials_[texAlpha.texture.name] then
		self.instanceMaterials_[texAlpha.texture.name] = UnityEngine.Object.Instantiate(self:loadMaterial("Materials/Common/sprite_default_mtrl"))

		self.instanceMaterials_[texAlpha.texture.name]:SetTexture("_AlphaTex", texAlpha.texture)
	end

	return self.instanceMaterials_[texAlpha.texture.name]
end

function AssetsLoader:getTileMaterial(texAlpha)
	self.instanceMaterials_[texAlpha.texture.name] = self:loadMaterial("Materials/Common/sprite_default_mtrl")

	self.instanceMaterials_[texAlpha.texture.name]:SetTexture("_AlphaTex", texAlpha.texture)

	return self.instanceMaterials_[texAlpha.texture.name]
end

function AssetsLoader:getUI2DMaterial(texAlpha)
	if not self.ui2dMaterilas_[texAlpha.texture.name] then
		self.ui2dMaterilas_[texAlpha.texture.name] = UnityEngine.Object.Instantiate(self:loadMaterial("Materials/Common/ui2dsprite_default_mtrl"))

		self.ui2dMaterilas_[texAlpha.texture.name]:SetTexture("_AlphaTex", texAlpha.texture)
	end

	return self.ui2dMaterilas_[texAlpha.texture.name]
end

function AssetsLoader:getMaskMaterial(maskType)
	if not self.maskMaterials_[maskType] then
		self.maskMaterials_[maskType] = UnityEngine.Object.Instantiate(self:loadMaterial("Materials/Common/mask_mtrl"))
	end

	return self.maskMaterials_[maskType]
end

function AssetsLoader:getCityStencilMaterial(texAlpha)
	if not self.cityStencilMaterials_[texAlpha.texture.name] then
		self.cityStencilMaterials_[texAlpha.texture.name] = UnityEngine.Object.Instantiate(self:loadMaterial("Materials/Common/city_stencil_mtl"))

		self.cityStencilMaterials_[texAlpha.texture.name]:SetTexture("_AlphaTex", texAlpha.texture)
	end

	return self.cityStencilMaterials_[texAlpha.texture.name]
end

function AssetsLoader:UnloadAsset(path, assetToUnload)
	xyd.ResourceLoader.Instance:UnloadAsset(path, assetToUnload)
end

function AssetsLoader:addDownloadProgressCallback(key, func)
	xyd.ResourceLoader.Instance:AddDownloadProgressCallback(key, func)
end

function AssetsLoader:deleteDownloadProgressCallback(key)
	xyd.ResourceLoader.Instance:DeleteDownloadProgressCallback(key)
end

function AssetsLoader:clearOnEnterMap()
	self.uAtlases_ = {}
	self.instanceMaterials_ = {}
	self.cityStencilMaterials_ = {}

	xyd.LuaManager.Instance:LuaGC()
	xyd.ResourceLoader.Instance:ForceGC()
end

return AssetsLoader
