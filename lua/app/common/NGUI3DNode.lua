-- chunkname: @../../../Product/Bundles/Android/src/app/common/NGUI3DNode.lua

local NGUI3DNode = class("NGUI3DNode")
local Rect = UnityEngine.Rect
local Screen = UnityEngine.Screen
local AddChild = NGUITools.AddChild
local Destroy = UnityEngine.Object.Destroy
local Material = UnityEngine.Material
local GameObject = UnityEngine.GameObject
local SpineManager = xyd.SpineManager
local Camera = UnityEngine.Camera

function NGUI3DNode.get()
	if NGUI3DNode.INSTANCE == nil then
		NGUI3DNode.INSTANCE = NGUI3DNode.new()
	end

	return NGUI3DNode.INSTANCE
end

function NGUI3DNode:ctor(parentGo)
	self.Ngui3D_ = GameObject.FindWithTag("Ngui3D")
	self.uiGroup = self.Ngui3D_:NodeByName("ui_group").gameObject
	self.ngui3DCamera_ = self.Ngui3D_:ComponentByName("ngui3dCamera", typeof(Camera))
end

function NGUI3DNode:setInfo(params)
	self.width = params.width or UnityEngine.Screen.width / 2
	self.height = params.height or UnityEngine.Screen.height / 2
	self.showTexture = params.showTexture

	self:init3DNode()
end

function NGUI3DNode:init3DNode()
	local modelPath = "3d/devil_01008/devil_01008"

	ResCache.PreloadGameObject(modelPath, function(success, go)
		if not success then
			return
		end

		local actor = GameObject.Instantiate(go)

		NGUITools.SetLayer(actor, LayerMask.NameToLayer(xyd.Layers.THREED_UI))

		if self.model and not tolua.isnull(self.model) then
			NGUITools.Destroy(self.model)

			self.model = nil
		end

		self.model = actor

		ResCache.AddChild(self.uiGroup, actor)
		self:initRenderTexture()
	end)
end

function NGUI3DNode:initRenderTexture()
	local localTexture = ResCache.LoadRenderTexture(self.Ngui3D_, "Textures/Misc/3dModelTexture")

	self.texture_ = UnityEngine.RenderTexture(math.floor(self.width), math.floor(self.height), 0)
	self.texture_.anisoLevel = 0
	self.texture_.format = localTexture.format
	self.texture_.filterMode = localTexture.filterMode
	self.texture_.depth = localTexture.depth
	self.ngui3DCamera_.targetTexture = self.texture_
	self.showTexture.mainTexture = self.texture_

	self.showTexture:MakePixelPerfect()
end

return NGUI3DNode
